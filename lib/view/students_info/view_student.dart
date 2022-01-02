import 'package:ctguide/controller/student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewStu extends StatefulWidget {
  const ViewStu({ Key? key }) : super(key: key);
  @override
  State<ViewStu> createState() => _ViewStuState();
}
class _ViewStuState extends State<ViewStu> {
  final StudentController controller = Get.find();
  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
  var id = Get.arguments['id'];
    controller.selectStudentByID(id);
    return Scaffold(
      appBar:AppBar(
        title: const Text('ကျောင်းသား၏ကိုယ်ရေး'),
        centerTitle: true,
        // actions: [
        //   isEdit = false ? IconButton(onPressed: (){}, icon: Icon(Icons.edit)) : IconButton(onPressed: (){}, icon: Icon(Icons.save))
        // ],
      ) ,      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Container(
                height: 124,
                width: 175,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 175,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(
                            enabled: isEdit==false ? false: true,
                            controller: controller.doseController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                            label: Text('ကျောင်းဝင်အမှတ်'),
                            //hintText: 'ကျောင်းဝင်အမှတ်',
                            contentPadding: EdgeInsets.all(4)),
                          ),
                TextFormField(
                  enabled: isEdit==false ? false: true,
                  controller: controller.roNoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  label: Text('ခုံအမှတ်'),
                  contentPadding: EdgeInsets.all(4)),
                ),
                        ],
                      ),
                    ),
                  //   Container(
                  //     width: 150,
                  //     decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.blue),
                  // borderRadius: BorderRadius.circular(8)
                  //     ),
                  //     child: Center(
                  //       child: Stack(
                  //         children: [
                  //           //Icon(Icons.person_outline_sharp, size: 125, ),
                  //           Positioned(
                  //             top: 20,
                  //             right: 20,
                  //             child: InkWell(
                  //               onTap: () async{
                  //                 final XFile? image = await _picker.pickImage(source: ImageSource.gallery, maxHeight: 125, maxWidth: 125);
                  //               },
                  //               child: Icon(Icons.camera_alt)),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  ],
                )
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: TextFormField(
                controller: controller.nameController,
                enabled: isEdit==false ? false: true,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                label: Text('အမည်'),
                contentPadding: EdgeInsets.all(4)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: TextFormField(
                controller: controller.dobController,
                enabled: isEdit==false ? false: true,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                label: Text('မွေးသက္ကရာဇ်'),
                contentPadding: EdgeInsets.all(4)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: TextFormField(
                controller: controller.fatherNameController,
                enabled: isEdit==false ? false: true,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                label: Text('အဘအမည်'),
                contentPadding: EdgeInsets.all(4)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: TextFormField(
                controller: controller.motherNameController,
                enabled: isEdit==false ? false: true,
                //keyboardType: TextInputType.name,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                label: Text('အမိအမည်'),
                contentPadding: EdgeInsets.all(4)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: TextFormField(
                controller: controller.addressController,
                enabled: isEdit==false ? false: true,
                //keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                label: Text('နေရပ်လိပ်စာ'),
                contentPadding: EdgeInsets.all(4)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: TextFormField(
                controller: controller.phNumberController,
                enabled: isEdit==false ? false: true,
                //keyboardType: TextInputType.phone,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                label: Text('ဖုန်းနံပါတ်'),
                contentPadding: EdgeInsets.all(4)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: isEdit == true ? 
                              FloatingActionButton(
                                  onPressed: (){
                                    controller.updateStudentbyID(id); 
                                    controller.clear(); 
                                    Get.back();}, 
                                  child: const Icon(Icons.save),) : 
                              FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      isEdit =! isEdit;});}, 
                                  child: const Icon(Icons.edit),),
    );
  }
}