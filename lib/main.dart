import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapi/Services/ApiService.dart';
import 'package:newsapi/Utils/Colors.dart';
import 'package:provider/provider.dart';

import 'Pages/homePage.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent
  ));
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>NewsApiService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.light(
                brightness: Brightness.light,
                primary:kBgColor
            ),
            scaffoldBackgroundColor: Color(0xff1E1E2E)
        ),
        home:HomePage(),
      ),
    );
  }
}
