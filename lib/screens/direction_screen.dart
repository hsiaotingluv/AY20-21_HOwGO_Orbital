import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/room.dart';

class DirectionScreen extends StatelessWidget {
  final DocumentSnapshot<Object> room;

  DirectionScreen(this.room);

  @override
  Widget build(BuildContext context) {
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
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          child: Image.network(
                            direction[index]['url'],
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(15),
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            direction[index]['caption'],
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .color),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    );
            }));
  }
}
