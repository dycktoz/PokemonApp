import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/bloc/detail_card/detail_card_bloc.dart';
import 'package:poke_app/ui/layouts/auth/login_page.dart';
import 'package:poke_app/ui/layouts/auth/register_page.dart';
import 'package:poke_app/ui/layouts/dashboard/details_card_page.dart';
import 'package:poke_app/ui/layouts/dashboard/home_page.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<DetailCardBloc>(create: (_) => DetailCardBloc()),
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon App',
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginPage(),
        'register': (_) => RegisterPage(),
        'home': (_) => HomePage(),
        'detailsCard': (_) => DetailsCardPage(),
      },
    );
  }
}
