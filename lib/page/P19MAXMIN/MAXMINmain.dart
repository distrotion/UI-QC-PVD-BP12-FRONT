import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/19-01-MAXMIN.dart';
import '../../bloc/BlocEvent/19-02-TrickMAXMIN.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwiHGdget.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'MAXMINvar.dart';

class MICROVICKER_MAXMINmain extends StatelessWidget {
  MICROVICKER_MAXMINmain({Key? key, this.data}) : super(key: key);
  MAXMINSCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_MAXMIN_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_MAXMIN_BlocBuffer extends StatelessWidget {
  _TRICKER_MAXMIN_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  MAXMINSCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_MAXMIN_Bloc(),
        child: BlocBuilder<TRICKER_MAXMIN_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_MAXMINbody(data: data);
          },
        ));
  }
}

class ROCKWELL_MAXMINbody extends StatefulWidget {
  ROCKWELL_MAXMINbody({Key? key, this.data}) : super(key: key);
  MAXMINSCHEMA? data;

  @override
  State<ROCKWELL_MAXMINbody> createState() => _ROCKWELL_MAXMINbodyState();
}

class _ROCKWELL_MAXMINbodyState extends State<ROCKWELL_MAXMINbody> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<MAXMIN_Bloc>().add(MAXMIN_READ());
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
    MAXMINvar.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    MAXMINvar.ItemPickSELECT = '';
    context.read<TRICKER_MAXMIN_Bloc>().add(TRICKER_MAXMINSETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 5;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        MAXMINvar.PO = widget.data?.PO ?? '';
        MAXMINvar.CP = widget.data?.CP ?? '';
        MAXMINvar.QTY = widget.data?.QTY ?? '';
        MAXMINvar.PROCESS = widget.data?.PROCESS ?? '';
        MAXMINvar.CUSLOT = widget.data?.CUSLOT ?? '';
        MAXMINvar.TPKLOT = widget.data?.TPKLOT ?? '';
        MAXMINvar.FG = widget.data?.FG ?? '';
        MAXMINvar.CUSTOMER = widget.data?.CUSTOMER ?? '';
        MAXMINvar.PART = widget.data?.PART ?? '';
        MAXMINvar.PARTNAME = widget.data?.PARTNAME ?? '';
        MAXMINvar.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        MAXMINvar.ItemPick = widget.data?.ItemPick ?? [''];
        MAXMINvar.PCS = widget.data?.PCS ?? '';
        // MAXMINvar.PCS = '10';
        MAXMINvar.PCSleft = widget.data?.PCSleft ?? '';
        // MAXMINvar.PCSleft = '10';
        MAXMINvar.POINTs = widget.data?.POINTs ?? '';
        // MAXMINvar.POINTs = '10';
        // if (MAXMINvar.ItemPickSELECT != "") {
        //   //
        //   if (MAXMINvar.POINTs == "") {
        //     //
        //     MAXMINvar.POINTs == "0";
        //   }
        // }
        MAXMINvar.UNIT = widget.data?.UNIT ?? '';
        // MAXMINvar.UNIT = 'pcs/lots';
        MAXMINvar.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        MAXMINvar.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        MAXMINvar.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        MAXMINvar.GAP = widget.data?.GAP ?? '';
        MAXMINvar.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        MAXMINvar.preview = widget.data?.preview ?? [];
        MAXMINvar.confirmdata = widget.data?.confirmdata ?? [];
        MAXMINvar.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        MAXMINvar.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        MAXMINvar.PICs = widget.data?.Pic ?? '';

        if (MAXMINvar.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<MAXMIN_Bloc>().add(MAXMIN_READ());
      });
      MAXMINvar.DHtimer = timer;
    }
    return SINGLESHOTHGmain(
      //------ Left
      LABEL: "MAXMIN",
      confirmdatasw: true,
      PO: MAXMINvar.PO,
      CP: MAXMINvar.CP,
      QTY: MAXMINvar.QTY,
      PROCESS: MAXMINvar.PROCESS,
      CUSLOT: MAXMINvar.CUSLOT,
      TPKLOT: MAXMINvar.TPKLOT,
      FG: MAXMINvar.FG,
      CUSTOMER: MAXMINvar.CUSTOMER,
      PART: MAXMINvar.PART,
      PARTNAME: MAXMINvar.PARTNAME,
      MATERIAL: MAXMINvar.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        MAXMINvar.ItemPickSELECT = v;
        //
        context.read<TRICKER_MAXMIN_Bloc>().add(TRICKER_MAXMINgeteachITEM());
      },
      ItemPick: MAXMINvar.ItemPick,
      PCS: MAXMINvar.PCS,
      PCSleft: MAXMINvar.PCSleft,
      POINTs: MAXMINvar.POINTs,
      UNIT: MAXMINvar.UNIT,
      INTERSEC: MAXMINvar.INTERSEC,
      RESULTFORMAT: MAXMINvar.RESULTFORMAT,
      Ghtype: MAXMINvar.GRAPHTYPE,
      GAP: MAXMINvar.GAP,
      GAPnameList: MAXMINvar.GAPnameList,
      GAPname: MAXMINvar.GAPname,
      GAPnamePick: (v) {
        MAXMINvar.GAPname = v;
        context.read<TRICKER_MAXMIN_Bloc>().add(TRICKER_MAXMINgeteachGRAPH());
      },
      //------- Bottom
      dropdown: SizedBox(
        height: 40,
        width: 400,
        child: AdvanceDropDown(
          imgpath: 'assets/icons/icon-down_4@3x.png',
          listdropdown: const [
            MapEntry("", ""),
            MapEntry("PVD-MCS-001", "PVD-MCS-001"),

            //
          ],
          onChangeinside: (d, v) {
            setState(() {
              MAXMINvar.dropdown = d;
            });
          },
          value: MAXMINvar.dropdown,
          height: 40,
          width: 400,
        ),
      ),
      GET: (v) {
        print(MAXMINvar.PO);
        print(MAXMINvar.ItemPickSELECT);
        print((MAXMINvar.ItemPickSELECT).contains("0.15") ? "2" : "0");

        Dio().post(
          GLOserver + 'GETMAXMINPOINT',
          data: {
            "PO": MAXMINvar.PO,
            "NAME_INS": MAXMINvar.dropdown,
            // "POINT": (MAXMINvar.ItemPickSELECT).contains("0.15") ? "2" : "0"
          },
        );
      },
      ACCEPT: (v) {
        if ((MAXMINvar.RESULTFORMAT == 'Graph' && MAXMINvar.GAPname != '') ||
            MAXMINvar.RESULTFORMAT != 'Graph') {
          if (MAXMINvar.PCS != '' &&
              MAXMINvar.POINTs != '' &&
              MAXMINvar.ItemPickSELECT != '') {
            if (int.parse(MAXMINvar.POINTs) > MAXMINvar.confirmdata.length) {
              context
                  .read<TRICKER_MAXMIN_Bloc>()
                  .add(TRICKER_MAXMINconfirmdata());
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
        if (MAXMINvar.PCS != '' &&
            MAXMINvar.POINTs != '' &&
            MAXMINvar.ItemPickSELECT != '') {
          if (int.parse(MAXMINvar.POINTs) == MAXMINvar.confirmdata.length) {
            if (int.parse(MAXMINvar.PCSleft) > 0) {
              onLoadingFAKE(context);
              context.read<TRICKER_MAXMIN_Bloc>().add(TRICKER_MAXMINFINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: MAXMINvar.preview,
      confirmdata: MAXMINvar.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_MAXMIN_Bloc>().add(TRICKER_MAXMINCLEAR());
      },
      BACKPAGE: (v) {
        MAXMINvar.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        MAXMINvar.ItemPickSELECT = '';
        context.read<TRICKER_MAXMIN_Bloc>().add(TRICKER_MAXMINSETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context.read<TRICKER_MAXMIN_Bloc>().add(TRICKER_MAXMINRESETVALUE());
      },
      ITEMleftUNIT: MAXMINvar.ITEMleftUNIT,
      ITEMleftVALUE: MAXMINvar.ITEMleftVALUE,
      PICB64: MAXMINvar.PICs,
    );
  }
}
