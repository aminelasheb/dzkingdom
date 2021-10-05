import 'package:dzkingdom/widgets/affich_info_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class settings extends StatefulWidget {
  const settings({ Key? key }) : super(key: key);

  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
   final GlobalKey<FormState> _formKey = GlobalKey();
   int nb_email = 2 ;
   int nb_phone = 3 ;
  final Map<String, String> _authData = {
    'name': '',
    'surname': '',
    'email': '',
    'password': '',
    'phone number': '',
    'adress': '' ,
  };

  final TextEditingController _namectrl = TextEditingController();
  final TextEditingController _surnamectrl = TextEditingController();
  final TextEditingController _emailctrl = TextEditingController();
  final TextEditingController _phonectrl = TextEditingController();
    final TextEditingController _adressctrl = TextEditingController();

    get sizee => MediaQuery.of(context).size ;
    bool changename = false ;
    bool changenumero = false ;
    bool changeemail = false ;
    bool changeadress = false ;
    var email = 1 ;
    var phone = 1 ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap : () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
            title: Text("Settings" ,style: TextStyle(color: Colors.white),),
            backgroundColor: Color(0xfff47834),
         automaticallyImplyLeading: true,
      leading: IconButton(icon:Icon(Icons.arrow_back_ios_new),
            onPressed: () {  Navigator.pop(context);
    },),
          ) ,
        body:SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all( sizee.height/45),
 
             margin: EdgeInsets.only(top: sizee.height/35,left:sizee.width/20),
                 alignment: Alignment.center,
                  decoration: BoxDecoration(
                          color: Colors.grey[200],
        
                          borderRadius: BorderRadius.circular(20),
                        ),
                height: sizee.height/1.2,
                width: sizee.width/1.12,
          
            child: Form(
             key: _formKey,
            child: Column(
              children: [
               Container(
                       height: sizee.height /9,
                width: sizee.width - ((sizee.width / 20) * 2.5),
                padding: EdgeInsets.symmetric(horizontal: sizee.width / 50 ,vertical: changename? sizee.height/120 : sizee.height/80),
                margin: EdgeInsets.only(bottom: sizee.height / 50),
                        decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child:
                changename?
                Column(
         crossAxisAlignment: CrossAxisAlignment.start,

      children: [
       Container(
         margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/35 ,bottom: sizee.height/160),
         child: Text("Modifiez votre nom",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      Container(
                        width: sizee.width/2.8,
                        child: TextFormField(
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
                     
                        ),
                      ),
                      ),

                          Container(
                                                  width: sizee.width/2.8,

                            child: TextFormField(
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
                       
                         
                        ),
                      ),
                          ),
                    ],
                  ),
      ],
    )
                :
             //   afficher_content("E-mail", "ma.lasheb@esi-sba.dz", changeemail)

             afficherr(1),
                //affich_info_setting("E-mail", "ma.lasheb@esi-sba.dz", changeemail)
                 ),


                Container(
                       height: sizee.height /9,
                width: sizee.width - ((sizee.width / 20) * 2.5),
                padding: EdgeInsets.symmetric(horizontal: sizee.width / 50 ,vertical: changeemail? sizee.height/110 : sizee.height/80),
                margin: EdgeInsets.only(bottom: sizee.height / 50),
                        decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child:
                changeemail?
                changeee(a:2, control: _emailctrl, authData: _authData)
                :
             //   afficher_content("E-mail", "ma.lasheb@esi-sba.dz", changeemail)

             afficherr(2),
                //affich_info_setting("E-mail", "ma.lasheb@esi-sba.dz", changeemail)
                 ),
                 soulignee(1),

                 phonee(),
                 soulignee(2),

                 Container(
                       height: sizee.height /9,
                width: sizee.width - ((sizee.width / 20) * 2.5),
                padding: EdgeInsets.symmetric(horizontal: sizee.width / 50 ,vertical: changeadress? sizee.height/120 : sizee.height/80),
                margin: EdgeInsets.only(bottom: sizee.height / 50),
                        decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child:
                changeadress?
                changeee(a:4, control: _adressctrl, authData: _authData)
                :
             //   afficher_content("E-mail", "ma.lasheb@esi-sba.dz", changeemail)

             afficherr(4),) ,


              Container(
                margin: EdgeInsets.symmetric(vertical: sizee.height/64),
                child: soulignee(3)) ,

                ElevatedButton(
                          child: Text("Mise à jour"),
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(sizee.width / 2.8, sizee.height / 18),
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
    ) );
    
    
    
  }

  Container phonee() {
    return Container(
                     height: sizee.height /9,
              width: sizee.width - ((sizee.width / 20) * 2.5),
              padding: EdgeInsets.symmetric(horizontal: sizee.width / 50 ,vertical: changenumero? sizee.height/120 : sizee.height/80),
              margin: EdgeInsets.only(bottom: sizee.height / 50),
                      decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child:
              changenumero?
              changeee(a:3, control: _phonectrl, authData: _authData)
              :
           //   afficher_content("E-mail", "ma.lasheb@esi-sba.dz", changeemail)

           afficherr(3),
              //affich_info_setting("E-mail", "ma.lasheb@esi-sba.dz", changeemail)
               );
  }

  Align soulignee(int a) {
    return Align(
                       alignment:((a==1)||(a==2))? Alignment.centerLeft:Alignment.center,
                      child: Container(
                          
                          padding: EdgeInsets.only(left: sizee.width / 29,bottom: sizee.height/32),
                          child: GestureDetector(
                            onTap: () { },
                            child: Text(
                              ((a==1)||(a==3))?
                              (a==1)?"Ajouter un e-mail"
                              :"Changer le mot de passe"
                              :"Ajouter un numéro de telephone",
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )));
  }




  Row afficherr(int a) {
  String name="" ;
  String namee="" ;

  if (a==1){name="Nom";namee="Lasheb Mohamed Amine";}
  else if (a==2){name="E-mail";namee="ma.lasheb@esi-sba.dz";}
    else if (a==3){name="Téléphone";namee="0658850774                  ";}
    else if (a==4){name="Adresse";namee="Cité 50log ,Tighennif-Mascara";}

  
    return Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,

children: [
Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 mainAxisAlignment: MainAxisAlignment.spaceAround,
 
children: [
  Text(
    name,style: const TextStyle(fontSize:22,fontWeight: FontWeight.bold),),
  Container(
    width: sizee.width/1.7,
    child: Text(namee,style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,)),
],
) ,
IconButton(


icon:Icon(Icons.create ,color: Color(0xfff47834)
,),
        onPressed: ()  {
 setState(() {
            if (a==1){changename=true;}
  else if (a==2){changeemail=true;}
    else if (a==3){changenumero=true;}
        else if (a==4){changeadress=true;}

 }); } )
],




                 );
  }

 
}

class changeee extends StatelessWidget {
  changeee({
    Key? key,
    required int a ,
    required TextEditingController control,
    required Map<String, String> authData,

  }) : _emailctrl = control, _authData = authData, _a=a , super(key: key);

  final int _a ;
  final TextEditingController _emailctrl;
  final Map<String, String> _authData;
  String modifier="";
  @override
  Widget build(BuildContext context) {
  if(_a==2){modifier="Modifiez votre e-mail";} else if (_a==3) {modifier="Modifiez votre numéro de téléphone"; }
  else if (_a==4) {modifier="Modifiez votre adresse"; }
    return Column(
         crossAxisAlignment: CrossAxisAlignment.start,

      children: [
       Container(
         margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/35 ,bottom: MediaQuery.of(context).size.height/160),
         child: Text(modifier,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
  TextFormField(
            controller: _emailctrl,
            validator: (value) {
              if (_a==2)  {
              if (value!.contains('@') || (value.length >= 5)) {
                return '';
              } else {
                return 'Votre e-mail est invalide';                            
              }
            } else if (_a==3) {
{
                          if (value!.length == 10) {
                            return '';
                          } else {
                            return 'Erreur';
                          }
                        }
            }
            if (_a==4)  {
              if (value!.length >= 6) {
                return '';
              } else {
                return 'Votre adresse est invalide';                            
              }
            }
            
            
            
            } ,
            onSaved: (value) {
            if (_a==2)  {  _authData['email'] = value!; }
            else if (_a==3)  {  _authData['phone number'] = value!; }
            else if (_a==4)  {  _authData['adresse'] = value!; }

            },

            keyboardType:
            ((_a==2)||(_a==4))?TextInputType.emailAddress:TextInputType.phone,            
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding:
                  const EdgeInsets.fromLTRB(10, 8, 10, 8),
               labelText: modifier,
                          hintText: modifier,
                          prefixIcon: ((_a==2)||(_a==4))? (_a==2)? Icon(
                              Icons.email,
                              color: Color(0xfff47834),
                            ):Icon(
                              Icons.home,
                              color: Color(0xfff47834),
                            ):
                            Icon(
                              Icons.phone,
                              color: Color(0xfff47834),
                            ),
                         
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)),
             
            ),
          ),
      ],
    );
  }
}