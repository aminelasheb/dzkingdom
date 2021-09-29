// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:dzkingdom/Providers/User.dart';
import 'package:dzkingdom/screens/envoyer_commentaire.dart';
import 'package:dzkingdom/screens/recuperation.dart';
import 'package:dzkingdom/screens/sign_in.dart';
import 'package:dzkingdom/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/auth.dart';
import 'Screens/signin.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: Auth()),
      // ChangeNotifierProvider.value(value: User())
    ],
    child: Consumer<Auth>(
      builder: (ctx, auth, _) => MaterialApp(
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        routes: {},
        home: SignIn(),
      ),
    ),
  ));
}
