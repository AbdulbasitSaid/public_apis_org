part of 'fetch_public_apis_cubit.dart';

abstract class FetchPublicApisState extends Equatable {
  const FetchPublicApisState();

  @override
  List<Object> get props => [];
}

class FetchPublicApisInitial extends FetchPublicApisState {}

class FetchPublicApisLoading extends FetchPublicApisState {}

class FetchPublicApisSuccess extends FetchPublicApisState {
  final PublicApiModel publicApiModel;

  const FetchPublicApisSuccess({required this.publicApiModel});
}

class FetchPublicApisFailed extends FetchPublicApisState {
  final String errorMessage;
  const FetchPublicApisFailed({
    required this.errorMessage,
  });
}
