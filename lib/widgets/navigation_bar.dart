import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

import '../screens/campus_screen.dart';
import '../screens/favourites_tabs_screen.dart';
import '../screens/search_screen.dart';
import '../screens/study_area_screen.dart';

class NavigationBar extends StatefulWidget {
  // Function _selectPage;
  int pageNo;
  NavigationBar(this.pageNo);

  @override
  _NavigationBarState createState() => _NavigationBarState(pageNo);
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedPageIndex = 0;

  int pageNo;
  _NavigationBarState(this.pageNo);

  List<Map<String, Object>> _pages = [
    {
      'page': CampusScreen(),
      'title': 'Campus',
      // 'appBar':,
    },
    {
      'page': SearchScreen(),
      'title': 'All Rooms',
      // 'appBar':,
    },
    {
      'page': FavouritesTabsScreen(),
      'title': 'Favourite',
      // 'appBar':,
    },
    {
      'page': StudyAreasScreen(),
      'title': 'Study Area',
      // 'appBar':,
    },
  ];

  void _selectPage(int index) {
    // navBarTapped = true;
    setState(() {
      _selectedPageIndex = index;
    });
    if (_selectedPageIndex == 0) {
      //Navigator.of(context).popAndPushNamed(CampusScreen.routeName);
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => CampusScreen(),
          transitionDuration: Duration(seconds: 2),
        ),
      );
    } else if (_selectedPageIndex == 1) {
      // Navigator.of(context).popAndPushNamed(SearchScreen.routeName);
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => SearchScreen(),
          transitionDuration: Duration(seconds: 2),
        ),
      );
    } else if (_selectedPageIndex == 2) {
      // Navigator.of(context).popAndPushNamed(FavouritesTabsScreen.routeName);
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              FavouritesTabsScreen(),
          transitionDuration: Duration(seconds: 2),
        ),
      );
    } else if (_selectedPageIndex == 3) {
      // Navigator.of(context).popAndPushNamed(StudyAreasScreen.routeName);
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => StudyAreasScreen(),
          transitionDuration: Duration(seconds: 2),
        ),
      );
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        showUnselectedLabels: true,
        onTap: _selectPage,
        // unselectedItemColor: Theme.of(context).iconTheme.color,
        // unselectedItemColor: Colors.black,
        selectedItemColor: Theme.of(context).primaryColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 30.0,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              pageNo == 0 ? Icons.explore : Icons.explore_outlined,
              color: pageNo == 0
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
            // label: 'Explore',
            title: Text(
              'Explore',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 0,
              ),
            ),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              // _selectedPageIndex == pageNo
              pageNo == 1 ? Icons.search : Icons.search_outlined,
              color: pageNo == 1
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
            // label: 'Search',
            title: Text(
              'Search',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 0,
              ),
            ),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              pageNo == 2 ? Icons.favorite : Icons.favorite_border,
              color: pageNo == 2
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
            // label: 'Favourites',
            title: Text(
              'Favourites',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 0,
              ),
            ),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              pageNo == 3 ? Icons.school : Icons.school_outlined,
              color: pageNo == 3
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
            // label: 'Study Areas',
            title: Text(
              'Study Areas',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 0,
              ),
            ),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
        ],
      ),
    );
  }

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: ThemeData(
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//       ),
//       child: FloatingNavbar(
//         onTap: _selectPage,
//         backgroundColor: Theme.of(context).primaryColor,
//         itemBorderRadius: 10.0,
//         // selectedItemColor: Colors.white,
//         // selectedBackgroundColor: Colors.black,
//         // padding: EdgeInsets.all(8),
//         // margin: EdgeInsets.all(8),
//         width: double.infinity,
//         elevation: 10,
//         fontSize: 0,
//         iconSize: 30.0,
//         currentIndex: pageNo > 3 ? 0 : pageNo,
//         items: [
//           FloatingNavbarItem(
//             icon: Icons
//                 .explore, //pageNo == 0 ? Icons.explore : Icons.explore_outlined,
//             title: 'Explore',
//           ),
//           FloatingNavbarItem(
//             icon: Icons
//                 .search, //pageNo == 1 ? Icons.search : Icons.search_outlined,
//             title: 'Search',
//           ),
//           FloatingNavbarItem(
//             icon: Icons
//                 .favorite, //pageNo == 2 ? Icons.favorite : Icons.favorite_border,
//             title: 'Favourites',
//           ),
//           FloatingNavbarItem(
//             icon: Icons
//                 .school, //pageNo == 3 ? Icons.school : Icons.school_outlined,
//             title: 'Study Areas',
//           ),
//         ],
//       ),
//     );
//   }
}
