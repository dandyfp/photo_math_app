import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_math_app/src/presentation/home/bloc/get_list_data_bloc.dart';
import 'package:photo_math_app/src/presentation/image/pages/preview_image_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<GetListDataBloc>().add(const GetListDataEvent.getData());
  }

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
      body: BlocBuilder<GetListDataBloc, GetListDataState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (message) => Center(child: Text(message)),
            initial: () => const Center(
              child: Text('Data not found'),
            ),
            loaded: (data) => data.isEmpty
                ? const Center(
                    child: Text('Data not found'),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        var item = data[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 24.0,
                            right: 24,
                            bottom: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.input ?? ''),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(item.result ?? ''),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}
