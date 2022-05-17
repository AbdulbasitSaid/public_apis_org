import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:public_apis_org/data_layer/models/public_api_model.dart';
import 'package:public_apis_org/domain_layer/repository/public_api_repository.dart';
import '../../../common/reusable.dart';
part 'fetch_public_apis_state.dart';

class FetchPublicApisCubit extends Cubit<FetchPublicApisState> {
  final PublicApiRepository _publicApiRepository;

  FetchPublicApisCubit(this._publicApiRepository)
      : super(FetchPublicApisInitial());
  void fetchPublicApis() async {
    emit(FetchPublicApisLoading());
    final result = await _publicApiRepository.fetchPublicApi();

    emit(result.fold(
        (l) => FetchPublicApisFailed(
            errorMessage: getErrorMessage(l.appErrorType)),
        (r) => FetchPublicApisSuccess(publicApiModel: r)));
  }
}
