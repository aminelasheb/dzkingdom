import 'package:flutter/material.dart';
import 'package:dzkingdom/Providers/boutique.dart';
import 'package:provider/provider.dart';
import 'package:dzkingdom/widgets/aucunX.dart';


class boutiques extends StatefulWidget {
  const boutiques({ Key? key }) : super(key: key);

  @override
  _boutiquesState createState() => _boutiquesState();
}

class _boutiquesState extends State<boutiques> {
      get sizee => MediaQuery.of(context).size ;
  
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
        body:  ChangeNotifierProvider(
          create:(_) => boutiquess(),
          child: SingleChildScrollView(
                    physics: ScrollPhysics(),
        
            child:  Consumer<boutiquess>(
                    builder: (context,val,child)=>
             
             val.list.length>0? Container(
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
                    itemCount: val.list.length,
                       physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                              title: Text(val.list[index].name),
                              subtitle: Text(val.list[index].followers.toString()+" Abonnées"),
                              leading: CircleAvatar(
                                
                              backgroundImage: NetworkImage(
                                      "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                              trailing:
                    ElevatedButton(
                              child: Text(val.list[index].follow?"Désabonner":"S'abonner" ,style: TextStyle(fontSize:val.list[index].follow?12:13, color: !val.list[index].follow?Colors.white:Color(0xfff47834),),),
                              onPressed: () {
                                val.switcher(index);
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(val.list[index].follow?sizee.width / 3.7:sizee.width / 4
                                  , sizee.height / 100),
                                primary: val.list[index].follow?Colors.white:Color(0xfff47834),
                                onPrimary: !val.list[index].follow?Colors.white:Color(0xfff47834),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                      ));}),
                 
                ],
              ),
            )
            :
            aucunX(sizee: sizee ,xx:"Aucun boutique"),
            //aucunX(sizee: sizee ,xx:"Aucun boutique"),
            ),
          
        )));
        






      
  
  
} }

