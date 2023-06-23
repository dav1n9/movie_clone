import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'boxoffice_rest_client.g.dart';

@RestApi(
    baseUrl:
        "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json")
abstract class BoxOfficeRestClient {
  factory BoxOfficeRestClient(Dio dio, {String baseUrl}) = _BoxOfficeRestClient;

  @GET("")
  Future<String> getDailyBoxOffice(
    @Query("key") String apiKey,
    @Query("targetDt") String targetDt,
  );
}

@JsonSerializable()
class DailyBoxOffice {
  String? rnum;
  String? rank;
  String? rankInten;
  String? rankOldAndNew;
  String? movieCd;
  String? movieNm;
  String? openDt;
  String? salesAmt;
  String? salesShare;
  String? salesInten;
  String? salesChange;
  String? salesAcc;
  String? audiCnt;
  String? audiInten;
  String? audiChange;
  String? audiAcc;
  String? scrnCnt;
  String? showCnt;

  DailyBoxOffice({
    this.rnum,
    this.rank,
    this.rankInten,
    this.rankOldAndNew,
    this.movieCd,
    this.movieNm,
    this.openDt,
    this.salesAmt,
    this.salesShare,
    this.salesInten,
    this.salesChange,
    this.salesAcc,
    this.audiCnt,
    this.audiInten,
    this.audiChange,
    this.audiAcc,
    this.scrnCnt,
    this.showCnt,
  });

  factory DailyBoxOffice.fromJson(Map<String, dynamic> json) =>
      _$DailyBoxOfficeFromJson(json);
  Map<String, dynamic> toJson() => _$DailyBoxOfficeToJson(this);
}
