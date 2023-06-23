import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:movie_clone/screen/movie_info_screen.dart';
import '../api/boxoffice_rest_client.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> events = ["O.T", "쿠폰팩", "매니아", "1Pick", "메가굿즈#", "배라박스", "매진임박"];
  List<String> category = ["박스오피스", "상영예정", "돌비시네마", "단독", "클소", "필소"];

  late final client;
  @override
  void initState() {
    final dio = Dio();
    client = BoxOfficeRestClient(dio);

    super.initState();
  }

  Future<List<DailyBoxOffice>> dailyBoxOfficeFromJson() async {
    List<DailyBoxOffice> result = [];
    String s = await client.getDailyBoxOffice(dotenv.get("apiKey"), getToday());
    List<dynamic> list =
        json.decode(s)["boxOfficeResult"]["dailyBoxOfficeList"];
    for (int i = 0; i < list.length; i++) {
      result.add(DailyBoxOffice.fromJson(list[i]));
    }
    return result;
  }

  // 오늘날짜 받아오기
  String getToday() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyyMMdd');
    //var strToday = formatter.format(now);
    var strToday = (int.parse(formatter.format(now)) - 1).toString();

    print("strToday : $strToday");
    return strToday;
  }

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

  Widget movieBox(DailyBoxOffice dailyBoxOffice) {
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
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              "${dailyBoxOffice.movieNm}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Row(
            children: [
              Text("예매율 ${dailyBoxOffice.salesShare}"),
              const SizedBox(width: 15),
              const Text("⭐평점"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(
              "개봉일 ${dailyBoxOffice.openDt}",
            ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            FutureBuilder<List<DailyBoxOffice>>(
              future: dailyBoxOfficeFromJson(),

              //String
              // parsing => List<Map<String, dynamic>>

              builder: (context, snapshot) {
                // response body가 받아와지는 동안 로딩화면이 띄워지도록 하는 코드
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                print(snapshot.data.runtimeType);

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: snapshot.data!.map((e) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MovieInfoScreen()),
                          );
                        },
                        child: movieBox(e),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("더 많은 영화보기 >"),
            ),
          ],
        ),
      ),
    );
  }
}
