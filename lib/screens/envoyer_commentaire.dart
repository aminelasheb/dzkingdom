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

    return GestureDetector(
        onTap : () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
           title: Text("Envoyer un commentaire" ,style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: true,
  leading: IconButton(icon:Icon(Icons.arrow_back_ios_new),
          onPressed: () {  Navigator.pop(context);
},),

            backgroundColor: Color(0xfff47834),
        ),
        body: Center(
        
          child: SingleChildScrollView(
            child: Container(
          
              height: sizee.height/1.5,
              width: sizee.width*0.85,
              margin:EdgeInsets.only(bottom: sizee.height/12),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
          
                children: [
                Image(image: AssetImage('images/envoyer_commentairee.png'),width: sizee.width/3.2,height:sizee.width/3.2,),
                Container(
                        margin: EdgeInsets.only(bottom:sizee.height/40),
          
                  child: Text("Envoyer un commentaire",style:TextStyle(fontSize: 21,fontWeight: FontWeight.bold))) ,
              Container(
                margin: EdgeInsets.only(bottom:sizee.height/50),
                child: Image(image: AssetImage('images/ligne2.png'),width: sizee.width*0.85 ,)),
              
              TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,// when user presses enter it will adapt to it
                                decoration: InputDecoration(
                                  
                                                              fillColor: Colors.white, filled: true,
                                  labelText: 'Ecrire votre commentaire ici',
                                  hintText: 'Décrivez vos problèmes ou partagez vos idées avec nous ...',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                                    
                                  ),
                                ),
          
                       Container(
                                       margin: EdgeInsets.only(top:sizee.height/50),
          
                         child: ElevatedButton(
                              child: Text("Envoyer"),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(sizee.width/3.5, sizee.height/18),
          
                                primary: Color(0xfff47834),
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                       )  ,
                
          
          
          
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}