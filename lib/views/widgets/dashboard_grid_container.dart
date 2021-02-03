import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Animated Container no video joi leje..
// Widget of the week mathi..
class GridContainer extends StatefulWidget {
  Color color =
      Colors.transparent; // any color aa pachi nai joi pan atyare joi che so...
  String text; // math, science etc..
  String imageUrl; // aa pachi avse atyare nathi..
  double h; // height of container
  double w; // width

  GridContainer({
    this.text,
    this.color,
    this.imageUrl,
    this.h,
    this.w,
  }); // constructor che aa..
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
        border: Border.all(color: Colors.blueGrey),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 25.0,
              spreadRadius: 2.0,
              offset: Offset(1.0, 1.0))
        ],
        image: DecorationImage(
            image: NetworkImage(widget.imageUrl), fit: BoxFit.cover),
      ),
      padding: EdgeInsets.all(8),
      alignment: Alignment.bottomCenter,

      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            gradient: LinearGradient(begin: Alignment.bottomLeft, colors: [
              Colors.transparent,
              Colors.white,
            ])),
        child: Text(
          '${widget.text}',
        ),
      ),
      /*child: Text(
        '${widget.text}',
      ),*/
    );
  }
}
