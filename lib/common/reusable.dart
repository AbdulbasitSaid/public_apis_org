import 'package:public_apis_org/domain_layer/entities/app_error_entity.dart';

String getErrorMessage(AppErrorType appErrorType) {
  switch (appErrorType) {
    case AppErrorType.unProcessableEntity:
      return 'The request is unprocessable, often due to invalid parameters.';
    case AppErrorType.badRequest:
      return 'The request was unacceptable, often due the parameter provided by the client.';
    case AppErrorType.network:
      return 'Please check your internet connection and try again';
    case AppErrorType.unauthorized:
      return 'No bearer token provided or an invalid bearer token was provided.';
    case AppErrorType.forbidden:
      return 'Authentication failed. This may occur when a wrong email or password is provided during login.';
    case AppErrorType.notFound:
      return 'The requested resource doesn\'t exist.';
    case AppErrorType.serveError:
      return 'Server error. Hopefully this will occur in rear cases.';
    case AppErrorType.serverNotAvailble:
      return 'Server not available at the moment please try again!! later';
    case AppErrorType.unExpected:
      return 'Unexpected error.';
    default:
      return 'Opps something went wrong pleas try again';
  }
}
