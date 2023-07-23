import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pdf_listner/firebase_options.dart';
import 'package:pdf_listner/provider/auth_provider.dart';
import 'package:pdf_listner/screens/add_document_screen.dart';
import 'package:pdf_listner/screens/authentication_screen.dart';
import 'package:pdf_listner/screens/forgot_password_screen.dart';
import 'package:pdf_listner/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(headlineMedium: TextStyle(fontWeight: FontWeight.bold)),
            inputDecorationTheme: const InputDecorationTheme(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2)))),
        initialRoute: AuthenticationScreen.routeName,
        routes: {
          AuthenticationScreen.routeName: (context) =>
              const AuthenticationScreen(),
          ForgotPasswordScreen.routeName: (context) =>
              const ForgotPasswordScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          AddDocumentScreen.routeName:(context)=> const AddDocumentScreen()
        },
      ),
    );
  }
}
