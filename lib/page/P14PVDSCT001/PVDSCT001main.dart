import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/14-01-PVDSCT001.dart';
import '../../bloc/BlocEvent/14-02-TrickPVDSCT001.dart';
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
import 'PVDSCT001var.dart';

class MICROVICKER_PVDSCT001main extends StatelessWidget {
  MICROVICKER_PVDSCT001main({Key? key, this.data}) : super(key: key);
  PVDSCT001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_PVDSCT001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_PVDSCT001_BlocBuffer extends StatelessWidget {
  _TRICKER_PVDSCT001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  PVDSCT001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_PVDSCT001_Bloc(),
        child: BlocBuilder<TRICKER_PVDSCT001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_PVDSCT001body(data: data);
          },
        ));
  }
}

class ROCKWELL_PVDSCT001body extends StatefulWidget {
  ROCKWELL_PVDSCT001body({Key? key, this.data}) : super(key: key);
  PVDSCT001SCHEMA? data;

  @override
  State<ROCKWELL_PVDSCT001body> createState() => _ROCKWELL_PVDSCT001bodyState();
}

class _ROCKWELL_PVDSCT001bodyState extends State<ROCKWELL_PVDSCT001body> {
  @override
  void initState() {
    super.initState();
    context.read<PVDSCT001_Bloc>().add(PVDSCT001_READ());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        PVDSCT001var.PO = widget.data?.PO ?? '';
        PVDSCT001var.CP = widget.data?.CP ?? '';
        PVDSCT001var.QTY = widget.data?.QTY ?? '';
        PVDSCT001var.PROCESS = widget.data?.PROCESS ?? '';
        PVDSCT001var.CUSLOT = widget.data?.CUSLOT ?? '';
        PVDSCT001var.TPKLOT = widget.data?.TPKLOT ?? '';
        PVDSCT001var.FG = widget.data?.FG ?? '';
        PVDSCT001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        PVDSCT001var.PART = widget.data?.PART ?? '';
        PVDSCT001var.PARTNAME = widget.data?.PARTNAME ?? '';
        PVDSCT001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        PVDSCT001var.ItemPick = widget.data?.ItemPick ?? [''];
        PVDSCT001var.PCS = widget.data?.PCS ?? '';
        // PVDSCT001var.PCS = '10';
        PVDSCT001var.PCSleft = widget.data?.PCSleft ?? '';
        // PVDSCT001var.PCSleft = '10';
        PVDSCT001var.POINTs = widget.data?.POINTs ?? '';
        // PVDSCT001var.POINTs = '10';
        // if (PVDSCT001var.ItemPickSELECT != "") {
        //   //
        //   if (PVDSCT001var.POINTs == "") {
        //     //
        //     PVDSCT001var.POINTs == "0";
        //   }
        // }
        PVDSCT001var.UNIT = widget.data?.UNIT ?? '';
        // PVDSCT001var.UNIT = 'pcs/lots';
        PVDSCT001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        PVDSCT001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        PVDSCT001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        PVDSCT001var.GAP = widget.data?.GAP ?? '';
        PVDSCT001var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        PVDSCT001var.preview = widget.data?.preview ?? [];
        PVDSCT001var.confirmdata = widget.data?.confirmdata ?? [];
        PVDSCT001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        PVDSCT001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        PVDSCT001var.PICs = widget.data?.Pic ?? '';

        if (PVDSCT001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<PVDSCT001_Bloc>().add(PVDSCT001_READ());
      });
      PVDSCT001var.DHtimer = timer;
    }
    return MULTISHOTmain(
      //------ Left
      LABEL: "PVD-SCT-001",
      PO: PVDSCT001var.PO,
      CP: PVDSCT001var.CP,
      QTY: PVDSCT001var.QTY,
      PROCESS: PVDSCT001var.PROCESS,
      CUSLOT: PVDSCT001var.CUSLOT,
      TPKLOT: PVDSCT001var.TPKLOT,
      FG: PVDSCT001var.FG,
      CUSTOMER: PVDSCT001var.CUSTOMER,
      PART: PVDSCT001var.PART,
      PARTNAME: PVDSCT001var.PARTNAME,
      MATERIAL: PVDSCT001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        PVDSCT001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_PVDSCT001_Bloc>()
            .add(TRICKER_PVDSCT001geteachITEM());
      },
      ItemPick: PVDSCT001var.ItemPick,
      PCS: PVDSCT001var.PCS,
      PCSleft: PVDSCT001var.PCSleft,
      POINTs: PVDSCT001var.POINTs,
      UNIT: PVDSCT001var.UNIT,
      INTERSEC: PVDSCT001var.INTERSEC,
      RESULTFORMAT: PVDSCT001var.RESULTFORMAT,
      Ghtype: PVDSCT001var.GRAPHTYPE,
      GAP: PVDSCT001var.GAP,
      GAPnameList: PVDSCT001var.GAPnameList,
      GAPname: PVDSCT001var.GAPname,
      GAPnamePick: (v) {
        PVDSCT001var.GAPname = v;
        context
            .read<TRICKER_PVDSCT001_Bloc>()
            .add(TRICKER_PVDSCT001geteachGRAPH());
      },
      //------- Bottom
      DATA1STR: "SCT",
      DATA2STR: "-",
      DATA3STR: "-",
      DATA1: (v) {
        context
            .read<TRICKER_PVDSCT001_Bloc>()
            .add(TRICKER_PVDSCT001confirmdata1());
      },
      DATA2: (v) {
        // context
        //     .read<TRICKER_PVDSCT001_Bloc>()
        //     .add(TRICKER_PVDSCT001confirmdata2());
      },
      DATA3: (v) {
        // context
        //     .read<TRICKER_PVDSCT001_Bloc>()
        //     .add(TRICKER_PVDSCT001confirmdata());
      },
      FINISH: (v) {
        if (PVDSCT001var.PCS != '' &&
            PVDSCT001var.POINTs != '' &&
            PVDSCT001var.ItemPickSELECT != '') {
          if (int.parse(PVDSCT001var.POINTs) ==
              PVDSCT001var.confirmdata.length) {
            if (int.parse(PVDSCT001var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_PVDSCT001_Bloc>()
                  .add(TRICKER_PVDSCT001FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: PVDSCT001var.preview,
      confirmdata: PVDSCT001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_PVDSCT001_Bloc>().add(TRICKER_PVDSCT001CLEAR());
      },
      BACKPAGE: (v) {
        PVDSCT001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        PVDSCT001var.ItemPickSELECT = '';
        context.read<TRICKER_PVDSCT001_Bloc>().add(TRICKER_PVDSCT001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_PVDSCT001_Bloc>()
            .add(TRICKER_PVDSCT001RESETVALUE());
      },
      ITEMleftUNIT: PVDSCT001var.ITEMleftUNIT,
      ITEMleftVALUE: PVDSCT001var.ITEMleftVALUE,
      PICB64: PVDSCT001var.PICs,
    );
  }
}
