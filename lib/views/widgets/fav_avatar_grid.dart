import 'package:flutter/material.dart';
import 'package:learn_with_ar/modals/app_user.dart';
import 'package:learn_with_ar/modals/avatar.dart';
import 'package:learn_with_ar/views/widgets/avatar_tile.dart';
import 'package:provider/provider.dart';

class FavAvatarGrid extends StatefulWidget {
  String filterOption;
  FavAvatarGrid({this.filterOption});
  @override
  _FavAvatarGridState createState() => _FavAvatarGridState();
}

class _FavAvatarGridState extends State<FavAvatarGrid> {
  @override
  Widget build(BuildContext context) {
    var list = Provider.of<List<Avatar>>(context);
    var now = [];
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        if (currentUser.likedModels.contains(list[i])) {
          now.add(list[i]);
        }
      }
    }
    var originalList = [];
    if ((widget.filterOption != null && widget.filterOption != "") &&
        now != null) {
      for (int i = 0; i < now.length; i++) {
        bool flag = false;
        if (now[i]
            .name
            .toLowerCase()
            .contains(widget.filterOption.toLowerCase())) {
          originalList.add(now[i]);
        } else if (now[i]
            .type
            .toLowerCase()
            .contains(widget.filterOption.toLowerCase())) {
          originalList.add(now[i]);
        }
      }
    } else {
      originalList = list;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: originalList == null
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
                height: 30,
              ),
            )
          : originalList.length == 0
              ? Container(
                  child: Text(
                    'No Model of current option',
                  ),
                )
              : GridView.builder(
                  itemCount: originalList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 4 / 5),
                  itemBuilder: (BuildContext context, int index) {
                    return AvatarTile(
                      currentAvatar: originalList[index],
                    );
                  },
                ),
    );
  }
}
