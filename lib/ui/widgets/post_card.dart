import 'package:flutter/material.dart';
import 'package:gather/ui/styles/gather_text_style.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
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
    children: [
      const CircleAvatar(
        backgroundImage: AssetImage('assets/dummy/post/profilePicture.png'),
        radius: 20,
      ),
      const SizedBox(
        width: 6,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'dhamar',
            style: GatherTextStyle.subhead2(context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/shared/icons/pin.png',
                height: 14,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                'Sentul, Jawa Barat',
                style: GatherTextStyle.caption(context),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
