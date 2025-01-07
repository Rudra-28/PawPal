import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pawpalforpets/authentication/login_view.dart';
import 'package:pawpalforpets/authentication/register_view.dart';
import 'package:pawpalforpets/constants/routes.dart';
import 'package:pawpalforpets/firebase_options.dart';
import 'package:pawpalforpets/utilities/location_view.dart';
import 'package:pawpalforpets/view/navbar/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    print("initialization started");
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } on FirebaseException catch (e) {
    // Handle Firebase initialization errors
    print("Firebase initialization failed: ${e.code} - ${e.message}"); 
    // You might want to show an error message to the user or log the error
  } catch (e) {
    // Handle any other unexpected errors
    print("An unexpected error occurred: $e");
  }
  print("done");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PawPal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegistrationScreen(),
      routes: <String, WidgetBuilder>{
      locationRoute: (context)=> const LocationView(locationStream: Stream.empty(),),
      loginRoute:(context)=> const LoginView(),
      //chatRoute:(context)=> const ChatScreen(),
    }
    );
  }
}