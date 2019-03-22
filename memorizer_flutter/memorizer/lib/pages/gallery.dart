import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:memorizer/models/species_item.dart';

class GalleryPage extends StatefulWidget {
  GalleryPage({Key key, this.title, this.items}) : super(key: key);

  final String title;
  List<SpeciesItem> items;
  int currentIndex = 0;

  @override
  _GalleryState createState() => new _GalleryState();
}

class _GalleryState extends State<GalleryPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        body:
        OrientationBuilder(
          builder: (context, orientation) {
            return
              Stack(
                children: <Widget>[
                  Swiper(itemBuilder: (BuildContext context, int index){
                    return new Image.network(widget.items[index].imageUrls.first, fit: BoxFit.cover,);
                  },
                      itemCount: widget.items.length,
                      control: new SwiperControl(),
                      itemWidth: orientation == Orientation.landscape ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.height,
                      itemHeight: orientation == Orientation.landscape ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.width,
                      layout: SwiperLayout.STACK,
                      onIndexChanged: ((idx) {
                        widget.currentIndex = idx;
                        setState(() {
                        });
                      })
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: new SizedBox(
                              height: 50,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                                textColor: Colors.white,
                                color: Colors.red,
                                child: new Text(
                                  widget.items[widget.currentIndex].name.getString("cs"),
                                ),
                                onPressed: () => {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              );
          },
        )
    );
  }
}