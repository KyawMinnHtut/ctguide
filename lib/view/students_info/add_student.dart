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
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar:AppBar(
        title: const Text('ကျောင်းသား၏ကိုယ်ရေး'),
        centerTitle: true,
      ) ,    
      //form validate
      //photo ထည့်ရန် ၁လက်မပတ်လည် နေရာပေးရန်  
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(top: 12, bottom: 12),
              //   child: Container(
              //     height: 124,
              //     width: 175,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Container(
              //           width: 175,
              //           child: ListView(
              //             //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Padding(
              //                 padding: const EdgeInsets.only(bottom: 24),
              //                 child: Container(
              //     decoration: BoxDecoration(
              //       //color: Colors.amber,
              //       border: Border.all(color: Colors.blue),
              //       borderRadius: BorderRadius.circular(8)),
              //     child: TextFormField(
              //       validator: (value) {
              //             if (value == null || value.isEmpty) {
              //               return 'ကျောင်းဝင်အမှတ်ထည့်ပေးပါ';
              //             } 
              //             return null;
              //           },
              //       controller: controller.doseController,
              //       keyboardType: TextInputType.number,
              //       decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              //       hintText: 'ကျောင်းဝင်အမှတ်',
              //       contentPadding: EdgeInsets.all(4)),
              //     )
              //     ),
              //               ),
              //     TextFormField(
              //       controller: controller.roNoController,
              //       keyboardType: TextInputType.number,
              //       decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              //       hintText: 'ခုံအမှတ်',
              //       contentPadding: EdgeInsets.all(4)),
              //     ),
              //             ],
              //           ),
              //         ),
              //         Container(
              //           width: 150,
              //           decoration: BoxDecoration(
              //             border: Border.all(color: Colors.blue),
              //       borderRadius: BorderRadius.circular(8)
              //           ),
              //           child: Center(
              //             child: Stack(
              //               children: [
              //                 //Icon(Icons.person_outline_sharp, size: 125, ),
              //                 Positioned(
              //                   top: 20,
              //                   right: 20,
              //                   child: InkWell(
              //                     onTap: () async{
              //                       //final XFile? image = await _picker.pickImage(source: ImageSource.gallery, maxHeight: 125, maxWidth: 125);
              //                     },
              //                     child: Icon(Icons.camera_alt)),
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              //       ],
              //     )
              //     ),
              // ),
              // Container(
              //           height: 150,
              //           decoration: BoxDecoration(
              //             border: Border.all(color: Colors.blue),
              //       borderRadius: BorderRadius.circular(8)
              //           ),
              //           child: Center(
              //             child: Stack(
              //               children: [
              //                 //Icon(Icons.person_outline_sharp, size: 125, ),
              //                 Positioned(
              //                   top: 20,
              //                   right: 20,
              //                   child: InkWell(
              //                     onTap: () async{
              //                       //final XFile? image = await _picker.pickImage(source: ImageSource.gallery, maxHeight: 125, maxWidth: 125);
              //                     },
              //                     child: Icon(Icons.camera_alt)),
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: TextFormField(
                  validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'ကျောင်းဝင်အမှတ်ထည့်ပေးပါ';
                        } 
                        return null;
                      },
                  controller: controller.doseController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  hintText: 'ကျောင်းဝင်အမှတ်',
                  contentPadding: EdgeInsets.all(4)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: TextFormField(
                  controller: controller.roNoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  hintText: 'ခုံနံပါတ်',
                  contentPadding: EdgeInsets.all(4)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: TextFormField(
                  validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'အမည်ထည့်ပေးပါ';
                        } 
                        return null;
                      },
                  controller: controller.nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  hintText: 'အမည်',
                  contentPadding: EdgeInsets.all(4)),
                ),
              ),
              //dob ကို မူတည်ကာ အသက်တွက်ရန်
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: TextFormField(
                  controller: controller.dobController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  hintText: 'မွေးသက္ကရာဇ်',
                  contentPadding: EdgeInsets.all(4)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: TextFormField(
                  validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'အဘအမည်ထည့်ပေးပါ';
                        } 
                        return null;
                      },
                  controller: controller.fatherNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  hintText: 'အဘအမည်',
                  contentPadding: EdgeInsets.all(4)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: TextFormField(
                  controller: controller.motherNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  hintText: 'အမိအမည်',
                  contentPadding: EdgeInsets.all(4)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: TextFormField(
                  controller: controller.addressController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  hintText: 'နေရပ်လိပ်စာ',
                  contentPadding: EdgeInsets.all(4)),
                ),
              ),
              //ဖုန်းနံပါတ်ကို ထိခါ ဖုန်းခေါ်နိုင်ရန်
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: TextFormField(
                  controller: controller.phNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  hintText: 'ဖုန်းနံပါတ်',
                  contentPadding: EdgeInsets.all(4)),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save), 
        onPressed: (){
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  controller.addStudent();
                  controller.clear();
                  Get.back();
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('ကျောင်းသားစာရင်းသစ် ထည့်သွင်းပီးပါပီ။'), backgroundColor: Colors.greenAccent,),
                  );
                }
          
        },),
    );
  }
}