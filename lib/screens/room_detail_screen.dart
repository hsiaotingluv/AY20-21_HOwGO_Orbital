import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './direction_screen.dart';
import '../widgets/navigation_bar.dart';

class RoomDetailScreen extends StatelessWidget {
  static const routeName = '/room-detail';

  final DocumentSnapshot<Object> selectedRoom;

  RoomDetailScreen({
    @required this.selectedRoom,
  });

  void getDirection(BuildContext ctx, DocumentSnapshot<Object> room) {
    Navigator.push(ctx, MaterialPageRoute(builder: (context) {
      return DirectionScreen(room);
    }));
  }

  Widget buildIconTile(
      BuildContext context, Icon icon, String title, String subtitle) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 15),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 11,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 17,
                          color: Theme.of(context).textTheme.bodyText1.color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPhotoGallery(List<String> gallery) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      height: 180,
      child: ListView.builder(
        padding: EdgeInsets.only(
          left: 8,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              width: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  gallery[index],
                  fit: BoxFit.cover,
                ),
              ));
        },
        itemCount: gallery.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                '${selectedRoom['name']}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
              background: Hero(
                tag: selectedRoom['name'],
                child: selectedRoom['coverphoto'] != null
                    ? Image.network(
                        selectedRoom['coverphoto'],
                        fit: BoxFit.cover,
                      )
                    : Container(),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 350,
                      height: 50,
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 40,
                        ),
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          'GET DIRECTION',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        onPressed: () => getDirection(
                          context,
                          selectedRoom,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                buildIconTile(context, Icon(Icons.business_rounded), 'Location',
                    selectedRoom['location']),
                buildIconTile(context, Icon(Icons.group_rounded), 'Capacity',
                    selectedRoom['capacity'].toString()),
                buildIconTile(context, Icon(Icons.directions_bus_rounded),
                    'Nearby Bus Stops', selectedRoom['nearbyBusStops']),
                buildIconTile(context, Icon(Icons.router_rounded), 'Facilities',
                    selectedRoom['facilities']),
                buildIconTile(context, Icon(Icons.location_on_rounded),
                    'Address', selectedRoom['address']),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.only(left: 18),
                  child: Text(
                    'More photos',
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).textTheme.bodyText1.color,
                    ),
                  ),
                ),
                selectedRoom['gallery'] == null
                    ? Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        height: 180,
                        child: Text(
                          'No photos available',
                          textAlign: TextAlign.center,
                        ),
                      )
                    : buildPhotoGallery(List.from(selectedRoom['gallery'])),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(0),
    );
  }
}
