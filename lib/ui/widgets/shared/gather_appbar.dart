import 'package:flutter/material.dart';

import '../../styles/gather_text_style.dart';
import '../../styles/colors/gather_color.dart';

class GatherAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GatherAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: null,
      automaticallyImplyLeading: false,
      centerTitle: false,
      titleSpacing: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                width: 16,
              ),
              Image.asset(
                'assets/shared/icons/logo.png',
                height: 25,
              ),
              const SizedBox(
                width: 8,
              ),
              RichText(
                text: TextSpan(
                  style: GatherTextStyle.appbarTitle(context),
                  children: [
                    TextSpan(
                      text: '2',
                      style: GatherTextStyle.appbarTitle(context).copyWith(
                        color: GatherColor.secondary,
                      ),
                    ),
                    const TextSpan(
                      text: 'Gather',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          splashRadius: 24,
          // TODO: on press, push screen to notification center
          onPressed: () => debugPrint('notification pressed'),
          icon: Image.asset('assets/shared/icons/bell.png'),
        ),
        IconButton(
          splashRadius: 24,
          // iconSize: 10,
          // TODO: on press, push screen to direct messages
          onPressed: () => debugPrint('direct message pressed'),
          icon: Image.asset('assets/shared/icons/message.png'),
        ),
        const SizedBox(
          width: 4,
        ),
      ],
    );
  }
}
