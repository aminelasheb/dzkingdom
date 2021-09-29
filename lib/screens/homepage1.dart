// ignore_for_file: prefer_const_constructors

import 'package:dzkingdom/Providers/User.dart';
import 'package:dzkingdom/Screens/sign_in.dart';
import 'package:dzkingdom/Providers/zones.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var user = Provider.of<User>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0), color: Colors.orange),
          child:
              // ignore: prefer_const_constructors
              Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
            child: Text(
              'Zones Commerciales',
              style: TextStyle(fontSize: 20, fontFamily: 'Baloo Thambi 2'),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                child:
                    //     Image(
                    //   image: AssetImage('assets/images/envoyer_commentairee.png'),
                    //   fit: BoxFit.cover,
                    // )
                    Hero(
                        tag: 'user.id',
                        child: FadeInImage(
                            fit: BoxFit.cover,
                            placeholder: AssetImage(
                                'assets/images/envoyer_commentairee.png'),
                            image: NetworkImage(
                                'https://upload.wikimedia.org/wikipedia/commons/d/d8/Person_icon_BLACK-01.svg'))),
              ),
            ),
          )
        ],
      ),
      body: ZoneList(),
    );
  }
}

class ZoneList extends StatelessWidget {
  const ZoneList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Zones.list.length,
        itemBuilder: (context, i) {
          return ZoneUi(
            name: Zones.list[i].name,
            imgUrl: Zones.list[i].imgUrl,
            description: Zones.list[i].description,
          );
        });
  }
}

class ZoneUi extends StatelessWidget {
  final String name;
  final String imgUrl;
  final String description;

  ZoneUi({required this.name, required this.imgUrl, required this.description});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      elevation: 1.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: size.height * 0.1,
            width: size.height * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage(imgUrl),
            ),
          ),
          // SizedBox(width: 10.0),
          Spacer(),
          SizedBox(
            width: size.width * 0.5,
            height: size.height * 0.1,
            child: Text(
              name,
              style: TextStyle(
                  fontFamily: 'Baloo Thambi 2',
                  fontSize: 20,
                  overflow: TextOverflow.fade),
            ),
          ),
          Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.info_outline)),
        ],
      ),
    );
  }
}
