import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:learn_with_ar/modals/app_user.dart';

class AppUserRepo{
  final appUserRef = FirebaseFirestore.instance.collection('user');
  Future<void>addAppUser(AppUser curr){
    return appUserRef.doc(curr.id).set({
      'email':curr.email,
      'username':curr.username,
      'liked_models':curr.likedModels,
      'created_models':curr.createdModels,
    });
  }
  Future<void>getUser(String id)async{
    var docRef = appUserRef.doc(id);
    dynamic result = await docRef.get().then((value){
      Map<String,dynamic>map = value.data();
      currentUser = createAppUser(map);
    });
  }

}