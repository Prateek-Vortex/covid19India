import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  final String heading1;
  final String heading2;
  final String heading3;
  final String heading4;
  final String cases;
  final String recovered;
  final String decesead;
  final String activeCases;
  ReusableCard({this.heading1,this.heading2,this.heading3,this.heading4,this.cases,this.recovered,this.decesead,this.activeCases});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
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
            padding: const EdgeInsets.only(top: 10.0),
            child: Text('India',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0,color: Color(0xFF0A0E21)),),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //Text(heading1+'\n'+cases,style: TextStyle(fontWeight: FontWeight.bold),),
                RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: heading1+'\n',style: TextStyle(fontSize: 17.0)),
                    TextSpan(text: cases,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Color(0xFF0A0E21)),),
                  ]
                ),
                ),
               // Text(heading2+'\n'+activeCases,style: TextStyle(fontWeight: FontWeight.bold),),
                RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(text: heading2+'\n',style: TextStyle(fontSize: 17.0)),
                        TextSpan(text: activeCases,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Color(0xFF0A0E21)),),
                      ]
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //Text(heading2+'\n'+recovered,style: TextStyle(fontWeight: FontWeight.bold),),
                RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(text: heading3+'\n',style: TextStyle(fontSize: 17.0)),
                        TextSpan(text: recovered,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Color(0xFF0A0E21)),),
                      ]
                  ),
                ),
                //Text(heading3+'\n'+decesead,style: TextStyle(fontWeight: FontWeight.bold),),
                RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(text: heading4+'\n',style: TextStyle(fontSize: 17.0)),
                        TextSpan(text: decesead,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Color(0xFF0A0E21)),),
                      ]
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}