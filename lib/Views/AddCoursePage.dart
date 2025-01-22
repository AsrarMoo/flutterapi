import 'package:flutter/material.dart';
import 'package:flutter_tutorial/Config/constants.dart';
import 'package:get/get.dart';
import 'package:flutter_tutorial/Controllers/HomeController.dart';

class AddCoursePage extends StatelessWidget {
  final HomeController controller = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController overviewController = TextEditingController();
  final TextEditingController photoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Course"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: overviewController,
              decoration: InputDecoration(labelText: "Overview"),
            ),
            TextField(
              controller: photoController,
              decoration: InputDecoration(labelText: "Photo URL"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text;
                final overview = overviewController.text;
                final photo = photoController.text;

                if (title.isNotEmpty && overview.isNotEmpty && photo.isNotEmpty) {
                  controller.addSubject(title, overview, photo); // Call the addSubject method
                  Get.back(result: true); // Go back to the home page after adding
                } else {
                  Get.snackbar("Error", "Please fill all fields", snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: Text("Add Course"),
            ),
          ],
        ),
      ),
    );
  }
}
