import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthForme extends StatefulWidget {
  @override
  State<AuthForme> createState() => _AuthFormeState();
}

class _AuthFormeState extends State<AuthForme> {
  final _formKey = GlobalKey<FormState>();
  var isLoading = false;
  var _isLogin = true;
  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';
  var _userImageFile;
  void _pickedImage(File image) {
    _userImageFile = image;
  }

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // ignore: duplicate_ignore
              children: <Widget>[
                TextFormField(
                  key: const ValueKey('email'),
                  validator: ((value) {
                    if (value!.isEmpty || value.contains("@")) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  }),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: "Email address",
                      icon: Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  onChanged: (value) {
                    _userEmail = value;
                  },
                ),
                if (!_isLogin)
                  TextFormField(
                    key: const ValueKey('username'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 3) {
                        return 'Please enter at least 3 character';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: "Username",
                        icon: Icon(
                          Icons.supervised_user_circle,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    onChanged: (value) {
                      _userName = value;
                    },
                  ),
                TextFormField(
                  key: const ValueKey('Password'),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 7) {
                      return 'Password must be at least 7 characters long';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "Password",
                      icon: Icon(
                        Icons.password,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  obscureText: true,
                  onChanged: (value) {
                    _userPassword = value;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                // ignore: deprecated_member_use
                isLoading
                    ? const CircularProgressIndicator()
                    : Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              setState(() {
                                isLoading = true;
                              });

                              if (_userImageFile == null && !_isLogin) {
                                setState(() {
                                  isLoading = false;
                                });

                                return;
                              }

                              if (_isLogin &&
                                  _formKey.currentState!.validate()) {
                                await _auth.signInWithEmailAndPassword(
                                    email: _userEmail, password: _userPassword);
                                setState(() {
                                  isLoading = false;
                                });
                              }

                              if (!_isLogin) {
                                var authResult =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: _userEmail,
                                        password: _userPassword);

                                await FirebaseFirestore.instance
                                    .collection('user')
                                    .doc(authResult.user!.uid)
                                    .set({
                                  'username': _userName,
                                  'email': _userEmail,
                                });

                                setState(() {
                                  isLoading = false;
                                });
                              }
                            } catch (err) {
                              setState(() {
                                isLoading = false;
                              });

                              var message =
                                  'An error occurred, please check your credentials!';
                              message = message;
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 219, 87, 30),
                              shape: StadiumBorder(),
                              padding: EdgeInsets.all(13)),
                          child: Text(_isLogin ? 'login' : 'Signup',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(
                        _isLogin
                            ? 'create new account'
                            : 'I already have an account',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
