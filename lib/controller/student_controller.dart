import 'package:ctguide/database/database.dart';
import 'package:ctguide/model/marks.dart';
import 'package:ctguide/model/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


GlobalKey<FormState> formKey = GlobalKey<FormState>();
class StudentController extends GetxController{
  RxList<Student> students = <Student>[].obs;
  //final TextEditingController imageController = TextEditingController();
  final TextEditingController doseController = TextEditingController();
  final TextEditingController roNoController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phNumberController = TextEditingController();
  final _db = DatabaseHelper.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    getAllStudents();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    //imageController.dispose();
    doseController.dispose();
    roNoController.dispose();
    nameController.dispose();
    dobController.dispose();
    fatherNameController.dispose();
    motherNameController.dispose();
    addressController.dispose();
    phNumberController.dispose();
  }

addStudent(){
    Student student = Student(
      //img: imageController.text,
      dose: doseController.text,
      roNo: roNoController.text,
      name: nameController.text,
      dob: dobController.text,
      fatherName: fatherNameController.text,
      motherName: motherNameController.text,
      address: addressController.text,
      phNumber: phNumberController.text,
    );
    _db.insertStudent(student);
    addStutoMarks();
    getAllStudents();
  }

  addStutoMarks(){
    Marks marks1 = Marks(
      roNumber: roNoController.text,
      stuName: nameController.text,
      sub1: '',
      sub2: '',
      sub3: '',
      sub4: '',
      sub5: '',
      sub6: '',
      total: '',
      rank: '',
      mt: 'mt1',
    );
    _db.insertStuMarks(marks1);
    Marks marks2 = Marks(
      roNumber: roNoController.text,
      stuName: nameController.text,
      sub1: '',
      sub2: '',
      sub3: '',
      sub4: '',
      sub5: '',
      sub6: '',
      total: '',
      rank: '',
      mt: 'mt2',
    );
    _db.insertStuMarks(marks2);
    Marks marks3 = Marks(
      roNumber: roNoController.text,
      stuName: nameController.text,
      sub1: '',
      sub2: '',
      sub3: '',
      sub4: '',
      sub5: '',
      sub6: '',
      total: '',
      rank: '',
      mt: 'mt3',
    );
    _db.insertStuMarks(marks3);
    Marks marks4 = Marks(
      roNumber: roNoController.text,
      stuName: nameController.text,
      sub1: '',
      sub2: '',
      sub3: '',
      sub4: '',
      sub5: '',
      sub6: '',
      total: '',
      rank: '',
      mt: 'mt4',
    );
    _db.insertStuMarks(marks4);
  }

  getAllStudents() async{
    List<Student> studentList = await _db.queryAllStudents();
    students.value = studentList;
  }

  clear(){
    //imageController.clear();
    doseController.clear();
    roNoController.clear();
    nameController.clear();
    dobController.clear();
    fatherNameController.clear();
    motherNameController.clear();
    addressController.clear();
    phNumberController.clear();
  }

    //to select note by ID
  selectStudentByID(int id) async{
    var student = await _db.selectStudentByID(id);
    //imageController.text = student.img.toString();
    doseController.text = student.dose.toString();
    roNoController.text = student.roNo.toString();
    nameController.text = student.name.toString();
    dobController.text = student.dob.toString();
    fatherNameController.text = student.fatherName.toString();
    motherNameController.text = student.motherName.toString();
    addressController.text = student.address.toString();
    phNumberController.text = student.phNumber.toString();
 
  }

    updateStudentbyID(int id) {
    Student student = Student(
      id: id,
      //img: imageController.text,
      dose: doseController.text,
      roNo: roNoController.text,
      name: nameController.text,
      dob: dobController.text,
      fatherName: fatherNameController.text,
      motherName: motherNameController.text,
      address: addressController.text,
      phNumber: phNumberController.text,
    );
    _db.updateStudentbyID(id, student.dose!, student.roNo!, student.name!, student.dob!, student.fatherName!, student.motherName!, student.address!, student.phNumber!);
    getAllStudents();
  }

  deleteStudentByID(int id) async{
    await _db.deleteStudentByID(id);
    getAllStudents();
  }

}