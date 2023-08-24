import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../data/data_collection.dart';


class HistoryController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxList<PendataanData> pendataanList = RxList<PendataanData>();

  final TextEditingController searchController = TextEditingController();

  final RxList<PendataanData> searchResults = RxList<PendataanData>();

  void updateSearchResults(List<PendataanData> searchData) {
    searchResults.assignAll(searchData);
  }

  void clearSearchResults() {
    searchResults.clear();
  }

  @override
  void onInit() {
    super.onInit();

    fetchDataFromFirestore();
  }

  Future<void> fetchDataFromFirestore() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance
                .collection('pendataan')
                .where('uid', isEqualTo: user.uid)
                .get();

        List<PendataanData> pendataanDataList = querySnapshot.docs
            .map((doc) => PendataanData.fromMap(doc.data()))
            .toList();

        pendataanList.assignAll(pendataanDataList);
      }
    } catch (e) {
      print('Error fetching pendataan data: $e');
    }
  }
}
