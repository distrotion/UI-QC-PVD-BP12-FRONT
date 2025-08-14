import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/06-01-GASVIC001.dart';
import '../../bloc/BlocEvent/06-02-TrickGASVIC001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/QCWIDGET/W1SINGLESHOTKEY/SINGLESHOTKEYwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'SPLINESIZE001var.dart';

class MICROVICKER_SPLINEGAUGEmain extends StatelessWidget {
  MICROVICKER_SPLINEGAUGEmain({Key? key, this.data}) : super(key: key);
  SPLINEGAUGESCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_SPLINEGAUGE_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_SPLINEGAUGE_BlocBuffer extends StatelessWidget {
  _TRICKER_SPLINEGAUGE_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  SPLINEGAUGESCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_SPLINEGAUGE_Bloc(),
        child: BlocBuilder<TRICKER_SPLINEGAUGE_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_SPLINEGAUGEbody(data: data);
          },
        ));
  }
}

class ROCKWELL_SPLINEGAUGEbody extends StatefulWidget {
  ROCKWELL_SPLINEGAUGEbody({Key? key, this.data}) : super(key: key);
  SPLINEGAUGESCHEMA? data;

  @override
  State<ROCKWELL_SPLINEGAUGEbody> createState() =>
      _ROCKWELL_SPLINEGAUGEbodyState();
}

class _ROCKWELL_SPLINEGAUGEbodyState extends State<ROCKWELL_SPLINEGAUGEbody> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<SPLINEGAUGE_Bloc>().add(SPLINEGAUGE_READ());
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
    SPLINEGAUGEvar.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    SPLINEGAUGEvar.ItemPickSELECT = '';
    // SPLINEGAUGEvar.SINGLEINPUT = '';
    context.read<TRICKER_SPLINEGAUGE_Bloc>().add(TRICKER_SPLINEGAUGESETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 5;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        SPLINEGAUGEvar.PO = widget.data?.PO ?? '';
        SPLINEGAUGEvar.CP = widget.data?.CP ?? '';
        SPLINEGAUGEvar.QTY = widget.data?.QTY ?? '';
        SPLINEGAUGEvar.PROCESS = widget.data?.PROCESS ?? '';
        SPLINEGAUGEvar.CUSLOT = widget.data?.CUSLOT ?? '';
        SPLINEGAUGEvar.TPKLOT = widget.data?.TPKLOT ?? '';
        SPLINEGAUGEvar.FG = widget.data?.FG ?? '';
        SPLINEGAUGEvar.CUSTOMER = widget.data?.CUSTOMER ?? '';
        SPLINEGAUGEvar.PART = widget.data?.PART ?? '';
        SPLINEGAUGEvar.PARTNAME = widget.data?.PARTNAME ?? '';
        SPLINEGAUGEvar.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        SPLINEGAUGEvar.ItemPick = widget.data?.ItemPick ?? [''];
        SPLINEGAUGEvar.PCS = widget.data?.PCS ?? '';
        // SPLINEGAUGEvar.PCS = '10';
        SPLINEGAUGEvar.PCSleft = widget.data?.PCSleft ?? '';
        // SPLINEGAUGEvar.PCSleft = '10';
        SPLINEGAUGEvar.POINTs = widget.data?.POINTs ?? '';
        // SPLINEGAUGEvar.POINTs = '10';
        // if (SPLINEGAUGEvar.ItemPickSELECT != "") {
        //   //
        //   if (SPLINEGAUGEvar.POINTs == "") {
        //     //
        //     SPLINEGAUGEvar.POINTs == "0";
        //   }
        // }
        SPLINEGAUGEvar.UNIT = widget.data?.UNIT ?? '';
        // SPLINEGAUGEvar.UNIT = 'pcs/lots';
        SPLINEGAUGEvar.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        SPLINEGAUGEvar.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        SPLINEGAUGEvar.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        SPLINEGAUGEvar.GAP = widget.data?.GAP ?? '';
        SPLINEGAUGEvar.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        SPLINEGAUGEvar.preview = widget.data?.preview ?? [];
        SPLINEGAUGEvar.confirmdata = widget.data?.confirmdata ?? [];
        SPLINEGAUGEvar.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        SPLINEGAUGEvar.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        if (SPLINEGAUGEvar.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<SPLINEGAUGE_Bloc>().add(SPLINEGAUGE_READ());
      });
      SPLINEGAUGEvar.DHtimer = timer;
    }
    return SINGLESHOTKEYmain(
      //------ Left
      LABEL: "LCR-UVS-001",
      PO: SPLINEGAUGEvar.PO,
      CP: SPLINEGAUGEvar.CP,
      QTY: SPLINEGAUGEvar.QTY,
      PROCESS: SPLINEGAUGEvar.PROCESS,
      CUSLOT: SPLINEGAUGEvar.CUSLOT,
      TPKLOT: SPLINEGAUGEvar.TPKLOT,
      FG: SPLINEGAUGEvar.FG,
      CUSTOMER: SPLINEGAUGEvar.CUSTOMER,
      PART: SPLINEGAUGEvar.PART,
      PARTNAME: SPLINEGAUGEvar.PARTNAME,
      MATERIAL: SPLINEGAUGEvar.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        SPLINEGAUGEvar.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_SPLINEGAUGE_Bloc>()
            .add(TRICKER_SPLINEGAUGEgeteachITEM());
      },
      ItemPick: SPLINEGAUGEvar.ItemPick,
      PCS: SPLINEGAUGEvar.PCS,
      PCSleft: SPLINEGAUGEvar.PCSleft,
      POINTs: SPLINEGAUGEvar.POINTs,
      UNIT: SPLINEGAUGEvar.UNIT,
      INTERSEC: SPLINEGAUGEvar.INTERSEC,
      RESULTFORMAT: SPLINEGAUGEvar.RESULTFORMAT,
      Ghtype: SPLINEGAUGEvar.GRAPHTYPE,
      GAP: SPLINEGAUGEvar.GAP,
      GAPnameList: SPLINEGAUGEvar.GAPnameList,
      GAPname: SPLINEGAUGEvar.GAPname,
      GAPnamePick: (v) {
        SPLINEGAUGEvar.GAPname = v;
        context
            .read<TRICKER_SPLINEGAUGE_Bloc>()
            .add(TRICKER_SPLINEGAUGEgeteachGRAPH());
      },
      //------- Bottom
      ACCEPT: (v) {
        if ((SPLINEGAUGEvar.RESULTFORMAT == 'Graph' &&
                SPLINEGAUGEvar.GAPname != '') ||
            SPLINEGAUGEvar.RESULTFORMAT != 'Graph') {
          if (SPLINEGAUGEvar.PCS != '' &&
              SPLINEGAUGEvar.POINTs != '' &&
              SPLINEGAUGEvar.ItemPickSELECT != '' &&
              SPLINEGAUGEvar.SINGLEINPUT != '') {
            if (int.parse(SPLINEGAUGEvar.POINTs) >
                SPLINEGAUGEvar.confirmdata.length) {
              // context
              //     .read<TRICKER_SPLINEGAUGE_Bloc>()
              //     .add(TRICKER_SPLINEGAUGEconfirmdata());
              context
                  .read<TRICKER_SPLINEGAUGE_Bloc>()
                  .add(TRICKER_SPLINEGAUGEpreview());
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
        if (SPLINEGAUGEvar.PCS != '' &&
            SPLINEGAUGEvar.POINTs != '' &&
            SPLINEGAUGEvar.ItemPickSELECT != '') {
          if (int.parse(SPLINEGAUGEvar.POINTs) ==
              SPLINEGAUGEvar.confirmdata.length) {
            if (int.parse(SPLINEGAUGEvar.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_SPLINEGAUGE_Bloc>()
                  .add(TRICKER_SPLINEGAUGEFINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      READ: (v) {
        print(v);
        if (SPLINEGAUGEvar.SINGLEINPUT != '') {
          context
              .read<TRICKER_SPLINEGAUGE_Bloc>()
              .add(TRICKER_SPLINEGAUGEpreview());
        }
      },
      preview: SPLINEGAUGEvar.preview,
      iscon01: false,
      input: SPLINEGAUGEvar.SINGLEINPUT,
      input2: SPLINEGAUGEvar.SINGLEINPUTNG,
      inputFN: (v) {
        SPLINEGAUGEvar.SINGLEINPUT = v;

        SPLINEGAUGEvar.SINGLEINPUTNG =
            (int.parse(ConverstStr(SPLINEGAUGEvar.QTY)) -
                    int.parse(ConverstStr(SPLINEGAUGEvar.SINGLEINPUT)))
                .toString();
        setState(() {});
      },
      confirmdata: SPLINEGAUGEvar.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context
            .read<TRICKER_SPLINEGAUGE_Bloc>()
            .add(TRICKER_SPLINEGAUGECLEAR());
      },
      BACKPAGE: (v) {
        SPLINEGAUGEvar.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        SPLINEGAUGEvar.ItemPickSELECT = '';
        // SPLINEGAUGEvar.SINGLEINPUT = '';
        context
            .read<TRICKER_SPLINEGAUGE_Bloc>()
            .add(TRICKER_SPLINEGAUGESETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_SPLINEGAUGE_Bloc>()
            .add(TRICKER_SPLINEGAUGERESETVALUE());
      },
      ITEMleftUNIT: SPLINEGAUGEvar.ITEMleftUNIT,
      ITEMleftVALUE: SPLINEGAUGEvar.ITEMleftVALUE,
    );
  }
}
