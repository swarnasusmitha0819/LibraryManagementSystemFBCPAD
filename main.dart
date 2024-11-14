import 'package:flutter/material.dart';
import 'browse_books_page.dart';
import 'home_page.dart';
import 'my_books_page.dart';
import 'profile_page.dart';
import 'about_us_page.dart';
import 'contact_us_page.dart';
import 'login_page.dart';
import 'registration_page.dart';

void main() {
  runApp(LibraryApp());
}

class LibraryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Management System',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomePage(),
        '/browseBooks': (context) => BrowseBooksPage(),
        '/myBooks': (context) => MyBooksPage(),
        '/profile': (context) => ProfilePage(),
        '/aboutUs': (context) => AboutUsPage(),
        '/contactUs': (context) => ContactUsPage(),
        '/login' : (context) => LoginPage(),
        '/register': (context) => RegistrationPage(),
      },
    );
  }
}
