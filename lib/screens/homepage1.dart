// ignore_for_file: prefer_const_constructors

import 'package:dzkingdom/Providers/homeprov.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dzkingdom/Providers/user.dart';
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

  // static String name = '';
  // static String email = '';
  // static String surname = '';

  // Future<void> getData()async{
  //   SharedPreferences prefs =
  //   await SharedPreferences.getInstance();
  //   email = prefs.getString('email')!;
  //   name = prefs.getString('name')!;
  //   surname = prefs.getString('surname')!;
  // }

  @override
  void initState(){
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    _animation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<User>(context, listen : true);
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
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
                  onTap: (){
                    setState(() {
                      // getData();
                      if (!isClicked) {
                        isClicked = true;
                        _controller.forward();
                      }
                    });
                  },
                  child: CircleAvatar(
                    child:SizedBox(
                      height:deviceSize.height*0.1,
                      width: deviceSize.height*0.1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                      child:prov.imgUrl =='' ?
                      Image(image:
                      AssetImage(
                          'assets/images/ph.png')
                      ):

                         Image.file(prov.image,
                           fit: BoxFit.fitWidth,
                           ),


                  ),
                    )
              )))],
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
          ),
    );
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
    print('redraw');
    var deviceSize = MediaQuery.of(context).size;

    var prov = Provider.of<User>(context , listen: false);
    print(prov.name);

    return

         Center(
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
                      icon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: Icon(
                          Icons.cancel_rounded,
                          size: 30,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          widget.controller.reverse();
                          _WelcomePageState.isClicked = false;
                        });
                      },
                    ),
                    title: Text('Votre profile',
                    style: TextStyle(
                      fontFamily: 'Baloo Thambi 2',
                      color: Colors.black,
                      fontSize: 22,
                    ),),
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
                                    child:
                                    prov.imgUrl == '' ?

                                          Image(image: AssetImage('assets/images/ph.png')):
                                              Image.file(prov.image,
                                              fit: BoxFit.cover,)


                                    // FadeInImage(
                                    //     fit: BoxFit.cover,
                                    //     placeholder: AssetImage('assets/images/ph.png'),
                                    //     image: AssetImage(
                                    //         prov.imgUrl)
                                    // ),
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
                                    onPressed: () {
                                      showDialog(context: context , builder: (context){
                                        TextStyle style = TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Baloo Thambi 2',
                                          color: Colors.black,
                                        );
                                        return AlertDialog(
                                          title: Text('Veuillez sélectionner une photo',
                                          style: style,),
                                          actions:[
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20.0),
                                                      color: Colors.orange
                                                  ),
                                                  child: ListTile(
                                                    leading: Icon(Icons.camera_alt,
                                                    color: Colors.black,),
                                                    title: Text('Prendre une photo',
                                                    style: style,),
                                                    minLeadingWidth: 1.0,
                                                    onTap: (){
                                                      prov.getImage(ImageSource.camera);
                                                    },
                                                  ),
                                                ),
                                                SizedBox(height:15),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20.0),
                                                      color: Colors.orange
                                                  ),
                                                  child: ListTile(
                                                    leading: Icon(Icons.photo_album_outlined,
                                                      color: Colors.black,),
                                                    title: Text('Importer de galerie',
                                                    style: style,),
                                                    minLeadingWidth: 1.0,
                                                    onTap: ()async {
                                                      Navigator.of(context).pop();
                                                      await prov.getImage(ImageSource.gallery);
                                                      print('shiiit' +prov.imgUrl);




                                                    },

                                                  ),
                                                ),
                                            SizedBox(height:15),
                                              ],

                                        );
                                      });
                                    },
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
                                  prov.name +
                                      ' ' +
                                      prov.surname,
                                  style: TextStyle(
                                      fontFamily: 'Baloo Thambi 2',
                                      fontSize: 26,
                                      overflow: TextOverflow.fade,
                                      fontWeight: FontWeight.w600),
                                ),

                              Text(
                                prov.email,
                                style: TextStyle(
                                    fontFamily: 'Baloo Thambi 2',
                                    fontSize: 22,
                                    overflow: TextOverflow.fade,
                                    color: Colors.blueAccent),
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                            indent: 10.0,
                            endIndent: 10.0,
                            thickness: 2.0,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Column(
                            children:  const [


                                 Categ(
                                  id: 'sc',
                                    widget: Icon(
                                        Icons.comment_outlined,
                                        color: Colors.white,
                                        size: 25,
                                      ),

                                    desc:'Envoyer un commentaire',
                                 color: Colors.orange,),

                              SizedBox(height: 10),
                              Categ(
                                id: 'settings',
                                   widget:Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                      size: 25,
                                    ),

                                  desc: 'Paramètres',
                              color:Colors.grey),
                              SizedBox(height: 10),
                              Categ(
                                id: 'logout',

                                     widget:Icon(
                                      Icons.logout,
                                      color: Colors.grey,
                                      size: 25,
                                    ),

                                  desc: 'Se déconnecter ',
                              color: Colors.white,)
                            ],
                          ),
                        ]),
                  )),
            ),
          ),

          // child: Profile(),
        ),
    )
      ;
  }
}



class Categ extends StatelessWidget {
  final String id;
  final Widget widget;
  final String desc;
  final Color color;

  const Categ({Key? key, required this.widget, required this.desc, required this.id, required this.color})
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
            width: 35,
            height :35,
            decoration:BoxDecoration(
              boxShadow: const [
                BoxShadow(color: Colors.black,
                blurRadius: 0.1,
                offset: Offset(0.0,0.5))
              ],
              borderRadius: BorderRadius.circular(100),
              color: color// color: Colors.orange
            ),
              child: widget),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              desc,
              maxLines: 1,
              style: TextStyle(
                  fontFamily: 'Baloo Thambi 2',
                  fontSize: 20,
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
              id:Zones.list[i].id,
              name: Zones.list[i].name,
              imgUrl: Zones.list[i].imgUrl,
              description: Zones.list[i].description,
            );

        });
  }
}

class ZoneUi extends StatelessWidget {
  final String id;
  final String name;
  final String imgUrl;
  final String description;

   ZoneUi({required this.id ,required this.name, required this.imgUrl, required this.description});

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
            val.passDesc(description, imgUrl, name );
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
    var deviceSize = MediaQuery.of(context).size;
    return Consumer<HomeProv>(
        builder: (context,val,child)=>
        Center(
        child: Card(
          elevation: 8.0,
          child: Container(
            width: val.isClicked ? deviceSize.width * 0.9:0,
            height: val.isClicked ? deviceSize.height * 0.7:0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(1.0)
            ),
            child:Padding(
              padding: const EdgeInsets.all(1.0),
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Text("Page d'information",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Baloo Thambi 2'

                  ),),
                  leading: IconButton(onPressed: (){
                    val.switcher();
                  },
                      icon: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle
                          ),
                          child: Icon(Icons.cancel,
                          size: 30,))),
                  backgroundColor: Colors.grey[50],
                  elevation: 0,
                ),
              body:Padding(
                padding: const EdgeInsets.all(5.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image(
                          image: AssetImage(val.imgUrl,
                          ),
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      Center(
                        child: Text(

                          val.name,
                          style: TextStyle(

                            fontFamily: 'Baloo Thambi 2',
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1.5,
                        indent: 5.0,
                        endIndent: 5.0,
                        color: Colors.black,
                      ),

                        Text(val.desc,
                        style: TextStyle(
                          fontFamily: 'Baloo Thambi 2',
                          fontSize: 18
                        ),),

                    ],
                  ),
                ),
              )),
            )
          ),
        ),
      )

      ,
    );

  }


}

