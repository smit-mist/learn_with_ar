import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_with_ar/views/particular_category_screen.dart';

// Animated Container no video joi leje..
// Widget of the week mathi..
class GridContainer extends StatefulWidget {
  Color color =
      Colors.transparent; // any color aa pachi nai joi pan atyare joi che so...
  String text; // math, science etc..
  String imageUrl; // aa pachi avse atyare nathi..

  GridContainer({
    this.text,
    this.color,
    this.imageUrl,
  }); // constructor che aa..
  @override
  _GridContainerState createState() => _GridContainerState();
}

class _GridContainerState extends State<GridContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
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
        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
        alignment: Alignment.bottomCenter,

        child: FittedBox(
          fit: BoxFit.cover,
          child: Text(
            '${widget.text}',
            style: TextStyle(
              backgroundColor: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CategoryScreen(
              categoryName: widget.text,
            ),
          ),
        );
      },
    );
  }
}
