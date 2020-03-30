import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'non_responsive_screen.dart';
import 'responsive_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      referenceHeight: 1920,
      referenceWidth: 1080,
      referenceShortestSide: 411,
    );

    return ResponsiveWidgets.builder(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(ResponsiveWidgets.getSize(50)),
          child: AppBar(
            title: TextResponsive('Plugin example app'),
            centerTitle: true,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NonResponsiveScreen())),
                      child: TextResponsive("Not Responsive Page"),
                      key: Key('RaisedButton'),
                    ),
                    RaisedButtonResponsive(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResponsiveScreen())),
                      child: TextResponsive("Responsive Page"),
                      key: Key('RaisedButtonResponsive'),
                    )
                  ],
                ),
                TextResponsive(
                  'Plugin example app',
                  key: Key('TextResponsive'),
                ),
                Text(
                  'Plugin example app',
                  key: Key('Text'),
                ),
                ContainerResponsive(
                  key: Key('ContainerResponsive'),
                  height: 100,
                  width: 200,
                  color: Colors.green,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 200,
                      width: 100,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ContainerResponsive(
                      height: 200,
                      width: 100,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: ResponsiveWidgets.safeBlockVertical * 50,
                      width: ResponsiveWidgets.safeBlockHorizontal * 20,
                      color: Colors.green,
                    ),
                  ],
                ),
                Container(
                  key: Key('Container'),
                  height: 100,
                  width: 200,
                  color: Colors.green,
                ),
                IconResponsive(
                  Icons.ac_unit,
                  key: Key('IconResponsive'),
                ),
                Icon(
                  Icons.ac_unit,
                  key: Key('Icon'),
                ),
                IconButtonResponsive(
                  onPressed: () {},
                  icon: Icon(Icons.ac_unit),
                  key: Key('IconButtonResponsive'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.ac_unit),
                  key: Key('IconButton'),
                ),

                ///! Never use two responsive widgets like this:
                IconButtonResponsive(
                  onPressed: () {},
                  icon: IconResponsive(Icons.ac_unit),
                ),
                IconButton(
                  onPressed: () {},
                  icon: IconResponsive(Icons.ac_unit),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
