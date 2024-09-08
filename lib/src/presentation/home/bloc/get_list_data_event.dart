part of 'get_list_data_bloc.dart';

@freezed
class GetListDataEvent with _$GetListDataEvent {
  const factory GetListDataEvent.started() = _Started;
  const factory GetListDataEvent.getData() = _GetData;
}
