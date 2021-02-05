import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_with_ar/modals/avatar.dart';
import 'dart:async';

class AvatarRepo {
  final avatarReference = FirebaseFirestore.instance.collection('modal');
  List<Avatar> convertAvatar(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      Map<String, dynamic> item = e.data();
      try {
        return createAvatar(item);
      } catch (error) {
        print(error.toString());
      }
    }).toList();
  }

  Stream<List<Avatar>> get avatars {
    return avatarReference.snapshots().map(
          (event) => convertAvatar(event),
        );
  }

  Future<void> likeAvatar(String id) async {
    int likes = 0;
    avatarReference.doc(id).get().then((value) {
      var data = value.data();
      likes = data['likes']??0;
    });
    dynamic result = avatarReference.doc(id).update({'likes': likes + 1});
    return;
  }

  Future<void> disLikeAvatar(String id) async {
    int likes = 0;
    avatarReference.doc(id).get().then((value) {
      likes = value.data()['likes'];
    });

    dynamic result = avatarReference.doc(id).update({'likes': likes + 1});
  }
}
