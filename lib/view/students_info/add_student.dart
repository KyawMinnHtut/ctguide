import 'package:ctguide/controller/student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

class AddStu extends StatelessWidget {
  AddStu({ Key? key }) : super(key: key);
  final StudentController controller = Get.find();
  //final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('ကျောင်းသား၏ကိုယ်ရေး'),
        centerTitle: true,
      ) ,    
      //form validate
      //photo ထည့်ရန် ၁လက်မပတ်လည် နေရာပေးရန်  
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
                          Container(
                decoration: BoxDecoration(
                  //color: Colors.amber,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8)),
                child: TextFormField(
                  controller: controller.doseController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: InputBorder.none,
                  hintText: 'ကျောင်းဝင်အမှတ်',
                  contentPadding: EdgeInsets.all(4)),
                )
                ),
                Container(
                decoration: BoxDecoration(
                  //color: Colors.amber,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8)),
                child: TextFormField(
                  controller: controller.roNoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: InputBorder.none,
                  hintText: 'ခုံအမှတ်',
                  contentPadding: EdgeInsets.all(4)),
                )
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
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8)
                  ),
                child: TextFormField(
                  controller: controller.nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(border: InputBorder.none,
                  hintText: 'အမည်',
                  contentPadding: EdgeInsets.all(4)),
                )),
            ),
            //dob ကို မူတည်ကာ အသက်တွက်ရန်
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8)),
                child: TextFormField(
                  controller: controller.dobController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(border: InputBorder.none,
                  hintText: 'မွေးသက္ကရာဇ်',
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
                  controller: controller.fatherNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(border: InputBorder.none,
                  hintText: 'အဘအမည်',
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
                  controller: controller.motherNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(border: InputBorder.none,
                  hintText: 'အမိအမည်',
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
                  controller: controller.addressController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(border: InputBorder.none,
                  hintText: 'နေရပ်လိပ်စာ',
                  contentPadding: EdgeInsets.all(4)),
                )),
            ),
            //ဖုန်းနံပါတ်ကို ထိခါ ဖုန်းခေါ်နိုင်ရန်
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8)),
                child: TextFormField(
                  controller: controller.phNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(border: InputBorder.none,
                  hintText: 'ဖုန်းနံပါတ်',
                  contentPadding: EdgeInsets.all(4)),
                )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save), 
        onPressed: (){
          controller.addStudent();
          controller.clear();
          Get.toNamed('/stulist');
        },),
    );
  }
}