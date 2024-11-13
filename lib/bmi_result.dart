import 'package:flutter/material.dart';

class BmiResult  extends StatelessWidget {


  final int result ;
  final bool isMale;
  final int age;

       BmiResult({
    required this.result,
    required this.isMale,
    required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('BMI Result',style: TextStyle(
          color: Colors.white,
        ),),
          leading:IconButton(onPressed: (){
          Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back),color: Colors.white,) ,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gender : ${isMale ? 'Male': 'Female' }',style:
              TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
            Text('Result : $result',style:
            TextStyle(
              fontSize: 25,g
              fontWeight: FontWeight.bold,
            ),),
            Text('Age : $age',style:
            TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),),

          ],
        ),
      ),
    );
  }
}
