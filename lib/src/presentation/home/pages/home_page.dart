import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_math_app/src/presentation/image/pages/preview_image_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? image;
  final picker = ImagePicker();
  Future getImageFromGallery(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(
        () {
          image = File(pickedFile.path);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PreviewImagePage(imageFile: File(pickedFile.path)),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50.0,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      getImageFromGallery(ImageSource.camera);
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      size: 50,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      getImageFromGallery(ImageSource.gallery);
                    },
                    icon: const Icon(
                      Icons.photo_sharp,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        tooltip: 'Select Image',
        child: const Text(
          'Add Input',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Column(),
    );
  }
}
