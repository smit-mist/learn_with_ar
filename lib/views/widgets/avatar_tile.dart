import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_with_ar/modals/avatar.dart';

class AvatarTile extends StatefulWidget {
  Avatar currentAvatar;
  AvatarTile({this.currentAvatar});
  @override
  _AvatarTileState createState() => _AvatarTileState();
}

class _AvatarTileState extends State<AvatarTile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                widget.currentAvatar.imageUrl,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.currentAvatar.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 16),
                    ),
                    Text(
                      widget.currentAvatar.type,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurple,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'View AR',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
