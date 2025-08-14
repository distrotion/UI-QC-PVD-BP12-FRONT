import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/19-01-MAXMIN.dart';
import '../model/model.dart';

import 'P19MAXMIN/MAXMINmain.dart';
import 'P19MAXMIN/MAXMINvar.dart';

class Page19 extends StatelessWidget {
  const Page19({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page19BlocTableBody();
  }
}

class Page19BlocTableBody extends StatelessWidget {
  const Page19BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => MAXMIN_Bloc(),
        child: BlocBuilder<MAXMIN_Bloc, MAXMINSCHEMA>(
          builder: (context, data) {
            return Page19Body(
              data: data,
            );
          },
        ));
  }
}

class Page19Body extends StatelessWidget {
  Page19Body({Key? key, this.data}) : super(key: key);
  MAXMINSCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return MICROVICKER_MAXMINmain(
      data: data,
    );
  }
}
