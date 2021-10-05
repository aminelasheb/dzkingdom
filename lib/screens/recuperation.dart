import 'package:dzkingdom/screens/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class recuperation extends StatefulWidget {
  const recuperation({Key? key}) : super(key: key);

  @override
  _recuperationState createState() => _recuperationState();
}

class _recuperationState extends State<recuperation> {
  get sizee => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    var value;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Récuperation du mot de passe",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xfff47834),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: sizee.height / 1.5,
              width: sizee.width * 0.85,
              margin: EdgeInsets.only(bottom: sizee.height / 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('images/recup.png'),
                    width: sizee.width / 3.2,
                    height: sizee.width / 3.2,
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: sizee.height / 40),
                      child: Text("Récuperer votre mot de passe",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold))),
                  Container(
                      margin: EdgeInsets.only(bottom: sizee.height / 50),
                      child: Image(
                        image: AssetImage('images/ligne2.png'),
                        width: sizee.width * 0.85,
                      )),
                  Container(
                    width: sizee.width * 0.8,
                    height: sizee.height / 16,
                    padding: EdgeInsets.only(
                        top: sizee.height / 1000,
                        bottom: sizee.height / 1000,
                        left: sizee.width / 10,
                        right: sizee.width / 35),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.4,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        items: <String>['Adresse e-mail', 'Numéro de téléphone']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        isExpanded: true,
                        hint: Text(
                          "Méthode de récuperation",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        onChanged: (_) {},
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: sizee.height / 50),
                    child: ElevatedButton(
                      child: Text("Envoyer le lien de récupération"),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(sizee.width / 1.2, sizee.height / 18),
                        primary: Color(0xfff47834),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          bottom: sizee.height / 50, top: sizee.height / 40),
                      child: Image(
                        image: AssetImage('images/ligne2.png'),
                        width: sizee.width * 0.85,
                      )),
                  Container(
                    margin: EdgeInsets.only(top: sizee.height / 50),
                    child: ElevatedButton(
                      child: Text("Se connecter"),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(sizee.width / 2.5, sizee.height / 18),
                        side: BorderSide(
                          width: 1.0,
                          color: Color(0xfff47834),
                        ),
                        primary: Colors.white,
                        onPrimary: Color(0xfff47834),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
