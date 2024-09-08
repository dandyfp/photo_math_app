import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_calculation_model.freezed.dart';

@freezed
class DataCalculationModel with _$DataCalculationModel {
  const factory DataCalculationModel({
    String? result,
    String? input,
    List<int>? imagePath,
  }) = _DataCalculationModel;

  factory DataCalculationModel.fromJSON(Map<String, dynamic> json) {
    Uint8List? image = json["imagePath"];
    return DataCalculationModel(
      imagePath: image,
      result: json['result'],
      input: json['input'],
    );
  }
}
