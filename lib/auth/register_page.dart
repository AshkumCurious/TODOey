import 'package:flutter/material.dart';
import 'package:todoey/auth/login_page.dart';
import 'package:todoey/components/my_textfield.dart';

import 'package:todoey/my_button.dart';

class RegisterPage extends StatelessWidget {


  final newusernameController = TextEditingController();
  final newpasswordController = TextEditingController();
  final repasswordController = TextEditingController();
  final displaynameController = TextEditingController();


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.deepPurple.shade400,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome new User",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  MyTextField(
                      controller: displaynameController,
                      hintText: "Enter Name",
                      obscureText: false),
                  const SizedBox(height: 15),
                  MyTextField(
                      controller: newusernameController,
                      hintText: "Enter Username",
                      obscureText: false),
                  const SizedBox(height: 15),


                  MyTextField(
                    controller: newpasswordController,
                    hintText: 'Enter Password',
                    obscureText: false,
                  ),
                  const SizedBox(height: 15),


                  MyTextField(
                    controller: repasswordController,
                    hintText: 'Re-enter Password',
                    obscureText: false,
                  ),
                  const SizedBox(height: 45),

                  GestureDetector(
                    onTap: (){
                      if(newusernameController.text.length==0)
                      {
                        showDialog(context: context, builder: (ctx) => AlertDialog(
                          title: const Text("Alert"),
                          content: const Text("Username field is empty"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Container(
                                color: Colors.deepPurple[400],
                                padding: const EdgeInsets.all(14),
                                child: const Text("okay",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        );
                      }
                      else if (newpasswordController.text.length!=0 && newpasswordController.text ==
                            repasswordController.text) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                LoginPage()),
                          );
                        }
                      else
                        {
                            showDialog(context: context, builder: (ctx) => AlertDialog(
                              title: const Text("Alert"),
                              content: const Text("Re-enter password correctly"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Container(
                                    color: Colors.deepPurple[400],
                                    padding: const EdgeInsets.all(14),
                                    child: const Text("okay",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            );
                        }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      );
    }
  }