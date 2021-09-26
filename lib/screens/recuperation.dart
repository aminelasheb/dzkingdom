import 'package:dzkingdom/screens/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class recuperation extends StatefulWidget {
  const recuperation({ Key? key }) : super(key: key);

  @override
  _recuperationState createState() => _recuperationState();
}

class _recuperationState extends State<recuperation> {
        get sizee => MediaQuery.of(context).size ;

  @override
  Widget build(BuildContext context) {
    var value;
    return
  
     GestureDetector(
        onTap : () => FocusScope.of(context).unfocus(),
      child: Scaffold(            
 
        body: 
        Column(
          children: [
             Container(
               margin:EdgeInsets.only(top: sizee.height/35  ),
               alignment: Alignment.topLeft,


               child:               
                 IconButton(    icon: Icon(Icons.arrow_back,),
                     color: Color(0xfff47834), 
                     
                                   iconSize: sizee.height/25,   
                                    onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=> sign_in()));
    },
                                      ),

             ),
            SingleChildScrollView(
                child: Container(
                  height: sizee.height/1.2,
                  width: sizee.width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
              
                    children: [
                    Image(image: AssetImage('images/recup.png'),width: sizee.width/3.2,height:sizee.width/3.2,),
                    Container(

                       height: sizee.height/2.5,
                        width: sizee.width,
                          padding: EdgeInsets.all( sizee.width/20),
                          decoration: BoxDecoration(
                            color: Color(0xfff47834),

                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50) ,
                              bottomRight: Radius.circular(50) ,

                            ),
                          ),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

children: [
             Container(
                            margin: EdgeInsets.only(bottom:sizee.height/40),
              
                      child: Text("Récupérez votre mot de passe",style:TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Colors.white))) ,

                  
                            Container(
                              width: sizee.width*0.8,
                              height: sizee.height/16,
                                        padding: EdgeInsets.symmetric(vertical: sizee.height/1000,horizontal: sizee.width/60),
                                           decoration: BoxDecoration(
                                             color: Colors.white,
    border: Border.all(color: Colors.grey,width: 1.4,),

                            borderRadius: BorderRadius.circular(15),
                          ),

                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                items: <String>['Adresse e-mail', 'Numéro de téléphone'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    
                                    child: Text(value),
                                  );
                                }).toList(),
                                            isExpanded: true,
                                 hint:Text("Méthode de récuperation",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                                onChanged: (_) {},
                              ),
                              ),

                             
                            )
              ,
 ElevatedButton(
                      child: Text("Se connecter"),
                      onPressed: () {  },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(sizee.width/2.5, sizee.height/18),

                        side: BorderSide(width: 1.0, color: Colors.grey,),
                        primary: Colors.white,
                        onPrimary: Color(0xfff47834),
                        shape: RoundedRectangleBorder(
                          
                          borderRadius: BorderRadius.circular(18.0),

                        ),
                      ),
                    ) ,
],
                      ),
                    )
             
              
              
                    ],
                  ),
                ),
              ),
          ],
        ),
        ),
     
    );
  }
}