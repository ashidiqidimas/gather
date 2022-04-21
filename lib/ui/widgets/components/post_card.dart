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
          const SizedBox(
            height: 8,
          ),
          buildCardContents(context),
          const SizedBox(
            height: 8,
          ),
          buildCardFooter(context),
        ],
      ),
    );
  }
}

Widget buildCardHeader(BuildContext context) {
  return Row(
    // mainAxisAlignment: MainAxisAlignment.start,
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

Widget buildCardContents(BuildContext context) {
  // TODO: Get state object from TimelineManager

  // TODO: Create a switch case for numberOfPhotos with case 1, 2, 3, 4, 5, 5+

  // Here is for post with 2 images
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Seger cuy pagi pagi trekking',
        style: GatherTextStyle.body1(context),
      ),
      const SizedBox(
        height: 8,
      ),
      buildImageGrid(context),
    ],
  );
}

Widget buildImageGrid(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  // 2 Images
  return Row(
    children: [
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
        child: Image.asset(
          'assets/dummy/post/image1.png',
          width: (width - 33) / 2,
        ),
      ),
      const SizedBox(
        width: 1,
      ),
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        child: Image.asset(
          'assets/dummy/post/image2.png',
          width: (width - 33) / 2,
        ),
      ),
    ],
  );
}

Widget buildCardFooter(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Align(
        heightFactor: 2.375,
        alignment: Alignment.topLeft,
        child: Image.asset(
          'assets/shared/icons/ticket.png',
          width: 16,
        ),
      ),
      const SizedBox(
        width: 4,
      ),
      Expanded(
        child: Text(
          'Paket Trekking Premium by Wisata Bogor',
          style: GatherTextStyle.callout(context),
          maxLines: 2,
          overflow: TextOverflow.clip,
        ),
      ),
      const SizedBox(
        width: 8,
      ),
      TextButton(
        // TODO: Add onPressed callback
        onPressed: () => debugPrint('See package pressed'),
        child: Text(
          'See Package',
          style: GatherTextStyle.callToAction3(context),
        ),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(219, 101, 81, 1)),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          ),
        ),
      ),
    ],
  );
}
