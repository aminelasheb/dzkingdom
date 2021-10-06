import 'package:flutter/material.dart';


class boutiques extends StatefulWidget {
  const boutiques({ Key? key }) : super(key: key);

  @override
  _boutiquesState createState() => _boutiquesState();
}

class _boutiquesState extends State<boutiques> {
      get sizee => MediaQuery.of(context).size ;
  final names = ["Elmiigneuw", "scareXx", "yaeekubb16"];
  final followers = <int>[
    16,
    328,
    210
  ];
  final follow = [false, true ,false] ;
  final icons = [Icons.person_add ,Icons.person_add, Icons.person_add];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           title: Text("Boutiques" ,style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: true,
  leading: IconButton(icon:Icon(Icons.arrow_back_ios_new),
  
          onPressed: () {  Navigator.pop(context);
},),
actions: [
IconButton(icon:Icon(Icons.search),
  
          onPressed: () {
},)

],
            backgroundColor: Color(0xfff47834),
        ),
        body:  SingleChildScrollView(
                  physics: ScrollPhysics(),

          child: Container(
            margin: EdgeInsets.symmetric(horizontal: sizee.width/45 ,vertical: sizee.height/55),
            child: Column(
            
              children: <Widget>[
 Align(
   alignment: Alignment.topLeft,
   child: SizedBox(
     
      width: sizee.width * 0.55,
                          height: sizee.height / 18,
     child: Card(
       
        shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
       elevation: 3,
       

      
 
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    items: <String>[' Tous les boutiques', ' Boutiques tendance']
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    isExpanded: true,
                                    hint: Text(
                                      "  Tous les boutiques",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onChanged: (_) {},
                                  ),
                                ),
                              ),
   ),
 ),        
                ListView.builder(
                itemCount: names.length,
                   physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                          title: Text(names[index]),
                          subtitle: Text(followers[index].toString()+" Abonnées"),
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                          trailing:
                ElevatedButton(
                          child: Text(follow[index]?"Désabonner":"S'abonner" ,style: TextStyle(fontSize:follow[index]?12:13, color: !follow[index]?Colors.white:Color(0xfff47834),),),
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(follow[index]?sizee.width / 3.7:sizee.width / 4
                              , sizee.height / 100),
                            primary: follow[index]?Colors.white:Color(0xfff47834),
                            onPrimary: !follow[index]?Colors.white:Color(0xfff47834),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                  ));}),
              ],
            ),
          ),
        ));
        






      
  
  
} }