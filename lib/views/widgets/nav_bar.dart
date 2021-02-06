import 'package:flutter/material.dart';
import 'package:learn_with_ar/views/fav_avatar.dart';

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
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      onTap: (index) {
        if (index == 1) {
          setState(() {
            widget._currentindex = index;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => FavAvatarScreen(),
              ),
            );
          });
        }
        else{
          setState(() {
            widget._currentindex = index;
            Navigator.pushReplacementNamed(context, widget.tabs[index]);
          });
        }

      },
    );
  }
}
