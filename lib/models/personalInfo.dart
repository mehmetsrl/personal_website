import 'dart:convert';

import 'package:flutter/foundation.dart';

class Competency {
  static int outOf;
  String competencyName;
  int competencyLevel;

  Competency({
    this.competencyName,
    this.competencyLevel,
  });

  factory Competency.fromMap(Map<String, dynamic> json) {
    return Competency(
      competencyName: json['competencyName'],
      competencyLevel: json['competencyLevel'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'competencyName': competencyName,
      'competencyLevel': competencyLevel,
    };
  }
  
  String toJson() => json.encode(toMap());

  factory Competency.fromJson(String source) => Competency.fromMap(json.decode(source));
}

class Keyword {
  String keywordId;
  String keywordName;
  int keywordMention;

  Keyword({
    this.keywordId,
    this.keywordName,
    this.keywordMention,
  });

  Map<String, dynamic> toMap() {
    return {
      'keywordId': keywordId,
      'keywordName': keywordName,
      'keywordMention': keywordMention,
    };
  }

  factory Keyword.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Keyword(
      keywordId: map['keywordId'],
      keywordName: map['keywordName'],
      keywordMention: map['keywordMention'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Keyword.fromJson(String source) =>
      Keyword.fromMap(json.decode(source));
}

class Language {
  static int outOf;
  String languageName;
  int overallLevel;
  int readingLevel;
  int writingLevel;
  int listeningLevel;

  Language({
    this.languageName,
    this.overallLevel,
    this.readingLevel,
    this.writingLevel,
    this.listeningLevel,
  });

  // factory Language.fromMap(Map<String, dynamic> json) {
  //   return Language(
  //     languageName: json['languageName'],
  //     overallLevel: json['overallLevel'],
  //     readingLevel: json['readingLevel'],
  //     writingLevel: json['writingLevel'],
  //     listeningLevel: json['listeningLevel'],
  //   );
  // }

  Map<String, dynamic> toMap() {
    return {
      'languageName': languageName,
      'overallLevel': overallLevel,
      'readingLevel': readingLevel,
      'writingLevel': writingLevel,
      'listeningLevel': listeningLevel,
    };
  }

  factory Language.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Language(
      languageName: map['languageName'],
      overallLevel: map['overallLevel'],
      readingLevel: map['readingLevel'],
      writingLevel: map['writingLevel'],
      listeningLevel: map['listeningLevel'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Language.fromJson(String source) =>
      Language.fromMap(json.decode(source));
}

class PersonalInfo {
  final String name;
  final String surname;
  final String description;
  final String email;
  final String pictureImageUrl;
  final String metaContentUrl;
  final List<Competency> competencies;
  final List<Language> languages;
  final List<Keyword> keywords;

  PersonalInfo(
      {this.name,
      this.surname,
      this.description,
      this.email,
      this.pictureImageUrl,
      this.metaContentUrl,
      this.competencies,
      this.languages,
      this.keywords});

  factory PersonalInfo.fromMap(Map<String, dynamic> data) {
    Iterable competencyList = data['competencies']['values'];
    Competency.outOf = data['competencies']['outOf'];
    Iterable languageList = data['languages']['values'];
    Language.outOf = data['languages']['outOf'];

    return PersonalInfo(
        name: data['name'],
        surname: data['surname'],
        description: data['description'],
        email: data['email'],
        pictureImageUrl: data['pictureImageUrl'],
        metaContentUrl: data['metaContentUrl'],
        competencies: competencyList.map((i) => Competency.fromMap(i)).toList(),
        languages: languageList.map((i) => Language.fromMap(i)).toList(),
        keywords: List<Keyword>.from(
            data['keywords']?.map((x) => Keyword.fromMap(x))));
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surname': surname,
      'description': description,
      'email': email,
      'pictureImageUrl': pictureImageUrl,
      'metaContentUrl': metaContentUrl,
      'competencies': competencies?.map((x) => x?.toMap())?.toList(),
      'languages': languages?.map((x) => x?.toMap())?.toList(),
      'keywords': keywords?.map((x) => x?.toMap())?.toList(),
    };
  }

  String toJson() => json.encode(toMap());

  factory PersonalInfo.fromJson(String source) =>
      PersonalInfo.fromMap(json.decode(source));
}
