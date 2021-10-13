import 'package:dzkingdom/widgets/storee.dart';
import 'package:flutter/cupertino.dart';
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
  int x=1 ; // 1 et 3 pour interface Boutique (1:tous ,3:tendaces) et 2 pour interface boutiques abonnées
    List<boutique> Liste=[] ;
      get sizee => MediaQuery.of(context).size ;
  Widget build(BuildContext context) {

  var obj = Provider.of<boutiquess>(context, listen: true) ;
  if (x==1) {Liste=obj.list;} else if  (x==2) {Liste=obj.list_abn;} else {Liste=obj.list_ten;};
  var scroll="  Tous les boutiques";
  var a=' Tous les boutiques' ;var b =' Boutiques tendance' ;
  bool searchh = obj.search;
  TextEditingController editingController = TextEditingController();

   


    return GestureDetector(
              onTap : () => FocusScope.of(context).unfocus(),

      child: Scaffold(
        appBar: AppBar(

             title:
             searchh?  Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextFormField(
          /*    onChanged: (value) {
   obj.filterSearchResults(value,x,Liste);
}, */
                controller: editingController,
            cursorColor: Color(0xfff47834),
                      decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: UnderlineInputBorder(      
                       borderSide: BorderSide(color: Color(0xfff47834)),), 
      focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black,width: 2.0),
      ),
                      contentPadding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                      hintText: 'Recherchez',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xfff47834),
                        
                      ),
                    ),
                  ),
          ),
        ):
             Text((x==1||x==3)?"Boutiques":"Boutiques abonnées" ,style: TextStyle(color: Colors.white),),
          automaticallyImplyLeading: true,
      leading: IconButton(icon:Icon(Icons.arrow_back_ios_new),
      
            onPressed: () {  Navigator.pop(context);
    },),
    actions: [
    IconButton(icon:
    searchh?
    Icon(Icons.clear):Icon(Icons.search),
      
            onPressed: () {
              setState(() {
               obj.searchup();
              });
            
    },)
    
    ],
              backgroundColor: Color(0xfff47834),
          // ignore: dead_code
          ),
    
          body:  ChangeNotifierProvider(
            create:(_) => boutiquess(),
            child: SingleChildScrollView(
                      physics: ScrollPhysics(),
          
              child:  Liste.length>0?Container(
                margin: EdgeInsets.symmetric(horizontal: sizee.width/45 ,vertical: sizee.height/55),
                child: Column(
                
                  children: <Widget>[
    
           (x==1 || x==3)?Align(
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
                                        items: <String>[a,b]
                                            .map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        isExpanded: true,
                                        hint: Text(
                                        x==1?a:b ,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onChanged: (val) {
        setState(() {  
             val==' Tous les boutiques'? { x=1 ,} : {x=3 ,} ;
    });
    
                                        },
                                      ),
                                    ),
                                  ),
             ),
           ):Container(),    
                    ListView.builder(
                      itemCount: Liste.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index ) {
                        return Card(
                            child: storee(index: index, obj: obj, Liste: Liste, sizee: sizee, x: x));}),
                            // store_widg(index, obj));}),
                   
                  ],
                )
              ) :
              aucunX(sizee: sizee ,xx:"Aucun boutique"),
             
             
            
          ))),
    );
        






      
  
  
}

 }

