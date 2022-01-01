import 'package:ctguide/controller/student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('အတန်းပိုင်လက်ဆွဲ', style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 50,),
            Container(
              width: 175,
              //color: Colors.amber,
              child: ElevatedButton(
                onPressed: (){Get.toNamed('/stulist');}, 
                child: const Text('ကျောင်းသားစာရင်း')
                ),
            ),
            Container(
              //color: Colors.amber,
              width: 175,
              child: ElevatedButton(
                onPressed: (){Get.toNamed('/palist');}, 
                child: const Text('(က) စာရင်း')
                ),
            ),
            Container(
              width: 175,
              //color: Colors.amber,
              child: ElevatedButton(
                onPressed: (){Get.toNamed('/mlist');}, 
                child: const Text('အမှတ်စာရင်း')),
            )
          ],
        ),
      ),
    );
  }
}