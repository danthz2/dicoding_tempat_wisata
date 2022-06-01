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
      home: TextFieldExample(),
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

class DetailScreen extends StatefulWidget {
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String option = "Op1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Farm House Lembang",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.calendar_today),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Open Everyday")
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.access_time),
                    SizedBox(
                      height: 10,
                    ),
                    Text("09.00 - 20.00")
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.monetization_on),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Rp 25.000")
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                "Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.",
                textAlign: TextAlign.center,
              ),
            ),
            DropdownButton(
              value: option,
              items: [
                DropdownMenuItem(
                  value: "Op1",
                  child: Text("Option1"),
                ),
                DropdownMenuItem(
                  value: "Op2",
                  child: Text("Option2"),
                ),
                DropdownMenuItem(
                  value: "Op3",
                  child: Text("Option3"),
                ),
              ],
              onChanged: (String? value) {
                setState(() {
                  option = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
