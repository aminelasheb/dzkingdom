import 'package:flutter/material.dart';

class historique extends StatefulWidget {
  const historique({ Key? key }) : super(key: key);

  @override
  _historiqueState createState() => _historiqueState();
}

class _historiqueState extends State<historique> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xfff47834),
         automaticallyImplyLeading: true,
      leading: IconButton(icon:Icon(Icons.arrow_back_ios_new),
            onPressed: () {  Navigator.pop(context);

    },),
            bottom: TabBar(
              indicatorColor:Colors.white,
              indicatorWeight: 3.0,
              
              tabs: [
                Tab(text: 'Historique produits'),
                Tab(text: 'Historique boutiques',),
            
              ],
            ),
            title: Text('Historique',style: TextStyle(color: Colors.white),),
          ),
          body: TabBarView(
            children: [
             Container(),
             Container(),
            ],
          ),
        ),
      ),
    );
  }
}