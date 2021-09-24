import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class sign_in extends StatefulWidget {

  @override
  _sign_inState createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  get sizee => MediaQuery.of(context).size ;
  bool isCheck = true ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: sizee.height/10 ,horizontal: sizee.width/20 ) ,

          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: sizee.height/40 ,) ,
                child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Text("Connectez-vous à" ,textAlign: TextAlign.center, style: const TextStyle(fontSize: 21,fontWeight: FontWeight.bold ),) ,
                    Image(image: AssetImage('images/logo_horizontal.png'),height: sizee.height/20,width: sizee.width/3,)
                  ],
                ),
              ) ,
              SingleChildScrollView(
                child: Container(
                  height: sizee.height/1.75,
                  width: sizee.width-((sizee.width/20)*2.5),
                    padding: EdgeInsets.symmetric(horizontal: sizee.width/75),
                    margin: EdgeInsets.only(bottom:sizee.height/50),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],

                      borderRadius: BorderRadius.circular(20),
                    ),
                child: Column(
                  children: [
                    Container(
                      margin:EdgeInsets.symmetric(vertical: sizee.height/80),

                      child: Container(
                        margin:EdgeInsets.only(bottom: sizee.height/80),
                        child: Icon(
                          Icons.account_circle,
                          color: Colors.black54,
                          size: 100.0,
                        ),
                      ),
                    ),
                    Container(
                      margin:EdgeInsets.symmetric(vertical: sizee.height/50),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                          labelText: 'Adresse e-mail',

                          hintText: 'Entrer votre e-mail',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                          icon: Icon(
                            Icons.email,
                          ),
                        ),
                      ),
                    ),


                    Container(
                      margin:EdgeInsets.symmetric(vertical: sizee.height/80),

                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                          labelText: 'Mot de passe',
                          hintText: 'Entrer votre mot de passe' ,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                          icon: Icon(
                            Icons.password,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin:EdgeInsets.symmetric(vertical: sizee.height/70),

                      child: ElevatedButton(
                        child: Text("Se connecter"),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(sizee.width/3, sizee.height/18),

                          primary: Color(0xfff47834),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      )
                    ) ,
                    Row(
                      children: [
                        Checkbox(
    value: isCheck,
    onChanged: (bool? value) {
    setState(() {
    isCheck = value!;
    });}
                        ),
                        Text("Rester connecté" , style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold ),) ,

                      ],
                    ) ,
                    Align(
                      alignment: Alignment.centerLeft,
                        child: Container(
                            padding: EdgeInsets.only(left: sizee.width/29),
                            child: Text("Mot de passe oublié ?" , style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,    decoration: TextDecoration.underline,
                            ),))) ,

                  ],

                ),
                ),


              ),

              ElevatedButton(
                child: Text("Créer votre compte"),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(sizee.width/2, sizee.height/18),

                  side: BorderSide(width: 1.0, color: Color(0xfff47834),),
                  primary: Colors.white,
                  onPrimary: Color(0xfff47834),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),

                  ),
                ),
              ) ,
              Container(
                margin:EdgeInsets.only(left:sizee.width/4.2 ,top:sizee.height/80),
                child:

                Row(

                      children: [
                        Image(image: AssetImage('images/ligne.png'),width: sizee.width/6.2,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:4),
                          child: Text("Où" ,style:  TextStyle(fontSize: 21,fontWeight: FontWeight.bold ),),
                        ) ,
                        Image(image: AssetImage('images/ligne.png'),width: sizee.width/6.2 ,)

                      ],
                    ),) ,
              Container(
                margin:EdgeInsets.only(left:sizee.width/3.9 ,),

                child:

                Row(

                  children: [
                    Container(
                        margin: EdgeInsets.only(right: sizee.width/9 ),
                        child: Image(image: AssetImage('images/google.png'),width: sizee.width/7,height: sizee.width/7,)),

                    Image(image: AssetImage('images/fb.png'),width: sizee.width/6.5,height: sizee.width/6.5,)

                  ],
                ),) ,


  ]
                ),
              ),
          ),);



  }
}
