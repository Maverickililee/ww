import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// NOTE: You need to update this import path if your LoginScreen is in a different location
import 'package:hello_flutter/screens/login_screen.dart'; 

// NOTE: Uncomment and set up your Firebase options file if you are running on a real device/emulator
// import 'firebase_options.dart'; 


// 2. Make main() async and initialize Firebase
Future<void> main() async {
  // Ensures that the Flutter framework is ready to use before running runApp
  WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: ".env"); // <-- important!
  // Initialize Firebase. This must happen before any other Firebase service is used.
  await Firebase.initializeApp(
     options: FirebaseOptions(
      apiKey: dotenv.env['FIREBASE_API_KEY']!,
      authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN']!,
      projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
      storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
      messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
      appId: dotenv.env['FIREBASE_APP_ID']!,
  ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Use ScreenUtilInit to set up the design size for responsive scaling
      home: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        // The builder pattern is the recommended way to use ScreenUtilInit
        builder: (context, child) {
          return const LoginScreen();
        },
      ),
    );
  }
}
