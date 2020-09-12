import 'package:Shapp/screens/search_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shapp"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            InkWell(
              borderRadius: BorderRadius.all(const Radius.circular(50.0)),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Zoek een product",
                  enabled: false,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: new OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(50.0)),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              ),
            ),
          ],
        ),
      ),
//      backgroundColor:,
    );
  }
}
