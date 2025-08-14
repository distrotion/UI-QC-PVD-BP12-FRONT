import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/08-01-GASRHT001.dart';
import '../../bloc/BlocEvent/08-02-TrickGASRHT001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTMANYCwidget.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'CTCXTM001var.dart';

class MICROVICKER_CTCXTM001main extends StatelessWidget {
  MICROVICKER_CTCXTM001main({Key? key, this.data}) : super(key: key);
  CTCXTM001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_CTCXTM001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_CTCXTM001_BlocBuffer extends StatelessWidget {
  _TRICKER_CTCXTM001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  CTCXTM001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_CTCXTM001_Bloc(),
        child: BlocBuilder<TRICKER_CTCXTM001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_CTCXTM001body(data: data);
          },
        ));
  }
}

class ROCKWELL_CTCXTM001body extends StatefulWidget {
  ROCKWELL_CTCXTM001body({Key? key, this.data}) : super(key: key);
  CTCXTM001SCHEMA? data;

  @override
  State<ROCKWELL_CTCXTM001body> createState() => _ROCKWELL_CTCXTM001bodyState();
}

class _ROCKWELL_CTCXTM001bodyState extends State<ROCKWELL_CTCXTM001body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<CTCXTM001_Bloc>().add(CTCXTM001_READ());
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    backpage_fn(); // Do some stuff.
    return true;
  }

  backpage_fn() {
    CTCXTM001var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    CTCXTM001var.ItemPickSELECT = '';
    context.read<TRICKER_CTCXTM001_Bloc>().add(TRICKER_CTCXTM001SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 5;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        CTCXTM001var.PO = widget.data?.PO ?? '';
        CTCXTM001var.CP = widget.data?.CP ?? '';
        CTCXTM001var.QTY = widget.data?.QTY ?? '';
        CTCXTM001var.PROCESS = widget.data?.PROCESS ?? '';
        CTCXTM001var.CUSLOT = widget.data?.CUSLOT ?? '';
        CTCXTM001var.TPKLOT = widget.data?.TPKLOT ?? '';
        CTCXTM001var.FG = widget.data?.FG ?? '';
        CTCXTM001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        CTCXTM001var.PART = widget.data?.PART ?? '';
        CTCXTM001var.PARTNAME = widget.data?.PARTNAME ?? '';
        CTCXTM001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        CTCXTM001var.ItemPick = widget.data?.ItemPick ?? [''];
        CTCXTM001var.PCS = widget.data?.PCS ?? '';
        // CTCXTM001var.PCS = '10';
        CTCXTM001var.PCSleft = widget.data?.PCSleft ?? '';
        // CTCXTM001var.PCSleft = '10';
        CTCXTM001var.POINTs = widget.data?.POINTs ?? '';
        // CTCXTM001var.POINTs = '10';
        // if (CTCXTM001var.ItemPickSELECT != "") {
        //   //
        //   if (CTCXTM001var.POINTs == "") {
        //     //
        //     CTCXTM001var.POINTs == "0";
        //   }
        // }
        CTCXTM001var.UNIT = widget.data?.UNIT ?? '';
        // CTCXTM001var.UNIT = 'pcs/lots';
        CTCXTM001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        CTCXTM001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        CTCXTM001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        CTCXTM001var.GAP = widget.data?.GAP ?? '';
        CTCXTM001var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        CTCXTM001var.preview = widget.data?.preview ?? [];
        CTCXTM001var.confirmdata = widget.data?.confirmdata ?? [];
        CTCXTM001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        CTCXTM001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        // CTCXTM001var.PICs = widget.data?.Pic ?? '';

        if (CTCXTM001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<CTCXTM001_Bloc>().add(CTCXTM001_READ());
      });
      CTCXTM001var.DHtimer = timer;
    }
    return SINGLESHOTMANYCmain(
      //------ Left
      LABEL: "CTC-XTM-001",
      PO: CTCXTM001var.PO,
      CP: CTCXTM001var.CP,
      QTY: CTCXTM001var.QTY,
      PROCESS: CTCXTM001var.PROCESS,
      CUSLOT: CTCXTM001var.CUSLOT,
      TPKLOT: CTCXTM001var.TPKLOT,
      FG: CTCXTM001var.FG,
      CUSTOMER: CTCXTM001var.CUSTOMER,
      PART: CTCXTM001var.PART,
      PARTNAME: CTCXTM001var.PARTNAME,
      MATERIAL: CTCXTM001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        CTCXTM001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_CTCXTM001_Bloc>()
            .add(TRICKER_CTCXTM001geteachITEM());
      },
      ItemPick: CTCXTM001var.ItemPick,
      PCS: CTCXTM001var.PCS,
      PCSleft: CTCXTM001var.PCSleft,
      POINTs: CTCXTM001var.POINTs,
      UNIT: CTCXTM001var.UNIT,
      INTERSEC: CTCXTM001var.INTERSEC,
      RESULTFORMAT: CTCXTM001var.RESULTFORMAT,
      Ghtype: CTCXTM001var.GRAPHTYPE,
      GAP: CTCXTM001var.GAP,
      GAPnameList: CTCXTM001var.GAPnameList,
      GAPname: CTCXTM001var.GAPname,
      GAPnamePick: (v) {
        CTCXTM001var.GAPname = v;
        context
            .read<TRICKER_CTCXTM001_Bloc>()
            .add(TRICKER_CTCXTM001geteachGRAPH());
      },
      //------- Bottom
      GET1: (v) {
        Dio().post(
          serverdata + 'BP12XTMGET',
          data: {"GETPOSITION": "1"},
        ).then((v) {});
      },
      GET2: (v) {
        Dio().post(
          serverdata + 'BP12XTMGET',
          data: {"GETPOSITION": "2"},
        ).then((v) {});
      },
      GET3: (v) {
        Dio().post(
          serverdata + 'BP12XTMGET',
          data: {"GETPOSITION": "3"},
        ).then((v) {});
      },
      ACCEPT: (v) {
        if ((CTCXTM001var.RESULTFORMAT == 'Graph' &&
                CTCXTM001var.GAPname != '') ||
            CTCXTM001var.RESULTFORMAT != 'Graph') {
          if (CTCXTM001var.PCS != '' &&
              CTCXTM001var.POINTs != '' &&
              CTCXTM001var.ItemPickSELECT != '') {
            if (int.parse(CTCXTM001var.POINTs) >
                CTCXTM001var.confirmdata.length) {
              context
                  .read<TRICKER_CTCXTM001_Bloc>()
                  .add(TRICKER_CTCXTM001confirmdata());
            } else {
              WORNINGpop(context, "Have completed POINTs");
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
        } else {
          WORNINGpop(context, "Please select GRAPH");
        }
      },
      FINISH: (v) {
        if (CTCXTM001var.PCS != '' &&
            CTCXTM001var.POINTs != '' &&
            CTCXTM001var.ItemPickSELECT != '') {
          if (int.parse(CTCXTM001var.POINTs) ==
              CTCXTM001var.confirmdata.length) {
            if (int.parse(CTCXTM001var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_CTCXTM001_Bloc>()
                  .add(TRICKER_CTCXTM001FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: CTCXTM001var.preview,
      confirmdata: CTCXTM001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_CTCXTM001_Bloc>().add(TRICKER_CTCXTM001CLEAR());
      },
      BACKPAGE: (v) {
        CTCXTM001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        CTCXTM001var.ItemPickSELECT = '';
        context.read<TRICKER_CTCXTM001_Bloc>().add(TRICKER_CTCXTM001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_CTCXTM001_Bloc>()
            .add(TRICKER_CTCXTM001RESETVALUE());
      },
      ITEMleftUNIT: CTCXTM001var.ITEMleftUNIT,
      ITEMleftVALUE: CTCXTM001var.ITEMleftVALUE,
      PICB64: CTCXTM001var.PICs,
    );
  }
}
