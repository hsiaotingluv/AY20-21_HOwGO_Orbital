import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/profile_providers.dart';

class ProfileItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profiles>(context).profiles;
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                ),
                child: CircleAvatar(
                  radius: 50,
                  // child: Text('Profile Pic'),
                  backgroundImage: AssetImage('assets/images/lzw.png'),
                ),
              ),
              VerticalDivider(
                width: 10,
                thickness: 10,
              ),
              Container(
                height: 100,
                width: 250,
                padding: EdgeInsets.only(
                  top: 25,
                  left: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Name: ${profile[0].name}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        'Major: ${profile[0].major}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 1,
          height: 16,
        )
      ],
    );
  }
}
