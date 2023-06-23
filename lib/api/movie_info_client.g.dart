// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_info_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieInfo _$MovieInfoFromJson(Map<String, dynamic> json) => MovieInfo(
      movieCd: json['movieCd'] as String?,
      movieNm: json['movieNm'] as String?,
      movieNmEn: json['movieNmEn'] as String?,
      movieNmOg: json['movieNmOg'] as String?,
      prdtYear: json['prdtYear'] as String?,
      showTm: json['showTm'] as String?,
      openDt: json['openDt'] as String?,
      prdtStatNm: json['prdtStatNm'] as String?,
      typeNm: json['typeNm'] as String?,
      nations: (json['nations'] as List<dynamic>?)
          ?.map((e) =>
              const NationConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map(
              (e) => const GenreConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      directors: (json['directors'] as List<dynamic>?)
          ?.map((e) =>
              const DirectorConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      actors: (json['actors'] as List<dynamic>?)
          ?.map(
              (e) => const ActorConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      showTypes: (json['showTypes'] as List<dynamic>?)
          ?.map((e) =>
              const ShowTypeConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      companys: (json['companys'] as List<dynamic>?)
          ?.map((e) =>
              const CompanyConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      audits: (json['audits'] as List<dynamic>?)
          ?.map(
              (e) => const AuditConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      staffs: (json['staffs'] as List<dynamic>?)
          ?.map(
              (e) => const StaffConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieInfoToJson(MovieInfo instance) => <String, dynamic>{
      'movieCd': instance.movieCd,
      'movieNm': instance.movieNm,
      'movieNmEn': instance.movieNmEn,
      'movieNmOg': instance.movieNmOg,
      'prdtYear': instance.prdtYear,
      'showTm': instance.showTm,
      'openDt': instance.openDt,
      'prdtStatNm': instance.prdtStatNm,
      'typeNm': instance.typeNm,
      'nations': instance.nations?.map(const NationConverter().toJson).toList(),
      'genres': instance.genres?.map(const GenreConverter().toJson).toList(),
      'directors':
          instance.directors?.map(const DirectorConverter().toJson).toList(),
      'actors': instance.actors?.map(const ActorConverter().toJson).toList(),
      'showTypes':
          instance.showTypes?.map(const ShowTypeConverter().toJson).toList(),
      'companys':
          instance.companys?.map(const CompanyConverter().toJson).toList(),
      'audits': instance.audits?.map(const AuditConverter().toJson).toList(),
      'staffs': instance.staffs?.map(const StaffConverter().toJson).toList(),
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _MovieInfoClient implements MovieInfoClient {
  _MovieInfoClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??=
        'http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<String> getMovieInfo(
    apiKey,
    movieCd,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'key': apiKey,
      r'movieCd': movieCd,
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
