import 'package:Shapp/widgets/intro_info.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController controller = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          PageView(
            onPageChanged: (value) {
              setState(() {
                pageIndex = value;
              });
            },
            controller: controller,
            children: <Widget>[
              IntroInfo('assets/images/basket.png', 'Find whatever you need',
                  'You can search through all products offered by partnered stores.'),
              IntroInfo('assets/images/supermarket_location.png', 'Clear information',
                  'You can find all information you need, such as price, availability, allergies, and much more.'),
              IntroInfo('assets/images/map.png', 'Go get it',
                  'You can easily view which stores have the product you selected.'),
            ],
          ),
          Positioned(
            bottom: 16.0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8.0),
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2),
                            color: pageIndex == 0
                                ? Theme.of(context).primaryColor
                                : Colors.white),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2),
                            color: pageIndex == 1
                                ? Theme.of(context).primaryColor
                                : Colors.white),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2),
                            color: pageIndex == 2
                                ? Theme.of(context).primaryColor
                                : Colors.white),
                      )
                    ],
                  ),
                  pageIndex != 2
                      ? FlatButton(
                          splashColor: Colors.transparent,
                          child: Text(
                            'Next',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          onPressed: () {
                            if (!(controller.page == 2.0))
                              controller.nextPage(
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.linear);
                          },
                        )
                      : FlatButton(
                          splashColor: Colors.transparent,
                          child: Text(
                            'Finish',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
