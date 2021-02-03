import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Animated Container no video joi leje..
// Widget of the week mathi..
class GridContainer extends StatefulWidget {
  Color color; // any color aa pachi nai joi pan atyare joi che so...
  String text; // math, science etc..
  String imageUrl; // aa pachi avse atyare nathi..
  double h; // height of container
  double w; // width
  GridContainer(
      {this.text,
      this.color,
      this.imageUrl,
      this.h,
      this.w}); // constructor che aa..
  @override
  _GridContainerState createState() => _GridContainerState();
}

class _GridContainerState extends State<GridContainer> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration:
          Duration(milliseconds: 100), // koi pan animation thai ano time...
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
          color: widget.color,
          image: DecorationImage(
              image: NetworkImage(widget.imageUrl), fit: BoxFit.cover)),
      padding: EdgeInsets.all(8),
      child: Text(
        '${widget.text}',
      ),
    );
  }
}
