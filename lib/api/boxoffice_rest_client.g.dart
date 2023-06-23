// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boxoffice_rest_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyBoxOffice _$DailyBoxOfficeFromJson(Map<String, dynamic> json) =>
    DailyBoxOffice(
      rnum: json['rnum'] as String?,
      rank: json['rank'] as String?,
      rankInten: json['rankInten'] as String?,
      rankOldAndNew: json['rankOldAndNew'] as String?,
      movieCd: json['movieCd'] as String?,
      movieNm: json['movieNm'] as String?,
      openDt: json['openDt'] as String?,
      salesAmt: json['salesAmt'] as String?,
      salesShare: json['salesShare'] as String?,
      salesInten: json['salesInten'] as String?,
      salesChange: json['salesChange'] as String?,
      salesAcc: json['salesAcc'] as String?,
      audiCnt: json['audiCnt'] as String?,
      audiInten: json['audiInten'] as String?,
      audiChange: json['audiChange'] as String?,
      audiAcc: json['audiAcc'] as String?,
      scrnCnt: json['scrnCnt'] as String?,
      showCnt: json['showCnt'] as String?,
    );

Map<String, dynamic> _$DailyBoxOfficeToJson(DailyBoxOffice instance) =>
    <String, dynamic>{
      'rnum': instance.rnum,
      'rank': instance.rank,
      'rankInten': instance.rankInten,
      'rankOldAndNew': instance.rankOldAndNew,
      'movieCd': instance.movieCd,
      'movieNm': instance.movieNm,
      'openDt': instance.openDt,
      'salesAmt': instance.salesAmt,
      'salesShare': instance.salesShare,
      'salesInten': instance.salesInten,
      'salesChange': instance.salesChange,
      'salesAcc': instance.salesAcc,
      'audiCnt': instance.audiCnt,
      'audiInten': instance.audiInten,
      'audiChange': instance.audiChange,
      'audiAcc': instance.audiAcc,
      'scrnCnt': instance.scrnCnt,
      'showCnt': instance.showCnt,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _BoxOfficeRestClient implements BoxOfficeRestClient {
  _BoxOfficeRestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??=
        'https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<String> getDailyBoxOffice(
    apiKey,
    targetDt,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'key': apiKey,
      r'targetDt': targetDt,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<String>(_setStreamType<String>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
