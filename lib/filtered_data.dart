import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:patrick_uchegbu/data/data.dart';

class FilteredData extends StatefulWidget {

  final Map<String, dynamic> data;

  FilteredData({Key key, @required this.data}) : super(key: key);

  @override
  _FilteredDataState createState() => _FilteredDataState();
}

class _FilteredDataState extends State<FilteredData> {

  var filtered = List<Widget>();

  populateList() {
    Widget wwidget(
        String name,
        String email,
        String country,
        String model,
        int year,
        String color,
        String gender,
        String job,
        String bio
        ) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: Colors.grey,
                style: BorderStyle.solid
            )
        ),
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                NeumorphicText(
                  "Name",
                  style: NeumorphicStyle(
                    color: Colors.black54
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
                SizedBox(width: 10,),
                NeumorphicText(
                  name,
                  style: NeumorphicStyle(
                      color: Colors.black54
                  ),
                  textStyle: NeumorphicTextStyle(
                      fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                NeumorphicText(
                  "Email",
                  style: NeumorphicStyle(
                      color: Colors.black54
                  ),
                  textStyle: NeumorphicTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
                SizedBox(width: 10,),
                NeumorphicText(
                  email,
                  style: NeumorphicStyle(
                      color: Colors.black54
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                NeumorphicText(
                  "Country",
                  style: NeumorphicStyle(
                      color: Colors.black54
                  ),
                  textStyle: NeumorphicTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
                SizedBox(width: 10,),
                NeumorphicText(
                  country,
                  style: NeumorphicStyle(
                      color: Colors.black54
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                NeumorphicText(
                  "Car Model",
                  style: NeumorphicStyle(
                      color: Colors.black54
                  ),
                  textStyle: NeumorphicTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
                SizedBox(width: 10,),
                NeumorphicText(
                  model,
                  style: NeumorphicStyle(
                      color: Colors.black54
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                NeumorphicText(
                  "Car Model Year",
                  style: NeumorphicStyle(
                      color: Colors.black54
                  ),
                  textStyle: NeumorphicTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
                SizedBox(width: 10,),
                NeumorphicText(
                  year.toString(),
                  style: NeumorphicStyle(
                      color: Colors.black54
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                NeumorphicText(
                  "Car Color",
                  style: NeumorphicStyle(
                      color: Colors.black54
                  ),
                  textStyle: NeumorphicTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
                SizedBox(width: 10,),
                NeumorphicText(
                  color,
                  style: NeumorphicStyle(
                      color: Colors.black54
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                NeumorphicText(
                  "Gender",
                  style: NeumorphicStyle(
                      color: Colors.black54
                  ),
                  textStyle: NeumorphicTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
                SizedBox(width: 10,),
                NeumorphicText(
                  gender,
                  style: NeumorphicStyle(
                      color: Colors.black54
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                NeumorphicText(
                  "Job Title",
                  style: NeumorphicStyle(
                      color: Colors.black54
                  ),
                  textStyle: NeumorphicTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
                SizedBox(width: 10,),
                NeumorphicText(
                  job,
                  style: NeumorphicStyle(
                      color: Colors.black54
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Column(
              children: [
                NeumorphicText(
                  "Bio",
                  style: NeumorphicStyle(
                      color: Colors.black54
                  ),
                  textStyle: NeumorphicTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
                SizedBox(height: 10,),
                NeumorphicText(
                  bio,
                  style: NeumorphicStyle(
                      color: Colors.black54
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    for (var i in listToFilter) {
      if (i[6] is int == true && i[6] >= widget.data['start_year'] && i[6] <= widget.data['end_year']) {
        var _name = "${i[1]} ${i[2]}";
        var _email = i[3];
        var _country = i[4];
        var _model = i[5];
        var _year = i[6];
        var _color = i[7];
        var _gender = i[8];
        var _job = i[9];
        var _bio = "";
        var k = i.length;
        for (var j = 10; j < k; j++) {
          _bio += i[j];
        }
        setState(() {
          filtered.add(wwidget(_name, _email, _country, _model, _year, _color, _gender, _job, _bio));
        });
      } else if (i[8] == widget.data['gender']) {
        var _name = "${i[1]} ${i[2]}";
        var _email = i[3];
        var _country = i[4];
        var _model = i[5];
        var _year = i[6];
        var _color = i[7];
        var _gender = i[8];
        var _job = i[9];
        var _bio = "";
        var k = i.length;
        for (var j = 10; j < k; j++) {
          _bio += i[j];
        }
        setState(() {
          filtered.add(wwidget(_name, _email, _country, _model, _year, _color, _gender, _job, _bio));
        });
      } else if (widget.data['countries'].contains(i[4])) {
        var _name = "${i[1]} ${i[2]}";
        var _email = i[3];
        var _country = i[4];
        var _model = i[5];
        var _year = i[6];
        var _color = i[7];
        var _gender = i[8];
        var _job = i[9];
        var _bio = "";
        var k = i.length;
        for (var j = 10; j < k; j++) {
          _bio += i[j];
        }
        setState(() {
          filtered.add(wwidget(_name, _email, _country, _model, _year, _color, _gender, _job, _bio));
        });
      } else if (widget.data['colors'].contains(i[7])) {
        var _name = "${i[1]} ${i[2]}";
        var _email = i[3];
        var _country = i[4];
        var _model = i[5];
        var _year = i[6];
        var _color = i[7];
        var _gender = i[8];
        var _job = i[9];
        var _bio = "";
        var k = i.length;
        for (var j = 10; j < k; j++) {
          _bio += i[j];
        }
        setState(() {
          filtered.add(wwidget(_name, _email, _country, _model, _year, _color, _gender, _job, _bio));
        });
      }
    }
  }

  @override
  void initState() {
    populateList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: NeumorphicText("List of Filters", textStyle: NeumorphicTextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ), style: NeumorphicStyle(
              color: Colors.grey
          ),),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: ListView(
                children: filtered
              ),
            )
        )
    );
  }
}
