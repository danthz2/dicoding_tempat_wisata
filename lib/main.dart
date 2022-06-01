import 'package:dicoding_tempat_wisata/detail_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wisata Bandung",
      theme: ThemeData(),
      home: DetailScreen(),
    );
  }
}

class TextFieldExample extends StatefulWidget {
  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  final _nameC = TextEditingController();
  bool _isActive = false;
  String? lang;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameC,
              decoration: InputDecoration(
                label: Text("Your Name"),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  var name = _nameC.text.trim();
                  showDialog(
                      context: context,
                      builder: (_) {
                        return name.isEmpty
                            ? AlertDialog(content: Text("Hello Guest"))
                            : AlertDialog(content: Text("Hello $name"));
                      });
                },
                child: Text("Masuk")),
            Switch(
                value: _isActive,
                onChanged: (newVal) {
                  setState(() {
                    _isActive = newVal;
                    print(_isActive);
                  });
                }),
            Radio(
              value: "dart",
              groupValue: lang,
              onChanged: (value) {
                setState(() {
                  lang = value as String;
                });
              },
            ),
            Radio(
              value: "java",
              groupValue: lang,
              onChanged: (value) {
                setState(() {
                  lang = value as String;
                });
              },
            ),
            Radio(
              value: "swift",
              groupValue: lang,
              onChanged: (value) {
                setState(() {
                  lang = value as String;
                });
              },
            ),
            Checkbox(
                value: _isActive,
                onChanged: (value) {
                  setState(() {
                    _isActive = !_isActive;
                  });
                })
          ],
        ),
      ),
    );
  }
}
