import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:profile/utils/custom_clipper.dart';

import 'top_bar.dart';

class StackContainer extends StatelessWidget {
  const StackContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: Stack(
        children: <Widget>[
          Container(),
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              height: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/200"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProfileAvatar(
                  "https://i.pravatar.cc/300",
                  borderWidth: 4.0,
                  radius: 60.0,
                ),
                SizedBox(height: 4.0),
              ],
            ),
          ),
          TopBar(),
        ],
      ),
    );
  }
}
