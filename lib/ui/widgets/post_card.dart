import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          buildCardHeader(context),
        ],
      ),
    );
  }
}

Widget buildCardHeader(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [
      CircleAvatar(
        backgroundImage: AssetImage('assets/dummy/post/profilePicture.png'),
        radius: 20,
      ),
    ],
  );
}
