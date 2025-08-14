import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/02-01-APPPVD.dart';

import '../bloc/BlocEvent/17-01-APPGAS12 copy.dart';
import 'P17BLOCKGAUGE/BLOCKGAUGEmain.dart';
import 'P17BLOCKGAUGE/BLOCKGAUGEvar.dart';

class Page17 extends StatelessWidget {
  const Page17({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page17BlocTableBody();
  }
}

class Page17BlocTableBody extends StatelessWidget {
  const Page17BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => BLOCKGAUGE_Bloc(),
        child: BlocBuilder<BLOCKGAUGE_Bloc, BLOCKGAUGESCHEMA>(
          builder: (context, data) {
            return Page17Body(
              data: data,
            );
          },
        ));
  }
}

class Page17Body extends StatelessWidget {
  Page17Body({Key? key, this.data}) : super(key: key);
  BLOCKGAUGESCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: APPEARANCE_BLOCKGAUGEmain(
        data: data,
      ),
    );
  }
}
