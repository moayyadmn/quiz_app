import 'package:firebase_quiz_app/configs/themes/app_colors.dart';
import 'package:firebase_quiz_app/controllers/zoom_drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuScreen extends GetView<MyZoomController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: onSurfaceTextColor),
          ),
        ),
        child: SafeArea(
            child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 30,
              child: BackButton(
                color: Colors.white,
                onPressed: controller.toggleDrawer,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => controller.user.value == null
                        ? const SizedBox()
                        : Text(
                            controller.user.value!.displayName ?? "",
                            style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                color: onSurfaceTextColor),
                          ),
                  ),
                  _DrawerButton(
                    icon: Icons.web,
                    label: "Website",
                    onPressed: () {},
                  ),
                  _DrawerButton(
                    icon: Icons.facebook,
                    label: "Facebook",
                    onPressed: () {},
                  ),
                  _DrawerButton(
                    icon: Icons.email,
                    label: "Contact us",
                    onPressed: () {},
                  ),
                  _DrawerButton(
                    icon: Icons.logout,
                    label: "Logout",
                    onPressed: () {
                      controller.signOut();
                    },
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton(
      {required this.icon, required this.label, this.onPressed});
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 15,
      ),
      label: Text(label),
    );
  }
}
