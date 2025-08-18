import 'dart:async';
import 'dart:io';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_parser/math_parser.dart';
import 'package:qc_ui_isn_hes/widget/common/ComInputText.dart';

import '../../bloc/BlocEvent/13-01-CALO001.dart';
import '../../bloc/BlocEvent/13-02-TrickCALO001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwiHGdget.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComYNPopup.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/imgset.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'CALO001var.dart';

class MICROVICKER_CALO001main extends StatelessWidget {
  MICROVICKER_CALO001main({Key? key, this.data}) : super(key: key);
  CALO001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_CALO001_BlocBuffer(data: data);
  }
}

class _TRICKER_CALO001_BlocBuffer extends StatelessWidget {
  _TRICKER_CALO001_BlocBuffer({Key? key, this.data}) : super(key: key);
  CALO001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TRICKER_CALO001_Bloc(),
      child: BlocBuilder<TRICKER_CALO001_Bloc, String>(
        builder: (context, trick) {
          return ROCKWELL_CALO001body(data: data);
        },
      ),
    );
  }
}

class ROCKWELL_CALO001body extends StatefulWidget {
  ROCKWELL_CALO001body({Key? key, this.data}) : super(key: key);
  CALO001SCHEMA? data;

  @override
  State<ROCKWELL_CALO001body> createState() => _ROCKWELL_CALO001bodyState();
}

class _ROCKWELL_CALO001bodyState extends State<ROCKWELL_CALO001body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<CALO001_Bloc>().add(CALO001_READ());
    CALO001var.base64pic01 = imgw;
    CALO001var.valueX = '';
    CALO001var.valueY = '';
    CALO001var.valueZ = '';
    CALO001var.valueI = '';
    CALO001var.Result1 = '';
    CALO001var.Result2 = '';
    CALO001var.Result = '';
    CALO001var.FORMULA = '';
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
    CALO001var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    CALO001var.ItemPickSELECT = '';
    context.read<TRICKER_CALO001_Bloc>().add(TRICKER_CALO001SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 5;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        CALO001var.PO = widget.data?.PO ?? '';
        CALO001var.CP = widget.data?.CP ?? '';
        CALO001var.QTY = widget.data?.QTY ?? '';
        CALO001var.PROCESS = widget.data?.PROCESS ?? '';
        CALO001var.CUSLOT = widget.data?.CUSLOT ?? '';
        CALO001var.TPKLOT = widget.data?.TPKLOT ?? '';
        CALO001var.FG = widget.data?.FG ?? '';
        CALO001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        CALO001var.PART = widget.data?.PART ?? '';
        CALO001var.PARTNAME = widget.data?.PARTNAME ?? '';
        CALO001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        CALO001var.ItemPick = widget.data?.ItemPick ?? [''];
        CALO001var.PCS = widget.data?.PCS ?? '';
        // CALO001var.PCS = '10';
        CALO001var.PCSleft = widget.data?.PCSleft ?? '';
        // CALO001var.PCSleft = '10';
        CALO001var.POINTs = widget.data?.POINTs ?? '';
        // CALO001var.POINTs = '10';
        // if (CALO001var.ItemPickSELECT != "") {
        //   //
        //   if (CALO001var.POINTs == "") {
        //     //
        //     CALO001var.POINTs == "0";
        //   }
        // }
        CALO001var.UNIT = widget.data?.UNIT ?? '';
        // CALO001var.UNIT = 'pcs/lots';
        CALO001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        CALO001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        CALO001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        CALO001var.GAP = widget.data?.GAP ?? '';
        CALO001var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        CALO001var.preview = widget.data?.preview ?? [];
        CALO001var.confirmdata = widget.data?.confirmdata ?? [];
        CALO001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        CALO001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        CALO001var.PICs = widget.data?.Pic ?? '';

        if (CALO001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
            "ITEM STATUS",
            "COMPLETE DATA",
            enumNotificationlist.Success,
          );
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<CALO001_Bloc>().add(CALO001_READ());
      });
      CALO001var.DHtimer = timer;
    }
    return SINGLESHOTHGmain(
      //------ Left
      LABEL: "CALO001",
      PO: CALO001var.PO,
      CP: CALO001var.CP,
      QTY: CALO001var.QTY,
      PROCESS: CALO001var.PROCESS,
      CUSLOT: CALO001var.CUSLOT,
      TPKLOT: CALO001var.TPKLOT,
      FG: CALO001var.FG,
      CUSTOMER: CALO001var.CUSTOMER,
      PART: CALO001var.PART,
      PARTNAME: CALO001var.PARTNAME,
      MATERIAL: CALO001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        CALO001var.ItemPickSELECT = v;
        //

        // if (v.toUpperCase().contains("START")) {
        //   showDialog(
        //     context: context,
        //     barrierDismissible: true,
        //     builder: (BuildContext context) {
        //       return Dialog(
        //         child: SizedBox(
        //             height: 150,
        //             width: 300,
        //             child: Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: Column(
        //                 // mainAxisAlignment: MainAxisAlignment.center,
        //                 // crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   // Align(
        //                   //   alignment: Alignment.topRight,
        //                   //   child: InkWell(
        //                   //     onTap: () {},
        //                   //     child: const SizedBox(
        //                   //       height: 24,
        //                   //       width: 36,
        //                   //       child: Padding(
        //                   //         padding: EdgeInsets.only(right: 12),
        //                   //         child: Center(child: Icon(Icons.close)),
        //                   //       ),
        //                   //     ),
        //                   //   ),
        //                   // ),
        //                   const SizedBox(
        //                     height: 20,
        //                   ),
        //                   Text("New MTO ?"),
        //                   const SizedBox(
        //                     height: 20,
        //                   ),
        //                   Row(
        //                     children: [
        //                       Padding(
        //                         padding: const EdgeInsets.only(left: 15),
        //                         child: InkWell(
        //                           onTap: () {
        //                             CALO001var.iscontrol = true;
        //                             CALO001var.edit = true;
        //                             CALO001var.valueX = "";
        //                             CALO001var.valueY = "";
        //                             CALO001var.valueZ = "";
        //                             CALO001var.valueI = "";

        //                             CALO001var.FORMULA = "";
        //                             CALO001var.Result1 = "";
        //                             CALO001var.Result2 = "";
        //                             CALO001var.Result = "";
        //                             Navigator.pop(context);
        //                           },
        //                           child: Container(
        //                             width: 100,
        //                             height: 40,
        //                             color: Colors.blue,
        //                             child: Center(child: Text("YES")),
        //                           ),
        //                         ),
        //                       ),
        //                       Spacer(),
        //                       Padding(
        //                         padding: const EdgeInsets.only(right: 15),
        //                         child: InkWell(
        //                           onTap: () {
        //                             //
        //                           },
        //                           child: Container(
        //                             width: 100,
        //                             height: 40,
        //                             color: Colors.blue,
        //                             child: Center(child: Text("NO")),
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   )
        //                 ],
        //               ),
        //             )),
        //       );
        //     },
        //   );
        // }

        context.read<TRICKER_CALO001_Bloc>().add(TRICKER_CALO001geteachITEM());
      },
      ItemPick: CALO001var.ItemPick,
      PCS: CALO001var.PCS,
      PCSleft: CALO001var.PCSleft,
      POINTs: CALO001var.POINTs,
      UNIT: CALO001var.UNIT,
      INTERSEC: CALO001var.INTERSEC,
      RESULTFORMAT: CALO001var.RESULTFORMAT,
      Ghtype: CALO001var.GRAPHTYPE,
      GAP: CALO001var.GAP,
      GAPnameList: CALO001var.GAPnameList,
      GAPname: CALO001var.GAPname,
      GAPnamePick: (v) {
        CALO001var.GAPname = v;
        context.read<TRICKER_CALO001_Bloc>().add(TRICKER_CALO001geteachGRAPH());
      },
      //------- Bottom
      // dropdown: SizedBox(
      //   height: 40,
      //   width: 400,
      //   child: AdvanceDropDown(
      //     imgpath: 'assets/icons/icon-down_4@3x.png',
      //     listdropdown: const [
      //       MapEntry("", ""),
      //       MapEntry("GAS-HMV-001", "GAS-HMV-001"),
      //       MapEntry("GAS-HMV-002", "GAS-HMV-002"),
      //       MapEntry("GAS-HMV-003", "GAS-HMV-003"),
      //     ],
      //     onChangeinside: (d, v) {
      //       setState(() {
      //         CALO001var.dropdown = d;
      //       });
      //     },
      //     value: CALO001var.dropdown,
      //     height: 40,
      //     width: 400,
      //   ),
      // ),
      GET: (v) {
        print(CALO001var.PO);
        print(CALO001var.ItemPickSELECT);
        print(CALO001var.GRAPHTYPE);

        double Result1 = 0;
        double Result2 = 0;

        String datastr = CALO001var.GRAPHTYPE
            .replaceAll("D1", CALO001var.valueX)
            .replaceAll("D2", CALO001var.valueY)
            .replaceAll("---", CALO001var.valueZ)
            .replaceAll("---", CALO001var.valueI)
            .toLowerCase();

        List<String> data = datastr.split("|");
        String FORMULA1 = '';
        String FORMULA2 = '';

        if (CALO001var.valueX != '' && CALO001var.valueY != ''
        // &&
        // CALO001var.Result == '' &&
        // CALO001var.Result1 == '' &&
        // CALO001var.Result2 == '' &&
        // CALO001var.valueZ != ''
        ) {
          if (data.length > 0) {
            final definable = MathNodeExpression.getPotentialDefinable(
              data[0],
              hideBuiltIns: true,
            );

            final expression = MathNodeExpression.fromString(
              data[0],
              variableNames: definable.variables,
              isImplicitMultiplication: false,
            );

            final variableValues = <String, double>{};
            for (final variable in definable.variables) {
              print('Enter value for $variable:');
              final double value = double.parse(stdin.readLineSync() as String);
              variableValues[variable] = value;
            }

            final result = expression.calc(MathVariableValues(variableValues));

            print('Result: $result');
            CALO001var.iscontrol = true;
            CALO001var.Result1 = result.toString();
            Result1 = double.parse(result.toString());
            FORMULA1 = data[0];
            CALO001var.FORMULA = CALO001var.GRAPHTYPE;
            CALO001var.Result = Result1.toStringAsFixed(4);
          }
          // if (data.length > 1) {
          //   final definable = MathNodeExpression.getPotentialDefinable(
          //     data[1],
          //     hideBuiltIns: true,
          //   );

          //   final expression = MathNodeExpression.fromString(
          //     data[1],
          //     variableNames: definable.variables,
          //     isImplicitMultiplication: false,
          //   );

          //   final variableValues = <String, double>{};
          //   for (final variable in definable.variables) {
          //     print('Enter value for $variable:');
          //     final double value = double.parse(
          //       stdin.readLineSync() as String,
          //     );
          //     variableValues[variable] = value;
          //   }

          //   final result = expression.calc(
          //     MathVariableValues(variableValues),
          //   );

          //   print('Result: $result');
          //   CALO001var.iscontrol = true;
          //   CALO001var.Result2 = result.toString();
          //   Result2 = double.parse(result.toString());
          //   FORMULA2 = data[1];
          // }
        } else {
          WORNINGpop(context, "Please completed all POINTs");
        }

        // print((CALO001var.ItemPickSELECT).contains("0.15") ? "2" : "0");

        // Dio().post(
        //   GLOserver + 'GETHMVATPOINT',
        //   data: {
        //     "PO": CALO001var.PO,
        //     "NAME_INS": CALO001var.dropdown,
        //     "POINT": (CALO001var.ItemPickSELECT).contains("0.15") ? "2" : "0"
        //   },
        // );
        // if(){

        // }
      },
      ACCEPT: (v) {
        if ((CALO001var.RESULTFORMAT == 'Graph' && CALO001var.GAPname != '') ||
            CALO001var.RESULTFORMAT != 'Graph') {
          if (CALO001var.PCS != '' &&
              CALO001var.POINTs != '' &&
              CALO001var.ItemPickSELECT != '') {
            if (int.parse(CALO001var.POINTs) > CALO001var.confirmdata.length) {
              context.read<TRICKER_CALO001_Bloc>().add(
                TRICKER_CALO001confirmdata(),
              );
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
        if (CALO001var.PCS != '' &&
            CALO001var.POINTs != '' &&
            CALO001var.ItemPickSELECT != '') {
          if (int.parse(CALO001var.POINTs) == CALO001var.confirmdata.length) {
            if (int.parse(CALO001var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context.read<TRICKER_CALO001_Bloc>().add(TRICKER_CALO001FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: CALO001var.preview,
      confirmdatasw: true,
      confirmdata: CALO001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_CALO001_Bloc>().add(TRICKER_CALO001CLEAR());
      },
      BACKPAGE: (v) {
        CALO001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        CALO001var.ItemPickSELECT = '';
        context.read<TRICKER_CALO001_Bloc>().add(TRICKER_CALO001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context.read<TRICKER_CALO001_Bloc>().add(TRICKER_CALO001RESETVALUE());
      },
      ITEMleftUNIT: CALO001var.ITEMleftUNIT,
      ITEMleftVALUE: CALO001var.ITEMleftVALUE,
      PICB64: CALO001var.PICs,
      invaluewid: Container(
        height: 119,
        // color: Colors.amber,
        child: SingleChildScrollView(
          child: Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 40, child: Center(child: Text("D1"))),
                      ComInputText(
                        height: 40,
                        width: 200,
                        isEnabled: CALO001var.edit,
                        isNumberOnly: true,
                        isContr: CALO001var.iscontrol,
                        fnContr: (input) {
                          setState(() {
                            CALO001var.iscontrol = input;
                          });
                        },
                        sValue: CALO001var.valueX,
                        returnfunc: (String s) {
                          setState(() {
                            CALO001var.valueX = s;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 40, child: Center(child: Text("D2"))),
                      ComInputText(
                        height: 40,
                        width: 200,
                        isEnabled: CALO001var.edit,
                        isNumberOnly: true,
                        isContr: CALO001var.iscontrol,
                        fnContr: (input) {
                          setState(() {
                            CALO001var.iscontrol = input;
                          });
                        },
                        sValue: CALO001var.valueY,
                        returnfunc: (String s) {
                          setState(() {
                            CALO001var.valueY = s;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 40, child: Center(child: Text("Result"))),
                      ComInputText(
                        height: 40,
                        width: 200,
                        isEnabled: false,
                        isContr: CALO001var.iscontrol,
                        fnContr: (input) {
                          setState(() {
                            CALO001var.iscontrol = input;
                          });
                        },
                        sValue: CALO001var.Result,
                        returnfunc: (String s) {
                          setState(() {
                            CALO001var.Result = s;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                        child: Center(child: Text("FORMULA")),
                      ),
                      ComInputText(
                        height: 40,
                        width: 200,
                        isEnabled: false,
                        isContr: CALO001var.iscontrol,
                        fnContr: (input) {
                          setState(() {
                            CALO001var.iscontrol = input;
                          });
                        },
                        sValue: CALO001var.FORMULA,
                        returnfunc: (String s) {
                          setState(() {
                            CALO001var.FORMULA = s;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  PicShow(
                    width: 200,
                    height: 100,
                    base64: CALO001var.base64pic01,
                  ),
                  IMGbutton(
                    base64pic: CALO001var.base64pic01,
                    setimg: (img) {
                      CALO001var.base64pic01 = img;
                      // context.read<CALO001_Bloc>().add(CALO001_READ());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
