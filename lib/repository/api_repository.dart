import 'package:fetcdata/models/post_model.dart';
import 'package:fetcdata/services/api_services.dart';

class ApiRepository {
  final ApiService apiService;

  ApiRepository(this.apiService);

  Future<List<Post>> getPostData() async {
    final response = await apiService.getResponse();
    if (response != null) {
      final data = response.data as List<dynamic>;
      return data.map((e) => Post.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
