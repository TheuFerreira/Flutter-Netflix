import 'package:flutter/material.dart';
import 'package:flutter_netflix/app/screens/introduction/introduction_page.dart';
import 'package:flutter_netflix/app/shared/const/colors.dart';
import 'package:flutter_netflix/app/shared/controllers/current_account_controller.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => CurrentAccountController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Netflix',
        theme: ThemeData(
          fontFamily: 'AssociateSans',
          scaffoldBackgroundColor: Colors.white,
          brightness: Brightness.dark,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: backgroundElevatedButton,
              onPrimary: foregroundElevatedButton,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              textStyle: const TextStyle(fontSize: 16),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: foregroundTextButton,
              textStyle: const TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: backgroundElevatedButton,
          ),
          unselectedWidgetColor: Colors.grey[700],
          popupMenuTheme: const PopupMenuThemeData(
            color: Colors.white,
            textStyle: TextStyle(color: Colors.black),
          ),
        ),
        home: const IntroductionPage(),
      ),
    );
  }
}
