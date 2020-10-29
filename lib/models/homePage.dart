import 'package:flutter/material.dart';
import './login.dart';
import './signup.dart';
import '../animation/my_fade_in.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    // List<String> list1 = [];
    // List<String> list2 = new List(3);
    // List<int> list3 = [1, 2, 3];

    // print('Print 1 ${list1.runtimeType.toString()}');
    // print('Print 2 ${list2.runtimeType.toString()}');
    // print('Print 3 ${list3.runtimeType.toString()}');

    // var teste =
    //     (list1.runtimeType.toString() == 'GrowableList<String>') ? true : false;

    // print(teste);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: mediaQuery.size.height,
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 50,
          ),
          child: SingleChildScrollView(
            child: Container(
              height: mediaQuery.size.height * 0.80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      MyFadeIn(
                        milliseconds: 600,
                        child: Text(
                          'Bem-vindo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyFadeIn(
                        milliseconds: 600,
                        child: Text(
                          'Conecte-se para acessar nossa área exclusiva',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  MyFadeIn(
                    milliseconds: 1000,
                    child: Container(
                      height: mediaQuery.size.height / 3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/social_transparent.png'),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      MyFadeIn(
                        milliseconds: 1400,
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage())),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            'Conectar',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyFadeIn(
                        milliseconds: 1400,
                        child: Container(
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()),
                              );
                            },
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
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
