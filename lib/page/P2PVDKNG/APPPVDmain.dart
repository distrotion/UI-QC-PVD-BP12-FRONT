import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/02-01-APPPVD.dart';
import '../../bloc/BlocEvent/02-02-TrickAPPPVD.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/QCWIDGET/W1SINGLESHOTAPR/SINGLESHOTAPRwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'APPPVDvar.dart';

class APPEARANCE_APPPVDmain extends StatelessWidget {
  APPEARANCE_APPPVDmain({Key? key, this.data}) : super(key: key);
  APPPVDSCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_APPPVD_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_APPPVD_BlocBuffer extends StatelessWidget {
  _TRICKER_APPPVD_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  APPPVDSCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_APPPVD_Bloc(),
        child: BlocBuilder<TRICKER_APPPVD_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_APPPVDbody(data: data, trick: trick);
          },
        ));
  }
}

class ROCKWELL_APPPVDbody extends StatefulWidget {
  ROCKWELL_APPPVDbody({Key? key, this.data, this.trick}) : super(key: key);
  APPPVDSCHEMA? data;
  String? trick;

  @override
  State<ROCKWELL_APPPVDbody> createState() => _ROCKWELL_APPPVDbodyState();
}

class _ROCKWELL_APPPVDbodyState extends State<ROCKWELL_APPPVDbody> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<APPPVD_Bloc>().add(APPPVD_READ());
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
    APPPVDvar.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    APPPVDvar.ItemPickSELECT = '';
    context.read<TRICKER_APPPVD_Bloc>().add(TRICKER_APPPVDSETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 8;
    // print(widget.data?.UPDATE);

    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        APPPVDvar.PO = widget.data?.PO ?? '';
        APPPVDvar.CP = widget.data?.CP ?? '';
        APPPVDvar.QTY = widget.data?.QTY ?? '';
        APPPVDvar.PROCESS = widget.data?.PROCESS ?? '';
        APPPVDvar.CUSLOT = widget.data?.CUSLOT ?? '';
        APPPVDvar.TPKLOT = widget.data?.TPKLOT ?? '';
        APPPVDvar.FG = widget.data?.FG ?? '';
        APPPVDvar.CUSTOMER = widget.data?.CUSTOMER ?? '';
        APPPVDvar.PART = widget.data?.PART ?? '';
        APPPVDvar.PARTNAME = widget.data?.PARTNAME ?? '';
        APPPVDvar.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        APPPVDvar.ItemPick = widget.data?.ItemPick ?? [''];
        APPPVDvar.PCS = widget.data?.PCS ?? '';
        // APPPVDvar.PCS = '10';
        APPPVDvar.PCSleft = widget.data?.PCSleft ?? '';
        // APPPVDvar.PCSleft = '10';
        APPPVDvar.POINTs = widget.data?.POINTs ?? '';
        // APPPVDvar.POINTs = '10';
        // if (APPPVDvar.ItemPickSELECT != "") {
        //   //
        //   if (APPPVDvar.POINTs == "") {
        //     //
        //     APPPVDvar.POINTs == "0";
        //   }
        // }
        APPPVDvar.UNIT = widget.data?.UNIT ?? '';
        // APPPVDvar.UNIT = 'pcs/lots';
        APPPVDvar.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        APPPVDvar.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        APPPVDvar.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        APPPVDvar.GAP = widget.data?.GAP ?? '';
        //
        APPPVDvar.preview = widget.data?.preview ?? [];
        APPPVDvar.confirmdata = widget.data?.confirmdata ?? [];
        APPPVDvar.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        APPPVDvar.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        APPPVDvar.PICs = widget.data?.Pic ?? '';

        if (APPPVDvar.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      // if (widget.trick == 'OK' &&
      //     APPPVDvar.PCSleft != '0' &&
      //     APPPVDvar.PCS != '' &&
      //     APPPVDvar.PCSleft != '' &&
      //     (int.parse(APPPVDvar.PCSleft) < int.parse(APPPVDvar.PCS))) {
      //   widget.trick = '';
      //   context.read<TRICKER_APPPVD_Bloc>().add(TRICKER_APPPVDFINISH());
      // }

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<APPPVD_Bloc>().add(APPPVD_READ());
      });
      APPPVDvar.DHtimer = timer;
    }
    return SINGLESHOTAPRmain(
      //------ Left
      LABEL: "APP-INSHES",
      PO: APPPVDvar.PO,
      CP: APPPVDvar.CP,
      QTY: APPPVDvar.QTY,
      PROCESS: APPPVDvar.PROCESS,
      CUSLOT: APPPVDvar.CUSLOT,
      TPKLOT: APPPVDvar.TPKLOT,
      FG: APPPVDvar.FG,
      CUSTOMER: APPPVDvar.CUSTOMER,
      PART: APPPVDvar.PART,
      PARTNAME: APPPVDvar.PARTNAME,
      MATERIAL: APPPVDvar.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        APPPVDvar.ItemPickSELECT = v;

        context.read<TRICKER_APPPVD_Bloc>().add(TRICKER_APPPVDgeteachITEM());
      },
      ItemPick: APPPVDvar.ItemPick,
      PCS: APPPVDvar.PCS,
      PCSleft: APPPVDvar.PCSleft,
      POINTs: APPPVDvar.POINTs,
      UNIT: APPPVDvar.UNIT,
      INTERSEC: APPPVDvar.INTERSEC,
      RESULTFORMAT: APPPVDvar.RESULTFORMAT,
      Ghtype: APPPVDvar.GRAPHTYPE,
      //------- Bottom
      GOOD: (v) {
        if (APPPVDvar.PCS != '') {
          APPPVDvar.APPEARANCE = 'Good';
          if (APPPVDvar.PCS != '' &&
              APPPVDvar.POINTs != '' &&
              APPPVDvar.ItemPickSELECT != '') {
            if (int.parse(APPPVDvar.PCSleft) > 0) {
              onLoadingFAKE(context);
              context.read<TRICKER_APPPVD_Bloc>().add(TRICKER_APPPVDFINISH());
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
        }
      },
      NOGOOD: (v) {
        if (APPPVDvar.PCS != '') {
          if (APPPVDvar.PCS != '' &&
              APPPVDvar.POINTs != '' &&
              APPPVDvar.ItemPickSELECT != '') {
            if (int.parse(APPPVDvar.PCSleft) > 0) {
              APPPVDvar.APPEARANCE = 'no Good';
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
        }
      },
      preview: APPPVDvar.preview,
      confirmdata: APPPVDvar.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_APPPVD_Bloc>().add(TRICKER_APPPVDCLEAR());
      },
      BACKPAGE: (v) {
        APPPVDvar.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        APPPVDvar.ItemPickSELECT = '';
        context.read<TRICKER_APPPVD_Bloc>().add(TRICKER_APPPVDSETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context.read<TRICKER_APPPVD_Bloc>().add(TRICKER_APPPVDRESETVALUE());
      },
      ITEMleftUNIT: APPPVDvar.ITEMleftUNIT,
      ITEMleftVALUE: APPPVDvar.ITEMleftVALUE,
      PICB64: APPPVDvar.PICs,
    );
  }
}
