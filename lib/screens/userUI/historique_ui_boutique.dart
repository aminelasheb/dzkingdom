import 'package:dzkingdom/Providers/boutique.dart';
import 'package:dzkingdom/widgets/storee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_format/date_format.dart';

class hisUiBout extends StatefulWidget {
  const hisUiBout({ Key? key }) : super(key: key);

  @override
  _hisUiBoutState createState() => _hisUiBoutState();
}

class _hisUiBoutState extends State<hisUiBout> {
        get sizee => MediaQuery.of(context).size ;

  

  @override
  Widget build(BuildContext context) {
      var obj = Provider.of<boutiquess>(context, listen: true) ;
List<boutique> Liste = obj.list ;
    return Container(
      margin: EdgeInsets.all(10),
       child: ListView.builder(
                      itemCount: Liste.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index ) {
                        return Column(
                          children: [
                             Container(
      alignment: Alignment.topLeft,
      margin:EdgeInsets.only(left:sizee.width*0.05 ,top:sizee.height*0.01),
                  child: Text(formatDate(DateTime.now(), [yy, '-', M, '-', DD,' at ',HH, ':', nn]),style:TextStyle(fontWeight: FontWeight.bold,)),),
                            Card(
                                child: storee(index: index, obj: obj, Liste: Liste, sizee: sizee, x: 1)),
                          ],
                        );}),
    );
  }
}