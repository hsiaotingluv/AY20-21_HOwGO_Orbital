import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sizer/sizer.dart';

class DirectionScreen extends StatelessWidget {
  final DocumentSnapshot<Object> room;

  DirectionScreen(this.room);

  @override
  Widget build(BuildContext context) {
    var width = double.infinity;
    var height = MediaQuery.of(context).size.height / 3.1;
    var direction = room['direction'];
    return Scaffold(
      appBar: AppBar(title: Text('Direction')),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView.builder(
        itemCount: direction.length ?? 0,
        itemBuilder: (_, index) {
          return direction == null
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      'No data has been added for this room yet. Try another room.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Theme.of(context).accentColor),
                      ),
                      elevation: 0,
                      margin: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 8,
                      ),
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: Image.network(
                              direction[index]['url'],
                              height: height,
                              width: width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            // height: 50,
                            width: 96.w,
                            child: Container(
                              height: 8.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                color: Theme.of(context).backgroundColor,
                              ),
                              // width: 390,
                              padding: EdgeInsets.all(10),
                              child: Text(
                                direction[index]['caption'],
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline2,
                                softWrap: true,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                );

          // Column(
          //     children: [
          //       Image.network(direction[index]['url']),
          //       Container(
          //         width: double.infinity,
          //         // margin: EdgeInsets.all(15),
          //         padding: const EdgeInsets.all(10),
          //         child: Text(
          //           direction[index]['caption'],
          //           style: TextStyle(
          //             fontSize: 17,
          //             fontWeight: FontWeight.bold,
          //           ),
          //           textAlign: TextAlign.center,
          //         ),
          //         // decoration: BoxDecoration(
          //         //   border: Border.all(
          //         //       color: Theme.of(context)
          //         //           .textTheme
          //         //           .bodyText1
          //         //           .color),
          //         //   borderRadius: BorderRadius.circular(10),
          //         // ),
          //       ),
          //       Divider(
          //         height: 0,
          //       ),
          //       // SizedBox(
          //       //   height: 20,
          //       // )
          //     ],
          //   );
        },
      ),
    );
  }
}
