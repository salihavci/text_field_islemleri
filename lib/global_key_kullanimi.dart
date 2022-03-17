import 'package:flutter/material.dart';
import 'package:text_field_islemleri/sayac_state.dart';

class GlobalKeyKullanimi extends StatelessWidget {
  GlobalKeyKullanimi({Key? key}) : super(key: key);
  //Harici dosyalarda private değişken olmaması gerekmektedir. Public olarak görebilir dış metodları.
  final sayacWidgetKey = GlobalKey<SayacWidgetState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global Key Kullanımı'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Buttona basılma miktarı',
            ),
            SayacWidget(
              key: sayacWidgetKey,
            ),
            Text(
              sayacWidgetKey.currentState?.sayac.toString() ?? '0',
            ), //Değer açılırken okunamadığı için eğer null ise "0" ata dedik
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sayacWidgetKey.currentState!.arttir();
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
