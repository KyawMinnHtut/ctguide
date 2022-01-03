class Marks {
  int? id;
  String? roNumber;
  String? stuName;
  String? sub1;
  String? sub2;
  String? sub3;
  String? sub4;
  String? sub5;
  String? sub6;
  String? total;
  String? rank;
  String? mt;

  Marks(
    {this.id,
      this.roNumber,
      this.stuName,
    this.sub1,
    this.sub2,
    this.sub3,
    this.sub4,
    this.sub5,
    this.sub6,
    this.total,
    this.rank,
    this.mt,
    }
  );

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'roNumber': roNumber,
      'stuName': stuName,
      'sub1': sub1,
      'sub2': sub2,
      'sub3': sub3,
      'sub4': sub4,
      'sub5': sub5,
      'sub6': sub6,
      'total': total,
      'rank': rank,
      'mt': mt,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Mark{'id': $id, 'roNumber': $roNumber, 'stuName': $stuName, 'sub1': $sub1, 'sub2': $sub2, 'sub3': $sub3, 'sub4': $sub4, 'sub5': $sub5, 'sub6': $sub6, 'total': $total, 'rank': $rank, 'mt': $mt}";
  }

}