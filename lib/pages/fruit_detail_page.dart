import 'package:flutter/material.dart';
import 'package:flutter2_kh_v1/models/fruite_model.dart';

class DetailPage extends StatelessWidget {
  FruiteModel fruiteModel;
  DetailPage({required this.fruiteModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(title: Text(fruiteModel.title),),
         body: _buildBody(),
    );
  }
  Widget _buildBody(){
      return Container(
         alignment: Alignment.center,
         child: SingleChildScrollView(
              child: Column(
                  children: [
                        Container(child: Text("${fruiteModel.title}"),),
                        Container(child: Text("${fruiteModel.title}"),)
                  ],
              ),
         ),
      );
  }
}
