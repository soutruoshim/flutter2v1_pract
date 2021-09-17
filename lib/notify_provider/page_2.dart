import 'package:flutter/material.dart';
import 'package:flutter2_kh_v1/notify_provider/counter_model.dart';
import 'package:provider/provider.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(title: Text("page2"),),
         body: Container(
               alignment: Alignment.center,
               color: Colors.grey,
               child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(),
                    MyText()
                  ],
               ),
         ),
    );
  }
}
class MyButton extends StatefulWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);
    return Container(
        child: ElevatedButton(child: Text("++1"), onPressed: (){counterModel.increase();},),
    );
  }
}

class MyText extends StatefulWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  _MyTextState createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);
    return Container(color: Colors.white54, child: Text("${counterModel.counter}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),);
  }
}


