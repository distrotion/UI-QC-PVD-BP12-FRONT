import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/03-01-GASHMVKNG001.dart';
import '../../bloc/BlocEvent/03-02-TrickGASHMVKNG001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/QCWIDGET/W2MULTISHOT/MULTISHOTwidget.dart';
import '../../widget/QCWIDGET/consolelayout.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'GASHMVPVD001var.dart';

class MICROVICKER_GASHMVPVD001main extends StatelessWidget {
  MICROVICKER_GASHMVPVD001main({Key? key, this.data}) : super(key: key);
  GASHMVPVD001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_GASHMVPVD001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_GASHMVPVD001_BlocBuffer extends StatelessWidget {
  _TRICKER_GASHMVPVD001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  GASHMVPVD001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_GASHMVPVD001_Bloc(),
        child: BlocBuilder<TRICKER_GASHMVPVD001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_GASHMVPVD001body(data: data);
          },
        ));
  }
}

class ROCKWELL_GASHMVPVD001body extends StatefulWidget {
  ROCKWELL_GASHMVPVD001body({Key? key, this.data}) : super(key: key);
  GASHMVPVD001SCHEMA? data;

  @override
  State<ROCKWELL_GASHMVPVD001body> createState() =>
      _ROCKWELL_GASHMVPVD001bodyState();
}

class _ROCKWELL_GASHMVPVD001bodyState extends State<ROCKWELL_GASHMVPVD001body> {
  @override
  void initState() {
    super.initState();
    context.read<GASHMVPVD001_Bloc>().add(GASHMVPVD001_READ());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        GASHMVPVD001var.PO = widget.data?.PO ?? '';
        GASHMVPVD001var.CP = widget.data?.CP ?? '';
        GASHMVPVD001var.QTY = widget.data?.QTY ?? '';
        GASHMVPVD001var.PROCESS = widget.data?.PROCESS ?? '';
        GASHMVPVD001var.CUSLOT = widget.data?.CUSLOT ?? '';
        GASHMVPVD001var.TPKLOT = widget.data?.TPKLOT ?? '';
        GASHMVPVD001var.FG = widget.data?.FG ?? '';
        GASHMVPVD001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        GASHMVPVD001var.PART = widget.data?.PART ?? '';
        GASHMVPVD001var.PARTNAME = widget.data?.PARTNAME ?? '';
        GASHMVPVD001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        GASHMVPVD001var.ItemPick = widget.data?.ItemPick ?? [''];
        GASHMVPVD001var.PCS = widget.data?.PCS ?? '';
        // GASHMVPVD001var.PCS = '10';
        GASHMVPVD001var.PCSleft = widget.data?.PCSleft ?? '';
        // GASHMVPVD001var.PCSleft = '10';
        GASHMVPVD001var.POINTs = widget.data?.POINTs ?? '';
        // GASHMVPVD001var.POINTs = '10';
        // if (GASHMVPVD001var.ItemPickSELECT != "") {
        //   //
        //   if (GASHMVPVD001var.POINTs == "") {
        //     //
        //     GASHMVPVD001var.POINTs == "0";
        //   }
        // }
        GASHMVPVD001var.UNIT = widget.data?.UNIT ?? '';
        // GASHMVPVD001var.UNIT = 'pcs/lots';
        GASHMVPVD001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        GASHMVPVD001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        GASHMVPVD001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        GASHMVPVD001var.GAP = widget.data?.GAP ?? '';
        GASHMVPVD001var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        GASHMVPVD001var.preview = widget.data?.preview ?? [];
        GASHMVPVD001var.confirmdata = widget.data?.confirmdata ?? [];
        GASHMVPVD001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        GASHMVPVD001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];
        //

        GASHMVPVD001var.PICs = widget.data?.Pic ?? '';

        if (GASHMVPVD001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<GASHMVPVD001_Bloc>().add(GASHMVPVD001_READ());
      });
      GASHMVPVD001var.DHtimer = timer;
    }

    return MULTISHOTmain(
      //------ Left
      LABEL: "GAS-HMVPVD-001",
      PO: GASHMVPVD001var.PO,
      CP: GASHMVPVD001var.CP,
      QTY: GASHMVPVD001var.QTY,
      PROCESS: GASHMVPVD001var.PROCESS,
      CUSLOT: GASHMVPVD001var.CUSLOT,
      TPKLOT: GASHMVPVD001var.TPKLOT,
      FG: GASHMVPVD001var.FG,
      CUSTOMER: GASHMVPVD001var.CUSTOMER,
      PART: GASHMVPVD001var.PART,
      PARTNAME: GASHMVPVD001var.PARTNAME,
      MATERIAL: GASHMVPVD001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        GASHMVPVD001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_GASHMVPVD001_Bloc>()
            .add(TRICKER_GASHMVPVD001geteachITEM());
      },
      ItemPick: GASHMVPVD001var.ItemPick,
      PCS: GASHMVPVD001var.PCS,
      PCSleft: GASHMVPVD001var.PCSleft,
      POINTs: GASHMVPVD001var.POINTs,
      UNIT: GASHMVPVD001var.UNIT,
      INTERSEC: GASHMVPVD001var.INTERSEC,
      RESULTFORMAT: GASHMVPVD001var.RESULTFORMAT,
      Ghtype: GASHMVPVD001var.GRAPHTYPE,
      GAP: GASHMVPVD001var.GAP,
      GAPnameList: GASHMVPVD001var.GAPnameList,
      GAPname: GASHMVPVD001var.GAPname,
      GAPnamePick: (v) {
        GASHMVPVD001var.GAPname = v;
        context
            .read<TRICKER_GASHMVPVD001_Bloc>()
            .add(TRICKER_GASHMVPVD001geteachGRAPH());
      },
      //------- Bottom
      DATA1STR: "Surface",
      DATA2STR: "Compound",
      DATA3STR: "TRIM",
      DATA1: (v) {
        context
            .read<TRICKER_GASHMVPVD001_Bloc>()
            .add(TRICKER_GASHMVPVD001confirmdata1());
      },

      DATA2: (v) {
        context
            .read<TRICKER_GASHMVPVD001_Bloc>()
            .add(TRICKER_GASHMVPVD001confirmdata2());
      },

      DATA3: (v) {
        context
            .read<TRICKER_GASHMVPVD001_Bloc>()
            .add(TRICKER_GASHMVPVD001confirmdata());
      },
      FINISH: (v) {
        if (GASHMVPVD001var.PCS != '' &&
            GASHMVPVD001var.POINTs != '' &&
            GASHMVPVD001var.ItemPickSELECT != '') {
          if (int.parse(GASHMVPVD001var.POINTs) ==
              GASHMVPVD001var.confirmdata.length) {
            if (int.parse(GASHMVPVD001var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_GASHMVPVD001_Bloc>()
                  .add(TRICKER_GASHMVPVD001FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: GASHMVPVD001var.preview,

      confirmdata: GASHMVPVD001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context
            .read<TRICKER_GASHMVPVD001_Bloc>()
            .add(TRICKER_GASHMVPVD001CLEAR());
      },
      BACKPAGE: (v) {
        GASHMVPVD001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        GASHMVPVD001var.ItemPickSELECT = '';
        context
            .read<TRICKER_GASHMVPVD001_Bloc>()
            .add(TRICKER_GASHMVPVD001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_GASHMVPVD001_Bloc>()
            .add(TRICKER_GASHMVPVD001RESETVALUE());
      },
      ITEMleftUNIT: GASHMVPVD001var.ITEMleftUNIT,
      ITEMleftVALUE: GASHMVPVD001var.ITEMleftVALUE,
      //
      PICB64: GASHMVPVD001var.PICs,
    );
  }
}
