import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/14-01-PVDSCT001.dart';
import 'P14PVDSCT001/PVDSCT001main.dart';
import 'P14PVDSCT001/PVDSCT001var.dart';

class Page14 extends StatelessWidget {
  const Page14({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page14BlocTableBody();
  }
}

class Page14BlocTableBody extends StatelessWidget {
  const Page14BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PVDSCT001_Bloc(),
        child: BlocBuilder<PVDSCT001_Bloc, PVDSCT001SCHEMA>(
          builder: (context, data) {
            return Page14Body(
              data: data,
            );
          },
        ));
  }
}

class Page14Body extends StatelessWidget {
  Page14Body({Key? key, this.data}) : super(key: key);
  PVDSCT001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MICROVICKER_PVDSCT001main(
        data: data,
      ),
    );
  }
}
