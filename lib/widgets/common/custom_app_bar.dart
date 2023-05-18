import 'package:firebase_quiz_app/configs/themes/custome_text_style.dart';
import 'package:firebase_quiz_app/configs/themes/ui_parameters.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.title = '',
      this.showActionIcon = false,
      this.leading,
      this.titleWidget,
      this.onMenuActionTab});
  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTab;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: mobileScreenPadding, vertical: mobileScreenPadding),
        child: Stack(children: [
          Positioned.fill(
            child: titleWidget == null
                ? Center(
                    child: Text(
                      title,
                      style: appBarTS,
                    ),
                  )
                : Center(child: titleWidget),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leading ??
                  Transform.translate(
                    offset: const Offset(-14, 0.0),
                    child: const BackButton(),
                  ),
              if (showActionIcon)
                Transform.translate(
                  offset: const Offset(10, 0),
                  child: IconButton(
                    onPressed: onMenuActionTab,
                    icon: const Icon(Icons.menu_rounded),
                  ),
                )
            ],
          )
        ]),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 80);
}
