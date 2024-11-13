import 'dart:math';

import 'package:bmi/bmi_result.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

    bool isMale = true;
    double height = 120.0;
    int weight = 40;
    int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title:Text('Bmi Caculator',style: TextStyle(
          color: Colors.white,
        ),) ,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                          setState(() {
                            isMale =true;

                          });                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('assets/images/5f47e2c4e700bd0004bb5e63.png',),
                              fit: BoxFit.cover,width: 100,
                              height: 115,),
                            Text('MALE',style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:isMale?Colors.blueGrey: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale =false;

                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('assets/images/Female_symbol.svg.png',),
                              fit: BoxFit.cover,width: 79,),
                            Text('FEMALE',style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:isMale? Colors.grey[400]:Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Expanded(
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20.0),
               child: Container(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('HEIGHT',style:
                       TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 25.0,
                       ),),
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.baseline,
                       textBaseline:TextBaseline.alphabetic,
                       mainAxisAlignment:MainAxisAlignment.center ,
                       children: [
                         Text('${height.round()}',style:
                         TextStyle(
                           fontWeight: FontWeight.w900,
                           fontSize: 40.0,
                         ),),
                         SizedBox(height: 5,),
                         Text('CM',style:
                         TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 20.0,
                         ),),

                       ],
                     ),
                     Slider(
                         value: height,
                         max: 220,
                         min: 80,
                         onChanged: (value){
                           setState(() {
                             height = value;
                           });
                         },
                     activeColor: Colors.black,),
                   ],
                 ),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: Colors.grey[400],
                 ),
               ),
             ),
          ),
          Expanded(
            child:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT',
                            style:
                            TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),),
                          Text('${weight}',style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                                heroTag: 'weight-',
                                mini: true,
                                child: Icon(Icons.remove,color: Colors.white,),
                                backgroundColor: Colors.black,),
                              SizedBox(width: 5,),
                              FloatingActionButton(onPressed: (){
                                  setState(() {
                                    weight++;
                                  }); },
                                heroTag: 'weight+',
                                mini: true,
                                child: Icon(Icons.add,color: Colors.white,),
                                backgroundColor: Colors.black,),
                            ],
                          ),

                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),

                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE',
                            style:
                            TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),),
                          Text('${age}',style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                                heroTag: 'age-',
                                mini: true,
                                child: Icon(Icons.remove,color: Colors.white,),
                                backgroundColor: Colors.black,),
                              SizedBox(width: 5,),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                                heroTag: 'age+',
                                mini: true,
                                child: Icon(Icons.add,color: Colors.white,),
                                backgroundColor: Colors.black,),
                            ],
                          ),

                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),

                    ),
                  ),

                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.blueGrey,
            child: MaterialButton(onPressed: (){
              double result = weight / pow(height / 100, 2);
                 print (result.round());
                 Navigator.push(context, MaterialPageRoute
                   (builder:(context)=>BmiResult(result: result.round(),
                   age: age,
                   isMale: isMale,) ));
            },
              child: Text('CALCULATE',
              style: TextStyle(color: Colors.white),),),
          )

        ],
      ),
    );
  }
}
