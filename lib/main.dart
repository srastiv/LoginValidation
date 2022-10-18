import 'package:asset/features/asset/presentation/screens/login/bloc/login_bloc.dart';
import 'package:asset/features/asset/presentation/screens/login/login.dart';
import 'package:asset/features/asset/presentation/screens/report/bloc/report_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(),
        ),
        BlocProvider<ReportBloc>(
          create: (BuildContext context) => ReportBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          //  textTheme: GoogleFonts.montserratTextTheme( Theme.of(context).textTheme,),
        ),
        home: BlocProvider(
          create: (context) => LoginBloc(),
          child: Login(),
        ),
      ),
    );
  }
}
