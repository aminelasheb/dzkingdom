// ignore_for_file: prefer_final_fields

import 'package:dzkingdom/Screens/homepage1.dart';
import 'package:dzkingdom/Screens/recuperation.dart';
import 'package:dzkingdom/Screens/sign_up.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  static const routeName = '/Auth';

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            width: deviceSize.width,
            height: deviceSize.height,
            color: Colors.white,
          ),
          SingleChildScrollView(
            child: Container(
              // margin: EdgeInsets.symmetric(
              //     vertical: deviceSize.height / 10,
              //     horizontal: deviceSize.width / 20),
              width: deviceSize.width,
              height: deviceSize.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                      child: Container(
                    padding: EdgeInsets.only(
                      bottom: deviceSize.height / 40,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Connectez-vous à",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: deviceSize.width * 0.05),
                        Image(
                          image: const AssetImage(
                              'assets/images/logo_horizontal.png'),
                          height: deviceSize.height / 20,
                          width: deviceSize.width / 3,
                        )
                      ],
                    ),
                  )),
                  // SizedBox(
                  //   height: 12.0,
                  // ),

                  Container(
                    height: deviceSize.height / 1.75,
                    width: deviceSize.width - ((deviceSize.width / 20) * 2.5),
                    padding:
                        EdgeInsets.symmetric(horizontal: deviceSize.width / 75),
                    // margin: EdgeInsets.only(bottom: deviceSize.height / 50),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:
                        //  SingleChildScrollView(
                        // child:
                        SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: deviceSize.height / 80),
                            child: Container(
                              margin: EdgeInsets.only(
                                  bottom: deviceSize.height / 80),
                              child: const Icon(
                                Icons.account_circle,
                                color: Colors.black54,
                                size: 100.0,
                              ),
                            ),
                          ),
                          const AuthCard(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    child: const Text("Créer votre compte"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => sign_up()));
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize:
                          Size(deviceSize.width / 2, deviceSize.height / 18),
                      side: const BorderSide(
                        width: 1.0,
                        color: Color(0xfff47834),
                      ),
                      primary: Colors.white,
                      onPrimary: const Color(0xfff47834),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.orange,
                    margin: EdgeInsets.fromLTRB(
                        deviceSize.width / 3.5,
                        deviceSize.height / 80,
                        deviceSize.width / 3.5,
                        deviceSize.height / 80),
                    // left: deviceSize.width / 3.5,
                    // top: deviceSize.height / 80),
                    child: Row(
                      children: [
                        Container(
                          width: deviceSize.width / 6.2,
                          height: 2.0,
                          color: Colors.black,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            "Où",
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                        ),
                        Container(
                          width: deviceSize.width / 6.2,
                          height: 2.0,
                          color: Colors.black,
                        ),

                        //
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.orange,
                    margin: EdgeInsets.symmetric(
                        horizontal: deviceSize.width / 3.4, vertical: 0),
                    //  (
                    //   left: deviceSize.width / 3.4,
                    // ),
                    child: Row(
                      children: [
                        Container(
                            margin:
                                EdgeInsets.only(right: deviceSize.width / 9),
                            child: Image(
                              image:
                                  const AssetImage('assets/images/google.png'),
                              width: deviceSize.width / 7,
                              height: deviceSize.width / 7,
                            )),
                        Image(
                          image: const AssetImage('assets/images/fb.png'),
                          width: deviceSize.width / 6.5,
                          height: deviceSize.width / 6.5,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({Key? key}) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  bool isCheck = true;

  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, String> _authData = {'email': '', 'password': ''};
  bool _isLoading = false;
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  Future<void> submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
  }

  _showErrorDialog(String errorMessage) {}

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: deviceSize.height / 50),
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'Invalid Email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['email'] = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                    labelText: 'Adresse e-mail',
                    hintText: 'Entrer votre e-mail',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Color(0xfff47834),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: deviceSize.height / 80),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.length < 5) {
                      return 'Invalid Password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['password'] = value!;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                    labelText: 'Mot de passe',
                    hintText: 'Entrer votre mot de passe',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Color(0xfff47834),
                    ),
                    // icon:
                  ),
                ),
              ),
              Container(
                  margin:
                      EdgeInsets.symmetric(vertical: deviceSize.height / 70),
                  child: ElevatedButton(
                    child: const Text("Se connecter"),
                    onPressed: () {
                      submit();
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const WelcomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize:
                          Size(deviceSize.width / 3, deviceSize.height / 18),
                      primary: const Color(0xfff47834),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  )),
              Row(
                children: [
                  Checkbox(
                      value: isCheck,
                      onChanged: (bool? value) {
                        setState(() {
                          isCheck = value!;
                        });
                      }),
                  const Text(
                    "Rester connecté",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      padding: EdgeInsets.only(left: deviceSize.width / 29),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => recuperation()));
                        },
                        child: const Text(
                          "Mot de passe oublié ?",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ))),
            ],
          ),
        ),
      ],
    );
  }
}
