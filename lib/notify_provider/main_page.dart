import 'package:flutter/material.dart';
import 'package:flutter2_kh_v1/notify_provider/counter_model.dart';
import 'package:flutter2_kh_v1/notify_provider/drawer.dart';
import 'package:flutter2_kh_v1/notify_provider/page_2.dart';
import 'package:flutter2_kh_v1/notify_provider/them_logic.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _dark = false;
  @override
  Widget build(BuildContext context) {
    //var counter = Provider.of<CounterModel>(context).counter;
     _dark = context.select<ThemsLogic, bool>((logic) => logic.dark);
    print("$_dark");
    return Scaffold(
        appBar: AppBar(title: Text("${context.watch<CounterModel>().counter}"), backgroundColor: _dark?Colors.black45: Colors.indigo, ),
        drawer: DrawerWidget(),
        body: Container(
           alignment: Alignment.center,
           child: Column(
              children: [
                 ElevatedButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Page2()));
                 }, child: Text("Page2"))
              ],
           ),
        ),
    );
  }
}
