import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/13-01-CALO001.dart';
import '../model/model.dart';
import 'P13CALO001/CALO001main.dart';
import 'P13CALO001/CALO001var.dart';

class Page13 extends StatelessWidget {
  const Page13({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page13BlocTableBody();
  }
}

class Page13BlocTableBody extends StatelessWidget {
  const Page13BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CALO001_Bloc(),
        child: BlocBuilder<CALO001_Bloc, CALO001SCHEMA>(
          builder: (context, data) {
            return Page13Body(
              data: data,
            );
          },
        ));
  }
}

class Page13Body extends StatelessWidget {
  Page13Body({Key? key, this.data}) : super(key: key);
  CALO001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return MICROVICKER_CALO001main(
      data: data,
    );
  }
}
