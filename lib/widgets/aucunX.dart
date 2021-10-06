import 'package:flutter/material.dart';


class aucunX extends StatelessWidget {
  final String xx ;
  const aucunX({
    Key? key,
    required this.sizee,
    required this.xx,
  }) : super(key: key);

  final sizee;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizee.height/5,
      alignment:Alignment.center,
      margin: EdgeInsets.only(top:sizee.height/3.5),
      child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Icon(
      Icons.do_not_disturb_outlined,size: 100,color: Colors.grey,
      ),
      Text(xx ,style: TextStyle(fontSize: 26 ,color: Colors.grey),)
        ],
      ),
    );
  }
}