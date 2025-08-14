import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/Cubit/32-Reportset.dart';

import '../page303.dart';
import '../page31.dart';

import '../page50.dart';
import 'P30SELECTReportvar.dart';

late BuildContext SELECTReportcontext;

class SELECTReport extends StatefulWidget {
  SELECTReport({
    Key? key,
    this.dataCommon,
  }) : super(key: key);
  CommonReportSet? dataCommon;
  @override
  State<SELECTReport> createState() => _SELECTReportState();
}

class _SELECTReportState extends State<SELECTReport> {
  @override
  void initState() {
    SELECTReportvar.TPKLOTEDIT = '';
    if (SELECTReportvar.PO != '') {
      SELECTReportvar.canf = false;
      context.read<Reportset_Cubit>().ReportsetCubit(SELECTReportvar.PO, "");
    }
    super.initState();
  }

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SELECTReportcontext = context;
    CommonReportSet _dataCommon = widget.dataCommon ??
        CommonReportSet(
          databasic: BasicCommonDATAset(),
        );
    //--------------------------------------

    //GAS12-2GP
    //GAS12-2GP-ABC
    //GAS12-3PIC
    //GAS12-3PIC-ABC
    //GAS12-3PIC-C

    //GAS12-STD
    //GAS12-STD_NoIC
    //GAS12-STD-C
    //GAS12-STD-C-NOPIC
    //GAS12-STD-N
    //GAS12-STD-N-NOPIC
    //GAS12-STD-NOPIC

    //GAS12-WM
    //GAS12-WM3

    // print(">>>>>>>>>>>>>>>>>-----+");
    // print(_dataCommon.databasic.reportset);
    // print(">>>>>>>>>>>>>>>>>-----+");ASI1-NOPIC

    // if (_dataCommon.databasic.reportset != '') {
    //   if (_dataCommon.databasic.reportset == 'COMMON1') {
    //     return Page50();
    //   } else {
    //     return Page31();
    //   }
    // } else {
    //   return SizedBox(
    //     height: 75,
    //     child: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       children: const [
    //         SizedBox(width: 30),
    //         CircularProgressIndicator(),
    //         SizedBox(width: 20),
    //         Text("Loading"),
    //       ],
    //     ),
    //   );
    // }
    return Page31();
  }
}
