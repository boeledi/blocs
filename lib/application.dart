import 'package:blocs/bloc_helpers/bloc_provider.dart';
import 'package:blocs/blocs/authentication/authentication_bloc.dart';
import 'package:blocs/blocs/shopping/shopping_bloc.dart';
import 'package:blocs/pages/decision_page.dart';
import 'package:blocs/pages/initialization_page.dart';
import 'package:blocs/pages/registration_page.dart';
import 'package:blocs/pages/shopping_basket_page.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: AuthenticationBloc(),
      child: BlocProvider<ShoppingBloc>(
        bloc: ShoppingBloc(),
        child: MaterialApp(
          title: 'BLoC Samples',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/decision': (BuildContext context) => DecisionPage(),
            '/register': (BuildContext context) => RegistrationPage(),
            '/shoppingBasket': (BuildContext context) => ShoppingBasketPage(),
          },
          home: InitializationPage(),
        ),
      ),
    );
  }
}
