import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';

import '../../page/P7KNGMCS001/PVDMCS001main.dart';
import '../../page/P7KNGMCS001/PVDMCS001var.dart';
import '07-01-PVDMCS001.dart';

//-------------------------------------------------
String server = GLOserver;
String serverR = 'http://172.23.10.40:1885/';

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoPVDMCS001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_PVDMCS001geteachITEM extends TRICKER_Event {}

class TRICKER_PVDMCS001geteachGRAPH extends TRICKER_Event {}

class TRICKER_PVDMCS001confirmdata extends TRICKER_Event {}

class TRICKER_PVDMCS001CLEAR extends TRICKER_Event {}

class TRICKER_PVDMCS001RESETVALUE extends TRICKER_Event {}

class TRICKER_PVDMCS001SETZERO extends TRICKER_Event {}

//

class TRICKER_PVDMCS001getPR extends TRICKER_Event {}

class TRICKER_PVDMCS001getCP extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_PVDMCS001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_PVDMCS001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_PVDMCS001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoPVDMCS001>((event, emit) {
      return _TRICKER_GETINtoPVDMCS001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_PVDMCS001geteachITEM>((event, emit) {
      return _TRICKER_PVDMCS001geteachITEM('', emit);
    });

    on<TRICKER_PVDMCS001confirmdata>((event, emit) {
      return _TRICKER_PVDMCS001confirmdata('', emit);
    });

    on<TRICKER_PVDMCS001CLEAR>((event, emit) {
      return _TRICKER_PVDMCS001CLEAR('', emit);
    });

    on<TRICKER_PVDMCS001RESETVALUE>((event, emit) {
      return _TRICKER_PVDMCS001RESETVALUE('', emit);
    });

    on<TRICKER_PVDMCS001SETZERO>((event, emit) {
      return _TRICKER_PVDMCS001SETZERO('', emit);
    });
    //
    on<TRICKER_PVDMCS001getPR>((event, emit) {
      return _TRICKER_PVDMCS001getPR('', emit);
    });

    on<TRICKER_PVDMCS001getCP>((event, emit) {
      return _TRICKER_PVDMCS001getCP('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_PVDMCS001FINISH>((event, emit) {
      return _TRICKER_PVDMCS001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoPVDMCS001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoPVDMCS001',
      data: {
        "PO": FIRSTUI.POACTIVE,
        "CP": FIRSTUI.CPACTIVE,
        "USER": USERDATA.NAME,
        "USERID": USERDATA.ID,
      },
    );
    String output = '';
    if (response.statusCode == 200) {
      var databuff = response.data;
      if (databuff.toString() == 'OK') {
        output = 'OK';
      } else {
        output = 'NOK';
      }
    } else {
      //
    }
    MICROSCOPEPVDMCS001_CONTEXT.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
    emit(output);
  }

  Future<void> _TRICKER_PVDMCS001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'PVDMCS001-geteachITEM',
      data: {
        "ITEMs": PVDMCS001var.ItemPickSELECT,
      },
    );
    MICROSCOPEPVDMCS001_CONTEXT.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
    emit('');
  }

  Future<void> _TRICKER_PVDMCS001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'PVDMCS001-confirmdata',
      data: {},
    );
    MICROSCOPEPVDMCS001_CONTEXT.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
    emit('');
  }

  Future<void> _TRICKER_PVDMCS001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'PVDMCS001-CLEAR',
      data: {},
    );
    MICROSCOPEPVDMCS001_CONTEXT.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
    emit('');
  }

  Future<void> _TRICKER_PVDMCS001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'PVDMCS001-RESETVALUE',
      data: {},
    );
    MICROSCOPEPVDMCS001_CONTEXT.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
    emit('');
  }

  Future<void> _TRICKER_PVDMCS001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'PVDMCS001-SETZERO',
      data: {},
    );
    emit('');
  }

  //
  Future<void> _TRICKER_PVDMCS001getPR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      serverR + 'getPR',
      data: {
        "MC": PVDMCS001var.selectINS,
      },
    );
    String output = '';
    if (response.statusCode == 200) {
      var databuff = response.data;
      PVDMCS001var.base64pic01data =
          databuff['DATA1'] != null ? databuff['DATA1'].toString() : "";
      PVDMCS001var.base64pic02data =
          databuff['DATA2'] != null ? databuff['DATA2'].toString() : "";
      PVDMCS001var.base64pic03data =
          databuff['DATA3'] != null ? databuff['DATA3'].toString() : "";
      PVDMCS001var.base64pic04data =
          databuff['DATA4'] != null ? databuff['DATA4'].toString() : "";
    } else {
      //
    }
    MICROSCOPEPVDMCS001_CONTEXT.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
    emit(output);
  }

  Future<void> _TRICKER_PVDMCS001getCP(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      serverR + 'getCP',
      data: {
        "MC": PVDMCS001var.selectINS,
      },
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      PVDMCS001var.base64pic01data =
          databuff['DATA1'] != null ? databuff['DATA1'].toString() : "";
      PVDMCS001var.base64pic02data =
          databuff['DATA2'] != null ? databuff['DATA2'].toString() : "";
      PVDMCS001var.base64pic03data =
          databuff['DATA3'] != null ? databuff['DATA3'].toString() : "";
      PVDMCS001var.base64pic04data =
          databuff['DATA4'] != null ? databuff['DATA4'].toString() : "";
    } else {
      //
    }
    MICROSCOPEPVDMCS001_CONTEXT.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_PVDMCS001FINISH

  Future<void> _TRICKER_PVDMCS001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'PVDMCS001-FINISH-IMG',
      data: {
        "IMG01": PVDMCS001var.base64pic01,
        "IMG02": PVDMCS001var.base64pic02,
        "IMG03": PVDMCS001var.base64pic03,
        "IMG04": PVDMCS001var.base64pic04,
        "IMG05": PVDMCS001var.base64pic05,
        "IMG06": PVDMCS001var.base64pic06,
        "IMG07": PVDMCS001var.base64pic07,
        "IMG08": PVDMCS001var.base64pic08,
        "IMG09": PVDMCS001var.base64pic09,
        "IMG10": PVDMCS001var.base64pic10,
        "IMG11": PVDMCS001var.base64pic11,
        "IMG12": PVDMCS001var.base64pic12,
        "IMG01data": PVDMCS001var.base64pic01data,
        "IMG02data": PVDMCS001var.base64pic02data,
        "IMG03data": PVDMCS001var.base64pic03data,
        "IMG04data": PVDMCS001var.base64pic04data,
        "IMG05data": PVDMCS001var.base64pic05data,
        "IMG06data": PVDMCS001var.base64pic06data,
        "IMG07data": PVDMCS001var.base64pic07data,
        "IMG08data": PVDMCS001var.base64pic08data,
        "IMG09data": PVDMCS001var.base64pic09data,
        "IMG10data": PVDMCS001var.base64pic10data,
        "IMG11data": PVDMCS001var.base64pic11data,
        "IMG12data": PVDMCS001var.base64pic12data,
      },
    );
    if (response.statusCode == 200) {
      MICROSCOPEPVDMCS001_CONTEXT.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
    }

    emit('OK');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    MICROSCOPEPVDMCS001_CONTEXT.read<PVDMCS001_Bloc>().add(PVDMCS001_READ());
    emit('');
  }
}
