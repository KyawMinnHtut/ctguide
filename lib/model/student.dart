class Student {
  //String? img;
  int? id;
  String? dose;
  String? roNo;
  String? name;
  String? dob;
  String? fatherName;
  String? motherName;
  String? address;
  String? phNumber;
  Student(
    {
      //this.img,
      this.id,
      this.dose,
      this.roNo,
      this.name,
      this.dob,
      this.fatherName,
      this.motherName,
      this.address,
      this.phNumber,
    }
  );
  Map<String, dynamic> toMap(){
    return {
      //'img': img,
      'id': id,
      'dose': dose,
      'roNo': roNo,
      'name': name,
      'dob': dob,
      'fatherName': fatherName,
      'motherName': motherName,
      'address': address,
      'phNumber': phNumber,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Student{id: $id, dose: $dose, roNo: $roNo, name: $name, dob: $dob, fatherName: $fatherName, motherName: $motherName, address: $address, phNumber: $phNumber}";
  }

}