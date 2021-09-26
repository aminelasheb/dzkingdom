import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class envoyer_commentaire extends StatefulWidget {
  const envoyer_commentaire({ Key? key }) : super(key: key);

  @override
  _envoyer_commentaireState createState() => _envoyer_commentaireState();
}

class _envoyer_commentaireState extends State<envoyer_commentaire> {
      get sizee => MediaQuery.of(context).size ;
FocusNode myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {

    return  GestureDetector(
        onTap : () => FocusScope.of(context).unfocus(),
      child: Scaffold(            
 
        body: 
        SingleChildScrollView(
          child: Column(
            children: [
               
                 Container(
                   margin:EdgeInsets.only(top: sizee.height/35  ),
                   alignment: Alignment.topLeft,
               
               
                   child:               
                     IconButton(    icon: Icon(Icons.arrow_back,),
                         color: Color(0xfff47834), 
                         
                                       iconSize: sizee.height/25,   
                                        onPressed: () {
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
                      Image(image: AssetImage('images/envoyer_commentairee.png'),width: sizee.width/3.2,height:sizee.width/3.2,),
                      Container(
        
                         height: sizee.height/2.2,
                          width: sizee.width,
                            padding: EdgeInsets.all( sizee.width/20),
                            decoration: BoxDecoration(
                              color: Color(0xfff47834),
        
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50) ,
                                bottomLeft: Radius.circular(50) ,
        
                              ),
                            ),
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
        
        children: [
               Container(
                              margin: EdgeInsets.only(bottom:sizee.height/40),
                
                        child: Text("Envoyer un commentaire",style:TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Colors.white))) ,
        
                    
                          
                      TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,// when user presses enter it will adapt to it
                                  decoration: InputDecoration(
                                       focusedBorder:OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.circular(20.0),
            ),
                                    fillColor: Colors.white, filled: true,
                                    labelText: 'Décrivez vos problèmes ou partagez vos idées avec nous ...',
                                    focusColor: Colors.black,
                                    hintText: 'Décrivez vos problèmes ou partagez vos idées avec nous ...',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                                      labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? Colors.black : Colors.black),),
             
        ), 
             
                       
         ElevatedButton(
                        child: Text("Envoyer"),
                        onPressed: () {  },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(sizee.width/3, sizee.height/18),
        
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
              )   
            ],
          ),
        ),
        ),
     
    );
  }
}