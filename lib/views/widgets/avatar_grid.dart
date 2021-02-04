import 'package:flutter/material.dart';
import 'package:learn_with_ar/modals/avatar.dart';
import 'package:learn_with_ar/views/widgets/avatar_tile.dart';
import 'package:provider/provider.dart';

class AvatarGrid extends StatefulWidget {
  String filterOption;
  AvatarGrid({this.filterOption});
  @override
  _AvatarGridState createState() => _AvatarGridState();
}

class _AvatarGridState extends State<AvatarGrid> {
  @override
  Widget build(BuildContext context) {
    var list = Provider.of<List<Avatar>>(context);
    var originalList = [];
    if ((widget.filterOption != null && widget.filterOption != "") &&
        list != null) {
      for (int i = 0; i < list.length; i++) {
        bool flag = false;
        if (list[i]
            .name
            .toLowerCase()
            .contains(widget.filterOption.toLowerCase())) {
          originalList.add(list[i]);
        } else if (list[i]
            .type
            .toLowerCase()
            .contains(widget.filterOption.toLowerCase())) {
          originalList.add(list[i]);
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
