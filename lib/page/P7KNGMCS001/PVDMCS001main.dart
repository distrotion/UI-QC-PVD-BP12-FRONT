import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/07-01-PVDMCS001.dart';
import '../../bloc/BlocEvent/07-02-TrickPVDMCS001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/QCWIDGET/W1SINGLESHOTIMG/SINGLESHOTIMGwidget.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/imgset.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'PVDMCS001var.dart';

late BuildContext MICROSCOPEPVDMCS001_CONTEXT;

class MICROSCOPE_PVDMCS001main extends StatelessWidget {
  MICROSCOPE_PVDMCS001main({Key? key, this.data}) : super(key: key);
  PVDMCS001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_PVDMCS001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_PVDMCS001_BlocBuffer extends StatelessWidget {
  _TRICKER_PVDMCS001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  PVDMCS001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_PVDMCS001_Bloc(),
        child: BlocBuilder<TRICKER_PVDMCS001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_PVDMCS001body(data: data);
          },
        ));
  }
}

class ROCKWELL_PVDMCS001body extends StatefulWidget {
  ROCKWELL_PVDMCS001body({Key? key, this.data}) : super(key: key);
  PVDMCS001SCHEMA? data;

  @override
  State<ROCKWELL_PVDMCS001body> createState() => _ROCKWELL_PVDMCS001bodyState();
}

class _ROCKWELL_PVDMCS001bodyState extends State<ROCKWELL_PVDMCS001body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
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
    PVDMCS001var.base64pic01 = imgw;
    PVDMCS001var.base64pic02 = imgw;
    PVDMCS001var.base64pic03 = imgw;
    PVDMCS001var.base64pic04 = imgw;
    PVDMCS001var.base64pic05 = imgw;
    PVDMCS001var.base64pic06 = imgw;
    PVDMCS001var.base64pic07 = imgw;
    PVDMCS001var.base64pic08 = imgw;
    PVDMCS001var.base64pic09 = imgw;
    PVDMCS001var.base64pic10 = imgw;
    PVDMCS001var.base64pic11 = imgw;
    PVDMCS001var.base64pic12 = imgw;

    PVDMCS001var.base64pic01data = '';
    PVDMCS001var.base64pic02data = '';
    PVDMCS001var.base64pic03data = '';
    PVDMCS001var.base64pic04data = '';

    PVDMCS001var.base64pic05data = '';
    PVDMCS001var.base64pic06data = '';
    PVDMCS001var.base64pic07data = '';
    PVDMCS001var.base64pic08data = '';
    PVDMCS001var.base64pic09data = '';
    PVDMCS001var.base64pic10data = '';
    PVDMCS001var.base64pic11data = '';
    PVDMCS001var.base64pic12data = '';

    // PVDMCS001var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    PVDMCS001var.ItemPickSELECT = '';
    context.read<TRICKER_PVDMCS001_Bloc>().add(TRICKER_PVDMCS001SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 6;

    MICROSCOPEPVDMCS001_CONTEXT = context;

    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        PVDMCS001var.PO = widget.data?.PO ?? '';
        PVDMCS001var.CP = widget.data?.CP ?? '';
        PVDMCS001var.QTY = widget.data?.QTY ?? '';
        PVDMCS001var.PROCESS = widget.data?.PROCESS ?? '';
        PVDMCS001var.CUSLOT = widget.data?.CUSLOT ?? '';
        PVDMCS001var.TPKLOT = widget.data?.TPKLOT ?? '';
        PVDMCS001var.FG = widget.data?.FG ?? '';
        PVDMCS001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        PVDMCS001var.PART = widget.data?.PART ?? '';
        PVDMCS001var.PARTNAME = widget.data?.PARTNAME ?? '';
        PVDMCS001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        PVDMCS001var.ItemPick = widget.data?.ItemPick ?? [''];
        PVDMCS001var.PCS = widget.data?.PCS ?? '';
        // PVDMCS001var.PCS = '10';
        PVDMCS001var.PCSleft = widget.data?.PCSleft ?? '';
        // PVDMCS001var.PCSleft = '10';
        PVDMCS001var.POINTs = widget.data?.POINTs ?? '';
        // PVDMCS001var.POINTs = '10';
        PVDMCS001var.UNIT = widget.data?.UNIT ?? '';
        // PVDMCS001var.UNIT = 'pcs/lots';
        PVDMCS001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        PVDMCS001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        PVDMCS001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        PVDMCS001var.GAP = widget.data?.GAP ?? '';
        //
        PVDMCS001var.preview = widget.data?.preview ?? [];
        PVDMCS001var.confirmdata = widget.data?.confirmdata ?? [];
        PVDMCS001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        PVDMCS001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        if (PVDMCS001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      // Timer timer = Timer(const Duration(seconds: 1), () {
      //   context.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
      // });
      // PVDMCS001var.DHtimer = timer;
    }

    return SINGLESHOTIMGmain(
      //------ Left
      LABEL: "GAS-MCS-002",
      PO: PVDMCS001var.PO,
      CP: PVDMCS001var.CP,
      QTY: PVDMCS001var.QTY,
      PROCESS: PVDMCS001var.PROCESS,
      CUSLOT: PVDMCS001var.CUSLOT,
      TPKLOT: PVDMCS001var.TPKLOT,
      FG: PVDMCS001var.FG,
      CUSTOMER: PVDMCS001var.CUSTOMER,
      PART: PVDMCS001var.PART,
      PARTNAME: PVDMCS001var.PARTNAME,
      MATERIAL: PVDMCS001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);

        PVDMCS001var.ItemPickSELECT = v;
        //----

        context
            .read<TRICKER_PVDMCS001_Bloc>()
            .add(TRICKER_PVDMCS001geteachITEM());
        PVDMCS001var.base64pic01 = imgw;
        PVDMCS001var.base64pic02 = imgw;
        PVDMCS001var.base64pic03 = imgw;
        PVDMCS001var.base64pic04 = imgw;
        PVDMCS001var.base64pic05 = imgw;
        PVDMCS001var.base64pic06 = imgw;
        PVDMCS001var.base64pic07 = imgw;
        PVDMCS001var.base64pic08 = imgw;
        PVDMCS001var.base64pic09 = imgw;
        PVDMCS001var.base64pic10 = imgw;
        PVDMCS001var.base64pic11 = imgw;
        PVDMCS001var.base64pic12 = imgw;

        PVDMCS001var.iscontrol = true;
        PVDMCS001var.base64pic01data = '';
        PVDMCS001var.base64pic02data = '';
        PVDMCS001var.base64pic03data = '';
        PVDMCS001var.base64pic04data = '';

        PVDMCS001var.base64pic05data = '';
        PVDMCS001var.base64pic06data = '';
        PVDMCS001var.base64pic07data = '';
        PVDMCS001var.base64pic08data = '';
        PVDMCS001var.base64pic09data = '';
        PVDMCS001var.base64pic10data = '';
        PVDMCS001var.base64pic11data = '';
        PVDMCS001var.base64pic12data = '';

        context.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
      },
      ItemPick: PVDMCS001var.ItemPick,
      PCS: PVDMCS001var.PCS,
      PCSleft: PVDMCS001var.PCSleft,
      POINTs: PVDMCS001var.POINTs,
      UNIT: PVDMCS001var.UNIT,
      INTERSEC: PVDMCS001var.INTERSEC,
      RESULTFORMAT: PVDMCS001var.RESULTFORMAT,
      Ghtype: PVDMCS001var.GRAPHTYPE,

      //------- Bottom
      ACCEPT: (v) {
        // print(checkpic());
        if (checkpic()) {
          // if (pointpic()) {
          if (PVDMCS001var.PCS != '' &&
              PVDMCS001var.POINTs != '' &&
              PVDMCS001var.ItemPickSELECT != '') {
            onLoadingFAKEintTIME(context, 3);
            if (int.parse(PVDMCS001var.PCSleft) > 0) {
              context
                  .read<TRICKER_PVDMCS001_Bloc>()
                  .add(TRICKER_PVDMCS001FINISH());
              Timer(const Duration(seconds: 3), () {
                context.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
              });
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
          // } else {
          //   WORNINGpop(context, "Please insert data");
          // }
        } else {
          WORNINGpop(context, "Please upload picture for Compound Layer");
        }
      },
      //-------------
      INSdd: (v, s) {
        PVDMCS001var.selectINS = v;
      },
      INSddData: PVDMCS001var.selectINS,
      PRread: (v) {
        if (PVDMCS001var.ItemPickSELECT.contains("Compound")) {
          PVDMCS001var.iscontrol = true;
          context.read<TRICKER_PVDMCS001_Bloc>().add(TRICKER_PVDMCS001getCP());
        } else if (PVDMCS001var.ItemPickSELECT.contains("Porous")) {
          WORNINGpop(context, "ITEM Porous");
        } else {
          PVDMCS001var.iscontrol = true;
          context.read<TRICKER_PVDMCS001_Bloc>().add(TRICKER_PVDMCS001getCP());
        }
      },
      CPreadbool: PVDMCS001var.ItemPickSELECT.contains("Compound") ||
          !(PVDMCS001var.ItemPickSELECT.contains("Compound") &&
              PVDMCS001var.ItemPickSELECT.contains("Porous")),
      CPread: (v) {
        if (PVDMCS001var.ItemPickSELECT.contains("Porous")) {
          PVDMCS001var.iscontrol = true;
          context.read<TRICKER_PVDMCS001_Bloc>().add(TRICKER_PVDMCS001getPR());
        } else if (PVDMCS001var.ItemPickSELECT.contains("Compound")) {
          //Porous
          WORNINGpop(context, "ITEM Compound");
        } else {
          PVDMCS001var.iscontrol = true;
          context.read<TRICKER_PVDMCS001_Bloc>().add(TRICKER_PVDMCS001getPR());
        }
      },
      PRreadbool: PVDMCS001var.ItemPickSELECT.contains("Porous") ||
          !(PVDMCS001var.ItemPickSELECT.contains("Compound") &&
              PVDMCS001var.ItemPickSELECT.contains("Porous")),
      //-------------
      FINISH: (v) {},
      preview: PVDMCS001var.preview,
      confirmdata: PVDMCS001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {},
      BACKPAGE: (v) {
        PVDMCS001var.base64pic01 = imgw;
        PVDMCS001var.base64pic02 = imgw;
        PVDMCS001var.base64pic03 = imgw;
        PVDMCS001var.base64pic04 = imgw;

        PVDMCS001var.base64pic05 = imgw;
        PVDMCS001var.base64pic06 = imgw;
        PVDMCS001var.base64pic07 = imgw;
        PVDMCS001var.base64pic08 = imgw;
        PVDMCS001var.base64pic09 = imgw;
        PVDMCS001var.base64pic10 = imgw;
        PVDMCS001var.base64pic11 = imgw;
        PVDMCS001var.base64pic12 = imgw;

        PVDMCS001var.base64pic01data = '';
        PVDMCS001var.base64pic02data = '';
        PVDMCS001var.base64pic03data = '';
        PVDMCS001var.base64pic04data = '';

        PVDMCS001var.base64pic05data = '';
        PVDMCS001var.base64pic06data = '';
        PVDMCS001var.base64pic07data = '';
        PVDMCS001var.base64pic08data = '';
        PVDMCS001var.base64pic09data = '';
        PVDMCS001var.base64pic10data = '';
        PVDMCS001var.base64pic11data = '';
        PVDMCS001var.base64pic12data = '';
        // PVDMCS001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        PVDMCS001var.ItemPickSELECT = '';
        context.read<TRICKER_PVDMCS001_Bloc>().add(TRICKER_PVDMCS001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {},
      ITEMleftUNIT: PVDMCS001var.ITEMleftUNIT,
      ITEMleftVALUE: PVDMCS001var.ITEMleftVALUE,
      wchild: Column(
        children: [
          FileUploadButton01(),
          FileUploadButton02(),
          FileUploadButton03(),
          FileUploadButton04(),
          FileUploadButton05(),
          FileUploadButton06(),
          FileUploadButton07(),
          FileUploadButton08(),
          FileUploadButton09(),
          FileUploadButton10(),
          FileUploadButton11(),
          FileUploadButton12(),
        ],
      ),
    );
  }
}

class FileUploadButton01 extends StatefulWidget {
  const FileUploadButton01({Key? key}) : super(key: key);

  @override
  State<FileUploadButton01> createState() => _FileUploadButton01State();
}

class _FileUploadButton01State extends State<FileUploadButton01> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value 1",
            height: 40,
            // isEnabled: false,
            isContr: PVDMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                PVDMCS001var.iscontrol = input;
              });
            },
            sValue: PVDMCS001var.base64pic01data,
            returnfunc: (String s) {
              PVDMCS001var.base64pic01data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: PVDMCS001var.base64pic01,
          ),
          IMGbutton(
            base64pic: PVDMCS001var.base64pic01,
            setimg: (img) {
              PVDMCS001var.base64pic01 = img;
              context.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton02 extends StatefulWidget {
  const FileUploadButton02({Key? key}) : super(key: key);

  @override
  State<FileUploadButton02> createState() => _FileUploadButton02State();
}

class _FileUploadButton02State extends State<FileUploadButton02> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value 2",
            height: 40,
            // isEnabled: false,
            isContr: PVDMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                PVDMCS001var.iscontrol = input;
              });
            },
            sValue: PVDMCS001var.base64pic02data,
            returnfunc: (String s) {
              PVDMCS001var.base64pic02data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: PVDMCS001var.base64pic02,
          ),
          IMGbutton(
            base64pic: PVDMCS001var.base64pic02,
            setimg: (img) {
              PVDMCS001var.base64pic02 = img;
              context.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton03 extends StatefulWidget {
  const FileUploadButton03({Key? key}) : super(key: key);

  @override
  State<FileUploadButton03> createState() => _FileUploadButton03State();
}

class _FileUploadButton03State extends State<FileUploadButton03> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value 3",
            height: 40,
            // isEnabled: false,
            isContr: PVDMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                PVDMCS001var.iscontrol = input;
              });
            },
            sValue: PVDMCS001var.base64pic03data,
            returnfunc: (String s) {
              PVDMCS001var.base64pic03data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: PVDMCS001var.base64pic03,
          ),
          IMGbutton(
            base64pic: PVDMCS001var.base64pic03,
            setimg: (img) {
              PVDMCS001var.base64pic03 = img;
              context.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton04 extends StatefulWidget {
  const FileUploadButton04({Key? key}) : super(key: key);

  @override
  State<FileUploadButton04> createState() => _FileUploadButton04State();
}

class _FileUploadButton04State extends State<FileUploadButton04> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value 4",
            height: 40,
            // isEnabled: false,
            isContr: PVDMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                PVDMCS001var.iscontrol = input;
              });
            },
            sValue: PVDMCS001var.base64pic04data,
            returnfunc: (String s) {
              PVDMCS001var.base64pic04data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: PVDMCS001var.base64pic04,
          ),
          IMGbutton(
            base64pic: PVDMCS001var.base64pic04,
            setimg: (img) {
              PVDMCS001var.base64pic04 = img;
              context.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton05 extends StatefulWidget {
  const FileUploadButton05({Key? key}) : super(key: key);

  @override
  State<FileUploadButton05> createState() => _FileUploadButton05State();
}

class _FileUploadButton05State extends State<FileUploadButton05> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value 5",
            height: 40,
            // isEnabled: false,
            isContr: PVDMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                PVDMCS001var.iscontrol = input;
              });
            },
            sValue: PVDMCS001var.base64pic05data,
            returnfunc: (String s) {
              PVDMCS001var.base64pic05data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: PVDMCS001var.base64pic05,
          ),
          IMGbutton(
            base64pic: PVDMCS001var.base64pic05,
            setimg: (img) {
              PVDMCS001var.base64pic05 = img;
              context.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton06 extends StatefulWidget {
  const FileUploadButton06({Key? key}) : super(key: key);

  @override
  State<FileUploadButton06> createState() => _FileUploadButton06State();
}

class _FileUploadButton06State extends State<FileUploadButton06> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value 6",
            height: 40,
            // isEnabled: false,
            isContr: PVDMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                PVDMCS001var.iscontrol = input;
              });
            },
            sValue: PVDMCS001var.base64pic06data,
            returnfunc: (String s) {
              PVDMCS001var.base64pic06data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: PVDMCS001var.base64pic06,
          ),
          IMGbutton(
            base64pic: PVDMCS001var.base64pic06,
            setimg: (img) {
              PVDMCS001var.base64pic06 = img;
              context.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton07 extends StatefulWidget {
  const FileUploadButton07({Key? key}) : super(key: key);

  @override
  State<FileUploadButton07> createState() => _FileUploadButton07State();
}

class _FileUploadButton07State extends State<FileUploadButton07> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value 7",
            height: 40,
            // isEnabled: false,
            isContr: PVDMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                PVDMCS001var.iscontrol = input;
              });
            },
            sValue: PVDMCS001var.base64pic07data,
            returnfunc: (String s) {
              PVDMCS001var.base64pic07data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: PVDMCS001var.base64pic07,
          ),
          IMGbutton(
            base64pic: PVDMCS001var.base64pic07,
            setimg: (img) {
              PVDMCS001var.base64pic07 = img;
              context.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton08 extends StatefulWidget {
  const FileUploadButton08({Key? key}) : super(key: key);

  @override
  State<FileUploadButton08> createState() => _FileUploadButton08State();
}

class _FileUploadButton08State extends State<FileUploadButton08> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value 8",
            height: 40,
            // isEnabled: false,
            isContr: PVDMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                PVDMCS001var.iscontrol = input;
              });
            },
            sValue: PVDMCS001var.base64pic08data,
            returnfunc: (String s) {
              PVDMCS001var.base64pic08data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: PVDMCS001var.base64pic08,
          ),
          IMGbutton(
            base64pic: PVDMCS001var.base64pic08,
            setimg: (img) {
              PVDMCS001var.base64pic08 = img;
              context.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton09 extends StatefulWidget {
  const FileUploadButton09({Key? key}) : super(key: key);

  @override
  State<FileUploadButton09> createState() => _FileUploadButton09State();
}

class _FileUploadButton09State extends State<FileUploadButton09> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value 9",
            height: 40,
            // isEnabled: false,
            isContr: PVDMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                PVDMCS001var.iscontrol = input;
              });
            },
            sValue: PVDMCS001var.base64pic09data,
            returnfunc: (String s) {
              PVDMCS001var.base64pic09data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: PVDMCS001var.base64pic09,
          ),
          IMGbutton(
            base64pic: PVDMCS001var.base64pic09,
            setimg: (img) {
              PVDMCS001var.base64pic09 = img;
              context.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton10 extends StatefulWidget {
  const FileUploadButton10({Key? key}) : super(key: key);

  @override
  State<FileUploadButton10> createState() => _FileUploadButton10State();
}

class _FileUploadButton10State extends State<FileUploadButton10> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value 10",
            height: 40,
            // isEnabled: false,
            isContr: PVDMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                PVDMCS001var.iscontrol = input;
              });
            },
            sValue: PVDMCS001var.base64pic10data,
            returnfunc: (String s) {
              PVDMCS001var.base64pic10data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: PVDMCS001var.base64pic10,
          ),
          IMGbutton(
            base64pic: PVDMCS001var.base64pic10,
            setimg: (img) {
              PVDMCS001var.base64pic10 = img;
              context.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton11 extends StatefulWidget {
  const FileUploadButton11({Key? key}) : super(key: key);

  @override
  State<FileUploadButton11> createState() => _FileUploadButton11State();
}

class _FileUploadButton11State extends State<FileUploadButton11> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value 11",
            height: 40,
            // isEnabled: false,
            isContr: PVDMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                PVDMCS001var.iscontrol = input;
              });
            },
            sValue: PVDMCS001var.base64pic11data,
            returnfunc: (String s) {
              PVDMCS001var.base64pic11data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: PVDMCS001var.base64pic11,
          ),
          IMGbutton(
            base64pic: PVDMCS001var.base64pic11,
            setimg: (img) {
              PVDMCS001var.base64pic11 = img;
              context.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton12 extends StatefulWidget {
  const FileUploadButton12({Key? key}) : super(key: key);

  @override
  State<FileUploadButton12> createState() => _FileUploadButton12State();
}

class _FileUploadButton12State extends State<FileUploadButton12> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value 12",
            height: 40,
            // isEnabled: false,
            isContr: PVDMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                PVDMCS001var.iscontrol = input;
              });
            },
            sValue: PVDMCS001var.base64pic12data,
            returnfunc: (String s) {
              PVDMCS001var.base64pic12data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: PVDMCS001var.base64pic12,
          ),
          IMGbutton(
            base64pic: PVDMCS001var.base64pic12,
            setimg: (img) {
              PVDMCS001var.base64pic12 = img;
              context.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
            },
          ),
        ],
      ),
    );
  }
}

bool pointpic() {
  bool out = false;
  if (PVDMCS001var.POINTs == '1') {
    if (PVDMCS001var.base64pic01data != '' &&
        (PVDMCS001var.base64pic02data == '' ||
            PVDMCS001var.base64pic02data == '0') &&
        (PVDMCS001var.base64pic03data == '' ||
            PVDMCS001var.base64pic03data == '0') &&
        (PVDMCS001var.base64pic04data == '' ||
            PVDMCS001var.base64pic04data == '0')) {
      out = true;
    }
  } else if (PVDMCS001var.POINTs == '2') {
    if (PVDMCS001var.base64pic01data != '' &&
        PVDMCS001var.base64pic02data != '' &&
        (PVDMCS001var.base64pic03data == '' ||
            PVDMCS001var.base64pic03data == '0') &&
        (PVDMCS001var.base64pic04data == '' ||
            PVDMCS001var.base64pic04data == '0')) {
      out = true;
    }
  } else if (PVDMCS001var.POINTs == '3') {
    if (PVDMCS001var.base64pic01data != '' &&
        PVDMCS001var.base64pic02data != '' &&
        PVDMCS001var.base64pic03data != '' &&
        (PVDMCS001var.base64pic04data == '' ||
            PVDMCS001var.base64pic04data == '0')) {
      out = true;
    }
  } else if (PVDMCS001var.POINTs == '4') {
    if (PVDMCS001var.base64pic01data != '' &&
        PVDMCS001var.base64pic02data != '' &&
        PVDMCS001var.base64pic03data != '' &&
        PVDMCS001var.base64pic04data != '') {
      out = true;
    }
  }

  return out;
}

bool checkpic() {
  bool out = false;
  if (PVDMCS001var.ItemPickSELECT == 'Compound Layer') {
    if (PVDMCS001var.base64pic01 != imgw) {
      out = true;
    }
  } else {
    out = true;
  }
  return out;
}
