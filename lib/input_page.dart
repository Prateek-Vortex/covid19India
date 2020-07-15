import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'main.dart';
//import 'package:firebase_admob/firebase_admob.dart';
import 'package:admob_flutter/admob_flutter.dart';


class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {



  List<String> _listImage=['images/socialDistance.png','images/sanitizer.png','images/touch.png','images/wash.png','images/mask.png'];
  //List<String> _listText=['Social Distancing','Sanatize Regularly',"Don't Touch Face",'Wash Hand Regularly','Wear Mask', ];
  int _currentIndex=0;

  @override
  void initState() {
    // TODO: implement initState
    Admob.initialize(getAppID());

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //FirebaseAdMob.instance.initialize(appId: "ca-app-pub-5088596611589238~7547424825").then((value) => myBanner..load()..show());

    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFE3E3E1),Color(0xFFBCBDC8)],
          ),
        ),
        child: Scaffold(
          appBar: AppBar(title: Text('Covid-19 India'),backgroundColor: Colors.blueGrey.shade200,),
          backgroundColor: Colors.transparent,
          body: getMainListViewUI(),
        ),
      ),
    );
  }
  void changeImage(){
    setState(() {
      _currentIndex=(_currentIndex+1)%_listImage.length;
    });
  }

  Widget getMainListViewUI() {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: ReusableCard(heading1: 'Total Cases',heading2: 'Active Cases',heading3: 'Total Recovered',heading4: 'Total Deaths',cases: MyApp.total.toString(),recovered: MyApp.totaldischarged.toString(),decesead: MyApp.totaldeaths.toString(),activeCases: MyApp.active.toString(),),
        ),
        Expanded(
          flex: 3,
          child: GestureDetector(
            onTap: (){
                    changeImage();
            },
            child: Container(
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                //color: Colors.blueGrey.shade200,
                color: Color(0xFFBCBDC8),
                borderRadius: BorderRadius.circular(15.0),
              ),
             child: Stack(
              children: <Widget>[
                Center(
                  child: Opacity(
                    opacity: 0.5,
                    child: Image(
                      image: AssetImage(_listImage.elementAt(_currentIndex)),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

              ],
            ),
            ),
          ),
        ),
        AdmobBanner(
          adUnitId: getBannerAdUnitID(),
          adSize: AdmobBannerSize.BANNER,
        ),
      ],
    );
  }
}
String getBannerAdUnitID()
{
//if(Platform.isAndroid)
  return"ca-app-pub-5088596611589238/6816797083"; //real
  //return "ca-app-pub-3940256099942544/6300978111";
}
String getAppID(){
  return "ca-app-pub-5088596611589238~7547424825";
}

//MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
//  keywords: <String>['Health', 'Covid'],
//  contentUrl: 'https://flutter.io',
//  //birthday: DateTime.now(),
//  childDirected: false,
//
//  //designedForFamilies: false,
//  //gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
//  testDevices: <String>[], // Android emulators are considered test devices
//);

//BannerAd myBanner = BannerAd(
//
//  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
//  // https://developers.google.com/admob/android/test-ads
//
//  // https://developers.google.com/admob/ios/test-ads
// //adUnitId: "ca-app-pub-5088596611589238/6816797083", //real
//  adUnitId: "ca-app-pub-3940256099942544/6300978111",
// // adUnitId: BannerAd.testAdUnitId,
//  size: AdSize.banner,
//  targetingInfo: targetingInfo,
//  listener: (MobileAdEvent event) {
//    print("BannerAd event is $event");
//  },
//);