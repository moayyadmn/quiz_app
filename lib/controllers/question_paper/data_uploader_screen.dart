import 'package:firebase_quiz_app/controllers/question_paper/data_uploader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});
  final DataUploader controller = Get.put(DataUploader());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('data uploadig...')),
    );
  }
}
