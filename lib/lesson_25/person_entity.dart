import 'package:hw_flutter/lesson_25/person_dto.dart';

class PersonEntity {
  const PersonEntity({
    required this.chequeId,
    required this.totalAmount,
    required this.items,
    required this.prediction,
  });

  PersonEntity.fromDto(PersonDto dto)
    : chequeId = dto.chequeHeader?.chequeId ?? 0,
      totalAmount = dto.chequeHeader?.sumReg ?? 0.0,
      items =
          dto.chequeLines
              ?.map((line) => line.lagerNameUa ?? '')
              .where((name) => name.isNotEmpty)
              .toList() ??
          [],
      prediction = dto.chPrediction ?? '';

  final int chequeId;
  final double totalAmount;
  final List<String> items;
  final String prediction;
}
