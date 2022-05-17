import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:public_apis_org/data_layer/datasource/public_api_remote_datasource.dart';
import 'package:public_apis_org/data_layer/models/public_api_model.dart';
import 'package:public_apis_org/domain_layer/entities/app_error_entity.dart';

class PublicApiRepository {
  final PublicApiRemoteDatasource _publicApiRemoteDatasource;
  PublicApiRepository(
    this._publicApiRemoteDatasource,
  );

  Future<Either<AppError, PublicApiModel>> fetchPublicApi() async {
    try {
      final result = await _publicApiRemoteDatasource.fetchPublicApis();
      return Right(result);
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on Exception {
      return const Left(
        AppError(appErrorType: AppErrorType.unExpected),
      );
    }
  }
}
