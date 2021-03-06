// import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screens/settings_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
    BuildContext context,
    String title,
    IconData icon,
    Function tapHandler,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: ListTile(
            leading: Icon(
              icon,
              size: 22.sp,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                color: Theme.of(context).textTheme.bodyText1.color,
              ),
            ),
            onTap: tapHandler,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 71.w,
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 23.h,
              // width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Container(
                padding: EdgeInsets.only(
                  left: 3.w,
                  top: 5.h,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 1),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          'assets/images/icon.png',
                          height: 15.h,
                          // width: 32.8.w,
                          fit: BoxFit.fill,
                          // scale: 0.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40,
                      ),
                      child: Container(
                        child: Text(
                          'HOwGO',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            buildListTile(
              context,
              'Settings',
              Icons.settings,
              () {
                Navigator.of(context).pushNamed(SettingsScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
