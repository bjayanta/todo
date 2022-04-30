import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'states/task_state.dart';
import 'screens/input_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Todo app",
        // home: HomeScreen(), // the home route is '/'
        routes: {
          '/': (context) => HomeScreen(),
          InputScreen.routeName: (context) => InputScreen(),
        },
      ),
    );
  }
}
