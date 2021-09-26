import 'package:flutter/material.dart';


class sign_up extends StatefulWidget {
  const sign_up({ Key? key }) : super(key: key);

  @override
  _sign_upState createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
    get sizee => MediaQuery.of(context).size ;
  bool isCheckH = true ;
  bool isCheckF = false ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap : () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Créer un compte" ,style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xfff47834),
       automaticallyImplyLeading: true,
  leading: IconButton(icon:Icon(Icons.arrow_back_ios_new),
          onPressed: () {  Navigator.pop(context);
},),
        ),
        body: 
         SingleChildScrollView(
           child: Center(
             child: Container(
               margin: EdgeInsets.only(top: sizee.height/35),
               alignment: Alignment.center,
                decoration: BoxDecoration(
                        color: Colors.grey[200],

                        borderRadius: BorderRadius.circular(20),
                      ),
              height: sizee.height/1.2,
              width: sizee.width/1.12,
              padding: EdgeInsets.all(sizee.height/80),
              child: Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
            
             
                      TextFormField(
                              decoration: InputDecoration(
                                                            fillColor: Colors.white, filled: true,

                           contentPadding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                                labelText: 'Nom',
                                hintText: 'Entrer votre nom',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                                icon: Icon(
                                  Icons.person,color: Color(0xfff47834),
                                ),
                              ),
                            ),
                     

                       TextFormField(

                              decoration: InputDecoration(
                                                            fillColor: Colors.white, filled: true,

                            contentPadding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                                labelText: 'Prénom',
                                hintText: 'Entrer votre prénom',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                                  icon: Icon(
                                  Icons.person_outline,color: Color(0xfff47834),
                                ),
                              ),
                            ),
                            


                TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                                                        fillColor: Colors.white, filled: true,

                            contentPadding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                            labelText: 'Adresse e-mail',

                            hintText: 'Entrer votre e-mail',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                            icon: Icon(
                              Icons.email,color: Color(0xfff47834),
                            ),
                          ),
                        ),
           TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                                                        fillColor: Colors.white, filled: true,

                            contentPadding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                            labelText: 'Mot de passe',
                            hintText: 'Entrer votre mot de passe' ,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                            icon: Icon(
                              Icons.password,color: Color(0xfff47834),
                            ),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                                                        fillColor: Colors.white, filled: true,

                            contentPadding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                            labelText: 'Confirmation de mot de passe',
                            hintText: 'Confirmer votre mot de passe' ,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                            icon: Icon(
                              Icons.password,color: Color(0xfff47834),
                            ),
                          ),
                        ),


                        TextFormField(

                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            fillColor: Colors.white, filled: true,
                            contentPadding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                            labelText: 'Numéro de télephone',

                            hintText: 'Entrer votre numéro de télephone',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                            icon: Icon(
                              Icons.phone,color: Color(0xfff47834),
                            ),
                          ),
                        ),
                        Row(
                                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            Row(children: [
                              Text("Homme") ,
                                Checkbox(
      value: isCheckH,
      onChanged: (bool? value) {
      setState(() {
      isCheckH = value!;
      });}
                          ),
                            ],) ,
                            Row(children: [
                              Text("Femme") ,
                                Checkbox(
      value: isCheckF,
      onChanged: (bool? value) {
      setState(() {
      isCheckF = value!;
      });}
                          ),
                            ],)
                          ],
                        ) ,

                        ElevatedButton(
                          child: Text("Créer votre compte"),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(sizee.width/2, sizee.height/18),
                            primary: Color(0xfff47834),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
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