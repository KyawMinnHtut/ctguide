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
        title: const Text('ကျောင်းသားစာရင်း'),
        centerTitle: true,
        // actions: [
        //   IconButton(onPressed: (){}, icon: Icon(Icons.search)),
        //   IconButton(onPressed: (){
        //     Get.offAndToNamed('/addmarks');
        //     }, 
        //     icon: Icon(Icons.add)),
        // ]
      ),
      body: Obx(()=>SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            showBottomBorder: true,
            //columnSpacing: 24,
            columns: const [
              //DataColumn(label: Text('စဥ်'), numeric: true),
              DataColumn(label: Text('စဥ်')),
              DataColumn(label: Text('ခုံအမှတ်')),
              DataColumn(label: Text('အမည်')),
            ], 
            rows: List<DataRow>.generate(
              stuList.length, 
              (index) => DataRow(
                onLongPress: (){
                  Get.toNamed('/addmarks', arguments: {'roNo': stuList[index].roNo, 'name': stuList[index].name});
                },
                cells: [
                  DataCell(Text((index+1).toString())),
                  DataCell(Text(stuList[index].roNo.toString())),
                  DataCell(Text(stuList[index].name.toString())),
                ]))),
        ),
      )
        ),
    );
  }
}