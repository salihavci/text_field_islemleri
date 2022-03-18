import 'package:flutter/material.dart';

class DigerFormElemanlari extends StatefulWidget {
  const DigerFormElemanlari({Key? key}) : super(key: key);

  @override
  State<DigerFormElemanlari> createState() => _DigerFormElemanlariState();
}

class _DigerFormElemanlariState extends State<DigerFormElemanlari> {
  bool _checkBoxState = false;
  String _sehir = "";
  bool _switchState = false;
  double _sliderDeger = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diğer form elemanları'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            CheckboxListTile(
              value: _checkBoxState,
              onChanged: (value) {
                setState(() {
                  _checkBoxState = value!;
                });
              },
              activeColor: Colors.red,
              title: Text('Checkbox Title'),
              subtitle: Text('Checkbox Subtitle'),
              secondary: Icon(Icons.add),
              selected: true,
            ),
            RadioListTile<String>(
              value: 'Ankara',
              groupValue: _sehir,
              onChanged: (value) {
                setState(() {
                  _sehir = value!;
                  print(value);
                });
              },
              title: Text('Ankara'),
              subtitle: Text('Switch subtitle'),
              secondary: Icon(Icons.map),
            ),
            RadioListTile<String>(
              value: 'Bursa',
              groupValue: _sehir,
              onChanged: (value) {
                setState(() {
                  _sehir = value!;
                  print(value);
                });
              },
              title: Text('Bursa'),
              subtitle: Text('Switch subtitle'),
              secondary: Icon(Icons.map),
            ),
            RadioListTile<String>(
              value: 'İzmir',
              groupValue: _sehir,
              onChanged: (value) {
                setState(() {
                  _sehir = value!;
                  print(value);
                });
              },
              title: Text('İzmir'),
              subtitle: Text('Switch subtitle'),
              secondary: Icon(Icons.map),
            ),
            SwitchListTile(
              value: _switchState,
              onChanged: (value) {
                setState(() {
                  _switchState = value;
                  print('Switch durumu : $value');
                });
              },
              title: Text('Switch Title'),
              subtitle: Text('Switch subtitle'),
              secondary: Icon(Icons.refresh),
            ),
            Text('Değeri sliderdan seçiniz : '),
            Slider(
              value: _sliderDeger,
              onChanged: (value) {
                setState(
                  () {
                    _sliderDeger = value;
                    print('Yeni değer : $value');
                  },
                );
              },
              min: 0,
              max: 100,
              divisions: 100,
              label: _sliderDeger.toString(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add_circle,
        ),
      ),
    );
  }
}
