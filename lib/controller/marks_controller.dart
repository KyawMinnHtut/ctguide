import 'dart:developer';

import 'package:ctguide/database/database.dart';
import 'package:ctguide/model/marks.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MarksController extends GetxController{
  RxList<Marks> marks = <Marks>[].obs;
  final TextEditingController roNoController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sub1Controller = TextEditingController();
  final TextEditingController sub2Controller = TextEditingController();
  final TextEditingController sub3Controller = TextEditingController();
  final TextEditingController sub4Controller = TextEditingController();
  final TextEditingController sub5Controller = TextEditingController();
  final TextEditingController sub6Controller = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController rankController = TextEditingController();
  final _db = DatabaseHelper.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    getAllMarks();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    roNoController.dispose();
    nameController.dispose();
    sub1Controller.dispose();
    sub2Controller.dispose();
    sub3Controller.dispose();
    sub4Controller.dispose();
    sub5Controller.dispose();
    sub6Controller.dispose();
    totalController.dispose();
    rankController.dispose();
  }

  clear(){
    roNoController.clear();
    nameController.clear();
    sub1Controller.clear();
    sub2Controller.clear();
    sub3Controller.clear();
    sub4Controller.clear();
    sub5Controller.clear();
    sub6Controller.clear();
    totalController.clear();
    rankController.clear();
  }

  getAllMarks() async {
    List<Marks> markList =  await _db.queryAllStuMarks();
    marks.value = markList;
    log('values from queryAllMarkscontroller=>  ' + markList.toString());
  }

  addMarks(){
    Marks marks = Marks(
      roNo: roNoController.text,
      name: nameController.text,
      sub1: sub1Controller.text,
      sub2: sub2Controller.text,
      sub3: sub3Controller.text,
      sub4: sub4Controller.text,
      sub5: sub5Controller.text,
      sub6: sub6Controller.text,
      total: totalController.text,
      rank: rankController.text,
    );
    log('values from addMarks controller'+marks.toString());
    _db.insertStuMarks(marks);
    getAllMarks();
  }

    updateStuMarksbyRN(String roNumber) {
    Marks mark = Marks(
      roNo: roNoController.text,
      name: nameController.text,
      sub1: sub1Controller.text,
      sub2: sub2Controller.text,
      sub3: sub3Controller.text,
      sub4: sub4Controller.text,
      sub5: sub5Controller.text,
      sub6: sub6Controller.text,
      total: totalController.text,
      rank: rankController.text,
    );
    _db.updateStuMarksbyRN(roNumber, mark.sub1!, mark.sub2!, mark.sub3!, mark.sub4!, mark.sub5!, mark.sub6!, mark.total!, mark.rank!);
    log('values from updateStuMarksbyRN controller=>'+mark.toString());
    getAllMarks();
  }
}