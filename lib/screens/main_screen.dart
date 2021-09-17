import 'package:flutter/material.dart';
import 'package:flutter2_kh_v1/models/fruite_model.dart';
import 'package:flutter2_kh_v1/screens/home_screen.dart';
import 'package:flutter2_kh_v1/screens/info_screen.dart';
import 'package:flutter2_kh_v1/screens/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
      bottomNavigationBar: _buildBottom,
    );
  }
  int _curretnindex = 0;
  List<Widget> _pageList = [
     HomeScreen(),
     SettingScreen(),
     InfoScreen()
  ];
  PageController _pageController = PageController();
  Widget get _buildBottom {
    return BottomNavigationBar(
        currentIndex: _curretnindex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (int index){
             _pageController.animateToPage(index, duration: Duration(microseconds: 100), curve: Curves.easeInOut);
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        BottomNavigationBarItem(icon: Icon(Icons.info), label: "Info"),
    ]);
}

  Widget get _buildBody {
    return Container(
      height: 400,
      child: PageView.builder(
          controller: _pageController,
          onPageChanged: (int index) {
            setState(() {
                _curretnindex = index;
            });
          },
          scrollDirection: Axis.horizontal,
          itemCount: _pageList.length,
          itemBuilder: (context, index) {
              return _pageList[index];
          }),
    );
  }

  Widget _buildItem(FruiteModel fruiteModel){
    return Card(
      child: ListTile(
        leading: Icon(Icons.face),
        title: Text("${fruiteModel.title}"),
        trailing: Icon(Icons.navigate_next),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
