import 'package:firebase_quiz_app/services/firebase_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  @override
  void onReady() {
    getAllPaper();
    super.onReady();
  }

  Future<void> getAllPaper() async {
    List<String> imgName = ['sectionone', 'sectiontwo', 'sectionthree'];
    try {
      for (var img in imgName) {
        var imgUrl = await Get.find<FirebaseSotrageService>().getImage(img);
        allPaperImages.add(imgUrl!);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
