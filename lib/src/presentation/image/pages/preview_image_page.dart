import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:photo_math_app/src/presentation/home/bloc/get_list_data_bloc.dart';
import 'package:photo_math_app/src/presentation/image/bloc/add_data_calculation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviewImagePage extends StatefulWidget {
  final File? imageFile;
  const PreviewImagePage({
    super.key,
    this.imageFile,
  });

  @override
  State<PreviewImagePage> createState() => _PreviewImagePageState();
}

String? resInput;
String? resCalculate;

class _PreviewImagePageState extends State<PreviewImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Back'),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ExtendedImage.file(
              cacheRawData: true,
              widget.imageFile!,
              height: MediaQuery.of(context).size.height * 0.6,
            ),
            const SizedBox(
              height: 30,
            ),
            Text('${resInput ?? ''} = ${resCalculate ?? ''}'),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  readTextFromImage();
                },
                child: const Text("Get Result"))
          ],
        ),
      ),
    );
  }

  double? calculateExpression(String expression) {
    Parser p = Parser();
    Expression exp = p.parse(expression);

    ContextModel cm = ContextModel();

    double? eval = exp.evaluate(EvaluationType.REAL, cm);
    if (eval == null) {
      setState(() {
        resInput == null;
        resCalculate == null;
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Input can't be calculate")));
      });
    } else {
      setState(
        () {
          resCalculate = eval.toInt().toString();
          context.read<AddDataCalculationBloc>().add(
                AddDataCalculationEvent.addData(
                  res: resCalculate ?? '',
                  input: resInput ?? '',
                  imagePath: widget.imageFile!.readAsBytesSync(),
                ),
              );
          context.read<GetListDataBloc>().add(const GetListDataEvent.getData());
        },
      );
    }

    return eval;
  }

  Future<void> readTextFromImage() async {
    final inputImage = InputImage.fromFile(widget.imageFile!);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    String text = recognizedText.text;
    setState(() {
      resInput = text;
    });
    calculateExpression(text);

    textRecognizer.close();
  }
}
