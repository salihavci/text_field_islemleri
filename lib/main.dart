import 'package:flutter/material.dart';
import 'package:text_field_islemleri/diger_form_elemanlari.dart';
import 'package:text_field_islemleri/global_key_kullanimi.dart';
import 'package:text_field_islemleri/stepper_example.dart';
import 'package:text_field_islemleri/tarih_saat_elemanlari.dart';
import 'package:text_field_islemleri/text_form_field_kullanimi.dart';

void main() {
  runApp(const MyApp());
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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StepperOrnegi(),
    );
  }
}

class TextFieldIslemleri extends StatefulWidget {
  final String title;
  const TextFieldIslemleri({required this.title, Key? key}) : super(key: key);

  @override
  State<TextFieldIslemleri> createState() => _TextFieldIslemleriState();
}

class _TextFieldIslemleriState extends State<TextFieldIslemleri> {
  late TextEditingController _emailController;
  late FocusNode _focusNode;
  int maxLineCount = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController(text: 'deneme@test.com');
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          maxLineCount = 3;
        } else {
          maxLineCount = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
                focusNode: _focusNode,
                controller: _emailController,
                keyboardType: TextInputType.number,
                textInputAction:
                    TextInputAction.next, //Enter tuşunun ikonu değişiyor.
                autofocus: true,
                maxLines: maxLineCount,
                maxLength: 20,
                onChanged: (String deger) {
                  if (deger.length > 3) {
                    print(deger);
                    setState(() {
                      _emailController.value = TextEditingValue(
                        text: deger,
                        selection:
                            TextSelection.collapsed(offset: deger.length),
                      );
                    });
                  }
                },
                cursorColor: Colors.pink,
                decoration: InputDecoration(
                  labelText: 'Label Text.',
                  hintText: 'E-mail giriniz',
                  // icon: Icon(Icons.add),
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.access_alarm_outlined),
                  filled: true,
                  fillColor: Colors.orange.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                ),
                onSubmitted: (String deger) {
                  print("Onaylanan değer: $deger");
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_emailController.text),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction:
                  TextInputAction.next, //Enter tuşunun ikonu değişiyor.
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _emailController.text = 'salih@gmail.com';
          });
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
