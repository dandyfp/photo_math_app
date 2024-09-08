import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_math_app/src/data/local_datasource.dart';

part 'add_data_calculation_event.dart';
part 'add_data_calculation_state.dart';
part 'add_data_calculation_bloc.freezed.dart';

class AddDataCalculationBloc
    extends Bloc<AddDataCalculationEvent, AddDataCalculationState> {
  LocalDatasource localDatasource = LocalDatasource();
  AddDataCalculationBloc() : super(const _Initial()) {
    on<_AddData>(
      (event, emit) async {
        var result = await localDatasource.createData(
          result: event.res,
          input: event.input,
          imagePath: event.imagePath,
        );

        return result.fold(
          (l) {
            AddDataCalculationState.loaded(l);
          },
          (r) {
            AddDataCalculationState.error(r);
          },
        );
      },
    );
  }
}
