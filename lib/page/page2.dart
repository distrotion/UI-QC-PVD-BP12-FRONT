import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/02-01-APPPVD.dart';
import 'P2PVDKNG/APPPVDmain.dart';
import 'P2PVDKNG/APPPVDvar.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page2BlocTableBody();
  }
}

class Page2BlocTableBody extends StatelessWidget {
  const Page2BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => APPPVD_Bloc(),
        child: BlocBuilder<APPPVD_Bloc, APPPVDSCHEMA>(
          builder: (context, data) {
            return Page2Body(
              data: data,
            );
          },
        ));
  }
}

class Page2Body extends StatelessWidget {
  Page2Body({Key? key, this.data}) : super(key: key);
  APPPVDSCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: APPEARANCE_APPPVDmain(
        data: data,
      ),
    );
  }
}
