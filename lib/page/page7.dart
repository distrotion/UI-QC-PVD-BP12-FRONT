import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/07-01-PVDMCS001.dart';
import '../bloc/Cubit/Rebuild.dart';
import '../model/model.dart';
import 'P7KNGMCS001/PVDMCS001main.dart';
import 'P7KNGMCS001/PVDMCS001var.dart';

class Page7 extends StatelessWidget {
  const Page7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page7BlocTableBody();
  }
}

class Page7BlocTableBody extends StatelessWidget {
  const Page7BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PVDMCS001_Bloc(),
        child: BlocBuilder<PVDMCS001_Bloc, PVDMCS001SCHEMA>(
          builder: (context, data) {
            return Page7Body(
              data: data,
            );
          },
        ));
  }
}

class Page7Body extends StatelessWidget {
  Page7Body({Key? key, this.data}) : super(key: key);

  PVDMCS001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MICROSCOPE_PVDMCS001main(
        data: data,
      ),
    );
  }
}
