import 'package:ctguide/controller/marks_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarksList extends StatelessWidget {
  MarksList({ Key? key }) : super(key: key);
  final MarksController controller = Get.put(MarksController());
  @override
  Widget build(BuildContext context) {
    var marksList = controller.marks; 
    return Scaffold(
      appBar: AppBar(
        title: const Text('အမှတ်စာရင်း'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){Get.toNamed('/addmarks');}, icon: Icon(Icons.add)),
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
              marksList.length, 
              (index) => DataRow(
                onLongPress: (){
                  Get.toNamed('/addmarks', arguments: {'roNo': marksList[index].roNo, 'name': marksList[index].name});
                },
                cells: [
                  DataCell(Text(marksList[index].roNo.toString())),
                  DataCell(Text(marksList[index].name.toString())),
                  DataCell(Text(marksList[index].total.toString())),
                  DataCell(Text(marksList[index].rank.toString())),
                ]))),
        ),
      )
        ),
    );
  }
}