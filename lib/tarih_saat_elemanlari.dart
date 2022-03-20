import 'package:date_format/date_format.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TarihSaatElemanlari extends StatefulWidget {
  const TarihSaatElemanlari({Key? key}) : super(key: key);

  @override
  State<TarihSaatElemanlari> createState() => _TarihSaatElemanlariState();
}

class _TarihSaatElemanlariState extends State<TarihSaatElemanlari> {
  @override
  Widget build(BuildContext context) {
    DateTime suan = DateTime.now();
    DateTime ucAyOnce = DateTime(suan.year, suan.month - 3);
    DateTime yirmiGunSonra = DateTime(suan.year, suan.month, suan.day + 20);

    TimeOfDay suAnkiSaat = TimeOfDay.now();
    TimeOfDay yirmiDkSonra =
        TimeOfDay(hour: suAnkiSaat.hour, minute: suAnkiSaat.minute + 20);
    return Scaffold(
      appBar: AppBar(
        title: Text("DateTimePicker kullanımı"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: suan,
                  firstDate: ucAyOnce,
                  lastDate: yirmiGunSonra,
                ).then(
                  (value) {
                    print(
                      value!,
                    );
                    print(
                      value.toIso8601String(),
                    );
                    print(
                      value.millisecondsSinceEpoch.toString(),
                    );
                    print(
                      value.toUtc().toIso8601String(),
                    );
                    print(
                      value
                          .add(
                            Duration(days: 20),
                          )
                          .toString(),
                    );
                    print(
                      DateTime.parse(
                        formatDate(
                          value,
                          [yyyy, "-", mm, "-", dd],
                        ),
                      ),
                    );
                  },
                ).catchError((e) {
                  print(e);
                });
              },
              child: Text('Tarih seç'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: suAnkiSaat,
                ).then((value) {
                  debugPrint(
                    value!.format(context),
                  );
                  debugPrint(
                    value.period.name.toString(),
                  );
                });
              },
              child: Text('Saat seç'),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
