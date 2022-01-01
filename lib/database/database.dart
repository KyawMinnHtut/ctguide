import 'dart:developer';
import 'dart:io';

import 'package:ctguide/model/marks.dart';
import 'package:ctguide/model/student.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

  static const _databaseName = "student.db";
  static const _databaseVersion = 1;
  static const table = 'Studentsdb';
  //static const columnImage = 'img';
  static const columnId = 'id';
  static const columnDOSE = 'dose';
  static const columnRoNo = 'roNo';
  static const columnName = 'name';
  static const columnDOB = 'dob';
  static const columnFatherName = 'fatherName';
  static const columnMotherName = 'motherName';
  static const columnAddress = 'address';
  static const columnPhNumber = 'phNumber';

  // static const _databaseName = "stumark.db";
  // static const _databaseVersion = 1;
  static const table1 = 'stuMarkdb';
  static const columnRN = 'roNumber';
  static const columnStuName = 'stuName';
  static const columnSub1 = 'sub1';
  static const columnSub2 = 'sub2';
  static const columnSub3 = 'sub3';
  static const columnSub4 = 'sub4';
  static const columnSub5 = 'sub5';
  static const columnSub6 = 'sub6';
  static const columnTotal = 'total';
  static const columnRank = 'rank';


  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String dbPath = await getDatabasesPath();
    String dataPath = p.join(dbPath, _databaseName);
    //print(dataPath);

  

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    p.join(documentsDirectory.path, _databaseName);
    //print(path);
    return await openDatabase(dataPath,
        version: _databaseVersion, 
        onCreate: _onCreate,
        onConfigure: _onConfigure);
  }

  static Future _onConfigure(Database db) async{
    await db.execute("PRAGMA foreign_keys = ON");
  }

  // SQL code to create the database table for student model
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table(
    $columnId INTEGER PRIMARY KEY,
    $columnDOSE VARCHAR NOT NULL,
    $columnRoNo VARCHAR,
    $columnName TEXT NOT NULL,
    $columnDOB VARCHAR,
    $columnFatherName TEXT,
    $columnMotherName TEXT,
    $columnAddress TEXT,
    $columnPhNumber VARCHAR
    )''');

    await db.execute('''
          CREATE TABLE $table1(
    $columnRN VARCHAR PRIMARY KEY,
    $columnStuName TEXT,
    $columnSub1 TEXT,
    $columnSub2 TEXT,
    $columnSub3 TEXT,
    $columnSub4 TEXT,
    $columnSub5 TEXT,
    $columnSub6 TEXT,
    $columnTotal NULL,
    $columnRank NUll 
    )''');
  }
  //FOREIGN KEY  ($columnStuName) REFERENCES $table($columnName) 

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<void> insertStudent(Student student) async {
    Database db = await instance.database;
    await db.insert(
      table, 
      student.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace, nullColumnHack: "");
  }

    // Future updateStudentbyID(int id, String dose, String roNo, String name, String dob, String fatherName, String motherName, String address, String phNumber) async{
    // //Get a reference to the database.
    // Database db = await instance.database;
    // log(id.toString());
    // //Update the given Note.
    // return await db.rawUpdate('UPDATE $table SET  $columnDOSE = ?, $columnRoNo = ?, $columnName = ?, $columnDOB = ?, $columnFatherName = ?, $columnMotherName = ?, $columnAddress = ?, $columnPhNumber = ?  where $columnId = ?', [dose, roNo, name, dob, fatherName, motherName, address, phNumber, id ]);
    // }

  Future<void> insertStuMarks(Marks mark) async {
    Database db = await instance.database;
    await db.insert(
      table1, 
      mark.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace, nullColumnHack: "");
  }

  //   Future<void> insertStuMarks(String roNumber, String name, String sub1, String sub2, String sub3, String sub4,String sub5, String sub6, String total, String rank) async {
  //   Database db = await instance.database;
  //   await db.rawInsert("INSERT INTO $table1($columnRN, $columnStuName, $columnSub1, $columnSub2, $columnSub3, $columnSub4, $columnSub5, $columnSub6, $columnTotal, $columnRank) VALUES($roNumber, $name, $sub1, $sub2, $sub3, $sub4, $sub5, $sub6, $total, $rank)");
  //     //log('values from insetMarksController=> '+value.toString());
  // }

    Future updateStuMarksbyRN(String roNumber, String sub1, String sub2, String sub3, String sub4,String sub5, String sub6, String total, String rank) async{
    //Get a reference to the database.
    Database db = await instance.database;
    log(roNumber.toString());
    //Update the given stuMark.
    return await db.rawUpdate('UPDATE $table1 SET $columnSub1 = ?, $columnSub2 = ?, $columnSub3 = ?,$columnSub4 = ?, $columnSub5 = ?,$columnSub6 = ?,  $columnTotal = ?, $columnRank = ?  where $columnRN = ?', [sub1, sub1, sub1,sub1, sub1, sub1, total, rank, roNumber]);
    }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Student>> queryAllStudents() async {
    Database db = await instance.database;
    //final data = await db.query(table);
    final List<Map<String, dynamic>> students = await db.query(table);
    log("values from database of queryAllStudents=>" + students.toString());
    return List<Student>.generate(students.length, (i){
      return Student(
        //img: students[i]['img'],
        id: students[i]['id'],
        dose: students[i]['dose'],
        roNo: students[i]['roNo'],
        name: students[i]['name'],
        dob: students[i]['dob'],
        fatherName: students[i]['fatherName'],
        motherName: students[i]['motherName'],
        address: students[i]['address'],
        phNumber: students[i]['phNumber'],
         );
    });
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Marks>> queryAllStuMarks() async {
    Database db = await instance.database;
    //final data = await db.query(table);
    final List<Map<String, dynamic>> marks = await db.rawQuery('SELECT $columnRoNo, $columnName FROM $table LEFT JOIN $table1 ON $table.$columnRoNo=$table1.$columnRN ORDER BY $columnRoNo');
    log("values from database of queryAllStuMarks=>" + marks.toString());
    return List<Marks>.generate(marks.length, (i){
      return Marks(
        roNo: marks[i]['roNo'],
        name: marks[i]['name'],
        sub1: marks[i]['sub1'],
        sub2: marks[i]['sub2'],
        sub3: marks[i]['sub3'],
        sub4: marks[i]['sub4'],
        sub5: marks[i]['sub5'],
        sub6: marks[i]['sub6'],
        total: marks[i]['total'],
        rank: marks[i]['rank'],
         );
    });
  }

  Future updateStudentbyID(int id, String dose, String roNo, String name, String dob, String fatherName, String motherName, String address, String phNumber) async{
  //Get a reference to the database.
  Database db = await instance.database;
  log(id.toString());
  //Update the given Note.
  return await db.rawUpdate('UPDATE $table SET  $columnDOSE = ?, $columnRoNo = ?, $columnName = ?, $columnDOB = ?, $columnFatherName = ?, $columnMotherName = ?, $columnAddress = ?, $columnPhNumber = ?  where $columnId = ?', [dose, roNo, name, dob, fatherName, motherName, address, phNumber, id ]);
  }

  // Future updateFav(int id, int value) async{
  //   Database db = await instance.database;
  //   return await db.rawUpdate('UPDATE $table SET $columnFavourite = ? where $columnId = ?', [value, id]);
  // }

  // Future moveToTrash(int id, int value) async{
  //   Database db = await instance.database;
  //   return await db.rawUpdate('UPDATE $table SET $columnIsInTrash = ? where $columnId = ?', [value, id]);
  // }
  // // Future updateNotebyID(Note note, int id) async{
  // //   //Get a reference to the database.
  // //   Database db = await instance.database;
  // //   log(id.toString());
  // //   //Update the given Note.
  // //   return await db.update(
  // //     table, 
  // //     note.toMap(),
  // //     where: '$columnId = ?',
  // //     whereArgs: [note.id],
  // //     );
  // // }

  Future<Student> selectStudentByID(int id) async{
    //Get a reference to the database.
    Database db = await instance.database;
    final List<Map<String, Object?>> students = await db.query(table, where: '$columnId = ?', whereArgs: [id]);
    //assign first map of students to a student
    var student = students[0];
    return Student(
        id: id,
        dose: student['dose'].toString(),
        roNo: student['roNo'].toString(),
        name: student['name'].toString(),
        dob: student['dob'].toString(),
        fatherName: student['fatherName'].toString(),
        motherName: student['motherName'].toString(),
        address: student['address'].toString(),
        phNumber: student['phNumber'].toString(),
        );
  }

  Future deleleAllStudents() async {
    Database db = await instance.database;
    return await db.delete(table);
  }
 
  Future<void> deleteStudentByID(int id) async{
    Database db = await instance.database;
    await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}