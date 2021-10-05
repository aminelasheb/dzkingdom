// ignore_for_file: prefer_const_constructors

import 'package:dzkingdom/Providers/User.dart';
import 'package:dzkingdom/Providers/homeprov.dart';
import 'package:dzkingdom/Providers/zones.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  static late AnimationController _controller;

  late Animation<double> _animation;


  static bool isClicked = false;

  static String name = '';
  static String email = '';
  static String surname = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));

    _animation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));



  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    // var user = Provider.of<User>(context, listen: false);
    String imgurl = '';
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.orange),
            child: Padding(
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
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  email = prefs.getString('email')!;
                  name = prefs.getString('name')!;
                  surname = prefs.getString('surname')!;

                  setState(() {
                    if (!isClicked) {
                      isClicked = true;
                      _controller.forward();
                    }
                  });
                },
                child: Container(
                  width: deviceSize.width*0.11,
                  height: deviceSize.width*0.1,
                  child:
                      Hero(
                          tag: 'user.id',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: FadeInImage(
                                fit: BoxFit.cover,
                                placeholder: AssetImage(
                                    'assets/images/ph.png'),
                                image: NetworkImage(
                                    'https://st.depositphotos.com/1428083/2946/i/600/depositphotos_29460297-stock-photo-bird-cage.jpg')),
                          )),
                ),
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            ZoneList(),
            Profile(
              isClicked: isClicked,
              animation: _animation,
              controller: _controller,
            ),
            ZoneInfos(
            )
          ],
        ));
  }
}

class Profile extends StatefulWidget {
  final bool isClicked;
  final Animation<double> animation;
  final AnimationController controller;

  const Profile(
      {Key? key,
      required this.isClicked,
      required this.animation,
      required this.controller})
      : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile>  {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    var imgUrl = '';
    return Center(
        child: FadeTransition(
      opacity: widget.animation,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
        duration: Duration(milliseconds: 150),
        width: widget.isClicked ? deviceSize.width * 0.9 : 0,
        height: widget.isClicked ? deviceSize.height * 0.7 : 0,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white38,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    Icons.cancel_rounded,
                    size: 38,
                    color: Colors.black87,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.controller.reverse();
                      _WelcomePageState.isClicked = false;
                    });
                  },
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child:
                            Stack(children: [
                            CircleAvatar(
                            radius: 60,
                            child:
                            SizedBox(
                              width:deviceSize.width*0.35 ,
                              height:deviceSize.width *0.35,
                              child:ClipRRect(
                                borderRadius:BorderRadius.circular(100) ,
                                child: FadeInImage(
                                    fit: BoxFit.cover,
                                    placeholder: AssetImage('assets/images/ph.png'),
                                    image: NetworkImage(
                                        'https://st.depositphotos.com/1428083/2946/i/600/depositphotos_29460297-stock-photo-bird-cage.jpg')
                                ),
                              ),

                        ),
                      ),
                      Positioned(
                          bottom: 0.5,
                          right: 0.2,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.white),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 30,
                                )),
                          )),
                      ]
                            )),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Text(
                            _WelcomePageState.name +
                                ' ' +
                                _WelcomePageState.surname,
                            style: TextStyle(
                                fontFamily: 'Baloo Thambi 2',
                                fontSize: 26,
                                overflow: TextOverflow.fade,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            _WelcomePageState.email,
                            style: TextStyle(
                                fontFamily: 'Baloo Thambi 2',
                                fontSize: 22,
                                overflow: TextOverflow.fade,
                                color: Colors.blueAccent),
                          )
                        ],
                      ),
                      Divider(
                        indent: 10.0,
                        endIndent: 10.0,
                        thickness: 2.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Column(
                        children:  [


                             Categ(
                              id: 'sc',
                                widget: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,

                                  ),
                                  child: Icon(
                                    Icons.message_rounded,
                                    color: Colors.orange,
                                    size: 30,
                                  ),
                                ),
                                desc:'Envoyer un commentaire'),

                          SizedBox(height: 10),
                          Categ(
                            id: 'settings',
                              widget: Container(
                                color: Colors.orange,
                                child: Icon(
                                  Icons.settings,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                              ),
                              desc: 'Paramètres'),
                          SizedBox(height: 10),
                          Categ(
                            id: 'logout',
                              widget: Container(
                                color: Colors.grey,
                                child: Icon(
                                  Icons.logout,
                                  color: Colors.orange,
                                  size: 30,
                                ),
                              ),
                              desc: 'Se déconnecter ')
                        ],
                      ),
                    ]),
              )),
        ),
      ),

      // child: Profile(),
    ));
  }
}

class Categ extends StatelessWidget {
  final String id;
  final Widget widget;
  final String desc;

  const Categ({Key? key, required this.widget, required this.desc, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if(id == 'logout'){

        }
        else if(id == 'sc'){

        }
        else{

        }

      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              // color: Colors.orange
            ),
              child: widget),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              desc,
              maxLines: 1,
              style: TextStyle(
                  fontFamily: 'Baloo Thambi 2',
                  fontSize: 22,
                  color: Colors.black,
                  overflow: TextOverflow.fade),
            ),
          )
        ],
      ),
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
          return
             ZoneUi(
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
    return Consumer<HomeProv>(
        builder: (context,val,child)=>
      Card(
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
                  overflow: TextOverflow.clip),
            ),
          ),
          Spacer(),
          IconButton(onPressed: () {
            val.switcher();

          }, icon: Icon(Icons.info_outline)),
        ],
      ),
    ));
  }
}

//TODO
class ZoneInfos extends StatelessWidget{
  const ZoneInfos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProv>(
        builder: (context,val,child)=>
        Center(
      child: Container(
        width: val.isClicked ? 300:0,
        height: val.isClicked ? 300:0,
        color: Colors.black,
        child: Text("data",
      )

      ),
    ));

  }


}

