import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_info_client.g.dart';

@RestApi(
    baseUrl:
        "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json")
abstract class MovieInfoClient {
  factory MovieInfoClient(Dio dio, {String baseUrl}) = _MovieInfoClient;

  @GET("")
  Future<String> getMovieInfo(
    @Query("key") String apiKey,
    @Query("movieCd") String movieCd,
  );
}

@JsonSerializable(converters: [
  NationConverter(),
  GenreConverter(),
  DirectorConverter(),
  ActorConverter(),
  ShowTypeConverter(),
  CompanyConverter(),
  AuditConverter(),
  StaffConverter(),
])
class MovieInfo {
  String? movieCd;
  String? movieNm;
  String? movieNmEn;
  String? movieNmOg;
  String? prdtYear;
  String? showTm;
  String? openDt;
  String? prdtStatNm;
  String? typeNm;
  List<Nation>? nations;
  List<Genre>? genres;
  List<Director>? directors;
  List<Actor>? actors;
  List<ShowType>? showTypes;
  List<Company>? companys;
  List<Audit>? audits;
  List<Staff>? staffs;

  MovieInfo({
    this.movieCd,
    this.movieNm,
    this.movieNmEn,
    this.movieNmOg,
    this.prdtYear,
    this.showTm,
    this.openDt,
    this.prdtStatNm,
    this.typeNm,
    this.nations,
    this.genres,
    this.directors,
    this.actors,
    this.showTypes,
    this.companys,
    this.audits,
    this.staffs,
  });

  factory MovieInfo.fromJson(Map<String, dynamic> json) =>
      _$MovieInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MovieInfoToJson(this);
}

//-----------Nation
class Nation {
  final String nationNm;

  Nation(this.nationNm);

  factory Nation.fromJson(Map<String, dynamic> json) {
    return Nation(json['nationNm'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'nationNm': nationNm,
    };
  }
}

class NationConverter implements JsonConverter<Nation, Map<String, dynamic>> {
  const NationConverter();

  @override
  Nation fromJson(Map<String, dynamic> json) {
    return Nation.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Nation nation) {
    return nation.toJson();
  }
}

//-----------Genre
class Genre {
  final String genreNm;

  Genre(this.genreNm);

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(json['genreNm'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'genreNm': genreNm,
    };
  }
}

class GenreConverter implements JsonConverter<Genre, Map<String, dynamic>> {
  const GenreConverter();

  @override
  Genre fromJson(Map<String, dynamic> json) {
    return Genre.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Genre genre) {
    return genre.toJson();
  }
}

//-----------Director
class Director {
  final String peopleNm;
  final String peopleNmEn;

  Director(this.peopleNm, this.peopleNmEn);

  factory Director.fromJson(Map<String, dynamic> json) {
    return Director(json['peopleNm'] as String, json['peopleNmEn'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'peopleNm': peopleNm,
      'peopleNmEn': peopleNmEn,
    };
  }
}

class DirectorConverter
    implements JsonConverter<Director, Map<String, dynamic>> {
  const DirectorConverter();

  @override
  Director fromJson(Map<String, dynamic> json) {
    return Director.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Director director) {
    return director.toJson();
  }
}

//-----------Actor
class Actor {
  final String peopleNm;
  final String peopleNmEn;
  final String cast;
  final String castEn;

  Actor(this.peopleNm, this.peopleNmEn, this.cast, this.castEn);

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(json['peopleNm'] as String, json['peopleNmEn'] as String,
        json['cast'] as String, json['castEn'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'peopleNm': peopleNm,
      'peopleNmEn': peopleNmEn,
      'cast': cast,
      'castEn': castEn,
    };
  }
}

class ActorConverter implements JsonConverter<Actor, Map<String, dynamic>> {
  const ActorConverter();

  @override
  Actor fromJson(Map<String, dynamic> json) {
    return Actor.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Actor actor) {
    return actor.toJson();
  }
}

//-----------ShowType
class ShowType {
  final String showTypeGroupNm;
  final String showTypeNm;

  ShowType(this.showTypeGroupNm, this.showTypeNm);

  factory ShowType.fromJson(Map<String, dynamic> json) {
    return ShowType(
        json['showTypeGroupNm'] as String, json['showTypeNm'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'showTypeGroupNm': showTypeGroupNm,
      'showTypeNm': showTypeNm,
    };
  }
}

class ShowTypeConverter
    implements JsonConverter<ShowType, Map<String, dynamic>> {
  const ShowTypeConverter();

  @override
  ShowType fromJson(Map<String, dynamic> json) {
    return ShowType.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ShowType showType) {
    return showType.toJson();
  }
}

//-----------Company
class Company {
  final String companyCd;
  final String companyNm;
  final String companyNmEn;
  final String companyPartNm;

  Company(this.companyCd, this.companyNm, this.companyNmEn, this.companyPartNm);

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(json['companyCd'] as String, json['companyNm'] as String,
        json['companyNmEn'] as String, json['companyPartNm'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'companyCd': companyCd,
      'companyNm': companyNm,
      'companyNmEn': companyNmEn,
      'companyPartNm': companyPartNm,
    };
  }
}

class CompanyConverter implements JsonConverter<Company, Map<String, dynamic>> {
  const CompanyConverter();

  @override
  Company fromJson(Map<String, dynamic> json) {
    return Company.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Company company) {
    return company.toJson();
  }
}

//-----------Audit
class Audit {
  final String auditNo;
  final String watchGradeNm;

  Audit(this.auditNo, this.watchGradeNm);

  factory Audit.fromJson(Map<String, dynamic> json) {
    return Audit(json['auditNo'] as String, json['watchGradeNm'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'auditNo': auditNo,
      'watchGradeNm': watchGradeNm,
    };
  }
}

class AuditConverter implements JsonConverter<Audit, Map<String, dynamic>> {
  const AuditConverter();

  @override
  Audit fromJson(Map<String, dynamic> json) {
    return Audit.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Audit audit) {
    return audit.toJson();
  }
}

//-----------Staff
class Staff {
  final String peopleNm;
  final String peopleNmEn;
  final String staffRoleNm;

  Staff(this.peopleNm, this.peopleNmEn, this.staffRoleNm);

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(json['peopleNm'] as String, json['peopleNmEn'] as String,
        json['staffRoleNm'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'peopleNm': peopleNm,
      'peopleNmEn': peopleNmEn,
      'staffRoleNm': staffRoleNm,
    };
  }
}

class StaffConverter implements JsonConverter<Staff, Map<String, dynamic>> {
  const StaffConverter();

  @override
  Staff fromJson(Map<String, dynamic> json) {
    return Staff.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Staff staff) {
    return staff.toJson();
  }
}
