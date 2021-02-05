import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_with_ar/modals/avatar.dart';
import 'package:learn_with_ar/views/widgets/nav_bar.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  Avatar currentAvatar = Avatar();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  List<String> categories = [
    "Biology",
    'History',
    'Astronomy',
    'Chemistry',
    'Mechanics',
    'Heritage',
  ];
  File imageFile, modelFile;
  String fileType = 'image';
  String imageName;
  String modelName;
  String modelType;
  Future filePicker(BuildContext context) async {
    try {
      if (fileType == 'image') {
        imageFile = await FilePicker.getFile(type: FileType.IMAGE);
        setState(() {
          imageName = p.basename(imageFile.path);
        });
        print(imageName);
        //  _uploadFile(imageFile, imageName);
      }

      if (fileType == 'others') {
        modelFile =
            await FilePicker.getFile(type: FileType.ANY, fileExtension: 'glb');
        modelName = p.basename(modelFile.path);
        setState(() {
          modelName = p.basename(modelFile.path);
        });
        print(modelName);
        //    _uploadFile(modelFile, modelName);
      }
    } on PlatformException catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sorry...'),
              content: Text('Unsupported exception: $e'),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  Future<void> _uploadFile(File file, String filename) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference storageReference = storage.ref();
    Reference imageRef, modelRef;
    UploadTask uploadTask;

    if (fileType == 'image') {
      imageRef = storageReference.child("images/$filename");
      try {
        uploadTask = imageRef.putFile(file).whenComplete(() {
          print('File Uploaded');
        });
      } catch (e) {
        print('==============> Error');
        print(e.toString());
      }
    }
    if (fileType == 'others') {
      modelRef = storageReference.child("others/$filename");
    }

    // final TaskSnapshot downloadUrl = (uploadTask.snapshot);
    //  final String url = (downloadUrl.ref.toString());
    // print("URL is $url");
    // print('here');
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Screen'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _key,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        return value.isEmpty ? "Cannot be Empty" : null;
                      },
                      onChanged: (value) {
                        setState(() {
                          currentAvatar.name = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Model Name',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FormField(
                      validator: (value) {
                        return null;
                      },
                      builder: (FormFieldState _) {
                        return DropdownButtonFormField(
                          items: categories.map((String category) {
                            return new DropdownMenuItem(
                                value: category,
                                child: Row(
                                  children: <Widget>[
                                    Text(category),
                                  ],
                                ));
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() => currentAvatar.type = newValue);
                          },
                          value: currentAvatar.type,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Category',
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        return value.isEmpty ? "Cannot be Empty" : null;
                      },
                      onChanged: (value) {
                        setState(() {
                          currentAvatar.description = value;
                        });
                      },
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      maxLength: 500,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Model Description',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FormField(validator: (value) {
                      return imageName == null ? 'Pick Image' : null;
                    }, builder: (FormFieldState _) {
                      return Container(
                        width: w * 0.8,
                        child: Row(
                          children: [
                            SizedBox(
                              child: Text(imageName == null
                                  ? 'Upload Image'
                                  : imageName),
                              width: w * 0.6,
                            ),
                            IconButton(
                              icon: Icon(Icons.filter),
                              onPressed: () {
                                fileType = 'image';
                                filePicker(context);
                              },
                            ),
                          ],
                        ),
                      );
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    FormField(validator: (value) {
                      return modelName == null ? 'Pick Model' : null;
                    }, builder: (FormFieldState _) {
                      return Container(
                        width: w * 0.8,
                        child: Row(
                          children: [
                            SizedBox(
                              child: Text(modelName == null
                                  ? 'Upload Model'
                                  : modelName),
                              width: w * 0.6,
                            ),
                            IconButton(
                              icon: Icon(Icons.filter),
                              onPressed: () {
                                fileType = 'others';
                                filePicker(context);
                              },
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print('pressed');
                  if (_key.currentState.validate()) {
                    print('validated');
                    final Reference imageRef =
                        FirebaseStorage.instance.ref().child(imageName);
                    final Reference modelRef =
                        FirebaseStorage.instance.ref().child(modelName);
                    final imageUp =
                        imageRef.putFile(imageFile).whenComplete(() {
                      print('done');
                    });
                    final modelUp =
                        modelRef.putFile(modelFile).whenComplete(() {
                      print('ok');
                    });
                  }
                },
                child: Text(
                  'Upload',
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: nav(1),
    );
  }
}
