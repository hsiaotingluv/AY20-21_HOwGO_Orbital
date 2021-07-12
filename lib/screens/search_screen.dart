import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/room.dart';
import '../providers/rooms_provider.dart';
import '../widgets/room_item.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/main_drawer.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/searchScreen';
  @override
  Widget build(BuildContext context) {
    final rooms = Provider.of<Rooms>(context);
    var roomsList = rooms.rooms;
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Rooms'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: RoomSearch(roomsList),
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
      bottomNavigationBar: NavigationBar(1),
    );
  }
}

class RoomSearch extends SearchDelegate<String> {
  List<RoomModel> roomsList;
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
        ? roomsList
        : roomsList.where((room) {
            return room.name.toLowerCase().contains(query.toLowerCase()) ||
                room.location.toLowerCase().contains(query.toLowerCase());
          }).toList();
    return SearchedRoomList(resultList: resultList);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? roomsList
        : roomsList.where((room) {
            return room.name.toLowerCase().contains(query.toLowerCase()) ||
                room.location.toLowerCase().contains(query.toLowerCase());
          }).toList();
    return SearchedRoomList(resultList: suggestionList);
  }
}

class SearchedRoomList extends StatelessWidget {
  SearchedRoomList({
    @required this.resultList,
  });

  final List<RoomModel> resultList;

  @override
  Widget build(BuildContext context) {
    return resultList.isEmpty
        ? Center(
            child: Text(
              'No results found...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).textTheme.subtitle1.color,
              ),
            ),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Container(
                child: RoomItem(
                  title: resultList[index].name,
                  location: resultList[index].location,
                  building: resultList[index].building,
                ),
              );
            },
            itemCount: resultList.length,
          );
  }
}
