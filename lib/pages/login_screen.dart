import "package:flutter/material.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _title = "Login";
  bool _hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_title),),
        body: _buildBody(context),
    );
  }


  Widget _buildBody(BuildContext context){
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Column(children: [
        _buildTextField(),
        SizedBox(height: 20,),
        _buildButton(),

      ],)
    );
  }

  Widget _buildButton() {
    return SizedBox(
        width: 200,
        height: 40,
        child: ElevatedButton.icon(
          onPressed: () {
             setState(() {
                  _title = "Login Page";
             });
          },
          icon: Icon(Icons.login),
          label: Text("Login"),
          style: ElevatedButton.styleFrom(
              primary: Colors.pink,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
        ));
  }

  TextEditingController _passController = TextEditingController();

  Widget _buildTextField() {
    return TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.pink),
      decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(Icons.email),
          suffixIcon: IconButton(
            icon: Icon(_hide ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _hide = !_hide;
              });

            },
          )),
      obscureText: _hide,
      controller: _passController,
    );
  }
}
