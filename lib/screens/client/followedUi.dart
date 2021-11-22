import 'package:dzkingdom/widgets/a_propos_wid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class followed extends StatefulWidget {
  const followed({ Key? key }) : super(key: key);


  @override
  _followedState createState() => _followedState();
}

class _followedState extends State<followed> {
  bool follow = true ;
  bool j = true ;
  @override
  Widget build(BuildContext context) {

          var sizee = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
     
        body: 
        Container(
color: Colors.white,
        child:
        Column(
          children: <Widget>[
            // construct the profile details widget here
            SizedBox(
              height: sizee.height*0.4,
              child:
              
              
              
              /////////
              ///
              ///
              ///
              
              
              
              
              
              
              
              
               Center(
      child: 
      Column(
        children: [
          Container(
            margin:EdgeInsets.only(top:sizee.height*0.05 ),
            child:     CircleAvatar(
              
                          radius: sizee.width * 0.15,
                            backgroundImage:   AssetImage(
                              'assets/images/ph.png'),


                            ),
        ),
              Padding(padding: EdgeInsets.only(top:sizee.height*0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                               Text("Boutique AMine" ,style: TextStyle(fontWeight: FontWeight.bold, fontSize:22,),
                               ),         
  
  Container(
    margin:EdgeInsets.only(left:sizee.width/80),
    child:   Icon(
    
    Icons.circle,color: Colors.green ,size:12
    
    ),
  )
                              ],),),
                              Padding(padding: EdgeInsets.only(top : sizee.height*0.015),
                              child: Center(
                                child: Text("13 Abonné(e)s", style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.bold),),),)
             ,
             Padding(padding: EdgeInsets.only(top:sizee.height*0.018), 
             child : RatingBar.builder(
               itemSize: 35,
               ignoreGestures: true,
               unratedColor: Colors.grey[300],
   initialRating: 3.5,
   minRating: 1,
   direction: Axis.horizontal,
   allowHalfRating: true,
   itemCount: 5,
   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
   itemBuilder: (context, _) => Icon(
     Icons.star,
     color: Color(0xfff47834),
   ),
   onRatingUpdate: (rating) {
     
   },
), ) ,
            
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
   ElevatedButton(

                            child:

                            !follow?
                             Text(follow?"Désabonner":"S'abonner" ,style: TextStyle(fontSize:13, color: !follow?Colors.white:Color(0xfff47834),),)
                            :
                            Row(
                             mainAxisAlignment:MainAxisAlignment.spaceAround,
                            children: [
                                                           Text(follow?"Abonné(e)":"S'abonner" ,style: TextStyle(fontSize:13, color: !follow?Colors.white:Color(0xfff47834),),),
                                       
                                Ink(
           child: IconButton(
            icon: j? Icon(Icons.notifications_on):Icon(Icons.notifications_off),
            color:  Color(0xfff47834),
            onPressed: () {
               setState(() {
                 j=!j;
               });
            },
          ),
        )
                          
                            ],  
                            ),
                            
                              onPressed: () {
                                 setState(() {
                                   follow=!follow;
                                 });
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(sizee.width / 2.55
                                  , sizee.height / 60),
                                primary:follow?Colors.white:Color(0xfff47834),
                                onPrimary: !follow?Colors.white:Color(0xfff47834),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),


                             ElevatedButton(
                              child:
                            Row(
                             mainAxisAlignment:MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
  Icons.chat,
  color: Colors.grey[700]
),
     Text("Message" ,style: TextStyle(fontSize:13, color: Colors.grey[700],),),
                                       
         
                          
                            ],  
                            ),
                            
                              onPressed: () {
                                 //
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(sizee.width /3
                                  , sizee.height / 60),
                                primary:Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),

                    Container(

                    width:sizee.height / 20,
                    height:sizee.height/20,
                    
                    decoration: BoxDecoration(
                       boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
        ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  child:  IconButton(

            icon: const Icon(Icons.more_vert),
            color: Colors.grey[700],
            onPressed: () { setState(() {
              j=!j ;
            });
},
           ),
                  
                     
              
                   
                  ),
//*

// Container(
//   color:Colors.red,
//   child:Ink(
  
//           decoration: const ShapeDecoration(
//             color: Colors.red,
//             shadows: [
//               BoxShadow(
// color: Colors.black,
// offset: Offset.zero,
//  blurRadius: 5.0,
//  spreadRadius: 5.0
// )
//             ],
//             shape: CircleBorder(),
//           ),
//           child: IconButton(
//             icon: const Icon(Icons.more_vert),
//             color: Colors.grey[700],
//             onPressed: () {},
//           ),
//         ),) 

],
)
        ],
      ),), 












      ////////////////////////////// 
      ///
      ///
      ///
      ///
      ///
      ///












            ),

            // the tab bar with two items
            SizedBox(
              height:sizee.height*0.095,
              child: 
              
              AppBar(
                            backgroundColor: Colors.white,

                bottom: TabBar(
                              labelColor: Color(0xfff47834),
                       unselectedLabelColor: Colors.black,
                      indicatorColor:Color(0xfff47834),
              indicatorWeight: 3.0,
                  tabs: [
                    Tab(
                      text:"Accueil",
                    ),
                    Tab(
                      text : "Catégorie"
                    ),
                     Tab(
                      text : "A propos"
                    ),
                  ],
                ),
              ),
            ),

            // create widgets for each tab bar here
            Expanded(
              child: TabBarView(
                children: [
                  // first tab bar view widget
                  Container(
                     color: Colors.red[100],
                    child: Center(
                      child: Text(
                        'Bike',
                      ),
                    ),
                  ),

                  // second tab bar viiew widget
                  Container(
                     color: Colors.pink[100],
                    child: Center(
                      child: Text(
                        'Car',
                      ),
                    ),
                  ),
                  a_proposs_wid(sizee: sizee),
                ],
              ),
            ),
          ],
        ),
      ),
     ) );
  }
}