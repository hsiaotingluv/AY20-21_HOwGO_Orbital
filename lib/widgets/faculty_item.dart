import 'package:flutter/material.dart';

import '../screens/building_screen.dart';

class FacultyItem extends StatelessWidget {
  final String title;
  final String campus;
  final String image;

  FacultyItem({
    @required this.title,
    @required this.campus,
    this.image,
  });

  void selectFaculty(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      BuildingScreen.routeName,
      arguments: {
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = double.infinity;
    var height = MediaQuery.of(context).size.height / 4;
    return InkWell(
      onTap: () => selectFaculty(context),
      splashColor: Theme.of(context).accentColor,
      // borderRadius: BorderRadius.circular(10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Theme.of(context).accentColor),
        ),
        elevation: 4,
        margin: EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 8,
        ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                image,
                height: height,
                width: width,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              // height: 50,
              width: 396,
              child: Container(
                height: 50,
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
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//   @override
//   Widget build(BuildContext context) {
//     var width = double.infinity;
//     var height = MediaQuery.of(context).size.height / 3 - 90;
//     return InkWell(
//       onTap: () => selectFaculty(context),
//       splashColor: Colors.amber.shade200,
//       borderRadius: BorderRadius.circular(5),
//       child: Container(
//         width: width,
//         height: height,
//         padding: const EdgeInsets.all(0),
//         margin: EdgeInsets.all(10),
//         child: Stack(
//           children: <Widget>[
//             ClipRRect(
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//               child: Image.asset(
//                 image,
//                 height: height,
//                 width: width,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               // right: 10,
//               child: Container(
//                 width: 400,
//                 color: Theme.of(context).accentColor,
//                 padding: EdgeInsets.symmetric(
//                   vertical: 10,
//                   horizontal: 20,
//                 ),
//                 child: Text(
//                   title,
//                   textAlign: TextAlign.center,
//                   style: Theme.of(context).textTheme.headline1,
//                   // style: TextStyle(
//                   //   fontSize: 18,
//                   //   color: Colors.white,
//                   // ),
//                   softWrap: true,
//                   overflow: TextOverflow.fade,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
