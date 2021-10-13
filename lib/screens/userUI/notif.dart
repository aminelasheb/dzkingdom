import 'dart:ui';

import 'package:dzkingdom/widgets/notif_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class notifications extends StatefulWidget {
  const notifications({ Key? key }) : super(key: key);

  @override
  _notificationsState createState() => _notificationsState();
}

class _notificationsState extends State<notifications> {
      get sizee => MediaQuery.of(context).size ;
      var Product = [["Samsung Galaxy S10", "Store Amine ", " - 60%", "6 800 DZD", "5 202 DZD"]
      ,["Samsung Galaxy S10", "Store Ahmed ", " - 6%", "12 900 DZD", "202 DZD"],
   ["Samsung Galaxy S10", "Store Amine ", " - 60%", "6 800 DZD", "5 202 DZD"]
      ,["Samsung Galaxy S10", "Store Ahmed ", " - 6%", "12 900 DZD", "202 DZD"],
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

            title: Text("Notification" ,style: TextStyle(color: Colors.white),),
            backgroundColor: Color(0xfff47834),
         automaticallyImplyLeading: true,
      leading: IconButton(icon:Icon(Icons.arrow_back_ios_new),
            onPressed: () {  Navigator.pop(context);

    },),

          ) ,
          body: SingleChildScrollView(
            child: Container(
              
              margin:EdgeInsets.symmetric(vertical: sizee.height/50 ,horizontal: sizee.width*0.03),
              child: Center(
                child: ListView.builder(
                   itemCount: Product.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                  itemBuilder: (ctx ,i){

            return   notif_box(prod: Product[i][0], store: Product[i][1], remise: Product[i][2], prix: Product[i][3], prix_nv: Product[i][4], sizee: sizee);
            
                  
                  })
             
              ),
            ),
          ),
    );
  } 
} 