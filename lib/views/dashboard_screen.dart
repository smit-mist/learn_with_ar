import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_with_ar/views/widgets/nav_bar.dart';
import 'package:learn_with_ar/views/widgets/dashboard_grid_container.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  String _image_add =
      'https://savageandgray.co.uk/wp-content/uploads/2017/04/DNA-Strand.gif';
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, 'all_avatar');
      }),
      appBar: AppBar(),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          GridContainer(
              color: Colors.teal[400],
              text: 'Biology',
              imageUrl:
                  'https://logos.co/1024/vector-logo-of-a-dna-double-helix-cloning-strand-in-red-and-blue-by-vector-tradition-sm-42655.jpg'),
          GridContainer(
              color: Colors.teal[400],
              text: 'History',
              imageUrl:
                  'https://st3.depositphotos.com/1195078/18282/v/1600/depositphotos_182820584-stock-illustration-colorful-illustration-about-history-in.jpg'),
          GridContainer(
              color: Colors.teal[400],
              text: 'Construction',
              imageUrl:
                  'https://png.pngtree.com/template/20191014/ourmid/pngtree-building-and-construction-logo-design-template-with-wave-sign-image_317778.jpg'),
          GridContainer(
              color: Colors.teal[400],
              text: 'Astronomy',
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToBrFc2OCaWlL2lAdS-CeN_hDpr1JWnDWPMQ&usqp=CAU'),
          GridContainer(
              color: Colors.teal[400],
              text: 'Heritage',
              imageUrl:
                  'https://www.kindpng.com/picc/m/127-1273415_taj-mahal-transparent-png-taj-mahal-logo-png.png'),
          GridContainer(
              color: Colors.teal[400],
              text: 'Economy',
              imageUrl:
                  'https://previews.123rf.com/images/freaktor/freaktor1908/freaktor190801084/128954676-economics-abstract-chart-and-arrow-for-corporate-business-logo-marketing-finance-symbol-marketing-fi.jpg'),
          GridContainer(
              color: Colors.teal[400],
              text: 'Mechanics',
              imageUrl:
                  'https://t4.ftcdn.net/jpg/03/16/32/11/360_F_316321194_wfj9haQAWOE24438WbJYeMNo0kBiAutw.jpg'),
          GridContainer(
              color: Colors.teal[400],
              text: 'Chemistry',
              imageUrl:
                  'https://img.jagranjosh.com/imported/images/E/Articles/cbse-12th-chemistry-sample-paper-pdf-jagran-josh.jpg'),
        ],
      ),
      bottomNavigationBar: nav(0),
    );
  }
}
