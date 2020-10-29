import 'package:flutter/material.dart';
import './login.dart';
import './homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();

  String _password;
  String _email;

  Widget makeInput(
      {label,
      obscureText = false,
      void Function(String) onSaved,
      String Function(String) validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 3),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // void validateAndSubmit() async {
  //   if (validateAndSave()) {
  //     User user = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: _email, password: _password);
  //     print("Signed in: $user");
  //   }
  // }

  String _checkValue({value, label}) {
    if (value.isEmpty) {
      return "'$label' não pode ser vazio";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    _signUp() {
      return Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }

    _goHome() {
      return Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: _goHome,
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: mediaQuery.size.height * 0.89,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Inscrição',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Crie a sua conta, é grátis",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        makeInput(
                          label: 'Email',
                          onSaved: (value) => _email = value,
                          validator: (value) =>
                              _checkValue(value: value, label: "Email"),
                        ),
                        makeInput(
                          label: 'Senha',
                          obscureText: true,
                          onSaved: (value) => _password = value,
                          validator: (value) => _checkValue(
                            value: value,
                            label: "Senha",
                          ),
                        ),
                        // makeInput(
                        //   label: 'Confirme a senha',
                        //   obscureText: true,
                        //   onSaved: (value) => _passwordConfirm = value,
                        //   validator: (value) => _checkValue(
                        //     value: value,
                        //     label: "Confirme a senha",
                        //   ),
                        // ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 3, right: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border(
                                  top: BorderSide(color: Colors.black),
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                ),
                              ),
                              child: MaterialButton(
                                minWidth: double.infinity,
                                height: 60,
                                onPressed: () {},
                                // onPressed: validateAndSubmit,
                                color: Colors.cyanAccent[100],
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Text(
                                  'Inscreva-se',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Já tem conta?"),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: _signUp,
                    child: Text(
                      " Conectar",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
