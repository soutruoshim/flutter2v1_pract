import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter2_kh_v1/notify_provider/counter_model.dart';
import 'package:flutter2_kh_v1/notify_provider/main_page.dart';
import 'package:flutter2_kh_v1/notify_provider/them_logic.dart';
import 'package:flutter2_kh_v1/pages/children_widget.dart';
import 'package:flutter2_kh_v1/pages/login_screen.dart';
import 'package:flutter2_kh_v1/pages/my_custom_scroll_page.dart';
import 'package:flutter2_kh_v1/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (context) => CounterModel(),
    //   child: MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       home: MainPage(),
    //   ),
    // );
    return MultiProvider(
      providers: [
           ChangeNotifierProvider(create: (context)=> CounterModel()),
           ChangeNotifierProvider(create: (context) => ThemsLogic()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}

