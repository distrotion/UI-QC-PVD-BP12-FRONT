import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/06-01-GASVIC001.dart';

import 'P6SPLINESIZE001/SPLINESIZE001main.dart';
import 'P6SPLINESIZE001/SPLINESIZE001var.dart';

class Page6 extends StatelessWidget {
  const Page6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page6BlocTableBody();
  }
}

class Page6BlocTableBody extends StatelessWidget {
  const Page6BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SPLINEGAUGE_Bloc(),
        child: BlocBuilder<SPLINEGAUGE_Bloc, SPLINEGAUGESCHEMA>(
          builder: (context, data) {
            return Page6Body(
              data: data,
            );
          },
        ));
  }
}

class Page6Body extends StatelessWidget {
  Page6Body({Key? key, this.data}) : super(key: key);
  SPLINEGAUGESCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MICROVICKER_SPLINEGAUGEmain(
        data: data,
      ),
    );
  }
}
