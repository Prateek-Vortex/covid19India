
import 'package:covid/helpline_info.dart';
import 'package:covid/input_page.dart';
import 'package:covid/state_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static String data;
  static var total;
  static var totaldischarged;
  static var  totaldeaths;
  static var active;
  Future<String> getData()async{
    Response response=await get('https://api.rootnet.in/covid19-in/stats/latest');
    if(response.statusCode==200)
    {
      data=response.body;
       total=jsonDecode(data)['data']['summary']['total'];
      totaldischarged=jsonDecode(data)['data']['summary']['discharged'];
      totaldeaths=jsonDecode(data)['data']['summary']['deaths'];
       active=jsonDecode(data)['data']['unofficial-summary'][0]['active'];

      return total.toString();
    }
    else{print(response.statusCode);}

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyBottomNavigationBar(),
    );
  }
}


class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  int _currentIndex=0;
  final List<Widget> _children=[
    InputPage(),
    Stateinfo(),
    Helpline(),
  ];
  void onTappedBar(int index){
    setState(() {
      _currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: MyApp().getData(),
      builder: (context,snapshot){
      if (!snapshot.hasData) {
       //return Center(child: CircularProgressIndicator());
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFE3E3E1),Color(0xFFBCBDC8)],
            ),
          ),
          child: Scaffold(
            body: Center(child:
               //CircularProgressIndicator(),
              SpinKitDoubleBounce(
                color: Colors.blueGrey.shade200,
                size: 80.0,
              ),

            ),
          ),
        );
      }
       else{
        return Scaffold(
          body: _children[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blueGrey.shade200,
            selectedItemColor: Colors.grey.shade500,
            onTap: onTappedBar,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home')
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_city),
                  title: Text('State')
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.phone),
                  title: Text('Helpline')
              ),
            ],
          ),
        );
      }
      },
    );
  }
}



