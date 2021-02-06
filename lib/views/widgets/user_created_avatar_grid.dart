import 'package:flutter/material.dart';
import 'package:learn_with_ar/modals/app_user.dart';
import 'package:learn_with_ar/modals/avatar.dart';
import 'package:learn_with_ar/views/widgets/avatar_tile.dart';
import 'package:provider/provider.dart';

class UserCreatedAvatarGrid extends StatefulWidget {
  String filterOption;
  UserCreatedAvatarGrid({this.filterOption});
  @override
  _UserCreatedAvatarGridState createState() => _UserCreatedAvatarGridState();
}

class _UserCreatedAvatarGridState extends State<UserCreatedAvatarGrid> {
  @override
  Widget build(BuildContext context) {
    print(currentUser.id);
    var list = Provider.of<List<Avatar>>(context);
    var curr = [];
    for(int i=0;i<list.length;i++){
      if(list[i].ownerId == currentUser.id){
        curr.add(list[i]);
      }
    }
    print(curr.length);
    var originalList = [];
    if ((widget.filterOption != null && widget.filterOption != "") &&
        curr != null) {
      for (int i = 0; i < curr.length; i++) {
        bool flag = false;
        if (curr[i]
            .name
            .toLowerCase()
            .contains(widget.filterOption.toLowerCase())) {
          originalList.add(curr[i]);
        } else if (curr[i]
            .type
            .toLowerCase()
            .contains(widget.filterOption.toLowerCase())) {
          originalList.add(curr[i]);
        }
      }
    } else {
      originalList = curr;
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
