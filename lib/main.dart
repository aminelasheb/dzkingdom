// ignore_for_file: prefer_const_literals_to_create_immutables



import 'package:dzkingdom/Providers/homeprov.dart';
import 'package:dzkingdom/screens/userUI/boutiques.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/auth.dart';
import 'Providers/user.dart';
import 'Screens/sign_in.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: Auth()),
      ChangeNotifierProvider.value(value: User()),
      ChangeNotifierProvider.value(value: HomeProv()),

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
