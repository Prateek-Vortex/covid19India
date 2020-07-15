
import 'package:flutter/cupertino.dart';
import 'contact_info_card.dart';
import 'package:flutter/material.dart';
class Helpline extends StatefulWidget {
  @override
  _HelplineState createState() => _HelplineState();
}

class _HelplineState extends State<Helpline> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // colors: [Colors.purple.shade200,Colors.blueGrey],
            //colors: [Color(0xFF2FE5C9),Color(0xFFC652C3)],
            //colors: [Color(0xFFFAFAFA),Color(0xFFC0D1D5)],
            colors: [Color(0xFFE3E3E1),Color(0xFFBCBDC8)],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(title: Text('Helpline'),backgroundColor: Colors.blueGrey.shade200,),
          body: getContactInfoUI(),
        ),
      ),
    );
  }
  Widget getContactInfoUI()
  {
    return ListView(
      children: <Widget>[
        Contact_card(ph: '+91-11-23978046',stateName: 'India',),
        Contact_card(ph: '+91-866-2410978',stateName: 'Andhra Pradesh',),
        Contact_card(ph: '+91-9436055743',stateName: 'Arunachal Pradesh',),
        Contact_card(ph: '+91-6913347770',stateName: 'Assam',),
        Contact_card(ph: '104',stateName: 'Bihar',),
        Contact_card(ph: '104',stateName: 'Chhattisgarh',),
        Contact_card(ph: '104',stateName: 'Goa',),
        Contact_card(ph: '104',stateName: 'Gujarat',),
        Contact_card(ph: '+91-8558893911',stateName: 'Haryana',),
        Contact_card(ph: '104',stateName: 'Himachal Pradesh',),
        Contact_card(ph: '104',stateName: 'Jharkhand',),
        Contact_card(ph: '104',stateName: 'Karnataka',),
        Contact_card(ph: '+91-471-2552056',stateName: 'Kerala',),
        Contact_card(ph: '+91-755-2527177"',stateName: 'Madhya Pradesh',),
        Contact_card(ph: '+91-20-26127394',stateName: 'Maharashtra',),
        Contact_card(ph: '+91-3852411668',stateName: 'Manipur',),
        Contact_card(ph: '108',stateName: 'Meghalaya',),
        Contact_card(ph: '102',stateName: 'Mizoram',),
        Contact_card(ph: '+91-7005539653',stateName: 'Nagaland',),
        Contact_card(ph: '+91-9439994859',stateName: 'Odisha',),
        Contact_card(ph: '104',stateName: 'Punjab',),
        Contact_card(ph: '+91-141-2225624',stateName: 'Rajasthan',),
        Contact_card(ph: '104',stateName: 'Sikkim',),
        Contact_card(ph: '+91-44-29510500',stateName: 'Tamil Nadu',),
        Contact_card(ph: '104',stateName: 'Telengana',),
        Contact_card(ph: '+91-381-2315879',stateName: 'Tripura',),
        Contact_card(ph: '104',stateName: 'Uttarakhand',),
        Contact_card(ph: '18001805145',stateName: 'Uttar Pradesh',),
        Contact_card(ph: '1800313444222',stateName: 'West Bengal',),
        Contact_card(ph: '+91-3192-232102',stateName: 'Andaman and Nicobar Islands',),
        Contact_card(ph: '+91-9779558282',stateName: 'Chandigarh',),
        Contact_card(ph: '104',stateName: 'Dadra and Nagar Haveli',),
        Contact_card(ph: '104',stateName: 'Daman & Diu',),
        Contact_card(ph: '+91-11-22307145',stateName: 'Delhi',),
        Contact_card(ph: '+91-191-2520982',stateName: 'Jammu and Kashmir',),
        Contact_card(ph: '+91-1982-256462',stateName: 'Ladakh',),
        Contact_card(ph: '104',stateName: 'Lakshadweep',),
        Contact_card(ph: '104',stateName: 'Puducherry',),
      ],
    );
  }
}



