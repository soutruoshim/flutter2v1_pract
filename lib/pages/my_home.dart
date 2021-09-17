import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  // const MyHome({Key? key}) : super(key: key);

  // for use current state to not chang
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(context),
      body: _buildBody(),
      floatingActionButton: _buildFloatAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      endDrawer: _buildDrawer(context),
      bottomNavigationBar: _buildBottom(),
    );
  }
  Widget _buildBody(){
    return Container(
      color: Colors.amber,
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(50),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors:[
                  Colors.redAccent,
                  Colors.black12
                ]
            )
        ),
      ),
    );
  }
  // Widget _buildBody(){
  //   return Container(
  //     alignment: Alignment.center,
  //     child: Text(
  //       "https://thumbs.dreamstime.com/b/hexagon-dark-blue-abstract-background-modern-149029489",
  //       textAlign: TextAlign.center,
  //       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.pink),
  //     ),
  //   );
  // }
  AppBar _buildAppBar(BuildContext context){
    final imageUrl = "https://thumbs.dreamstime.com/b/hexagon-dark-blue-abstract-background-modern-149029489.jpg";
    return AppBar(
      flexibleSpace: Container(
        child: Image.network(imageUrl, fit: BoxFit.cover,),
      ),
      leading: IconButton(icon: Icon(Icons.face),onPressed: (){
        showMessage(context, "Face Clicked");
      },),
      title: Text("អក្សរខ្មែរ", style: TextStyle(fontFamily: "khmer os freehand"),),
      centerTitle: true,
      backgroundColor: Colors.redAccent,
      actions: [
        IconButton(icon: Icon(Icons.settings), onPressed: (){
          _scaffoldKey.currentState!.openEndDrawer();
        }),
      ],
    );
  }
  Widget _buildDrawer(BuildContext context){
    final image = "https://myplaceloungechiangmai.com/wp-content/uploads/2015/02/google-logo-icon-PNG-Transparent-Background.png";
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Image.network(image)),
          ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              trailing: Icon(Icons.navigate_next),
              onTap: (){
                Navigator.of(context).pop();
              }
          ),
          ListTile(
              leading: Icon(Icons.check_box),
              title: Text("Check"),
              trailing: Icon(Icons.navigate_next),
              onTap: (){
                Navigator.of(context).pop();
              }
          ),
          ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              trailing: Icon(Icons.navigate_next),
              onTap: (){
                Navigator.of(context).pop();
              }
          )
        ],
      ),
    );
  }

  Widget _buildFloatAction(){
    return FloatingActionButton(
      backgroundColor: Colors.amber,
      child: Icon(Icons.map, color: Colors.black,),
      onPressed: (){print("Float action button");},
    );
  }
  void showMessage(BuildContext context, text){
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar
      (content: Text("Face Clicked"),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 15),
      action: SnackBarAction(label: 'Undo',textColor: Colors.black, onPressed: (){},),
    ));
  }


  Widget _buildBottom() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(icon: Icon(Icons.home), onPressed: () {}),
          IconButton(
            icon: Icon(Icons.wifi),
            onPressed: () {},
          ),
          SizedBox(width: 50,),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
