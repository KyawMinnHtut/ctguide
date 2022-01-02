// import 'package:ctguide/controller/student_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class EditStu extends StatelessWidget {
//   EditStu({ Key? key }) : super(key: key);
//   final StudentController controller = Get.find();
  
//   @override
//   Widget build(BuildContext context) {
//     var id = Get.arguments['id'];
//     controller.selectStudentByID(id);
//     return Scaffold(
//       appBar:AppBar(
//         title: Text('ကျောင်းသား၏ကိုယ်ရေး'),
//         centerTitle: true,
//       ) ,      
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 12, bottom: 12),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(8)),
//                 child: TextFormField(
//                   controller: controller.doseController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(border: InputBorder.none,
//                   hintText: 'ကျောင်းဝင်အမှတ်',
//                   contentPadding: EdgeInsets.all(4)),
//                 )),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 12, bottom: 12),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(8)),
//                 child: TextFormField(
//                   controller: controller.roNoController,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(border: InputBorder.none,
//                   hintText: 'ခုံအမှတ်',
//                   contentPadding: EdgeInsets.all(4)),
//                 )),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 12, bottom: 12),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(8)),
//                 child: TextFormField(
//                   controller: controller.nameController,
//                   keyboardType: TextInputType.name,
//                   decoration: InputDecoration(border: InputBorder.none,
//                   hintText: 'အမည်',
//                   contentPadding: EdgeInsets.all(4)),
//                 )),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 12, bottom: 12),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(8)),
//                 child: TextFormField(
//                   controller: controller.dobController,
//                   keyboardType: TextInputType.datetime,
//                   decoration: InputDecoration(border: InputBorder.none,
//                   hintText: 'မွေးသက္ကရာဇ်',
//                   contentPadding: EdgeInsets.all(4)),
//                 )),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 12, bottom: 12),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(8)),
//                 child: TextFormField(
//                   controller: controller.fatherNameController,
//                   keyboardType: TextInputType.name,
//                   decoration: InputDecoration(border: InputBorder.none,
//                   hintText: 'အဘအမည်',
//                   contentPadding: EdgeInsets.all(4)),
//                 )),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 12, bottom: 12),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(8)),
//                 child: TextFormField(
//                   controller: controller.motherNameController,
//                   keyboardType: TextInputType.name,
//                   decoration: InputDecoration(border: InputBorder.none,
//                   hintText: 'အမိအမည်',
//                   contentPadding: EdgeInsets.all(4)),
//                 )),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 12, bottom: 12),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(8)),
//                 child: TextFormField(
//                   controller: controller.addressController,
//                   keyboardType: TextInputType.streetAddress,
//                   decoration: InputDecoration(border: InputBorder.none,
//                   hintText: 'နေရပ်လိပ်စာ',
//                   contentPadding: EdgeInsets.all(4)),
//                 )),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 12, bottom: 12),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(8)),
//                 child: TextFormField(
//                   controller: controller.phNumberController,
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(border: InputBorder.none,
//                   hintText: 'ဖုန်းနံပါတ်',
//                   contentPadding: EdgeInsets.all(4)),
//                 )),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           controller.updateStudentbyID(id); 
//           controller.clear(); 
//           Get.back();}, 
//         child: const Icon(Icons.save),
//       ),
//     );
//   }
// }