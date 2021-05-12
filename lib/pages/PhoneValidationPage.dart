import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livi_app/bloc/global/GlobalCubit.dart';
import 'package:livi_app/routes.dart';
import 'package:livi_app/widgets/CountryCodeInput.dart';
import 'package:livi_app/values/LiviTheme.dart';

class PhoneValidationPage extends StatefulWidget {
  @override
  _PhoneValidationPageState createState() => _PhoneValidationPageState();
}

class _PhoneValidationPageState extends State<PhoneValidationPage> {
  String countryCode = '+852';
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Livi APP'),
        actions: [
          TextButton(
            onPressed: () => BlocProvider.of<GlobalCubit>(context).updateThemeMode(
              BlocProvider.of<GlobalCubit>(context).state.themeMode == LiviThemeMode.LIGHT ? LiviThemeMode.DARK : LiviThemeMode.LIGHT,
            ),
            child: Text(BlocProvider.of<GlobalCubit>(context).state.themeMode == LiviThemeMode.LIGHT ? 'Light' : 'Dark'),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 32),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 80,
                  child: CountryCodeInput(
                    initialValue: countryCode,
                    onChanged: (value) => countryCode = value,
                  ),
                ),
                SizedBox(width: 16),
                Flexible(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => phoneNumber = value,
                    onEditingComplete: () => verifyPhone(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => verifyPhone(),
            child: Text('Submit'),
          )
        ],
      ),
    );
  }

  void verifyPhone() async {
    if (countryCode.isEmpty || phoneNumber.isEmpty) {
      showErrorDialog(error: 'Both countryCode and phoneNumber are required');
      return;
    }

    BlocProvider.of<GlobalCubit>(context).addPhoneInput('$countryCode-$phoneNumber');

    String accountId = 'AC087e870bc3dc3100d876c5e49a891e05';
    String token = '0415f952a7dfacb9e7c7fd6f65e2fca8';
    String auth = '$accountId:$token@';

    Response? response;
    try {
      print('https://${auth}lookups.twilio.com/v1/PhoneNumbers/$countryCode$phoneNumber');
      response = await Dio().get('https://${auth}lookups.twilio.com/v1/PhoneNumbers/$countryCode$phoneNumber');
    } catch (e) {
      print(e.toString());
    }

    print(response.toString());

    if (response?.statusCode == 200)
      Navigator.of(context).pushNamed(PATH_PHONE_RECORD_LIST);
    else
      showErrorDialog();
  }

  void showErrorDialog({String? error}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(error ?? 'Phone verification failed'),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
