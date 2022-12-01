import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Image Picker Testes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  galleryImages() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      setState((){
        _image = File(image.path);
      });

    }
  }


  cameraImages() async {

    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if(image != null){
      setState((){
        _image = File(image.path);
      });

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image != null
                ? Image.file(_image!)
                : const Icon(
                    Icons.image,
                    size: 150,
                  ),
            ElevatedButton(
              onPressed: () {
                galleryImages();
              },
              onLongPress: () {
                cameraImages();
              },
              child: const Text('Galeria / Camera'),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
