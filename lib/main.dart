import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:public_apis_org/application_layer/home/home.dart';
import 'package:public_apis_org/di/get_it.dart';
import 'package:public_apis_org/simple_observer.dart';
import 'application_layer/home/cubit/fetch_public_apis_cubit.dart';
import 'di/get_it.dart' as get_it;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(get_it.init());
  BlocOverrides.runZoned(
      () => runApp(
            const MyApp(),
          ),
      blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: const TextTheme(
              bodyText1: TextStyle(
            color: Colors.white,
          )),
          scaffoldBackgroundColor: const Color(0xff2C3055),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          )),
      home: BlocProvider(
        create: (context) => FetchPublicApisCubit(getItInstance()),
        child: const HomeScreen(),
      ),
    );
  }
}
