import 'package:blocs/bloc_helpers/bloc_provider.dart';
import 'package:blocs/blocs/shopping/shopping_bloc.dart';
import 'package:blocs/pages/shopping_basket_page.dart';
import 'package:flutter/material.dart';

class ShoppingBasket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ShoppingBloc bloc = BlocProvider.of<ShoppingBloc>(context);

    return Container(
      width: 48.0,
      height: 48.0,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => ShoppingBasketPage(),
            ),
          );
        },
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Center(
              child: const Icon(Icons.shopping_basket),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Transform.translate(
                  offset: Offset(0.0, -5.0),
                  child: StreamBuilder<int>(
                    stream: bloc.shoppingBasketSize,
                    initialData: 0,
                    builder:
                        (BuildContext context, AsyncSnapshot<int> snapshot) {
                      return Container(
                        width: 16.0,
                        height: 16.0,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Text(
                            '${snapshot.data}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
