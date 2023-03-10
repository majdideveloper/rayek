import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rayek_v001/providers/app_provider.dart';
import 'package:rayek_v001/providers/user_provider.dart';
import 'package:rayek_v001/utils/palette.dart';
import 'package:rayek_v001/widgets/bottom_bar.dart';

import 'firebase_options.dart';
import 'screens/auth/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return AppProvider();
          }),
          ChangeNotifierProvider(create: (_) {
            return UserProvider();
          }),
        ],
        child: MaterialApp(
          title: 'Rayek Social',
          theme: ThemeData(
            scaffoldBackgroundColor: BgColor,
          ),
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  context.read<UserProvider>().refreshUser();
                  // Checking if the snapshot has any data or not
                  if (snapshot.hasData) {
                    // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                    return const BottomBar();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  }
                }

                // means connection to future hasnt been made yet
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
// just verfied
                return const WelcomeScreen();
                // allo
              }),
        ));
  }
}
