import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/room_item.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/main_drawer.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/searchScreen';

  List<DocumentSnapshot<Object>> favRooms = [];
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Room'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Platform.isIOS ? CupertinoIcons.search : Icons.search,
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: RoomSearch(widget.favRooms),
              );
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: MainDrawer(),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('allRooms').get(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> displayedRooms = snapshot.data.docs;
              if (displayedRooms.length == 0) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      'No data has been added yet.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              } else {
                for (int i = 0; i < displayedRooms.length; i++) {
                  widget.favRooms.add(displayedRooms[i]);
                }
                return ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: displayedRooms
                          .map((room) => RoomItem(
                                selectedRoom: room,
                              ))
                          .toList(),
                    ),
                  ],
                );
              }
            } else if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      bottomNavigationBar: NavigationBar(1),
    );
  }
}

class RoomSearch extends SearchDelegate<String> {
  List<DocumentSnapshot<Object>> roomsList;
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
            return room['name']
                    .toLowerCase()
                    .contains(query.toLowerCase().trim()) ||
                room['location']
                    .toLowerCase()
                    .contains(query.toLowerCase().trim());
          }).toList();
    return SearchedRoomList(resultList: resultList);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? roomsList
        : roomsList.where((room) {
            return room['name']
                    .toLowerCase()
                    .contains(query.toLowerCase().trim()) ||
                room['location']
                    .toLowerCase()
                    .contains(query.toLowerCase().trim());
          }).toList();
    return SearchedRoomList(resultList: suggestionList);
  }
}

class SearchedRoomList extends StatelessWidget {
  SearchedRoomList({
    @required this.resultList,
  });

  final List<DocumentSnapshot<Object>> resultList;

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
        : ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: resultList
                    .map((room) => RoomItem(
                          selectedRoom: room,
                        ))
                    .toList(),
              ),
            ],
          );
  }
}
