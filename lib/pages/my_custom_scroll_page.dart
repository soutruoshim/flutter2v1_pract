import 'package:flutter/material.dart';
import 'package:flutter2_kh_v1/constants/fruit_list_constant.dart';
import 'package:flutter2_kh_v1/models/fruite_model.dart';

class CustomScroll extends StatefulWidget {
  const CustomScroll({Key? key}) : super(key: key);

  @override
  _CustomScrollState createState() => _CustomScrollState();
}

class _CustomScrollState extends State<CustomScroll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildBody,
        bottomNavigationBar: _buildBottom,
    );
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


  Widget get _buildBody{
       return CustomScrollView(
            slivers:[
              _buildAppBar,
              _sliverList,
              SliverToBoxAdapter(
                child: Container(
                  height: 300,
                  color: Colors.pink,
                ),
              ),
              _sliverList,
              _buildAppBarAds,
              _sliverList,
            ]
       );
  }
  Widget get _buildAppBar {
       return SliverAppBar(
         leading: Icon(Icons.home),
         // floating: true, //auto hide appbar
         // pinned: true, // static appbar
         title: Text("Custom Scroll View"),
         flexibleSpace: Container(
             decoration: BoxDecoration(
                gradient: LinearGradient(
                   colors:[
                      Colors.pink,
                      Colors.indigo
                   ]
                )
             ),
         ),
       );
  }
  Widget get _buildAppBarAds {
    return SliverAppBar(
      pinned: true, // static appbar
      flexibleSpace: Container(
        child: Text("ADS"),
        height: 100,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[
                  Colors.pink,
                  Colors.indigo
                ]
            )
        ),
      ),
    );
  }

  Widget get _sliverList {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return _buildItem(fruitList[index]);
      }, childCount: fruitList.length),
    );
  }

  Widget _buildItem(FruiteModel fruiteModel){
    return Container(
      color: Colors.orange,
      margin: EdgeInsets.all(5),
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
}
