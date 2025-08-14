import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/01-03-SELECTINS.dart';

import '../../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../../data/global.dart';
import '../../../mainBody.dart';
import '../../../styles/TextStyle.dart';
import '../../../widget/onlyINqcui/popup.dart';
import '../../page12.dart';
import '../../page13.dart';
import '../../page14.dart';
import '../../page17.dart';
import '../../page19.dart';
import '../../page2.dart';
import '../../page3.dart';

import '../../page4.dart';
import '../../page5.dart';
import '../../page6.dart';
import '../../page7.dart';
import '../../page8.dart';
import '../../page9.dart';
import '../FIRSTuiMAIN.dart';
import '../FIRSTuiVAR.dart';
import 'p1instrument.dart';

class SELECtINSTRUMENT extends StatelessWidget {
  SELECtINSTRUMENT({
    Key? key,
    this.INSlist,
  }) : super(key: key);
  List<String>? INSlist;
  @override
  Widget build(BuildContext context) {
    return TRICKER_BlocBuffer(
      INSlist: INSlist,
    );
  }
}

class TRICKER_BlocBuffer extends StatelessWidget {
  TRICKER_BlocBuffer({
    Key? key,
    this.INSlist,
  }) : super(key: key);
  List<String>? INSlist;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKERMASTER_Bloc(),
        child: BlocBuilder<TRICKERMASTER_Bloc, String>(
          builder: (context, trick) {
            return SELECtINSTRUMENTbody(
              INSlist: INSlist,
              trick: trick,
            );
          },
        ));
  }
}

class SELECtINSTRUMENTbody extends StatelessWidget {
  SELECtINSTRUMENTbody({
    Key? key,
    this.INSlist,
    this.trick,
  }) : super(key: key);
  List<String>? INSlist;
  String? trick;

  @override
  Widget build(BuildContext context) {
    List<String> _INSlist = INSlist ?? [];
    print("-----------------");
    print(INSlist);
    print(FIRSTUI.SECLECTins);
    print("-----------------");

    if (trick == 'OK') {
      trick = '';
      context.read<TRICKERMASTER_Bloc>().add(TRICKERMASTER_FLUSH());

      if (FIRSTUI.SECLECTins == 'APP-PVD') {
        CuPage = Page2();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
        FIRSTUI.INSnotREADY[0] = 0;
      } else if (FIRSTUI.SECLECTins == 'GAS-HMVPVD-001') {
        CuPage = Page3();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      } else if (FIRSTUI.SECLECTins == 'GAS-HMVPVD-002') {
        CuPage = Page4();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      } else if (FIRSTUI.SECLECTins == 'GAS-HMVPVD-003') {
        CuPage = Page5();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      } else if (FIRSTUI.SECLECTins == 'PVD-SCT-001') {
        CuPage = Page14();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      } else if (FIRSTUI.SECLECTins == 'PVD-MCS-001') {
        CuPage = Page7();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      } else if (FIRSTUI.SECLECTins == 'CTC-XTM-001') {
        CuPage = Page8();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      } else if (FIRSTUI.SECLECTins == 'SPLINEGAUGE') {
        CuPage = Page6();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      } else if (FIRSTUI.SECLECTins == 'CALO-001') {
        CuPage = Page13();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      } else if (FIRSTUI.SECLECTins == 'MAXMIN') {
        CuPage = Page19();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      }
    } else {
      if (FIRSTUI.SECLECTins != '') {
        if (FIRSTUI.SECLECTins == 'APP-PVD') {
          FIRSTUI.INSnotREADY[FIRSTUI.INSint] = 1;
        } else if (FIRSTUI.SECLECTins == 'GAS-HMVPVD-001') {
          FIRSTUI.INSnotREADY[FIRSTUI.INSint] = 1;
        } else if (FIRSTUI.SECLECTins == 'GAS-HMVPVD-002') {
          FIRSTUI.INSnotREADY[FIRSTUI.INSint] = 1;
        } else if (FIRSTUI.SECLECTins == 'GAS-HMVPVD-003') {
          FIRSTUI.INSnotREADY[FIRSTUI.INSint] = 1;
        } else if (FIRSTUI.SECLECTins == 'PVD-SCT-001') {
          FIRSTUI.INSnotREADY[FIRSTUI.INSint] = 1;
        } else if (FIRSTUI.SECLECTins == 'PVD-MCS-001') {
          FIRSTUI.INSnotREADY[FIRSTUI.INSint] = 1;
        } else if (FIRSTUI.SECLECTins == 'CTC-XTM-001') {
          FIRSTUI.INSnotREADY[FIRSTUI.INSint] = 1;
        } else if (FIRSTUI.SECLECTins == 'SPLINEGAUGE') {
          FIRSTUI.INSnotREADY[FIRSTUI.INSint] = 1;
        } else if (FIRSTUI.SECLECTins == 'CALO-001') {
          FIRSTUI.INSnotREADY[FIRSTUI.INSint] = 1;
        } else if (FIRSTUI.SECLECTins == 'MAXMIN') {
          FIRSTUI.INSnotREADY[FIRSTUI.INSint] = 1;
        }

        FIRSTUI.SECLECTins = '';
      } else {
        FIRSTUI.INSnotREADY = [
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0
        ];
      }
    }

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(0)),
                ),
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: SizedBox(
                          child: Row(
                            children: [
                              const Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Text(
                                      "PO",
                                      style: TxtStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Text(
                                      FIRSTUI.POACTIVE,
                                    ),
                                  ))
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: SizedBox(
                          child: Row(
                            children: [
                              const Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Text(
                                      "CP",
                                      style: TxtStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Text(FIRSTUI.CPACTIVE),
                                  ))
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 320,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 600,
                  child: Column(
                    children: [
                      for (int i = 0; i < _INSlist.length; i++)
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                            onTap: () {
                              FIRSTUI.SECLECTins = _INSlist[i];
                              FIRSTUI.INSint = i;
                              print(i);
                              print(FIRSTUI.SECLECTins);
                              if (_INSlist[i] == 'APP-PVD') {
                                context
                                    .read<TRICKERMASTER_Bloc>()
                                    .add(TRICKERMASTER_GETINtoAPPPVD());
                              }
                              if (_INSlist[i] == 'GAS-HMVPVD-001') {
                                context
                                    .read<TRICKERMASTER_Bloc>()
                                    .add(TRICKERMASTER_GETINtoGASHMVPVD001());
                              }
                              if (_INSlist[i] == 'GAS-HMVPVD-002') {
                                context
                                    .read<TRICKERMASTER_Bloc>()
                                    .add(TRICKERMASTER_GETINtoGASHMVPVD002());
                              }
                              if (_INSlist[i] == 'GAS-HMVPVD-003') {
                                context
                                    .read<TRICKERMASTER_Bloc>()
                                    .add(TRICKERMASTER_GETINtoGASHMVPVD003());
                              }
                              if (_INSlist[i] == 'PVD-SCT-001') {
                                context
                                    .read<TRICKERMASTER_Bloc>()
                                    .add(TRICKERMASTER_GETINtoPVDSCT001());
                              }
                              if (_INSlist[i] == 'PVD-MCS-001') {
                                context
                                    .read<TRICKERMASTER_Bloc>()
                                    .add(TRICKERMASTER_GETINtoPVDMCS001());
                              }
                              if (_INSlist[i] == 'CTC-XTM-001') {
                                context
                                    .read<TRICKERMASTER_Bloc>()
                                    .add(TRICKERMASTER_GETINtoCTCXTM001());
                              }
                              if (_INSlist[i] == 'SPLINEGAUGE') {
                                context
                                    .read<TRICKERMASTER_Bloc>()
                                    .add(TRICKERMASTER_GETINtoSPLINEGAUGE());
                              }

                              if (_INSlist[i] == 'CALO-001') {
                                context
                                    .read<TRICKERMASTER_Bloc>()
                                    .add(TRICKERMASTER_GETINtoCALO001());
                              }
                              if (_INSlist[i] == 'MAXMIN') {
                                context
                                    .read<TRICKERMASTER_Bloc>()
                                    .add(TRICKERMASTER_GETINtoMAXMIN());
                              }
                            },
                            child: INSBOX(
                              INS: _INSlist[i],
                              inuse: FIRSTUI.INSnotREADY[i] == 1,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class SELECTins extends StatelessWidget {
//   SELECTins({Key? key, this.ins}) : super(key: key);
//   String? ins;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       color: Colors.blue,
//       child: Center(
//         child: Text(ins ?? '',style: TxtStyle(
//                         color: Colors.black, fontWeight: FontWeight.bold)),
//       ),
//     );
//   }
// }


// for (int i = 0; i < maxins; i++) {
//       INSOUTPUT.add(Padding(
//         padding: const EdgeInsets.all(4.0),
//         child: InkWell(
//           onTap: () {
//             // INSConsoleBox();
//             CuPage = Page2();
//             CuPageLV = 1;
//             MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
//           },
//           child: INSBOX(
//             INS: ' INS ${i + 1}',
//           ),
//         ),
//       ));
//     }


