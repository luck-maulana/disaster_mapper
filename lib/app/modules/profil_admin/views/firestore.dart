import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/user_model.dart';

class FirestoreService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<List<UserModel>> getUsersByKabupaten(String selectedKabupaten) async {
    try {
      QuerySnapshot<Object?> querySnapshot = await usersCollection
          .where('selectedKabupaten', isEqualTo: selectedKabupaten)
          .get();

      return querySnapshot.docs.map((doc) {
        return UserModel(
          uid: doc['uid'],
          username: doc['username'],
          email: doc['email'],
          role: 'admindesa',
        );
      }).toList();
    } catch (e) {
      print('Error getting users by kabupaten: $e');
      return [];
    }
  }
}
