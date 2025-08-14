import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/05-01-GASHMVKNG003.dart';
import 'P5GASHMVPVD003/GASHMVPVD003main.dart';
import 'P5GASHMVPVD003/GASHMVPVD003var.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page5BlocTableBody();
  }
}

class Page5BlocTableBody extends StatelessWidget {
  const Page5BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GASHMVPVD003_Bloc(),
        child: BlocBuilder<GASHMVPVD003_Bloc, GASHMVPVD003SCHEMA>(
          builder: (context, data) {
            return Page5Body(
              data: data,
            );
          },
        ));
  }
}

class Page5Body extends StatelessWidget {
  Page5Body({Key? key, this.data}) : super(key: key);
  GASHMVPVD003SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MICROVICKER_GASHMVPVD003main(
        data: data,
      ),
    );
  }
}
