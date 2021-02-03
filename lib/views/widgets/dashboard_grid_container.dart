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
      ),
      padding: EdgeInsets.all(8),
      child: Text(
        '${widget.text}',
      ),
    );
  }
}

class nav extends StatefulWidget {
  @override
  int _currentindex = 0;
  final tabs = ['dash', 'upload', 'profile'];
  nav(this._currentindex);
  _navState createState() => _navState();
}

class _navState extends State<nav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget._currentindex,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline), label: 'Upload'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      onTap: (index) {
        setState(() {
          widget._currentindex = index;
          Navigator.pushNamed(context, widget.tabs[index]);
        });
      },
    );
  }
}
