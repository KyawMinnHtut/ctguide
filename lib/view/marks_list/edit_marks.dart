import 'package:ctguide/controller/marks_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewMarks extends StatelessWidget {
  ViewMarks({ Key? key }) : super(key: key);
  final MarksController controller = Get.find();
  var name = Get.arguments['name'];
  @override
  Widget build(BuildContext context) {
    var marksList = controller.marks; 
    return Scaffold(
      appBar: AppBar(
        title: const Text('အမှတ်စာရင်း ထည့်ရန်'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          //IconButton(onPressed: (){Get.toNamed('/viewmarks');}, icon: Icon(Icons.save)),
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
              DataColumn(label: Text('မြန်မာစာ')),
              DataColumn(label: Text('အင်္ဂလိပ်စာ')),
              DataColumn(label: Text('သင်္ချာ')),
              DataColumn(label: Text('ဓာတုဗေဒ')),
              DataColumn(label: Text('ရုပဗေဒ')),
              DataColumn(label: Text('ဇီဝဗေဒ')),
              DataColumn(label: Text('စုစုပေါင်း')),
              DataColumn(label: Text('အဆင့်')),
            ], 
            rows: List<DataRow>.generate(
              marksList.length, 
              (index) => DataRow(
                onLongPress: (){
                  //Get.toNamed('viewstu', arguments: {'name': marksList[name].name});
                },
                cells: [
                  DataCell(Text(marksList[index].roNumber.toString())),
                  DataCell(Text(marksList[index].stuName.toString())),
                  DataCell(Text(marksList[index].sub1.toString()),showEditIcon: true),
                  DataCell(Text(marksList[index].sub2.toString())),
                  DataCell(Text(marksList[index].sub3.toString())),
                  DataCell(Text(marksList[index].sub4.toString())),
                  DataCell(Text(marksList[index].sub5.toString())),
                  DataCell(Text(marksList[index].sub6.toString())),
                  DataCell(Text(marksList[index].total.toString())),
                  DataCell(Text(marksList[index].rank.toString())),
                ]))),
        ),
      )
        ),
    );
  }
}