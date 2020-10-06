import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:patrick_uchegbu/data/data.dart';
import 'package:patrick_uchegbu/utils/utilities.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Neumorphic App',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        appBarTheme: NeumorphicAppBarThemeData(
          color: Colors.grey,
        ),
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Utilities utils = Utilities();

  final Dio dio = Dio();

  @override
  initState() {
    getFilters().then((value) => {
      download().then((value) => {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()))
      })
    });
    super.initState();
  }

  Future<void> getFilters() async {
    var result = await http.get(Utilities().apiUrl);
    filterList.addAll(json.decode(result.body));
    print(filterList);
  }

  Future<void> getDownloadPath() async {
    if (Platform.isAndroid) {
      var directory = await DownloadsPathProvider.downloadsDirectory;
      utils.path = "${directory.path}/venten/file.csv";
    } else {
      var dir = await getApplicationDocumentsDirectory();
      utils.path = "${dir.path}/venten/file.csv";
    }
  }

  Future<void> download() async {
    try {
      await getDownloadPath();
      print(utils.path);
      final response = await dio.download(utils.fileUrl, utils.path);
      print(response.data);
      await loadAsset();
    } catch (e) {
      print(e);
    }
  }

  loadAsset() async {
    var d = await rootBundle.loadString("assets/data.csv");
    listToFilter = CsvToListConverter().convert(d);
    print(listToFilter);
    print(listToFilter[65499][6]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NeumorphicText("Please Wait", style: NeumorphicStyle(
              depth: 4,  //customize depth here
              color: Colors.white, //customize color here
            ),
              textStyle: NeumorphicTextStyle(
                fontSize: 18, //customize size here
                // AND others usual text style properties (fontFamily, fontWeight, ...)
              ),),
            NeumorphicText(
              ".....", textStyle: NeumorphicTextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold
            ),
            )
          ],
        ),
      ),
    );
  }
}
