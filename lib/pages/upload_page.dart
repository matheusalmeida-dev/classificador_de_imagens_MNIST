import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cross_file/cross_file.dart';
import '../utils/constants.dart';
import "../model/classifier.dart";

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  final _picker = ImagePicker();
  String digit = "";
  XFile? image;
  Classifier classifier = Classifier();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                backgroundColor: Colors.teal,
                child: Icon(Icons.camera),
                onPressed: () async {
                  image = await _picker.pickImage(
                    source: ImageSource.camera,
                    maxHeight: 300,
                    maxWidth: 300,
                    imageQuality: 100,
                  );
                  try {
                    digit = await classifier.classifyImage(image);
                  } catch (e) {
                    print(e.toString());
                  }
                  setState(() {

                  });
                }
            ),
            SizedBox(height: 10,),
            FloatingActionButton(
                backgroundColor: Colors.teal,
                child: Icon(Icons.image),
                onPressed: () async {
                  image = await _picker.pickImage(
                    source: ImageSource.gallery,
                    maxHeight: 300,
                    maxWidth: 300,
                    imageQuality: 100,
                  );
                  try {
                    digit = await classifier.classifyImage(image);
                  } catch (e) {
                    print(e.toString());
                  }
                  setState(() {

                  });
                }
            ),
          ]
          ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Classificador de imagens"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Visualização da imagem",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: canvasSize + borderSize*2,
                width: canvasSize + borderSize*2,
                // color: Colors.white60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black54,
                    width: 2.0,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: digit == "" ? AssetImage('assets/unsplash.jpg') as ImageProvider :  FileImage(File(image!.path))
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Predição atual:",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              digit == "" ? "" : "$digit",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
