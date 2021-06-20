import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/room.dart';
import '../providers/rooms_provider.dart';
import '../widgets/room_item.dart';
import '../widgets/main_drawer.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rooms = Provider.of<Rooms>(context);
    var roomsList = rooms.rooms;
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: RoomSearch(rooms),
              );
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SearchedRoomList(resultList: roomsList),
      ),
    );
  }
}

class RoomSearch extends SearchDelegate<String> {
  Rooms roomsList;
  RoomSearch(this.roomsList);

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final resultList = query.isEmpty
        ? null
        : roomsList.rooms.where((room) => room.name.contains(query)).toList();
    return SearchedRoomList(resultList: resultList);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? null
        : roomsList.rooms.where((room) => room.name.contains(query)).toList();
    return SearchedRoomList(resultList: suggestionList);
  }
}

class SearchedRoomList extends StatelessWidget {
  SearchedRoomList({
    @required this.resultList,
  });

  final List<Room> resultList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Container(
          padding: const EdgeInsets.all(5),
          child: RoomItem(
            title: resultList[index].name,
            location: resultList[index].location,
            building: resultList[index].building,
          ),
        );
      },
      itemCount: resultList == null ? 0 : resultList.length,
    );
  }
}
