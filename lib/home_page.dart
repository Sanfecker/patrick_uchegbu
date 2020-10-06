import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:patrick_uchegbu/filtered_data.dart';

import 'data/data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    Future<bool> checkPath() async {
      final path = '/storage/emulated/0/Download/venten/file.csv';
      final checkPathExistence = await Directory(path).exists();
      return checkPathExistence;
    }

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
          child: ListView.builder(
            itemCount: filterList.length,
            itemBuilder: (BuildContext context, int index) {
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (filterList[index]['gender'] != "") Container(
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                          margin: EdgeInsets.symmetric(vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.grey
                          ),
                          child: NeumorphicText("Gender: ${filterList[index]['gender']}", textStyle: NeumorphicTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ), style: NeumorphicStyle(
                              color: Colors.black54
                          ),),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                          margin: EdgeInsets.symmetric(vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.grey
                          ),
                          child: NeumorphicText("Period: ${filterList[index]['start_year']} - ${filterList[index]['end_year']}", textStyle: NeumorphicTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ), style: NeumorphicStyle(
                              color: Colors.black54
                          ),),
                        ),
                      ],
                    ),
                    SizedBox(height: 12,),
                    Wrap(
                      spacing: 8,
                      runSpacing: 0.5,
                      children: [
                        for (var country in filterList[index]['countries']) Container(
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          margin: EdgeInsets.symmetric(vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.grey
                          ),
                          child: NeumorphicText(
                            country, textStyle: NeumorphicTextStyle(
                              fontSize: 12
                            ),
                          ),
                        )
                      ]
                    ),
                    SizedBox(height: 8,),
                    Wrap(
                        spacing: 8,
                        runSpacing: 0.5,
                        children: [
                          for (var color in filterList[index]['colors']) Container(
                            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                            margin: EdgeInsets.symmetric(vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Colors.grey
                            ),
                            child: NeumorphicText(
                              color, textStyle: NeumorphicTextStyle(
                                fontSize: 12
                            ),
                            ),
                          )
                        ]
                    ),
                    SizedBox(height: 12,),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => FilteredData(data: filterList[index])));
                      },
                      color: Colors.green,
                      disabledColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black),
                      ),
                      child: Row(
                        children: [
                          Spacer(),
                          NeumorphicText(
                            "Filter", textStyle: NeumorphicTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Spacer()
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      )
    );
  }
}
