import 'package:flutter/material.dart';
import 'package:memorizer/models/category_content.dart';
import 'package:memorizer/pages/category_detail.dart';

class CategoryItem extends StatefulWidget {
  final CategoryContent category;

  CategoryItem(this.category);

  @override
  CategoryItemState createState() {
    return new CategoryItemState(category);
  }
}

class CategoryItemState extends State<CategoryItem> {
  CategoryContent category;

  CategoryItemState(this.category);

  Widget get lessonImage {
    var dogAvatar = new Hero(
      tag: category.name.getString("cs"),
      child: new Container(
        width: 70.0,
        height: 70.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: new NetworkImage(category.items.first.imageUrl ?? ''),
          ),
        ),
      ),
    );

    var placeholder = new Container(
        width: 70.0,
        height: 70.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          gradient: new LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black54, Colors.black, Colors.blueGrey[600]],
          ),
        ),
        alignment: Alignment.center);

    var crossFade = new AnimatedCrossFade(
      firstChild: placeholder,
      secondChild: dogAvatar,
      crossFadeState: category.items.first.imageUrl == null
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: new Duration(milliseconds: 1000),
    );

    return crossFade;
  }

  Widget get listTile {
    return ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: lessonImage,
      title: Text(
        category.name.getString("cs"),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                // tag: 'hero',
                child: LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                    value: 10,
                    valueColor: AlwaysStoppedAnimation(Colors.green)),
              )),
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("Dojo",
                    style: TextStyle(color: Colors.white))),
          )
        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {
        showDetailPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: listTile,
      ),
    );
  }

  showDetailPage() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new CategoryDetailPage(category);
    }));
  }
}