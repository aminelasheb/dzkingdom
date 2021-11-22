import 'package:dzkingdom/Providers/boutique.dart';
import 'package:flutter/material.dart';

class storee extends StatelessWidget {
  final int index
    ;final boutiquess obj ;
    final Liste ;
    final sizee ;
    final x ;
  const storee({
   
    required this.index ,
    required this.obj ,
    required this.Liste,
    required this.sizee ,
    required this.x, // 1 :hist
     Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
                              title: 
                              Row(children: [
                               Text(Liste[index].name+" "),
                               Liste[index].tendance?Icon(
    Icons.verified_outlined,color: Colors.brown ,
  ):Container() ,
  
  Container(
    margin:EdgeInsets.only(left:sizee.width/100),
    child:   Icon(
    
    Icons.circle,color: Colors.green ,size:11
    
    ),
  )
                              ],),
                              //Row(
                              
                              subtitle: Text(Liste[index].followers.toString()+" Abonnées"),
                              leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                              trailing:
                    ElevatedButton(
                              child: Text(Liste[index].follow?"Désabonner":"S'abonner" ,style: TextStyle(fontSize:Liste[index].follow?12:13, color: !Liste[index].follow?Colors.white:Color(0xfff47834),),),
                              onPressed: () {
                                   obj.switcher(index,x,Liste[index].id);
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(Liste[index].follow?sizee.width / 3.7:sizee.width / 4
                                  , sizee.height / 100),
                                primary: Liste[index].follow?Colors.white:Color(0xfff47834),
                                onPrimary: !Liste[index].follow?Colors.white:Color(0xfff47834),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                      );
  }
}