import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmediatest/first_screen.dart';
import 'package:suitmediatest/viewmodel/user_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserViewModel(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: FirstScreen(),
      ),
    ),
  );
}
