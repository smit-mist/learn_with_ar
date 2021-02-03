import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:learn_with_ar/modals/avatar.dart';
import 'package:learn_with_ar/views/widgets/avatar_tile.dart';

Avatar currentAvatar = Avatar(
    name: 'Apollo 11',
    type: 'Science',
    description: 'This is the description of Apollo 11',
    imageUrl:
        'https://thumbs-prod.si-cdn.com/y6l4RoJZ6JFMSqmTy-cejYS5uW0=/fit-in/1600x0/https://public-media.si-cdn.com/filer/19/f9/19f95403-d31a-44d5-9034-4ed7bdf34cc3/apollocommandmodule.jpg',
    modelUrl:
        'https://firebasestorage.googleapis.com/v0/b/learn-with-ar.appspot.com/o/apollo.glb?alt=media&token=6ca3250f-9e91-4b7c-9bb2-4c0228585a2a');

class AvatarGrid extends StatefulWidget {
  @override
  _AvatarGridState createState() => _AvatarGridState();
}

class _AvatarGridState extends State<AvatarGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 4/5
        ),
        itemBuilder: (BuildContext context, int index) {
          return AvatarTile(
            currentAvatar: currentAvatar,
          );
        },
      ),
    );
  }
}
