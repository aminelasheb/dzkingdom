import 'package:dzkingdom/widgets/notif_2.dart';
import "package:flutter/material.dart";
import 'package:date_format/date_format.dart';

class historiqueUi extends StatefulWidget {
  const historiqueUi({ Key? key }) : super(key: key);

  @override
  _historiqueUiState createState() => _historiqueUiState();
}

class _historiqueUiState extends State<historiqueUi> {
   get sizee => MediaQuery.of(context).size ;
      var Product = [["Samsung Galaxy S10", "Store Amine ", " - 60%", "6 800 DZD", "5 202 DZD"]
      ,["Samsung Galaxy S10", "Store Ahmed ", " - 6%", "12 900 DZD", "202 DZD"],
   ["Samsung Galaxy S10", "Store Amine ", " - 60%", "6 800 DZD", "5 202 DZD"]
      ,["Samsung Galaxy S10", "Store Ahmed ", " - 6%", "12 900 DZD", "202 DZD"],
      ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top:sizee.height/200),
              // margin:EdgeInsets.symmetric(vertical: sizee.height/50 ,horizontal: sizee.width*0.03),
              child: Center(
                child: ListView.builder(
                   itemCount: Product.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                  itemBuilder: (ctx ,i){

            return 
            
            Column(
              children: [
                Container(
      alignment: Alignment.topLeft,
      margin:EdgeInsets.only(left:sizee.width*0.05 ,top:sizee.height*0.01),
                  child: Text(formatDate(DateTime.now(), [yy, '-', M, '-', DD,' at ',HH, ':', nn]),style:TextStyle(fontWeight: FontWeight.bold,)),),
                Notification_2(Store: Product[i][0], sizee: sizee, product: Product[i][1],notif:false),
              ],
            );
            //  notif_box(prod: Product[i][0], store: Product[i][1], remise: Product[i][2], prix: Product[i][3], prix_nv: Product[i][4], sizee: sizee);
   
                  })
             
              ),
            ),
          );
  }
}