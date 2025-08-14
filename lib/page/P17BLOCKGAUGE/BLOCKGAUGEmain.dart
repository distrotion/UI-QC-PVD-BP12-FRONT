import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/02-01-APPPVD.dart';
import '../../bloc/BlocEvent/02-02-TrickAPPPVD.dart';
import '../../bloc/BlocEvent/17-01-APPGAS12 copy.dart';
import '../../bloc/BlocEvent/17-02-TrickAPPGAS12 copy.dart';
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
import 'BLOCKGAUGEvar.dart';

class APPEARANCE_BLOCKGAUGEmain extends StatelessWidget {
  APPEARANCE_BLOCKGAUGEmain({Key? key, this.data}) : super(key: key);
  BLOCKGAUGESCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_BLOCKGAUGE_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_BLOCKGAUGE_BlocBuffer extends StatelessWidget {
  _TRICKER_BLOCKGAUGE_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  BLOCKGAUGESCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_BLOCKGAUGE_Bloc(),
        child: BlocBuilder<TRICKER_BLOCKGAUGE_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_BLOCKGAUGEbody(data: data, trick: trick);
          },
        ));
  }
}

class ROCKWELL_BLOCKGAUGEbody extends StatefulWidget {
  ROCKWELL_BLOCKGAUGEbody({Key? key, this.data, this.trick}) : super(key: key);
  BLOCKGAUGESCHEMA? data;
  String? trick;

  @override
  State<ROCKWELL_BLOCKGAUGEbody> createState() =>
      _ROCKWELL_BLOCKGAUGEbodyState();
}

class _ROCKWELL_BLOCKGAUGEbodyState extends State<ROCKWELL_BLOCKGAUGEbody> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<BLOCKGAUGE_Bloc>().add(BLOCKGAUGE_READ());
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
    BLOCKGAUGEvar.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    BLOCKGAUGEvar.ItemPickSELECT = '';
    context.read<TRICKER_BLOCKGAUGE_Bloc>().add(TRICKER_BLOCKGAUGESETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 8;
    // print(widget.data?.UPDATE);

    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        BLOCKGAUGEvar.PO = widget.data?.PO ?? '';
        BLOCKGAUGEvar.CP = widget.data?.CP ?? '';
        BLOCKGAUGEvar.QTY = widget.data?.QTY ?? '';
        BLOCKGAUGEvar.PROCESS = widget.data?.PROCESS ?? '';
        BLOCKGAUGEvar.CUSLOT = widget.data?.CUSLOT ?? '';
        BLOCKGAUGEvar.TPKLOT = widget.data?.TPKLOT ?? '';
        BLOCKGAUGEvar.FG = widget.data?.FG ?? '';
        BLOCKGAUGEvar.CUSTOMER = widget.data?.CUSTOMER ?? '';
        BLOCKGAUGEvar.PART = widget.data?.PART ?? '';
        BLOCKGAUGEvar.PARTNAME = widget.data?.PARTNAME ?? '';
        BLOCKGAUGEvar.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        BLOCKGAUGEvar.ItemPick = widget.data?.ItemPick ?? [''];
        BLOCKGAUGEvar.PCS = widget.data?.PCS ?? '';
        // BLOCKGAUGEvar.PCS = '10';
        BLOCKGAUGEvar.PCSleft = widget.data?.PCSleft ?? '';
        // BLOCKGAUGEvar.PCSleft = '10';
        BLOCKGAUGEvar.POINTs = widget.data?.POINTs ?? '';
        // BLOCKGAUGEvar.POINTs = '10';
        // if (BLOCKGAUGEvar.ItemPickSELECT != "") {
        //   //
        //   if (BLOCKGAUGEvar.POINTs == "") {
        //     //
        //     BLOCKGAUGEvar.POINTs == "0";
        //   }
        // }
        BLOCKGAUGEvar.UNIT = widget.data?.UNIT ?? '';
        // BLOCKGAUGEvar.UNIT = 'pcs/lots';
        BLOCKGAUGEvar.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        BLOCKGAUGEvar.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        BLOCKGAUGEvar.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        BLOCKGAUGEvar.GAP = widget.data?.GAP ?? '';
        //
        BLOCKGAUGEvar.preview = widget.data?.preview ?? [];
        BLOCKGAUGEvar.confirmdata = widget.data?.confirmdata ?? [];
        BLOCKGAUGEvar.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        BLOCKGAUGEvar.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        BLOCKGAUGEvar.PICs = widget.data?.Pic ?? '';

        if (BLOCKGAUGEvar.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      // if (widget.trick == 'OK' &&
      //     BLOCKGAUGEvar.PCSleft != '0' &&
      //     BLOCKGAUGEvar.PCS != '' &&
      //     BLOCKGAUGEvar.PCSleft != '' &&
      //     (int.parse(BLOCKGAUGEvar.PCSleft) < int.parse(BLOCKGAUGEvar.PCS))) {
      //   widget.trick = '';
      //   context.read<TRICKER_BLOCKGAUGE_Bloc>().add(TRICKER_BLOCKGAUGEFINISH());
      // }

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<BLOCKGAUGE_Bloc>().add(BLOCKGAUGE_READ());
      });
      BLOCKGAUGEvar.DHtimer = timer;
    }
    return SINGLESHOTAPRmain(
      //------ Left
      LABEL: "APP-INSHES",
      PO: BLOCKGAUGEvar.PO,
      CP: BLOCKGAUGEvar.CP,
      QTY: BLOCKGAUGEvar.QTY,
      PROCESS: BLOCKGAUGEvar.PROCESS,
      CUSLOT: BLOCKGAUGEvar.CUSLOT,
      TPKLOT: BLOCKGAUGEvar.TPKLOT,
      FG: BLOCKGAUGEvar.FG,
      CUSTOMER: BLOCKGAUGEvar.CUSTOMER,
      PART: BLOCKGAUGEvar.PART,
      PARTNAME: BLOCKGAUGEvar.PARTNAME,
      MATERIAL: BLOCKGAUGEvar.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        BLOCKGAUGEvar.ItemPickSELECT = v;

        context
            .read<TRICKER_BLOCKGAUGE_Bloc>()
            .add(TRICKER_BLOCKGAUGEgeteachITEM());
      },
      ItemPick: BLOCKGAUGEvar.ItemPick,
      PCS: BLOCKGAUGEvar.PCS,
      PCSleft: BLOCKGAUGEvar.PCSleft,
      POINTs: BLOCKGAUGEvar.POINTs,
      UNIT: BLOCKGAUGEvar.UNIT,
      INTERSEC: BLOCKGAUGEvar.INTERSEC,
      RESULTFORMAT: BLOCKGAUGEvar.RESULTFORMAT,
      Ghtype: BLOCKGAUGEvar.GRAPHTYPE,
      //------- Bottom
      GOOD: (v) {
        if (BLOCKGAUGEvar.PCS != '') {
          BLOCKGAUGEvar.APPEARANCE = 'Good';
          if (BLOCKGAUGEvar.PCS != '' &&
              BLOCKGAUGEvar.POINTs != '' &&
              BLOCKGAUGEvar.ItemPickSELECT != '') {
            if (int.parse(BLOCKGAUGEvar.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_BLOCKGAUGE_Bloc>()
                  .add(TRICKER_BLOCKGAUGEFINISH());
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
        }
      },
      NOGOOD: (v) {
        if (BLOCKGAUGEvar.PCS != '') {
          if (BLOCKGAUGEvar.PCS != '' &&
              BLOCKGAUGEvar.POINTs != '' &&
              BLOCKGAUGEvar.ItemPickSELECT != '') {
            if (int.parse(BLOCKGAUGEvar.PCSleft) > 0) {
              BLOCKGAUGEvar.APPEARANCE = 'no Good';
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
        }
      },
      preview: BLOCKGAUGEvar.preview,
      confirmdata: BLOCKGAUGEvar.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_BLOCKGAUGE_Bloc>().add(TRICKER_BLOCKGAUGECLEAR());
      },
      BACKPAGE: (v) {
        BLOCKGAUGEvar.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        BLOCKGAUGEvar.ItemPickSELECT = '';
        context
            .read<TRICKER_BLOCKGAUGE_Bloc>()
            .add(TRICKER_BLOCKGAUGESETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_BLOCKGAUGE_Bloc>()
            .add(TRICKER_BLOCKGAUGERESETVALUE());
      },
      ITEMleftUNIT: BLOCKGAUGEvar.ITEMleftUNIT,
      ITEMleftVALUE: BLOCKGAUGEvar.ITEMleftVALUE,
      PICB64: BLOCKGAUGEvar.PICs,
    );
  }
}
