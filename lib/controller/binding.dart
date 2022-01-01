import 'package:ctguide/controller/marks_controller.dart';
import 'package:ctguide/controller/student_controller.dart';
import 'package:get/get.dart';

class StudentBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => StudentController);
  }
}

class MarkBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => MarksController);
  }
}