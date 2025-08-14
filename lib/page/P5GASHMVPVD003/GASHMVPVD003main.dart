import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/05-01-GASHMVKNG003.dart';
import '../../bloc/BlocEvent/05-02-TrickGASHMVKNG003.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/QCWIDGET/W2MULTISHOT/MULTISHOTwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'GASHMVPVD003var.dart';

class MICROVICKER_GASHMVPVD003main extends StatelessWidget {
  MICROVICKER_GASHMVPVD003main({Key? key, this.data}) : super(key: key);
  GASHMVPVD003SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_GASHMVPVD003_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_GASHMVPVD003_BlocBuffer extends StatelessWidget {
  _TRICKER_GASHMVPVD003_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  GASHMVPVD003SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_GASHMVPVD003_Bloc(),
        child: BlocBuilder<TRICKER_GASHMVPVD003_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_GASHMVPVD003body(data: data);
          },
        ));
  }
}

class ROCKWELL_GASHMVPVD003body extends StatefulWidget {
  ROCKWELL_GASHMVPVD003body({Key? key, this.data}) : super(key: key);
  GASHMVPVD003SCHEMA? data;

  @override
  State<ROCKWELL_GASHMVPVD003body> createState() =>
      _ROCKWELL_GASHMVPVD003bodyState();
}

class _ROCKWELL_GASHMVPVD003bodyState extends State<ROCKWELL_GASHMVPVD003body> {
  @override
  void initState() {
    super.initState();
    context.read<GASHMVPVD003_Bloc>().add(GASHMVPVD003_READ());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        GASHMVPVD003var.PO = widget.data?.PO ?? '';
        GASHMVPVD003var.CP = widget.data?.CP ?? '';
        GASHMVPVD003var.QTY = widget.data?.QTY ?? '';
        GASHMVPVD003var.PROCESS = widget.data?.PROCESS ?? '';
        GASHMVPVD003var.CUSLOT = widget.data?.CUSLOT ?? '';
        GASHMVPVD003var.TPKLOT = widget.data?.TPKLOT ?? '';
        GASHMVPVD003var.FG = widget.data?.FG ?? '';
        GASHMVPVD003var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        GASHMVPVD003var.PART = widget.data?.PART ?? '';
        GASHMVPVD003var.PARTNAME = widget.data?.PARTNAME ?? '';
        GASHMVPVD003var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        GASHMVPVD003var.ItemPick = widget.data?.ItemPick ?? [''];
        GASHMVPVD003var.PCS = widget.data?.PCS ?? '';
        // GASHMVPVD003var.PCS = '10';
        GASHMVPVD003var.PCSleft = widget.data?.PCSleft ?? '';
        // GASHMVPVD003var.PCSleft = '10';
        GASHMVPVD003var.POINTs = widget.data?.POINTs ?? '';
        // GASHMVPVD003var.POINTs = '10';
        // if (GASHMVPVD003var.ItemPickSELECT != "") {
        //   //
        //   if (GASHMVPVD003var.POINTs == "") {
        //     //
        //     GASHMVPVD003var.POINTs == "0";
        //   }
        // }
        GASHMVPVD003var.UNIT = widget.data?.UNIT ?? '';
        // GASHMVPVD003var.UNIT = 'pcs/lots';
        GASHMVPVD003var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        GASHMVPVD003var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        GASHMVPVD003var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        GASHMVPVD003var.GAP = widget.data?.GAP ?? '';
        GASHMVPVD003var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        GASHMVPVD003var.preview = widget.data?.preview ?? [];
        GASHMVPVD003var.confirmdata = widget.data?.confirmdata ?? [];
        GASHMVPVD003var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        GASHMVPVD003var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        GASHMVPVD003var.PICs = widget.data?.Pic ?? '';

        if (GASHMVPVD003var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<GASHMVPVD003_Bloc>().add(GASHMVPVD003_READ());
      });
      GASHMVPVD003var.DHtimer = timer;
    }
    return MULTISHOTmain(
      //------ Left
      LABEL: "GAS-HMV-003",
      PO: GASHMVPVD003var.PO,
      CP: GASHMVPVD003var.CP,
      QTY: GASHMVPVD003var.QTY,
      PROCESS: GASHMVPVD003var.PROCESS,
      CUSLOT: GASHMVPVD003var.CUSLOT,
      TPKLOT: GASHMVPVD003var.TPKLOT,
      FG: GASHMVPVD003var.FG,
      CUSTOMER: GASHMVPVD003var.CUSTOMER,
      PART: GASHMVPVD003var.PART,
      PARTNAME: GASHMVPVD003var.PARTNAME,
      MATERIAL: GASHMVPVD003var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        GASHMVPVD003var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_GASHMVPVD003_Bloc>()
            .add(TRICKER_GASHMVPVD003geteachITEM());
      },
      ItemPick: GASHMVPVD003var.ItemPick,
      PCS: GASHMVPVD003var.PCS,
      PCSleft: GASHMVPVD003var.PCSleft,
      POINTs: GASHMVPVD003var.POINTs,
      UNIT: GASHMVPVD003var.UNIT,
      INTERSEC: GASHMVPVD003var.INTERSEC,
      RESULTFORMAT: GASHMVPVD003var.RESULTFORMAT,
      Ghtype: GASHMVPVD003var.GRAPHTYPE,
      GAP: GASHMVPVD003var.GAP,
      GAPnameList: GASHMVPVD003var.GAPnameList,
      GAPname: GASHMVPVD003var.GAPname,
      GAPnamePick: (v) {
        GASHMVPVD003var.GAPname = v;
        context
            .read<TRICKER_GASHMVPVD003_Bloc>()
            .add(TRICKER_GASHMVPVD003geteachGRAPH());
      },
      //------- Bottom
      DATA1STR: "Surface",
      DATA2STR: "Compound",
      DATA3STR: "TRIM",
      DATA1: (v) {
        context
            .read<TRICKER_GASHMVPVD003_Bloc>()
            .add(TRICKER_GASHMVPVD003confirmdata1());
      },
      DATA2: (v) {
        context
            .read<TRICKER_GASHMVPVD003_Bloc>()
            .add(TRICKER_GASHMVPVD003confirmdata2());
      },
      DATA3: (v) {
        // context
        //     .read<TRICKER_GASHMVPVD003_Bloc>()
        //     .add(TRICKER_GASHMVPVD003confirmdata());
      },
      FINISH: (v) {
        if (GASHMVPVD003var.PCS != '' &&
            GASHMVPVD003var.POINTs != '' &&
            GASHMVPVD003var.ItemPickSELECT != '') {
          if (int.parse(GASHMVPVD003var.POINTs) ==
              GASHMVPVD003var.confirmdata.length) {
            if (int.parse(GASHMVPVD003var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_GASHMVPVD003_Bloc>()
                  .add(TRICKER_GASHMVPVD003FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: GASHMVPVD003var.preview,
      confirmdata: GASHMVPVD003var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context
            .read<TRICKER_GASHMVPVD003_Bloc>()
            .add(TRICKER_GASHMVPVD003CLEAR());
      },
      BACKPAGE: (v) {
        GASHMVPVD003var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        GASHMVPVD003var.ItemPickSELECT = '';
        context
            .read<TRICKER_GASHMVPVD003_Bloc>()
            .add(TRICKER_GASHMVPVD003SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_GASHMVPVD003_Bloc>()
            .add(TRICKER_GASHMVPVD003RESETVALUE());
      },
      ITEMleftUNIT: GASHMVPVD003var.ITEMleftUNIT,
      ITEMleftVALUE: GASHMVPVD003var.ITEMleftVALUE,
      PICB64: GASHMVPVD003var.PICs,
    );
  }
}
