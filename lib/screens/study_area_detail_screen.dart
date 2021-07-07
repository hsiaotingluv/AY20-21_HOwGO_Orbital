import 'package:flutter/material.dart';

import '../widgets/navigation_bar.dart';
import '../category_data.dart';

class StudyAreaDetailScreen extends StatelessWidget {
  static const routeName = '/study-area-detail';

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
    final studyAreaTitle = routeArgs['title'];
    final studyAreaLocation = routeArgs['location'];
    final selectedStudyArea = STUDYAREAS.firstWhere(
      (area) =>
          area.name == studyAreaTitle && area.location == studyAreaLocation,
    );
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
                '${selectedStudyArea.name}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
              background: Hero(
                tag: selectedStudyArea.name,
                child: selectedStudyArea.image != null
                    ? Image.asset(
                        selectedStudyArea.image,
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
                          onPressed: () {}),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                buildIconTile(context, Icon(Icons.business_rounded), 'Location',
                    selectedStudyArea.location),
                buildIconTile(context, Icon(Icons.group_rounded), 'Capacity',
                    selectedStudyArea.capacity.toString()),
                buildIconTile(context, Icon(Icons.directions_bus_rounded),
                    'Nearby Bus Stops', selectedStudyArea.nearbyBusStops),
                buildIconTile(context, Icon(Icons.router_rounded), 'Facilities',
                    '2 x Aircon, 19 x Apple Desktop'),
                buildIconTile(context, Icon(Icons.location_on_rounded),
                    'Address', selectedStudyArea.address),
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
                selectedStudyArea.gallery == null
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
                    : buildPhotoGallery(selectedStudyArea.gallery),
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
      bottomNavigationBar: NavigationBar(3),
    );
  }
}
