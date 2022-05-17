import 'dart:convert';

import 'package:http/http.dart';

import 'package:public_apis_org/data_layer/models/public_api_model.dart';

class PublicApiRemoteDatasource {
  final Client client;
  PublicApiRemoteDatasource(
    this.client,
  );
  Future<PublicApiModel> fetchPublicApis() async {
    final response =
        await client.get(Uri.parse('https://api.publicapis.org/entries'));
    final result = jsonDecode(response.body);
    return PublicApiModel.fromJson(result);
  }
}
