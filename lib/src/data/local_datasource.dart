import 'package:dartz/dartz.dart';
import 'package:photo_math_app/src/data/db_helper.dart';
import 'package:photo_math_app/src/models/data_calculation_model.dart';

class LocalDatasource implements DataCalculationRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  @override
  Future<Either<String, String>> createData({
    required String result,
    required String input,
    required List<int> imagePath,
  }) async {
    try {
      await _databaseHelper.insertData(
        input: input,
        imagePath: imagePath,
        result: result,
      );

      return right('Success add data');
    } catch (e) {
      return left('Failed add user');
    }
  }

  @override
  Future<Either<String, List<DataCalculationModel>>> getData() async {
    try {
      var result = await _databaseHelper.getData();
      return right(
          result.map((e) => DataCalculationModel.fromJSON(e)).toList());
    } catch (e) {
      return left('Failed get list agenda');
    }
  }
}

abstract class DataCalculationRepository {
  Future<Either<String, String>> createData({
    required String result,
    required String input,
    required List<int> imagePath,
  });

  Future<Either<String, List<DataCalculationModel>>> getData();
}
