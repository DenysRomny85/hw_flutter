import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hw_flutter/lesson_25/person_dto.dart';
import 'package:hw_flutter/lesson_25/person_entity.dart';

Future<PersonEntity> getDecodeDataFromJson() async {
  final jsonString = await rootBundle.loadString(
    'assets/json/example.json',
  );

  final personMap = jsonDecode(jsonString) as Map<String, dynamic>;
  final person = PersonDto.fromJson(personMap);

  return PersonEntity.fromDto(person);
}
