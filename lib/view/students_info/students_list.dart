import 'package:ctguide/controller/student_controller.dart';
import 'package:ctguide/model/student.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_page/search_page.dart';

class StuList extends StatelessWidget {
  StuList({ Key? key }) : super(key: key);
  final StudentController controller = Get.put(StudentController());  
  @override
  Widget build(BuildContext context) {
    var studentList = controller.students;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ကျောင်းသားစာရင်း'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              showSearch(
                context: context, 
                delegate: SearchPage<Student>(
                  searchLabel: 'Search studentss',
                  suggestion: const Center(
                    child: Text('Search student by name, fathername or rollno.')
                  ),
                  failure: Center(
                    child: Text('No student found'),
                  ),
                  builder: (student)=> ListTile(
                    leading: Text(student.roNo.toString()),
                    title: Text(student.name.toString()),
                    trailing: Text(student.fatherName.toString()),
                    dense: true,

                  ), 
                  filter: (student)=>[
                    student.dose,
                    student.roNo,
                    student.name,
                    student.fatherName,
                    student.motherName,
                    student.address,
                    student.phNumber
                  ], 
                  items: controller.students));
            }, 
            icon: const Icon(Icons.search)
            ),
        ],
      ),
      body: Obx(()=>SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            columns: const [
              DataColumn(label: Text('စဥ်'),),
              DataColumn(label: Text('ခုံအမှတ်'),),
              DataColumn(label: Text('အမည်'),),
              DataColumn(label: Text('အဘအမည်'),),
            ], 
            rows: List<DataRow>.generate(
              studentList.length, 
              (index) => DataRow(
                onLongPress: (){
                  Get.toNamed('/viewstu', arguments: {'id': studentList[index].id});
                   
                },
                cells: [
                  DataCell(Text((index+1).toString())),
                  DataCell(Text(studentList[index].roNo.toString())),
                  DataCell(Text(studentList[index].name.toString())),
                  DataCell(Text(studentList[index].fatherName.toString())),
                ]))),
        ),
      )
        ),
      floatingActionButton: FloatingActionButton(onPressed: (){controller.clear(); Get.toNamed('/addstu');}, child: const Icon(Icons.add),),
    );
  }
}

