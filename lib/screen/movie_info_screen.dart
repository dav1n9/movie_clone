import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_clone/api/movie_info_client.dart';

class MovieInfoScreen extends StatefulWidget {
  final String movieCd;
  const MovieInfoScreen({
    super.key,
    required this.movieCd,
  });

  @override
  State<MovieInfoScreen> createState() => _MovieInfoScreenState();
}

class _MovieInfoScreenState extends State<MovieInfoScreen> {
  late final movieInfoClient;

  @override
  void initState() {
    final dio = Dio();
    movieInfoClient = MovieInfoClient(dio);
    super.initState();
  }

  Future<MovieInfo> movieInfoFromJson(String movieCd) async {
    String s =
        await movieInfoClient.getMovieInfo(dotenv.get("apiKey"), movieCd);
    Map<String, dynamic> result =
        json.decode(s)["movieInfoResult"]["movieInfo"]; // String -> map
    MovieInfo movieInfo = MovieInfo.fromJson(result); // map -> MovieInfo 타입으로!!

    print("movieInfo: $movieInfo");
    return movieInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<MovieInfo>(
        future: movieInfoFromJson(widget.movieCd),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${snapshot.data!.prdtStatNm}",
                    style: const TextStyle(fontSize: 13),
                  ),
                  Text(
                    "${snapshot.data!.movieNm}",
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text(
                    "${snapshot.data!.movieNmEn} ${snapshot.data!.prdtYear}",
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "${snapshot.data!.showTm}분",
                    style: const TextStyle(fontSize: 15),
                  ),
                  Row(
                    children: snapshot.data!.nations!.map(
                      (e) {
                        return Text(e.nationNm);
                      },
                    ).toList(),
                  ),
                  Row(
                    children: snapshot.data!.genres!.map(
                      (e) {
                        return Text(e.genreNm);
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
