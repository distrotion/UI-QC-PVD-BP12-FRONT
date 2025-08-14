import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/04-01-GASHMVKNG002.dart';
import 'P4GASHMVPVD002/GASHMVPVD002main.dart';
import 'P4GASHMVPVD002/GASHMVPVD002var.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page4BlocTableBody();
  }
}

class Page4BlocTableBody extends StatelessWidget {
  const Page4BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GASHMVPVD002_Bloc(),
        child: BlocBuilder<GASHMVPVD002_Bloc, GASHMVPVD002SCHEMA>(
          builder: (context, data) {
            return Page4Body(
              data: data,
            );
          },
        ));
  }
}

class Page4Body extends StatelessWidget {
  Page4Body({Key? key, this.data}) : super(key: key);
  GASHMVPVD002SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MICROVICKER_GASHMVPVD002main(
        data: data,
      ),
    );
  }
}
