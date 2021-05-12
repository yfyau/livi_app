import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livi_app/bloc/global/GlobalCubit.dart';

class PhoneRecordListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalCubit globalCubit = BlocProvider.of<GlobalCubit>(context);
    List<String> phoneRecords = globalCubit.state.phoneInputs;

    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Records'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: phoneRecords.length,
        itemBuilder: (context, index) {
          return Container(
            height: 40,
            alignment: Alignment.centerLeft,
            child: Text(phoneRecords[index], style: TextStyle(fontSize: 24 )),
          );
        },
      ),
    );
  }
}
