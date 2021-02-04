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
  Widget build(BuildContext context) {
  //  double h = MediaQuery.of(context).size.height;
//    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.pushNamed(context, 'all_avatar');
        }),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: 2,
            children: <Widget>[
              GridContainer(
                  text: 'Biology',
                  imageUrl:
                      'https://logos.co/1024/vector-logo-of-a-dna-double-helix-cloning-strand-in-red-and-blue-by-vector-tradition-sm-42655.jpg'),
              GridContainer(
                  text: 'History',
                  imageUrl:
                      'https://webstockreview.net/images/history-clipart-clip-art.jpg'),
              GridContainer(
                  text: 'Construction',
                  imageUrl:
                      'https://png.pngtree.com/template/20191014/ourmid/pngtree-building-and-construction-logo-design-template-with-wave-sign-image_317778.jpg'),
              GridContainer(
                  text: 'Astronomy',
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToBrFc2OCaWlL2lAdS-CeN_hDpr1JWnDWPMQ&usqp=CAU'),
              GridContainer(
                  text: 'Heritage',
                  imageUrl:
                      'https://www.kindpng.com/picc/m/127-1273415_taj-mahal-transparent-png-taj-mahal-logo-png.png'),
              GridContainer(
                  text: 'Economy',
                  imageUrl:
                      'https://previews.123rf.com/images/freaktor/freaktor1908/freaktor190801084/128954676-economics-abstract-chart-and-arrow-for-corporate-business-logo-marketing-finance-symbol-marketing-fi.jpg'),
              GridContainer(
                  text: 'Mechanics',
                  imageUrl:
                      'https://t4.ftcdn.net/jpg/03/16/32/11/360_F_316321194_wfj9haQAWOE24438WbJYeMNo0kBiAutw.jpg'),
              GridContainer(
                  text: 'Chemistry',
                  imageUrl:
                      'https://img.jagranjosh.com/imported/images/E/Articles/cbse-12th-chemistry-sample-paper-pdf-jagran-josh.jpg'),
            ],
          ),
        ),
        bottomNavigationBar: nav(0));
  }
}
