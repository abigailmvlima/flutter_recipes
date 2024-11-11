import '../repository/category_repository.dart';

class CategoryService {
  final CategoryRepository categoryRepository;

  CategoryService({required this.categoryRepository});

  Future<List<dynamic>> fetchAllCategories() async {
    return await categoryRepository.getAllCategories();
  }
}
