import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

//void main() => runApp(FlashChat());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {

  late final _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context)  {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: _auth.currentUser != null ?ChatScreen.id :WelcomeScreen.id,
      routes: {
        WelcomeScreen.id:(context)=>WelcomeScreen(),
        ChatScreen.id: (context)=> ChatScreen(),
        LoginScreen.id: (context)=>LoginScreen(),
        RegistrationScreen.id: (context)=>RegistrationScreen(),
    }
    );
  }
}
