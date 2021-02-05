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
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Container(
        // koi pan animation thai ano time...
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
       //   border: Border.all(color: Colors.blueGrey),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 25.0,
                spreadRadius: 2.0,
                offset: Offset(1.0, 1.0))
          ],
        ),
     //   padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
        alignment: Alignment.bottomCenter,

        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(10)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.imageUrl,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: h * 0.2,
                        child: Container(
                          color: Colors.white,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 10,

                child: Text(
                  '${widget.text}',
                  style: TextStyle(
                    backgroundColor: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
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
