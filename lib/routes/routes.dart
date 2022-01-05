import 'package:ctguide/controller/binding.dart';
import 'package:ctguide/view/home.dart';
import 'package:ctguide/view/marks_list/add_marks.dart';
import 'package:ctguide/view/marks_list/edit_marks.dart';
import 'package:ctguide/view/marks_list/edit_stumarks.dart';
import 'package:ctguide/view/marks_list/marks_list.dart';
import 'package:ctguide/view/marks_list/view_marks.dart';
import 'package:ctguide/view/present_absence/absence_list.dart';
import 'package:ctguide/view/students_info/add_student.dart';
import 'package:ctguide/view/students_info/edit_student.dart';
import 'package:ctguide/view/students_info/students_list.dart';
import 'package:ctguide/view/students_info/view_student.dart';
import 'package:get/get.dart';

class MyRoutes {
  static final routes = [
    GetPage(name: "/home", page: ()=> const HomeScreen()),
    GetPage(name: "/stulist", page: ()=> StuList(), binding: StudentBinding()),
    //GetPage(name: "/palist", page: ()=> const PAList()),
    GetPage(name: "/mlist", page: ()=> MarksList(), binding: MarkBinding()),
    //GetPage(name: "/mlistV", page: ()=> MarksListView(), binding: MarkBinding()),
    //GetPage(name: "/addmarks", page: ()=> AddMarks(), binding: MarkBinding()),
    //GetPage(name: "/viewmarks", page: ()=> ViewMarks(), binding: MarkBinding()),
     GetPage(name: "/editstumarks", page: ()=> EditStuMarks(), binding: MarkBinding()),
    GetPage(name: "/addstu", page: ()=> AddStu(), binding: StudentBinding()),
    GetPage(name: "/viewstu", page: ()=> const ViewStu(), binding: StudentBinding()),
    //GetPage(name: "/editstu", page: ()=> EditStu(), binding: StudentBinding()),
  ];
}
