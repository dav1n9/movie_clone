import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> events = ["O.T", "쿠폰팩", "매니아", "1Pick", "메가굿즈#", "배라박스", "매진임박"];
  List<String> category = ["박스오피스", "상영예정", "돌비시네마", "단독", "클소", "필소"];

  Widget eventsBox(String name) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 70,
        height: 100,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.purple.shade100,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white, width: 3),
        ),
        child: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget movieBox() {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              'https://picsum.photos/id/421/200/200',
              errorBuilder: (BuildContext? context, Object? exception,
                  StackTrace? stackTrace) {
                return const Icon(Icons.error_outline);
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "영화 이름",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Row(
            children: [
              Text("예매율 27.2%"),
              SizedBox(width: 15),
              Text("⭐평점"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("바로예매"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade900,
        foregroundColor: Colors.white,
        title: const Text("HOME"),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.bell),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.list_bullet),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade900,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: events.map((e) => eventsBox(e)).toList()),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade900,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: category.map((e) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(13, 20, 13, 5),
                      child: Text("#$e"),
                    );
                  }).toList()),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                for (int i = 0; i < 8; i++) ...[movieBox()]
              ]),
            ),
            const Text("더 많은 영화보기 >"),
          ],
        ),
      ),
    );
  }
}
