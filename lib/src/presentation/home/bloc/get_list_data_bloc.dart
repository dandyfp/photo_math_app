import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_math_app/src/data/local_datasource.dart';
import 'package:photo_math_app/src/models/data_calculation_model.dart';

part 'get_list_data_event.dart';
part 'get_list_data_state.dart';
part 'get_list_data_bloc.freezed.dart';

class GetListDataBloc extends Bloc<GetListDataEvent, GetListDataState> {
  LocalDatasource localDatasource = LocalDatasource();
  GetListDataBloc() : super(const _Initial()) {
    on<_GetData>((event, emit) async {
      var resutl = await localDatasource.getData();
      return resutl.fold(
        (l) {
          emit(GetListDataState.error(l));
        },
        (r) {
          emit(GetListDataState.loaded(r));
        },
      );
    });
  }
}
