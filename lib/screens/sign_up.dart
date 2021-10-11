import 'package:dzkingdom/Providers/user.dart';
import 'package:dzkingdom/Screens/homepage1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class sign_up extends StatefulWidget {
  const sign_up({Key? key}) : super(key: key);

  @override
  _sign_upState createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  get sizee => MediaQuery.of(context).size;
  bool isCheckH = true;
  bool isCheckF = false;
  final Map<String, String> _authData = {
    'name': '',
    'surname': '',
    'email': '',
    'password': '',
    'phone number': '',
  };

  final TextEditingController _namectrl = TextEditingController();
  final TextEditingController _surnamectrl = TextEditingController();
  final TextEditingController _emailctrl = TextEditingController();
  final TextEditingController _passctrl = TextEditingController();
  final TextEditingController _cpassctrl = TextEditingController();
  final TextEditingController _phonectrl = TextEditingController();
  
  Future<void> signUp()async {
    if(!_formKey.currentState!.validate()){
      return;


  }
    
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
        builder:(context,val,child)=>
       GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Créer un compte",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: const Color(0xfff47834),
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.only(top: sizee.height / 35),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: sizee.height / 1.2,
                  width: sizee.width / 1.12,
                  padding: EdgeInsets.all(sizee.height / 80),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          controller: _namectrl,
                          validator: (value) {
                            if (value!.length > 5) {
                              return '';
                            } else {
                              return 'Votre nom doit passer 5 lettres';
                            }
                          },
                          onSaved: (value) {
                            _authData['name'] = value!;
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 8, 10, 8),
                            labelText: 'Nom',
                            hintText: 'Entrer votre nom',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color(0xfff47834),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _surnamectrl,
                          validator: (value) {
                            if (value!.length > 5) {
                              return '';
                            } else {
                              return 'Votre prenom doit passer 5 lettres';
                            }
                          },
                          onSaved: (value) {
                            _authData['surname'] = value!;
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 8, 10, 8),
                            labelText: 'Prénom',
                            hintText: 'Entrer votre prénom',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            prefixIcon: const Icon(
                              Icons.person_outline,
                              color: Color(0xfff47834),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _emailctrl,
                          validator: (value) {
                            if (value!.contains('@') || (value.length >= 5)) {
                              return '';
                            } else {
                              return 'Votre e-mail est invalide';
                            }
                          },
                          onSaved: (value) {
                            _authData['email'] = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 8, 10, 8),
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
                        TextFormField(
                          controller: _passctrl,
                          validator: (value) {
                            if (value!.length > 8) {
                              return '';
                            } else {
                              return 'Votre mot de passe doit passer 8 lettres';
                            }
                          },
                          onSaved: (value) {
                            _authData['password'] = value!;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 8, 10, 8),
                            labelText: 'Mot de passe',
                            hintText: 'Entrer votre mot de passe',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            prefixIcon: const Icon(
                              Icons.password,
                              color: Color(0xfff47834),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _cpassctrl,
                          validator: (value) {
                            if (value == _passctrl.text) {
                              return '';
                            } else {
                              return 'Erreur';
                            }
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 8, 10, 8),
                            labelText: 'Confirmation de mot de passe',
                            hintText: 'Confirmer votre mot de passe',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            prefixIcon: const Icon(
                              Icons.password,
                              color: Color(0xfff47834),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _phonectrl,
                          validator: (value) {
                            if (value!.length == 10) {
                              return '';
                            } else {
                              return 'Erreur';
                            }
                          },
                          onSaved: (value) {
                            _authData['phone number'] = value!;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 8, 10, 8),
                            labelText: 'Numéro de télephone',
                            hintText: 'Entrer votre numéro de télephone',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: Color(0xfff47834),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                const Text("Homme"),
                                Checkbox(
                                    value: isCheckH,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isCheckH = value!;
                                        isCheckF = !isCheckF;
                                      });
                                    }),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Femme"),
                                Checkbox(
                                    value: isCheckF,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isCheckF = value!;
                                        isCheckH = !isCheckH;
                                      });
                                    }),
                              ],
                            )
                          ],
                        ),
                        ElevatedButton(
                          child: const Text("Créer votre compte"),
                          onPressed: ()  {
                             Provider.of<User>(context, listen: false).setUserData(DateTime.now().toString(),
                                _namectrl.text,
                                _surnamectrl.text,
                                _emailctrl.text,
                                _phonectrl.text);
                             // getData();
                            signUp(); Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>WelcomePage()) );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(sizee.width / 2, sizee.height / 18),
                            primary: const Color(0xfff47834),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
  // void getData()async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   prefs.setString('name', _namectrl.text);
  //   prefs.setString('email', _emailctrl.text);
  //   prefs.setString('surname', _surnamectrl.text);
  //
  // }
}
