import 'package:flutter/material.dart';

class notif_box extends StatelessWidget {

  final String prod ;
  final String store ;
  final String remise ;
  final String prix ;
  final String prix_nv ;
  final  sizee ;

  const notif_box({
     Key? key ,
  required this.prod,
  required this.store ,
  required this.remise ,
  required this.prix ,
  required this.prix_nv ,
  required this.sizee,
     
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {     

    return SizedBox(
      
                width:sizee.width*0.9,
      height: sizee.height*0.375  ,
              child: Card(
               shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
              elevation: 8, 
               margin: EdgeInsets.only(bottom: sizee.height*0.03),
                child:  Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [

                             

                              Container( 
                                alignment: AlignmentDirectional.topStart,
                                height : sizee.height*0.22 ,
                                decoration :BoxDecoration(
                                  image: DecorationImage(image:NetworkImage(
                                "https://d1fmx1rbmqrxrr.cloudfront.net/cnet/optim/i/edit/2019/02/galaxy-s10-family__w1200.JPG"),
          fit: BoxFit.cover, ),
                                   
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                              
                            ),
                            child:   Container(
                                alignment: AlignmentDirectional.bottomStart,
                               margin: EdgeInsets.only(bottom: sizee.height/80,left: sizee.width/40),
                                child: Row(children: [
         Container (
                                                 decoration: BoxDecoration(
       color:Colors.green,                  borderRadius: BorderRadius.circular(8),
                ),
                                               padding: EdgeInsets.symmetric(vertical: sizee.height/190,horizontal: sizee.width/90),
margin: EdgeInsets.only(right:sizee.width/100),
                       
           child: Text(prix_nv,style:TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold))),

                                  Container(
                                                        decoration: BoxDecoration(
       color:Colors.red,                  borderRadius: BorderRadius.circular(8),
                ),
                                               padding: EdgeInsets.symmetric(vertical: sizee.height/190,horizontal: sizee.width/90),

                                    child: Text(prix, style:TextStyle(decoration : TextDecoration.lineThrough ,color: Colors.white,fontWeight: FontWeight.bold))) ,
                                ],),
                              ), ),
                             
                             Container(
 margin: EdgeInsets.only(top: sizee.height/80,left: sizee.width/40),

                                       decoration: BoxDecoration(
       color:Colors.blue[900],                  borderRadius: BorderRadius.circular(8),
                ),
                               padding: EdgeInsets.symmetric(vertical: sizee.height/190,horizontal: sizee.width/90),
                               child: Text(remise ,style: TextStyle(fontWeight:FontWeight.bold, color:Colors.white)))
                            

                                              ,        Container(
                                padding: EdgeInsets.only(top:5,),
                                alignment: AlignmentDirectional.topEnd,
                                decoration :BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            
                            ),

                            
                                child:RawMaterialButton(
onPressed: () {},
elevation: 2.0,
fillColor: Color(0xfff47834),
child: Icon(
  Icons.notifications,
  size: 22.0,
  color: Colors.white,
),
shape: CircleBorder(),
)
                                
                                /* Icon(
Icons.circle_notifications_outlined,size:35, color:Color(0xfff47834) ,
),*/),


                              ],
                            ),
                          Container(
 height: sizee.height/400,
                width: sizee.width*0.9,
                color: Colors.grey,
 ) ,
 Center(
 child: Padding(
   padding:  EdgeInsets.symmetric(vertical: sizee.height/85,horizontal: 0),
   child: Text(prod ,style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
 ),
 ) ,
                      Container(
                        margin: EdgeInsets.only(bottom:sizee.height/700),
 height: sizee.height/400,
                width: sizee.width*0.9,
                color: Colors.grey,
 ) ,



 ListTile(
                                title: 
                                Row(children: [
                                 Text(store ,style:TextStyle(fontWeight: FontWeight.bold)),
                                 
  
   Icon(
    
    Icons.circle,color: Colors.green ,size:11
    
    ),
  
                                ],),
                                //Row(
                                
                                leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                          
                        )                       
                          ],
                        ),),
            );
  }
}