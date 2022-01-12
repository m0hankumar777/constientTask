import 'package:task1/model/categoryModel.dart';
import 'package:task1/service/api_service.dart';
import 'package:dio/dio.dart' as dio;

class CategoryViewModel {
  late Category category;
  CategoryViewModel() {
    fetchData();
  }

  Future<void> fetchData() async {
    ApiService apiService = ApiService(dio.Dio());
    this.category = await apiService.getCategory();
  }
}
