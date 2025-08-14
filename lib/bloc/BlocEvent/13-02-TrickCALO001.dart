import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/P13CALO001/CALO001var.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoCALO001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_CALO001geteachITEM extends TRICKER_Event {}

class TRICKER_CALO001geteachGRAPH extends TRICKER_Event {}

class TRICKER_CALO001confirmdata extends TRICKER_Event {}

class TRICKER_CALO001CLEAR extends TRICKER_Event {}

class TRICKER_CALO001RESETVALUE extends TRICKER_Event {}

class TRICKER_CALO001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_CALO001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_CALO001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_CALO001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoCALO001>((event, emit) {
      return _TRICKER_GETINtoCALO001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_CALO001geteachITEM>((event, emit) {
      return _TRICKER_CALO001geteachITEM('', emit);
    });

    on<TRICKER_CALO001geteachGRAPH>((event, emit) {
      return _TRICKER_CALO001geteachGRAPH('', emit);
    });

    on<TRICKER_CALO001confirmdata>((event, emit) {
      return _TRICKER_CALO001confirmdata('', emit);
    });

    on<TRICKER_CALO001CLEAR>((event, emit) {
      return _TRICKER_CALO001CLEAR('', emit);
    });

    on<TRICKER_CALO001RESETVALUE>((event, emit) {
      return _TRICKER_CALO001RESETVALUE('', emit);
    });

    on<TRICKER_CALO001SETZERO>((event, emit) {
      return _TRICKER_CALO001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_CALO001FINISH>((event, emit) {
      return _TRICKER_CALO001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoCALO001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoCALO001',
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
    emit(output);
  }

  Future<void> _TRICKER_CALO001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CALO001-geteachITEM',
      data: {
        "ITEMs": CALO001var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_CALO001geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CALO001-geteachGRAPH',
      data: {
        "GAPname": CALO001var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_CALO001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CALO001-confirmdata',
      data: {
        "PO": CALO001var.PO,
        "CP": CALO001var.CP,
        "VAL1": CALO001var.valueX,
        "VAL2": CALO001var.valueY,
        "VAL3": CALO001var.valueZ,
        "VAL4": CALO001var.valueI,
        "Area": "",
        "FORMULA": CALO001var.FORMULA,
        "Result1": CALO001var.Result1,
        "Result2": CALO001var.Result2,
        "Result": CALO001var.Result,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_CALO001CLEAR(String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CALO001-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_CALO001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CALO001-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_CALO001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CALO001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_CALO001FINISH

  Future<void> _TRICKER_CALO001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      // server + 'CALO001-FINISH-CAL1',
      server + 'CALO001-FINISH',
      data: {
        "PO": CALO001var.PO,
        "CP": CALO001var.CP,
        "VAL1": CALO001var.valueX,
        "VAL2": CALO001var.valueY,
        "VAL3": CALO001var.valueZ,
        "VAL4": CALO001var.valueI,
        "Area": "",
        "FORMULA": CALO001var.FORMULA,
        "Result1": CALO001var.Result1,
        "Result2": CALO001var.Result2,
        "Result": CALO001var.Result,
      },
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
