import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  uploadData() async {
    final String manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // in general here keys refres to the path so we need to to tell where the only path we need from our assets
    // we convert is toList() to make it indexable
    // load json file and print path
    final List<String> papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith('assets/papers') && path.contains('.json'))
        .toList();

  }
}