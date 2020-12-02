import 'package:ceramic_app/model/TestStripItem.dart';
import 'package:flutter/material.dart';

class Test{
  String testName;
  String testUnit;
  List<TestStripItem> testValues;
  TestStripItem selectedTestValue;

  Test({@required this.testName,this.testValues, this.testUnit,this.selectedTestValue});


}