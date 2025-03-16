import 'package:one_does_project/data/network/general_model.dart';

abstract class ApiServices {
  Future<dynamic> getApiResponse<T extends GeneralTypeModel>(
    String baseAdress,
    String path,
  );
}
