import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../firebse_ref/references.dart';



class FirebaseSotrageService extends GetxService {
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) return null;
    try {
      Reference urlRef = firebaseStorage
          .child("quesion_paper_images")
          .child("${imgName.toLowerCase()}.png");
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e) {
      return null;
    }
  }
}
