import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class TextFormFieldKullanimi extends StatefulWidget {
  const TextFormFieldKullanimi({Key? key}) : super(key: key);

  @override
  State<TextFormFieldKullanimi> createState() => _TextFormFieldKullanimiState();
}

class _TextFormFieldKullanimiState extends State<TextFormFieldKullanimi> {
  String _email = '', _password = '', _username = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Form Field Kullanımı'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  // initialValue: 'Salih AVCI',
                  decoration: InputDecoration(
                    // errorStyle: TextStyle(
                    //   color: Colors.orange.shade100,
                    // ),
                    labelText: 'Username',
                    hintText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (newValue) {
                    _username = newValue!;
                  },
                  validator: (value) {
                    if (value!.length < 4) {
                      return 'Username 4 karakterden az olamaz.';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  // initialValue: 'salih.avci@gmail.com',
                  decoration: InputDecoration(
                    // errorStyle: TextStyle(
                    //   color: Colors.orange.shade100,
                    // ),
                    labelText: 'Email',
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (newValue) {
                    _email = newValue!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'email boş olamaz';
                    } else if (!EmailValidator.validate(value)) {
                      return 'Geçerli mail giriniz';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    // errorStyle: TextStyle(
                    //   color: Colors.orange.shade100,
                    // ),
                    labelText: 'Password',
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (newValue) {
                    _password = newValue!;
                  },
                  validator: (value) {
                    if (value!.length >= 6) {
                      return null;
                    } else {
                      return 'Şifre en az 6 karakter olmalı.';
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    bool _validate = _formKey.currentState!.validate();
                    if (_validate) {
                      _formKey.currentState!.save();
                      String result =
                          'Username : $_username\nEmail : $_email\nŞifre : $_password';
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.orange.shade300,
                          content: Text(
                            result,
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      );
                      _formKey.currentState!.reset();
                    }
                  },
                  child: Text(
                    'Onayla',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
