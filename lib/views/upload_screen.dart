import 'package:flutter/material.dart';
import 'package:learn_with_ar/modals/avatar.dart';
import 'package:learn_with_ar/views/widgets/nav_bar.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  Avatar currentAvatar = Avatar();
  GlobalKey _key = GlobalKey();
  List<String> categories = [
    "Biology",
    'History',
    'Astronomy',
    'Chemistry',
    'Mechanics',
    'Heritage',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Screen'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: _key,
          child: SingleChildScrollView(
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
                DropdownButtonFormField(
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: nav(1),
    );
  }
}
