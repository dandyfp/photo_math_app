part of 'add_data_calculation_bloc.dart';

@freezed
class AddDataCalculationState with _$AddDataCalculationState {
  const factory AddDataCalculationState.initial() = _Initial;
  const factory AddDataCalculationState.loaded(String message) = _Loaded;
  const factory AddDataCalculationState.error(String message) = _Error;
}
