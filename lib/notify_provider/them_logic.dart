import 'package:flutter/cupertino.dart';

class ThemsLogic extends ChangeNotifier{
    bool _dark = false;
    bool get dark => _dark;
    void toggleDark(){
       _dark = !_dark;
       print(_dark);
       notifyListeners();
    }
}