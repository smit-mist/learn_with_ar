import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:learn_with_ar/modals/app_user.dart';

class AppUserRepo {
  final appUserRef = FirebaseFirestore.instance.collection('user');
  Future<void> addAppUser(AppUser curr) {
    return appUserRef.doc(curr.id).set({
      'email': curr.email,
      'username': curr.username,
      'liked_models': curr.likedModels,
      'created_models': curr.createdModels,
    });
  }

  Future<AppUser> getUser(String id) async {
    AppUser temp;
    var docRef = appUserRef.doc(id);
    print('insider repo ==============> $id');
    dynamic result = await docRef.get().then((value) {
      Map<String, dynamic> map = value.data();
      print(value.data().toString());
      temp = createAppUser(map);
    });
    temp.id = id;
    return temp;
  }

  Future<String> getUsername(String id) async {
    AppUser temp;
    var docRef = appUserRef.doc(id);
    dynamic result = await docRef.get().then((value) {
      Map<String, dynamic> map = value.data();
      return map['username'];
    });
    return 'smit_37_mist';
  }

  Future<void> updateLiked() async {
    print(currentUser.id);
    return appUserRef
        .doc(currentUser.id)
        .update({'liked_models': currentUser.likedModels});
  }
}
