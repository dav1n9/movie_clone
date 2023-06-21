import 'package:flutter/material.dart';
import 'package:movie_clone/bottom_navi.dart';
import 'package:movie_clone/screen/buy_ticket_screen.dart';
import 'package:movie_clone/screen/mobile_order_screen.dart';
import 'package:movie_clone/screen/my_page_screen.dart';

import 'screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavi(
          onTap: (selectedIndex) {
            setState(() {
              index = selectedIndex;
            });
          },
        ),
        body: const SafeArea(
          child: IndexedStack(
            children: [
              MainScreen(),
              BuyTicketScreen(),
              MobileOrderScreen(),
              MyPageScreen(),
            ],
          ),
        ));
  }
}
