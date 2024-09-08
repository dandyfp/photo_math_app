part of 'get_list_data_bloc.dart';

@freezed
class GetListDataState with _$GetListDataState {
  const factory GetListDataState.initial() = _Initial;
  const factory GetListDataState.loaded(List<DataCalculationModel> data) =
      _Loaded;
  const factory GetListDataState.error(String message) = _Error;
  const factory GetListDataState.loading() = _Loading;
}
