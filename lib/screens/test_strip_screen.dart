import 'package:ceramic_app/model/Test.dart';
import 'package:ceramic_app/model/TestStripItem.dart';
import 'package:flutter/material.dart';
import 'package:ceramic_app/constants.dart';

class TestStripScreen extends StatefulWidget {
  @override
  _TestStripScreenState createState() => _TestStripScreenState();
}

class _TestStripScreenState extends State<TestStripScreen> {
  List<Test> getTestData() {
    List<Test> testList = List();

    Test hardnessTest = Test(testName: 'Total Hardness', testUnit: 'ppm');
    hardnessTest.testValues = List();
    hardnessTest.testValues
        .add(TestStripItem(color: kHardnessColor1, value: 0));
    hardnessTest.testValues
        .add(TestStripItem(color: kHardnessColor2, value: 110));
    hardnessTest.testValues
        .add(TestStripItem(color: kHardnessColor3, value: 250));
    hardnessTest.testValues
        .add(TestStripItem(color: kHardnessColor4, value: 500));
    hardnessTest.testValues
        .add(TestStripItem(color: kHardnessColor5, value: 1000));

    Test chlorineTest = Test(testName: 'Total Chlorine', testUnit: 'ppm');
    chlorineTest.testValues = List();
    chlorineTest.testValues
        .add(TestStripItem(color: kChlorineColor1, value: 0));
    chlorineTest.testValues
        .add(TestStripItem(color: kChlorineColor2, value: 1));
    chlorineTest.testValues
        .add(TestStripItem(color: kChlorineColor3, value: 3));
    chlorineTest.testValues
        .add(TestStripItem(color: kChlorineColor4, value: 5));
    chlorineTest.testValues
        .add(TestStripItem(color: kChlorineColor5, value: 10));

    Test freeChlorineTest = Test(testName: 'Free Chlorine', testUnit: 'ppm');
    freeChlorineTest.testValues = List();
    freeChlorineTest.testValues
        .add(TestStripItem(color: kFreeChlorineColor1, value: 0));
    freeChlorineTest.testValues
        .add(TestStripItem(color: kFreeChlorineColor2, value: 1));
    freeChlorineTest.testValues
        .add(TestStripItem(color: kFreeChlorineColor3, value: 3));
    freeChlorineTest.testValues
        .add(TestStripItem(color: kFreeChlorineColor4, value: 5));
    freeChlorineTest.testValues
        .add(TestStripItem(color: kFreeChlorineColor5, value: 10));

    Test pHTest = Test(testName: 'pH', testUnit: 'ppm');
    pHTest.testValues = List();
    pHTest.testValues.add(TestStripItem(color: kPHColor1, value: 6.2));
    pHTest.testValues.add(TestStripItem(color: kPHColor2, value: 6.8));
    pHTest.testValues.add(TestStripItem(color: kPHColor3, value: 7.2));
    pHTest.testValues.add(TestStripItem(color: kPHColor4, value: 7.8));
    pHTest.testValues.add(TestStripItem(color: kPHColor5, value: 8.4));

    Test alkalinityTest = Test(testName: 'Total Alkality', testUnit: 'ppm');
    alkalinityTest.testValues = List();
    alkalinityTest.testValues
        .add(TestStripItem(color: kAlkalinityColor1, value: 0));
    alkalinityTest.testValues
        .add(TestStripItem(color: kAlkalinityColor2, value: 40));
    alkalinityTest.testValues
        .add(TestStripItem(color: kAlkalinityColor3, value: 120));
    alkalinityTest.testValues
        .add(TestStripItem(color: kAlkalinityColor4, value: 180));
    alkalinityTest.testValues
        .add(TestStripItem(color: kAlkalinityColor5, value: 240));

    Test cyanuricAcidTest = Test(testName: 'Cyanuric Acid', testUnit: 'ppm');
    cyanuricAcidTest.testValues = List();
    cyanuricAcidTest.testValues
        .add(TestStripItem(color: kAcidColor1, value: 0));
    cyanuricAcidTest.testValues
        .add(TestStripItem(color: kAcidColor2, value: 50));
    cyanuricAcidTest.testValues
        .add(TestStripItem(color: kAcidColor3, value: 100));
    cyanuricAcidTest.testValues
        .add(TestStripItem(color: kAcidColor4, value: 150));
    cyanuricAcidTest.testValues
        .add(TestStripItem(color: kAcidColor5, value: 300));

    testList.add(hardnessTest);
    testList.add(chlorineTest);
    testList.add(freeChlorineTest);
    testList.add(pHTest);
    testList.add(alkalinityTest);
    testList.add(cyanuricAcidTest);

    return testList;
  }

  List<Widget> getTests() {
    List<Test> testList = getTestData();

    List<Widget> testItemList = List();

    for (Test test in testList) {
      testItemList.add(TestItem(
        test: test,
      ));
    }

    return testItemList;
  }

  List<Widget> getSelectedTestColors() {
    List<Test> testList = getTestData();

    List<Widget> colorsList = List();

    for (Test test in testList) {
      colorsList.add(SelectedColor(
        test: test,
      ));
    }

    return colorsList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: kNextButtonColor,
                  onPressed: () {},
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Test Strip',
                    style: TextStyle(
                      color: kTitleColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: getSelectedTestColors(),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: getTests(),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SelectedColor extends StatelessWidget {
  final Test test;
  SelectedColor({this.test});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0),
      width: 30,
      height: 30,
      color: test?.selectedTestValue?.color??Colors.black,
    );
  }
}

class TestItem extends StatefulWidget {
  final Test test;
  final Function onSelectedColor;

  TestItem({this.test, this.onSelectedColor});

  @override
  _TestItemState createState() => _TestItemState();
}

class _TestItemState extends State<TestItem> {
  List<Widget> getTestValues() {
    List<Widget> testValueItemList = List();

    for (TestStripItem testValue in widget.test.testValues) {
      testValueItemList.add(
        TestValueItem(
          testStripItem: testValue,
          onTap: (){
            setState(() {
              widget.test.selectedTestValue = testValue;
            });
          },
        ),
      );
    }

    return testValueItemList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${widget.test.testName} (${widget.test.testUnit})',
              style: TextStyle(
                  color: kTestTitleColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            OutlineButton(
              color: kTestTitleColor,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              onPressed: () {},
              child: Text(
                '${widget.test?.selectedTestValue?.value??'value'}',
                style: TextStyle(color: kTestTitleColor),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 4.0,
        ),
        Row(
          children: getTestValues(),
        ),
      ],
    );
  }
}

class TestValueItem extends StatelessWidget {
  final TestStripItem testStripItem;
  final Function onTap;
  TestValueItem({this.testStripItem,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 3 / 1,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: onTap,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: testStripItem.color,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              '${testStripItem.value}',
              style: TextStyle(
                  fontWeight: FontWeight.w400, color: kTestTitleColor),
            )
          ],
        ),
      ),
    );
  }
}
