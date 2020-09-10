import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedFontSize: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            backgroundColor: Color.fromRGBO(183, 248, 219, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            title: Text("Lijst"),
            backgroundColor: Color.fromRGBO(80, 167, 194, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text("Meer"),
            backgroundColor: Color.fromRGBO(120, 167, 180, 1),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: false,
              enableSuggestions: true,
              autocorrect: true,
              decoration: InputDecoration(
                hintText: "Zoek een product",
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  color: Colors.black,
                  onPressed: () => print("Clear search Bar"),
                ),
                border: new OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(50.0)),
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              ),
            ),
          ],
        ),
      ),
//      backgroundColor:,
    );
  }
}
