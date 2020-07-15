import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Contact_card extends StatelessWidget {
  final String ph;
  final String stateName;
  Contact_card({this.ph,this.stateName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){_makePhoneCall('tel:$ph');},
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          //color: Colors.blueGrey.shade200,
          color: Color(0xFFBCBDC8),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
              child: Text(stateName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Color(0xFF0A0E21)),),
            ),
//            Padding(
//              padding: const EdgeInsets.fromLTRB(6.0, 3.0, 0.0, 12.0),
//              child: Text(ph,style: TextStyle(fontSize: 17.0),),
//            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 3.0, 0.0, 12.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.phone,size: 20.0,),
                SizedBox(
                  width: 7.0,
                ),
                Text(ph,style: TextStyle(fontSize: 17.0,),),
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}
Future<void> _makePhoneCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}