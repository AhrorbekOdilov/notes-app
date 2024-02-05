import 'package:dio/dio.dart';
import 'package:notes_json_app/core/network.dart';

class RemoteApiService {
  final NetworkManager networkManager;

  RemoteApiService({
    required Dio dio,
    required this.networkManager,
  });

  static const gitHubUrl = "https://jsonplaceholder.typicode.com/todos";

  Future<Response> getNotes() async {
    final response = await networkManager.request(RequestMethod.get, gitHubUrl);
    return response;
  }
}
