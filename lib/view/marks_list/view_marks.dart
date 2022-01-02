import 'package:ctguide/controller/marks_controller.dart';
import 'package:ctguide/controller/student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarksListView extends StatelessWidget {
  MarksListView({ Key? key }) : super(key: key);
  final MarksController controller = Get.put(MarksController());
  final StudentController controllerStu = Get.put(StudentController());
  @override
  Widget build(BuildContext context) {
    var stuList = controllerStu.students;
    var marksList = controller.marks; 
    return Scaffold(
      appBar: AppBar(
        title: const Text('အမှတ်စာရင်း'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){
            Get.toNamed('/addmarks');
            }, 
            icon: Icon(Icons.add)),
        ]
      ),
      body: Obx(()=>SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            //columnSpacing: 24,
            columns: const [
              //DataColumn(label: Text('စဥ်'), numeric: true),
              DataColumn(label: Text('ခုံအမှတ်')),
              DataColumn(label: Text('အမည်')),
              DataColumn(label: Text('စုစုပေါင်း')),
              DataColumn(label: Text('အဆင့်')),
            ], 
            rows: List<DataRow>.generate(
              stuList.length, 
              (index) => DataRow(
                onLongPress: (){
                  Get.toNamed('/addmarks', arguments: {'roNo': stuList[index].roNo, 'name': stuList[index].name});
                },
                cells: [
                  DataCell(Text(stuList[index].roNo.toString())),
                  DataCell(Text(stuList[index].name.toString())),
                  DataCell(Text('-')),
                  DataCell(Text('-')),
                ]))),
        ),
      )
        ),
    );
  }
}