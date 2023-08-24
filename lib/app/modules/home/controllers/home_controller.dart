import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/data_collection.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
   double get width => Get.width;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxList<PendataanData> pendataanList = RxList<PendataanData>();

  Rxn<DocumentSnapshot> userProfile = Rxn<DocumentSnapshot>();

  @override
  void onInit() {
    String uid = auth.currentUser?.uid ?? '';
    userProfile.bindStream(userStream(uid));
    super.onInit();
  }

  Stream<DocumentSnapshot> userStream(String uid) {
    return firestore.collection('users').doc(uid).snapshots();
  }
}
