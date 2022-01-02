import 'package:ctguide/controller/marks_controller.dart';
// import 'package:ctguide/database/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditStuMarks extends StatelessWidget {
  EditStuMarks({ Key? key }) : super(key: key);
  final MarksController controller = Get.find();
  @override
  Widget build(BuildContext context) {
      var roNo = Get.arguments['roNo'];
      controller.selectStuMarksByRN(roNo);
      //var marksList = controller.marks; 
    return Scaffold(
      appBar: AppBar(
        title: const Text('အမှတ်စာရင်း ပြင်ရန်'),
        centerTitle: true,
        // actions: [
        //   IconButton(onPressed: (){}, icon: Icon(Icons.search)),
        //   IconButton(onPressed: (){Get.toNamed('/viewmarks');}, icon: Icon(Icons.save)),
        // ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    controller: controller.roNoController,
                    enabled:false,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(border: InputBorder.none,
                    label: Text('ခုံအမှတ်'),
                    contentPadding: EdgeInsets.all(4)),
                  )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    controller: controller.nameController,
                    enabled:false,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(border: InputBorder.none,
                    label: Text('အမည်'),
                    contentPadding: EdgeInsets.all(4)),
                  )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    controller: controller.sub1Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: InputBorder.none,
                    label: Text('မြန်မာစာ'),
                    contentPadding: EdgeInsets.all(4)),
                  )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    controller: controller.sub2Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: InputBorder.none,
                    label: Text('အင်္ဂလိပ်စာ'),
                    contentPadding: EdgeInsets.all(4)),
                  )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    controller: controller.sub3Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: InputBorder.none,
                    label: Text('သင်္ချာ'),
                    contentPadding: EdgeInsets.all(4)),
                  )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    controller: controller.sub4Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: InputBorder.none,
                    label: Text('ဓာတုဗေဒ'),
                    contentPadding: EdgeInsets.all(4)),
                  )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    controller: controller.sub5Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: InputBorder.none,
                    label: Text('ရူပဗေဒ'),
                    contentPadding: EdgeInsets.all(4)),
                  )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    controller: controller.sub6Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: InputBorder.none,
                    label: Text('ဇီဝဗေဒ'),
                    contentPadding: EdgeInsets.all(4)),
                  )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    controller: controller.totalController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: InputBorder.none,
                    label: Text('စုစုပေါင်း'),
                    contentPadding: EdgeInsets.all(4)),
                  )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    controller: controller.rankController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: InputBorder.none,
                    label: Text('အဆင့်'),
                    contentPadding: EdgeInsets.all(4)),
                  )),
              ),
            ],
          ),
      ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: (){
            controller.updateStuMarksbyRN(roNo);
            controller.clear();
            Get.back();
          },),
      
    );
  }
}
