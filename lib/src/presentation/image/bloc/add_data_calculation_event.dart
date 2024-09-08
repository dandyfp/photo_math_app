part of 'add_data_calculation_bloc.dart';

@freezed
class AddDataCalculationEvent with _$AddDataCalculationEvent {
  const factory AddDataCalculationEvent.started() = _Started;
  const factory AddDataCalculationEvent.addData({
    required String res,
    required String input,
    required List<int> imagePath,
  }) = _AddData;
}
