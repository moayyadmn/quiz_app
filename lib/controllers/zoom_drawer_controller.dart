import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';

class MyZoomController extends GetxController {
  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  void toogleDrawer() {
    zoomDrawerController.toggle!.call();
    update();
  }
}
