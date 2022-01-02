import 'package:ctguide/controller/marks_controller.dart';
import 'package:ctguide/model/marks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_page/search_page.dart';

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
          IconButton(
            onPressed: (){
              showSearch(
                context: context, 
                delegate: SearchPage<Marks>(
                  searchLabel: 'Search students',
                  suggestion: const Center(
                    child: Text('Search student by name or rollno.')
                  ),
                  failure: Center(
                    child: Text('No student found'),
                  ),
                  builder: (mark)=> ListTile(
                    leading: Text(mark.roNumber.toString()),
                    title: Text(mark.stuName.toString()),
                    trailing: Text(mark.rank.toString()),
                    dense: true,

                  ), 
                  filter: (mark)=>[
                    mark.roNumber,
                    mark.stuName,
                    mark.rank,
                  ], 
                  items: controller.marks));
            }, 
            icon: const Icon(Icons.search)
            ),
        ],
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
                  Get.toNamed('/editstumarks', arguments: {'roNo': marksList[index].roNumber.toString()});
                  // Get.toNamed('/viewmarks', arguments: {'roNo': marksList[index].roNumber, 'name': marksList[index].stuName});
                },
                cells: [
                  DataCell(Text(marksList[index].roNumber.toString())),
                  DataCell(Text(marksList[index].stuName.toString())),
                  DataCell(Text(marksList[index].sub1.toString())),
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