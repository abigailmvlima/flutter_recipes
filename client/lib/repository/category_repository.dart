import '../api/api_client.dart';

class CategoryRepository {
  final ApiClient apiClient;

  CategoryRepository({required this.apiClient});

  Future<List<dynamic>> getAllCategories() async {
    return await apiClient.get('/api/category');
  }

  Future<dynamic> createCategory(Map<String, dynamic> categoryData) async {
    return await apiClient.post('/api/category', categoryData);
  }
}
