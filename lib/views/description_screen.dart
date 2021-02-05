import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learn_with_ar/modals/avatar.dart';
import 'package:learn_with_ar/repository/app_user_repository.dart';
import 'package:learn_with_ar/repository/avatar_repository.dart';
import 'package:learn_with_ar/views/avatar_ar_view.dart';
import 'package:learn_with_ar/modals/app_user.dart';

class DescriptionScreen extends StatefulWidget {
  Avatar currentAvatar;
  DescriptionScreen({this.currentAvatar});

  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  final _auth = FirebaseAuth.instance;
  bool liked = false;
  AvatarRepo avatarRepo = AvatarRepo();
  AppUserRepo userRepo = AppUserRepo();
  @override
  Widget build(BuildContext context) {
    print(currentUser.email);
 //   if (currentUser != null && currentUser.likedModels != null)
      liked = currentUser.likedModels.contains(widget.currentAvatar.id);
  //  else
   //   liked = false;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    print(currentUser.id);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: h * 0.5,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  widget.currentAvatar.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                background: Image.network(
                  widget.currentAvatar.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: h * 0.2,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                width: w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        widget.currentAvatar.type,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Icon(
                              liked ? Icons.favorite : Icons.favorite_border,
                              color: liked ? Colors.red : null,
                            ),
                            onTap: () {
                              setState(() {
                                if (liked && currentUser != null) {
                                  currentUser.likedModels
                                      .remove(widget.currentAvatar.id);
                                  setState(() {
                                    widget.currentAvatar.likes--;
                                    liked = !liked;
                                  });
                                } else if (currentUser != null) {
                                  currentUser.likedModels
                                      .add(widget.currentAvatar.id);
                                  setState(() {
                                    widget.currentAvatar.likes++;
                                    liked = !liked;
                                  });
                                }
                           //     print(currentUser.likedModels.length);

                              avatarRepo.updateLikes(widget.currentAvatar);
                              userRepo.updateLiked();
                              });

                            },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(widget.currentAvatar.likes.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  widget.currentAvatar.description,
                  style: TextStyle(
                    fontSize: 16,
                    wordSpacing: 0.5,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'View in 3D',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AvatarArView(
                currentAvatar: widget.currentAvatar,
              ),
            ),
          );
        },
        child: Icon(
          Icons.aspect_ratio_outlined,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
