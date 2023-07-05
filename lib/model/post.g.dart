// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      authorUID: json['authorUID'] as String?,
      location: $enumDecodeNullable(_$LocationsEnumMap, json['location']),
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      timestamp: json['timestamp'] as int? ?? 0,
      description: json['description'] as String? ?? "",
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      followers: (json['followers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      anonymous: json['anonymous'] as bool? ?? false,
      spotted: json['spotted'] as bool? ?? false,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'authorUID': instance.authorUID,
      'location': _$LocationsEnumMap[instance.location],
      'gender': _$GenderEnumMap[instance.gender]!,
      'timestamp': instance.timestamp,
      'description': instance.description,
      'tags': instance.tags,
      'followers': instance.followers,
      'comments': instance.comments,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'anonymous': instance.anonymous,
      'spotted': instance.spotted,
    };

const _$LocationsEnumMap = {
  Locations.INGEGNERIA: 'INGEGNERIA',
  Locations.AGRARIA: 'AGRARIA',
  Locations.SCIENZE: 'SCIENZE',
  Locations.MENSA_INGEGNERIA: 'MENSA_INGEGNERIA',
  Locations.MENSA_ECONOMIA: 'MENSA_ECONOMIA',
  Locations.MEDICINA_MURRI: 'MEDICINA_MURRI',
  Locations.MEDICINA_EUSTACCHIO: 'MEDICINA_EUSTACCHIO',
  Locations.ECONOMIA: 'ECONOMIA',
  Locations.ANCONA: 'ANCONA',
  Locations.QT_140: 'QT_140',
  Locations.QT_150: 'QT_150',
  Locations.QT_155: 'QT_155',
  Locations.QT_160: 'QT_160',
  Locations.AULE_SUD: 'AULE_SUD',
  Locations.PORTINERIA: 'PORTINERIA',
  Locations.SEGRETERIA: 'SEGRETERIA',
  Locations.CLAB: 'CLAB',
  Locations.DIPARTIMENTO_MATEMATICA: 'DIPARTIMENTO_MATEMATICA',
  Locations.BIBLIOTECA: 'BIBLIOTECA',
  Locations.AGRARIA_ATRIO: 'AGRARIA_ATRIO',
  Locations.AGRARIA_INGRESSO: 'AGRARIA_INGRESSO',
  Locations.AGRARIA_ZONA_STUDENTI: 'AGRARIA_ZONA_STUDENTI',
  Locations.SCIENZE_1: 'SCIENZE_1',
  Locations.SCIENZE_2: 'SCIENZE_2',
  Locations.SCIENZE_3: 'SCIENZE_3',
  Locations.ECONOMIA_AULA_A: 'ECONOMIA_AULA_A',
  Locations.ECONOMIA_AULA_C: 'ECONOMIA_AULA_C',
  Locations.ECONOMIA_AULA_T_27: 'ECONOMIA_AULA_T_27',
  Locations.ECONOMIA_AULA_T_PICCOLA: 'ECONOMIA_AULA_T_PICCOLA',
  Locations.ECONOMIA_AULE_DOTTORATO: 'ECONOMIA_AULE_DOTTORATO',
  Locations.ECONOMIA_BIBLIOTECA: 'ECONOMIA_BIBLIOTECA',
  Locations.ECONOMIA_CHIOSTRO: 'ECONOMIA_CHIOSTRO',
  Locations.ECONOMIA_SALA_LETTURA: 'ECONOMIA_SALA_LETTURA',
  Locations.ECONOMIA_SBT: 'ECONOMIA_SBT',
  Locations.ECONOMIA_SEGRETERIA_STUDENTI: 'ECONOMIA_SEGRETERIA_STUDENTI',
  Locations.ANCONA_CAVOUR: 'ANCONA_CAVOUR',
  Locations.ANCONA_CITTADELLA: 'ANCONA_CITTADELLA',
  Locations.ANCONA_MOLE: 'ANCONA_MOLE',
  Locations.ANCONA_PASSETTO: 'ANCONA_PASSETTO',
  Locations.ANCONA_PIAZZA_DEL_PAPA: 'ANCONA_PIAZZA_DEL_PAPA',
  Locations.ANCONA_SAN_CIRIACO: 'ANCONA_SAN_CIRIACO',
  Locations.ANCONA_STAZIONE: 'ANCONA_STAZIONE',
  Locations.ANCONA_UGO_BASSI: 'ANCONA_UGO_BASSI',
  Locations.MEDICINA_MURRI_AULA_P1: 'MEDICINA_MURRI_AULA_P1',
  Locations.MEDICINA_MURRI_AULA_R: 'MEDICINA_MURRI_AULA_R',
  Locations.MEDICINA_MURRI_PIANO_TERRA: 'MEDICINA_MURRI_PIANO_TERRA',
  Locations.MEDICINA_MURRI_PIANO_1: 'MEDICINA_MURRI_PIANO_1',
  Locations.MEDICINA_MURRI_PIANO_2: 'MEDICINA_MURRI_PIANO_2',
  Locations.MEDICINA_MURRI_PIANO_3: 'MEDICINA_MURRI_PIANO_3',
  Locations.MEDICINA_MURRI_PIANO_4: 'MEDICINA_MURRI_PIANO_4',
  Locations.MEDICINA_EUSTACCHIO_ATELIER: 'MEDICINA_EUSTACCHIO_ATELIER',
  Locations.MEDICINA_EUSTACCHIO_AULA_D: 'MEDICINA_EUSTACCHIO_AULA_D',
  Locations.MEDICINA_EUSTACCHIO_AULE_STUDIO: 'MEDICINA_EUSTACCHIO_AULE_STUDIO',
  Locations.MEDICINA_EUSTACCHIO_BIBLIOTECA: 'MEDICINA_EUSTACCHIO_BIBLIOTECA',
  Locations.MEDICINA_EUSTACCHIO_LAURE_TRIENNALI:
      'MEDICINA_EUSTACCHIO_LAURE_TRIENNALI',
  Locations.MEDICINA_EUSTACCHIO_PIANO_TERRA: 'MEDICINA_EUSTACCHIO_PIANO_TERRA',
  Locations.MEDICINA_EUSTACCHIO_PIANO_1: 'MEDICINA_EUSTACCHIO_PIANO_1',
  Locations.MEDICINA_EUSTACCHIO_PIANO_2: 'MEDICINA_EUSTACCHIO_PIANO_2',
  Locations.MEDICINA_EUSTACCHIO_SEGRETERIA: 'MEDICINA_EUSTACCHIO_SEGRETERIA',
};

const _$GenderEnumMap = {
  Gender.MALE: 'MALE',
  Gender.FEMALE: 'FEMALE',
  Gender.OTHER: 'OTHER',
};
