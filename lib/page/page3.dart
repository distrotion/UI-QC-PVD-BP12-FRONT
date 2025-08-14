import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/03-01-GASHMVKNG001.dart';
import 'P3GASHMVPVD001/GASHMVPVD001main.dart';
import 'P3GASHMVPVD001/GASHMVPVD001var.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page3BlocTableBody();
  }
}

class Page3BlocTableBody extends StatelessWidget {
  const Page3BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GASHMVPVD001_Bloc(),
        child: BlocBuilder<GASHMVPVD001_Bloc, GASHMVPVD001SCHEMA>(
          builder: (context, data) {
            return Page3Body(
              data: data,
            );
          },
        ));
  }
}

class Page3Body extends StatelessWidget {
  Page3Body({Key? key, this.data}) : super(key: key);
  GASHMVPVD001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MICROVICKER_GASHMVPVD001main(
        data: data,
      ),
    );
  }
}
