import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../providers/room_provider.dart';
import '../models/room.dart';
import '../providers/rooms_provider.dart';
import '../category_data.dart';
import '../screens/direction_screen.dart';

class RoomDetailScreen extends StatelessWidget {
  static const routeName = '/room-detail';

  void getDirection(BuildContext ctx, Room room) {
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
              child: Image.asset(
                gallery[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        itemCount: gallery.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final roomTitle = routeArgs['title'];
    final roomLocation = routeArgs['location'];
    final roomBuilding = routeArgs['building'];
    final selectedRoom = ROOMS.firstWhere(
      (room) =>
          room.name == roomTitle &&
          room.location == roomLocation &&
          room.building == roomBuilding,
    );
    final roomsList = Provider.of<Rooms>(context);
    // final room = Provider.of<Room>(context);
    return Scaffold(
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: Colors.black),
      // ),
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
                '${selectedRoom.name}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
              background: Hero(
                tag: selectedRoom.name,
                child: selectedRoom.image != null
                    ? Image.asset(
                        selectedRoom.image,
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
                    selectedRoom.location),
                buildIconTile(context, Icon(Icons.group_rounded), 'Capacity',
                    selectedRoom.capacity.toString()),
                buildIconTile(context, Icon(Icons.directions_bus_rounded),
                    'Nearby Bus Stops', selectedRoom.nearbyBusStops),
                buildIconTile(context, Icon(Icons.router_rounded), 'Facilities',
                    '2 x Aircon, 19 x Apple Desktop'),
                buildIconTile(context, Icon(Icons.location_on_rounded),
                    'Address', selectedRoom.address),
                SizedBox(
                  height: 20,
                ),
                // Divider(
                //   height: 0,
                //   thickness: 1,
                //   color: Colors.grey,
                // ),
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
                selectedRoom.gallery == null
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
                    : buildPhotoGallery(selectedRoom.gallery),
                // Divider(
                //   height: 0,
                //   thickness: 0.2,
                //   color: Colors.grey,
                // ),
                SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// Container(
//       margin: EdgeInsets.symmetric(
//         vertical: 10,
//       ),
//       height: 180,


// floatingActionButton: FloatingActionButton(
//   child: Icon(
//     roomsList.findByName(roomTitle).isFavourite
//         ? Icons.favorite
//         : Icons.favorite_border,
//   ),
//   backgroundColor: Theme.of(context).primaryColor,
//   onPressed: () => roomsList.toggleFavourite(roomTitle),
// ),


// body: ListView(
//   children: [
//     Container(
//       child: Text(
//         'Images go here...',
//         style: TextStyle(fontSize: 30),
//       ),
//       alignment: Alignment.center,
//       margin: EdgeInsets.all(15),
//       padding: EdgeInsets.all(15),
//       height: 300,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         border: Border.all(
//           width: 2,
//         ),
//         borderRadius: BorderRadius.circular(10),
//       ),
//     ),
//     Container(
//       margin: EdgeInsets.all(15),
//       padding: EdgeInsets.all(20),
//       child: Text(
//         'Room: $roomTitle \n'
//         'Location: $roomLocation \n'
//         'Capacity: ${selectedRoom.capacity} \n'
//         'Nearby Bus Stops: ${selectedRoom.nearbyBusStops} \n'
//         'Address: ${selectedRoom.address}',
//         style: TextStyle(fontSize: 20),
//       ),
//       decoration: BoxDecoration(
//         border: Border.all(
//           width: 2,
//         ),
//         borderRadius: BorderRadius.circular(10),
//       ),
//     ),
//   ],
// ),
