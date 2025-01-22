import 'package:flutter_tutorial/APIServices/DioClient.dart';
import 'package:flutter_tutorial/Config/constants.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../Models/SubjectModels.dart';

class HomeController extends GetxController {
  var subjects = <SubjectModel>[].obs; // Observable list of subjects
  var isLoading = true.obs; // Loading state

  final DioClient _dio = DioClient(); // Dio client for API calls

  @override
  void onInit() {
    super.onInit();
    fetchSubjects();
  }

  // Fetch subjects from API
  Future<void> fetchSubjects() async {
    try {
      isLoading(true);
      final response = await _dio.dio.get(baseAPIURLV1 + subjectsAPI); // Fetch subjects

      if (response.statusCode == 200) {
        subjects.value = (response.data as List)
            .map((json) => SubjectModel.fromJson(json))
            .toList();
      } else {
        Get.snackbar("Error", "Failed to fetch subjects", snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e", snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }

  // Add a new course
  Future<void> addSubject(String title, String overview, String photo) async {
    try {
      isLoading(true);
      final response = await _dio.dio.post(
        baseAPIURLV1 + createCourseAPI,
        data: {
          'title': title,
          'overview': overview,
          'photo': photo,
        },
      );

      print(response.data); // Print the response to check the data

      if (response.statusCode == 201) {
        Get.snackbar("Success", "Course added successfully", snackPosition: SnackPosition.BOTTOM);
        fetchSubjects(); // Refresh the list of subjects after adding a new course
      } else {
        Get.snackbar("Error", "Failed to add course", snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print('Error adding course: $e');
      Get.snackbar("Error", "An error occurred: $e", snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}
