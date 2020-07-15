import 'dart:convert';
import 'package:flutter/material.dart';
import 'main.dart';
class Stateinfo extends StatefulWidget {

  @override
  _StateinfoState createState() => _StateinfoState();
}

class _StateinfoState extends State<Stateinfo> {


    List<String> totalCases=new List();
    List<Widget> lnew=new List();
    List<String> totalRecoveredCases=new List();
    List<String> totalDeaths=new List();
    List<String> stateName=new List();
  void getStateData()
  {
    String stateData=MyApp.data;
     for(int i=0;i<35;i++)
       {
         //String tc=jsonDecode(stateData)['data']['regional'][i]['confirmedCasesIndian'];
         var locName=jsonDecode(stateData)['data']['regional'][i]['loc'];
         var tc=jsonDecode(stateData)['data']['regional'][i]['totalConfirmed'];
         var deaths=jsonDecode(stateData)['data']['regional'][i]['deaths'];
         var recovered=jsonDecode(stateData)['data']['regional'][i]['discharged'];
        // print(locName);
         totalCases.add(tc.toString());
         totalRecoveredCases.add(recovered.toString());
         totalDeaths.add(deaths.toString());
         stateName.add(locName.toString());
       }

     //data.regional[0].discharged
     //data.regional[0].deaths
     //data.regional[0].loc
    //data.regional[0].totalConfirmed
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStateData();
  // print(MyApp.data);

    for(int i=0;i<35;i++)
    {
      lnew.add(State_info_card(stateName: stateName.elementAt(i),totalDeceased: totalDeaths.elementAt(i),totalCases: totalCases.elementAt(i),totalRecovered: totalRecoveredCases.elementAt(i),));
    }

    //print(lnew.elementAt(0));
    //print(lnew.elementAt(1));
  }
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
          appBar: AppBar(title: Text('State Info'),backgroundColor: Colors.blueGrey.shade200,),
          body: getStateUI(),
        ),
      ),
    );
  }

  Widget getStateUI(){
 return ListView(
   children: <Widget>[
     lnew.elementAt(0),
     lnew.elementAt(1),
     lnew.elementAt(2),
     lnew.elementAt(3),
     lnew.elementAt(4),
     lnew.elementAt(5),
     lnew.elementAt(6),
     lnew.elementAt(7),
     lnew.elementAt(8),lnew.elementAt(9),lnew.elementAt(10),lnew.elementAt(11),lnew.elementAt(12),
     lnew.elementAt(13),lnew.elementAt(14),lnew.elementAt(15),lnew.elementAt(16),lnew.elementAt(17),
     lnew.elementAt(18),lnew.elementAt(19),lnew.elementAt(20),lnew.elementAt(21),lnew.elementAt(22),
     lnew.elementAt(23),lnew.elementAt(24),lnew.elementAt(25),lnew.elementAt(26),lnew.elementAt(27),
     lnew.elementAt(28),lnew.elementAt(29),lnew.elementAt(30),lnew.elementAt(31),lnew.elementAt(32),
     lnew.elementAt(33),lnew.elementAt(34),
   ],
 );
   //data.regional[0].confirmedCasesIndian
    //data.regional[1].confirmedCasesIndian

  }
}

class State_info_card extends StatelessWidget {
  final String stateName;
  final String totalCases;
  final String totalRecovered;
  final String totalDeceased;
  State_info_card({this.stateName,this.totalCases,this.totalRecovered,this.totalDeceased});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(13.0),
      decoration: BoxDecoration(
        //color: Colors.blueGrey.shade200,
        color: Color(0xFFBCBDC8),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 7.0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(stateName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,color: Color(0xFF0A0E21)),),
          ),
          //Text('TotalCases$totalCases'),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: RichText(
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Total Cases'+'\n',style: TextStyle(fontSize: 15.0)),
                    TextSpan(text: totalCases,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,color: Color(0xFF0A0E21)),),
                  ]
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //Text('TotalRecovered$totalRecovered'),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(text: 'Total Recovered'+'\n',style: TextStyle(fontSize: 15.0)),
                        TextSpan(text: totalRecovered,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,color: Color(0xFF0A0E21)),),
                      ]
                  ),
                ),
              ),
             // Text('TotalDeceased$totalDeceased'),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(text: 'Total Deaths'+'\n',style: TextStyle(fontSize: 15.0)),
                        TextSpan(text: totalDeceased,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,color: Color(0xFF0A0E21)),),
                      ]
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


