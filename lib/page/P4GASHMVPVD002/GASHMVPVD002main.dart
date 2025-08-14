import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/04-01-GASHMVKNG002.dart';
import '../../bloc/BlocEvent/04-02-TrickGASHMVKNG002.dart';
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
import 'GASHMVPVD002var.dart';

class MICROVICKER_GASHMVPVD002main extends StatelessWidget {
  MICROVICKER_GASHMVPVD002main({Key? key, this.data}) : super(key: key);
  GASHMVPVD002SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_GASHMVPVD002_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_GASHMVPVD002_BlocBuffer extends StatelessWidget {
  _TRICKER_GASHMVPVD002_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  GASHMVPVD002SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_GASHMVPVD002_Bloc(),
        child: BlocBuilder<TRICKER_GASHMVPVD002_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_GASHMVPVD002body(data: data);
          },
        ));
  }
}

class ROCKWELL_GASHMVPVD002body extends StatefulWidget {
  ROCKWELL_GASHMVPVD002body({Key? key, this.data}) : super(key: key);
  GASHMVPVD002SCHEMA? data;

  @override
  State<ROCKWELL_GASHMVPVD002body> createState() =>
      _ROCKWELL_GASHMVPVD002bodyState();
}

class _ROCKWELL_GASHMVPVD002bodyState extends State<ROCKWELL_GASHMVPVD002body> {
  @override
  void initState() {
    super.initState();
    context.read<GASHMVPVD002_Bloc>().add(GASHMVPVD002_READ());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        GASHMVPVD002var.PO = widget.data?.PO ?? '';
        GASHMVPVD002var.CP = widget.data?.CP ?? '';
        GASHMVPVD002var.QTY = widget.data?.QTY ?? '';
        GASHMVPVD002var.PROCESS = widget.data?.PROCESS ?? '';
        GASHMVPVD002var.CUSLOT = widget.data?.CUSLOT ?? '';
        GASHMVPVD002var.TPKLOT = widget.data?.TPKLOT ?? '';
        GASHMVPVD002var.FG = widget.data?.FG ?? '';
        GASHMVPVD002var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        GASHMVPVD002var.PART = widget.data?.PART ?? '';
        GASHMVPVD002var.PARTNAME = widget.data?.PARTNAME ?? '';
        GASHMVPVD002var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        GASHMVPVD002var.ItemPick = widget.data?.ItemPick ?? [''];
        GASHMVPVD002var.PCS = widget.data?.PCS ?? '';
        // GASHMVPVD002var.PCS = '10';
        GASHMVPVD002var.PCSleft = widget.data?.PCSleft ?? '';
        // GASHMVPVD002var.PCSleft = '10';
        GASHMVPVD002var.POINTs = widget.data?.POINTs ?? '';
        // GASHMVPVD002var.POINTs = '10';
        // if (GASHMVPVD002var.ItemPickSELECT != "") {
        //   //
        //   if (GASHMVPVD002var.POINTs == "") {
        //     //
        //     GASHMVPVD002var.POINTs == "0";
        //   }
        // }
        GASHMVPVD002var.UNIT = widget.data?.UNIT ?? '';
        // GASHMVPVD002var.UNIT = 'pcs/lots';
        GASHMVPVD002var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        GASHMVPVD002var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        GASHMVPVD002var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        GASHMVPVD002var.GAP = widget.data?.GAP ?? '';
        GASHMVPVD002var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        GASHMVPVD002var.preview = widget.data?.preview ?? [];
        GASHMVPVD002var.confirmdata = widget.data?.confirmdata ?? [];
        GASHMVPVD002var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        GASHMVPVD002var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        GASHMVPVD002var.PICs = widget.data?.Pic ?? '';

        if (GASHMVPVD002var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<GASHMVPVD002_Bloc>().add(GASHMVPVD002_READ());
      });
      GASHMVPVD002var.DHtimer = timer;
    }
    return MULTISHOTmain(
      //------ Left
      LABEL: "GAS-HMV-002",
      PO: GASHMVPVD002var.PO,
      CP: GASHMVPVD002var.CP,
      QTY: GASHMVPVD002var.QTY,
      PROCESS: GASHMVPVD002var.PROCESS,
      CUSLOT: GASHMVPVD002var.CUSLOT,
      TPKLOT: GASHMVPVD002var.TPKLOT,
      FG: GASHMVPVD002var.FG,
      CUSTOMER: GASHMVPVD002var.CUSTOMER,
      PART: GASHMVPVD002var.PART,
      PARTNAME: GASHMVPVD002var.PARTNAME,
      MATERIAL: GASHMVPVD002var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        GASHMVPVD002var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_GASHMVPVD002_Bloc>()
            .add(TRICKER_GASHMVPVD002geteachITEM());
      },
      ItemPick: GASHMVPVD002var.ItemPick,
      PCS: GASHMVPVD002var.PCS,
      PCSleft: GASHMVPVD002var.PCSleft,
      POINTs: GASHMVPVD002var.POINTs,
      UNIT: GASHMVPVD002var.UNIT,
      INTERSEC: GASHMVPVD002var.INTERSEC,
      RESULTFORMAT: GASHMVPVD002var.RESULTFORMAT,
      Ghtype: GASHMVPVD002var.GRAPHTYPE,
      GAP: GASHMVPVD002var.GAP,
      GAPnameList: GASHMVPVD002var.GAPnameList,
      GAPname: GASHMVPVD002var.GAPname,
      GAPnamePick: (v) {
        GASHMVPVD002var.GAPname = v;
        context
            .read<TRICKER_GASHMVPVD002_Bloc>()
            .add(TRICKER_GASHMVPVD002geteachGRAPH());
      },
      //------- Bottom
      DATA1STR: "Surface",
      DATA2STR: "Compound",
      DATA3STR: "TRIM",
      DATA1: (v) {
        context
            .read<TRICKER_GASHMVPVD002_Bloc>()
            .add(TRICKER_GASHMVPVD002confirmdata1());
      },
      DATA2: (v) {
        context
            .read<TRICKER_GASHMVPVD002_Bloc>()
            .add(TRICKER_GASHMVPVD002confirmdata2());
      },
      DATA3: (v) {
        context
            .read<TRICKER_GASHMVPVD002_Bloc>()
            .add(TRICKER_GASHMVPVD002confirmdata());
      },
      FINISH: (v) {
        if (GASHMVPVD002var.PCS != '' &&
            GASHMVPVD002var.POINTs != '' &&
            GASHMVPVD002var.ItemPickSELECT != '') {
          if (int.parse(GASHMVPVD002var.POINTs) ==
              GASHMVPVD002var.confirmdata.length) {
            if (int.parse(GASHMVPVD002var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_GASHMVPVD002_Bloc>()
                  .add(TRICKER_GASHMVPVD002FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: GASHMVPVD002var.preview,
      confirmdata: GASHMVPVD002var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context
            .read<TRICKER_GASHMVPVD002_Bloc>()
            .add(TRICKER_GASHMVPVD002CLEAR());
      },
      BACKPAGE: (v) {
        GASHMVPVD002var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        GASHMVPVD002var.ItemPickSELECT = '';
        context
            .read<TRICKER_GASHMVPVD002_Bloc>()
            .add(TRICKER_GASHMVPVD002SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_GASHMVPVD002_Bloc>()
            .add(TRICKER_GASHMVPVD002RESETVALUE());
      },
      ITEMleftUNIT: GASHMVPVD002var.ITEMleftUNIT,
      ITEMleftVALUE: GASHMVPVD002var.ITEMleftVALUE,
      PICB64: GASHMVPVD002var.PICs,
    );
  }
}
