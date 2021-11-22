import 'package:flutter/material.dart';


class Notification_2 extends StatelessWidget {
  const Notification_2({
    Key? key,
    required this.Store,
    required this.sizee,
    required this.product,
    required this.notif ,
  }) : super(key: key);

 final sizee;
final  Store;
 final product;
 final bool notif;
  @override
  Widget build(BuildContext context) {
    return Card(
      //     shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(20.0),
      // ),
          elevation: 3, 
      child: ListTile(
        minVerticalPadding: 5,
        horizontalTitleGap: 5,
        subtitle: Row(
         children: [
              // Image(
              //   image: const AssetImage(
              //       'assets/images/eulma.png'),
             
              // ),
             

             Text(product ,style:TextStyle(fontWeight: FontWeight.bold))
                  
         
              
         ], 
        )
                        ,  
                        title:
                           Row(
                             children: [
                               Text(Store ,style:TextStyle(fontWeight: FontWeight.bold)),
                               Expanded(child:Text(notif?" a publié un produit : ":"",
                               overflow: TextOverflow.ellipsis, ),)
                               
    
                             ],
                           ),
                           
                          //Row(
                          
                          leading:
                          
                             CircleAvatar(
                          radius: sizee.width * 0.07,
                            backgroundImage: NetworkImage(
                           "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                          
                          trailing: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),

                            child: Image(
                              height: sizee.height * 0.25,
                              width: sizee.width * 0.25,
                          
                                                     image: const NetworkImage(
                             "https://sm.pcmag.com/t/pcmag_uk/review/s/samsung-ga/samsung-galaxy-s20-fe-5g_vwxr.1920.jpg"),
                          
                                                  // ),,
                                          
                                                    ),
                          ),
    ));
  }
} 