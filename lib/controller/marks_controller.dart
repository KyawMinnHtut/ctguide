import 'dart:developer';

import 'package:ctguide/database/database.dart';
import 'package:ctguide/model/marks.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MarksController extends GetxController{
  RxList<Marks> marks = <Marks>[].obs;
  RxList<Marks> marksMT = <Marks>[].obs;
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
  final TextEditingController mtController = TextEditingController();
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
    mtController.dispose();
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
    mtController.clear();
  }

  getAllMarks() async {
    List<Marks> markList =  await _db.queryAllStuMarks();
    marks.value = markList;
    log('values from queryAllMarkscontroller=>  ' + markList.toString());
  }

  selectStuMarksByMT(String mt) async {
    List<Marks> markList =  await _db.queryAllStuMarksByMT(mt);
    marks.value = markList;
    log('values from queryAllMarkscontroller=>  ' + markList.toString());
  }

  addMarks(){
    Marks marks = Marks(
      roNumber: roNoController.text,
      stuName: nameController.text,
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

  selectStuMarksByID(int id) async{
    var mark = await _db.selectStuMarksByID(id);
    roNoController.text = mark.roNumber.toString();
    nameController.text = mark.stuName.toString();
    sub1Controller.text = mark.sub1.toString();
    sub2Controller.text = mark.sub2.toString();
    sub3Controller.text = mark.sub3.toString();
    sub4Controller.text = mark.sub4.toString();
    sub5Controller.text = mark.sub5.toString();
    sub6Controller.text = mark.sub6.toString();
    totalController.text = mark.total.toString();
    rankController.text = mark.rank.toString();
  }
 
    updateStuMarksbyID(int id) {
    Marks mark = Marks(
      sub1: sub1Controller.text,
      sub2: sub2Controller.text,
      sub3: sub3Controller.text,
      sub4: sub4Controller.text,
      sub5: sub5Controller.text,
      sub6: sub6Controller.text,
      total: totalController.text,
      rank: rankController.text,
      //roNumber: roNoController.text,
    );
    _db.updateStuMarksbyID(id, mark.sub1!, mark.sub2!, mark.sub3!, mark.sub4!, mark.sub5!, mark.sub6!, mark.total!, mark.rank!);
    log('values from updateStuMarksbyID controller=>'+mark.toString());
    getAllMarks();
  }
}