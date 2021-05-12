import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livi_app/values/LiviTheme.dart';

import 'bloc/global/GlobalCubit.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider <GlobalCubit>(
        create: (context) => GlobalCubit(),
        child: BlocBuilder<GlobalCubit, GlobalState>(
            builder: (context, state) {
              return MaterialApp(
                title: 'Livi App',
                theme: LiviTheme.getData(context),
                routes: appRoutes,
              );
            }
        )
    );
  }
}
