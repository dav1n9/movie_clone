import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavi extends StatefulWidget {
  final void Function(int) onTap;
  const BottomNavi({
    super.key,
    required this.onTap,
  });

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        setState(() {
          selectedIndex = index;
        });
      },
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed, // 애니메이션 없음
      selectedItemColor: Colors.grey[800],
      unselectedItemColor: Colors.grey[500],
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Main',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.tickets),
          label: 'BuyTicket',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mobile_friendly),
          label: 'MobileOrder',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: 'MyPage',
        ),
      ],
    );
  }
}
