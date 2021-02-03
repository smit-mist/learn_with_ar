import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_with_ar/modals/avatar.dart';
import 'dart:async';

class AvatarRepo {
  final avatarReference = FirebaseFirestore.instance.collection('modal');

  Future<List<Avatar>> getAllAvatar() async {
    List<Avatar> allAvatar = [];
    avatarReference.get().then((value) {
      value.docs.forEach((element) {
        Avatar here = createAvatar(element.data());
        allAvatar.add(here);
        print(element.id);
      });
    });
    print(allAvatar.length);
    return allAvatar;
  }
}
