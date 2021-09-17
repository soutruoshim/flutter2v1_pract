import 'package:flutter/material.dart';
import 'package:flutter2_kh_v1/notify_provider/them_logic.dart';
import 'package:provider/provider.dart';
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool dark = context.select<ThemsLogic, bool>((value) => value.dark);
    return Drawer(
         child: ListView(
            children: [
               DrawerHeader(child: Icon(Icons.face)),
               ListTile(
                 leading: Icon(Icons.circle),
                 title: Text(dark?"Choice Light Theme": "Choice Dark Them"),
                 onTap: (){
                   context.read<ThemsLogic>().toggleDark();
                   print("Work");
                 },
               )
            ],
         ),
    );
  }
}
