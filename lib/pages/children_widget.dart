import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter2_kh_v1/models/fruite_model.dart';

import '../constants/fruit_list_constant.dart';
import 'fruit_detail_page.dart';

class ChildrenWidget extends StatefulWidget {
  // const ChildrenWidget({Key? key}) : super(key: key);

  @override
  _ChildrenWidgetState createState() => _ChildrenWidgetState();
}

class _ChildrenWidgetState extends State<ChildrenWidget> {
  ScrollController _scrollController = ScrollController();
  bool _hideUpIcon = false;
  @override
  void initState() {
     super.initState();
     _scrollController.addListener(() {
         if(_scrollController.position.pixels <= 100){
           setState(() {
             _hideUpIcon = false;
           });
         }else{
           setState(() {
             _hideUpIcon = true;
           });
         }
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildGridView,
      bottomNavigationBar: _buildBottom,
      floatingActionButton: _buildFloating,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget get _buildGridView {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: [
        for (int index = 0; index < fruitList.length; index++)
          _buildGridItem(fruitList[index]),
      ],
    );
  }

  Widget _buildGridItem(FruiteModel fruiteModel){
       return Container(
            color: Colors.orange,
            child: Column(
               children: [
                 Container(padding: EdgeInsets.all(10),
                    child: Text("${fruiteModel.title}"),
                 ),
                 Container(padding: EdgeInsets.all(10),
                   child: Text("${fruiteModel.title}"),
                 )
               ],
            ),
       );
  }

  Widget get _buildBodyListViewBuilder {
       return Stack(
         children: [
         _buildListView ,
         Positioned(
              bottom: 10,
              right: 10,
              child: _hideUpIcon? _buildUpIcon: SizedBox(),
          )
         ],
       );
  }

  Widget get _buildListView {
    return Container(
        child: ListView.builder(
      itemCount: fruitList.length,
      controller: _scrollController,
      itemBuilder: (context, index) {
        return _buildItem(fruitList[index]);
      },
    ));
  }
  Widget _buildItem(FruiteModel fruiteModel){
    return Card(
      child: ListTile(
        leading: Icon(Icons.face),
        title: Text("${fruiteModel.title}"),
        trailing: Icon(Icons.navigate_next),
        onTap: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DetailPage(fruiteModel: fruiteModel)));
        },
      ),
    );
  }

  Widget get _buildUpIcon {
      return  Container(
        width: 50,
        height: 50,
        color: Colors.black45,
        child: IconButton(
          icon: Icon(Icons.arrow_upward_outlined),
          onPressed: (){
            _scrollController.animateTo(0.0, duration: Duration(microseconds: 300), curve: Curves.easeInOut);
          },
        ),
      );
  }
  Widget _buildBody2() {
    String img =
        "https://m.media-amazon.com/images/M/MV5BZmYzMzU4NjctNDI0Mi00MGExLWI3ZDQtYzQzYThmYzc2ZmNjXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg";
    return Stack(alignment: Alignment.center, children: [
      Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.network(img, fit: BoxFit.cover),
      ),
      Positioned(
          top: 0,
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.black.withOpacity(0.0)])),
          )),
      Positioned(
          bottom: 0,
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.black.withOpacity(0.0)])),
          )),
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white30,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.play_arrow, size: 70, color: Colors.white),
      )
    ]);
  }
  AppBar get _buildAppBar{
    return AppBar(
      leading: Icon(Icons.volunteer_activism),
      title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(child: Text("Hot"), onTap: (){},),
              SizedBox(width: 20,),
              InkWell(child: Text("Trends"), onTap: (){},),
              SizedBox(width: 20,),
              InkWell(child: Text("Latest"), onTap: (){},),
              SizedBox(width: 20,),
              InkWell(child: Text("Trends"), onTap: (){},),
              SizedBox(width: 20,),
              InkWell(child: Text("Latest"), onTap: (){},),

            ],
          )
      ),
    );
  }

  Widget get _buildBodyListView {
       return Container(
           child: ListView(
             physics: BouncingScrollPhysics(),
             reverse: true,
             children: [
                 Card(
                   child: ListTile(
                     leading: Icon(Icons.favorite),
                     title: Text("Item 1"),
                     subtitle: Text("This is subtitle 1"),
                     trailing: Icon(Icons.navigate_next),
                   ),
                 ),
               Card(
                 child:  ListTile(
                   leading: Icon(Icons.favorite),
                   title: Text("Item 2"),
                   subtitle: Text("This is subtitle 2"),
                   trailing: Icon(Icons.navigate_next),
                 ),
               ),
               Card(
                 child: ListTile(
                   leading: Icon(Icons.favorite),
                   title: Text("Item 3"),
                   subtitle: Text("This is subtitle 3"),
                   trailing: Icon(Icons.navigate_next),
                 ),
               ),
               Card(
                 child: ListTile(
                   leading: Icon(Icons.favorite),
                   title: Text("Item 3"),
                   subtitle: Text("This is subtitle 3"),
                   trailing: Icon(Icons.navigate_next),
                 ),
               ),
             ],
           )
       );
  }

  Widget get _buildFloating {
    return FloatingActionButton(child: Icon(Icons.add), onPressed: () {});
  }

  int _currentIndex = 0;

  Widget get _buildBottom {
    return BottomAppBar(
      color: Colors.yellow,
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              icon: Icon(Icons.home,
                  color: _currentIndex == 0 ? Colors.blue : Colors.black54),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });

              }),
          IconButton(
              icon: Icon(Icons.play_circle_outline_rounded,
                  color: _currentIndex == 1 ? Colors.blue : Colors.black54),
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });

              }),
          SizedBox(
            width: 20,
          ),
          IconButton(
              icon: Icon(Icons.settings,
                  color: _currentIndex == 2 ? Colors.blue : Colors.black54),
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });

              }),
          IconButton(
              icon: Icon(Icons.more_horiz,
                  color: _currentIndex == 3 ? Colors.blue : Colors.black54),
              onPressed: () {
                setState(() {
                  _currentIndex = 3;
                });

              }),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildBox(height: 100, color: Colors.red),
          _buildBox(height: 50, color: Colors.blue),
          _buildBox(height: 20, color: Colors.black),
        ],
      ),
    );
  }

  Widget _buildBox(
      {double width = 100, double height = 100, Color color = Colors.blue}) {
    return Container(
      color: color,
      width: width,
      height: height,
    );
  }


}
