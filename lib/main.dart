
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Gallery Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GalleryPickerPage(),
    );
  }
}

class GalleryPickerPage extends StatefulWidget {
  @override
  _GalleryPickerPageState createState() => _GalleryPickerPageState();
}

class _GalleryPickerPageState extends State<GalleryPickerPage> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Gambar dari Galeri'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pilih Foto'),
            ),
            SizedBox(height: 20),
            _image != null
                ? Image.file(
                    _image!,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  )
                : Text('Belum ada gambar dipilih'),
          ],
        ),
      ),
    );
  }
}
