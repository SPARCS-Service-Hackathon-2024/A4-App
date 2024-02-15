import 'package:flutter/material.dart';

import '../../../Resources/images/image_assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 10.0,),
        Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.notifications,
            color: Colors.black,
          ),),
        Spacer(),
      ],
    );
  }
}
