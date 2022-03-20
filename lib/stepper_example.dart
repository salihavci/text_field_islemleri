import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class StepperOrnegi extends StatefulWidget {
  const StepperOrnegi({Key? key}) : super(key: key);

  @override
  State<StepperOrnegi> createState() => _StepperOrnegiState();
}

class _StepperOrnegiState extends State<StepperOrnegi> {
  int _currentStep = 0;
  String isim = "", mail = "", sifre = "";
  late List<Step> tumStepler = [];
  bool hata = false;
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tumStepler = _tumStepler();

    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper örneği'),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: details.onStepContinue,
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  child: Text('Devam'),
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: details.onStepCancel,
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: Text('Geri Gel'),
                ),
              ],
            );
          },
          steps: tumStepler,
          currentStep: _currentStep,
          // onStepTapped: (value) {
          //   setState(() {
          //     _currentStep = value;
          //   });
          // },
          onStepContinue: () {
            if (_currentStep < tumStepler.length - 1) {
              setState(() {
                _ileriButonuKontrolu();
                // print(hata);
              });
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(
                () {
                  _currentStep--;
                  // print(hata);
                },
              );
            } else {
              setState(
                () {
                  _currentStep = 0;
                  print(hata);
                },
              );
            }
          },
        ),
      ),
    );
  }

  List<Step> _tumStepler() {
    List<Step> stepler = [
      Step(
        title: Text('Username Giriniz :'),
        subtitle: Text('Username alt başlık.'),
        state: _stateleriAyarla(0),
        isActive: true,
        content: TextFormField(
          key: key0,
          decoration: InputDecoration(
            labelText: "Username Label",
            hintText: "Username Hint",
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.length < 6) {
              // hata = true;
              return "En az 6 karakter giriniz.";
            }
          },
          onSaved: (newValue) {
            setState(() {
              isim = newValue!;
            });
          },
        ),
      ),
      Step(
        title: Text('Email Giriniz :'),
        subtitle: Text('Email alt başlık.'),
        state: _stateleriAyarla(1),
        isActive: true,
        content: TextFormField(
          key: key1,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Email Label",
            hintText: "Email Hint",
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.length < 6 ||
                !EmailValidator.validate(value.toString())) {
              // hata = true;
              return "Geçerli bir email giriniz.";
            }
          },
          onSaved: (newValue) {
            setState(() {
              mail = newValue!;
            });
          },
        ),
      ),
      Step(
        title: Text('Şifre Giriniz :'),
        subtitle: Text('Şifre alt başlık.'),
        state: _stateleriAyarla(2),
        isActive: true,
        content: TextFormField(
          key: key2,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            labelText: "Şifre Label",
            hintText: "Şifre Hint",
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.length < 6) {
              // hata = true;
              return "En az 6 karakter giriniz.";
            }
          },
          onSaved: (newValue) {
            setState(() {
              sifre = newValue!;
            });
          },
        ),
      ),
    ];
    return stepler;
  }

  StepState _stateleriAyarla(int i) {
    // print(i);
    // print(_currentStep);
    if (_currentStep == i) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    }
    return StepState.complete;
  }

  void _ileriButonuKontrolu() {
    switch (_currentStep) {
      case 0:
        if (key0.currentState!.validate()) {
          key0.currentState!.save();
          hata = false;
          _currentStep = 1;
        } else {
          hata = true;
        }
        break;

      case 1:
        if (key1.currentState!.validate()) {
          key1.currentState!.save();
          hata = false;
          _currentStep = 2;
        } else {
          hata = true;
        }
        break;

      case 2:
        if (key2.currentState!.validate()) {
          key2.currentState!.save();
          hata = false;
          formTamamlandi();
          _currentStep++;
        } else {
          hata = true;
        }
        break;
    }
  }

  void formTamamlandi() {
    String result =
        "Girilen değerler: isim=> $isim, mail=> $mail, şifre=> $sifre";
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
  }
}
