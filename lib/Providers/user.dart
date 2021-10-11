import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';


class User extends ChangeNotifier{
   String id='';
   String name='hhhhhh';
   String surname='';
   String email='';
   String phoneNumber='';
   String imgUrl='';
   late File image;
   final picker = ImagePicker();




   void setUserData(String id, String name,String surname, String email,String phoneNumber){
     this.id = id;
     this.name = name;
     this.surname = surname;
     this.email = email;
     this.phoneNumber = phoneNumber;
     notifyListeners();
   }

    User getUserData(){
      notifyListeners();
      return this;
    }

    Future<void> getImage(ImageSource source)async{
     final pickedFile = await picker.pickImage(source: source);
     if(pickedFile != null){
       image = File(pickedFile.path);
       imgUrl = image.path;
       notifyListeners();
     }


    }


}

