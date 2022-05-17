import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../data_layer/datasource/public_api_remote_datasource.dart';
import '../domain_layer/repository/public_api_repository.dart';

final GetIt getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance.registerLazySingleton<PublicApiRemoteDatasource>(
      () => PublicApiRemoteDatasource(getItInstance()));
  getItInstance.registerLazySingleton<PublicApiRepository>(
      () => PublicApiRepository(getItInstance()));
}
