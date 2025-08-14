import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P8CTCXTM001/CTCXTM001var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoCTCXTM001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_CTCXTM001geteachITEM extends TRICKER_Event {}

class TRICKER_CTCXTM001geteachGRAPH extends TRICKER_Event {}

class TRICKER_CTCXTM001preview extends TRICKER_Event {}

class TRICKER_CTCXTM001confirmdata extends TRICKER_Event {}

class TRICKER_CTCXTM001CLEAR extends TRICKER_Event {}

class TRICKER_CTCXTM001RESETVALUE extends TRICKER_Event {}

class TRICKER_CTCXTM001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_CTCXTM001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_CTCXTM001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_CTCXTM001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoCTCXTM001>((event, emit) {
      return _TRICKER_GETINtoCTCXTM001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_CTCXTM001geteachITEM>((event, emit) {
      return _TRICKER_CTCXTM001geteachITEM('', emit);
    });

    on<TRICKER_CTCXTM001geteachGRAPH>((event, emit) {
      return _TRICKER_CTCXTM001geteachGRAPH('', emit);
    });

    on<TRICKER_CTCXTM001preview>((event, emit) {
      return _TRICKER_CTCXTM001preview('', emit);
    });

    on<TRICKER_CTCXTM001confirmdata>((event, emit) {
      return _TRICKER_CTCXTM001confirmdata('', emit);
    });

    on<TRICKER_CTCXTM001CLEAR>((event, emit) {
      return _TRICKER_CTCXTM001CLEAR('', emit);
    });

    on<TRICKER_CTCXTM001RESETVALUE>((event, emit) {
      return _TRICKER_CTCXTM001RESETVALUE('', emit);
    });

    on<TRICKER_CTCXTM001SETZERO>((event, emit) {
      return _TRICKER_CTCXTM001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_CTCXTM001FINISH>((event, emit) {
      return _TRICKER_CTCXTM001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoCTCXTM001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoCTCXTM001',
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

  Future<void> _TRICKER_CTCXTM001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CTCXTM001-geteachITEM',
      data: {
        "ITEMs": CTCXTM001var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_CTCXTM001geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CTCXTM001-geteachGRAPH',
      data: {
        "GAPname": CTCXTM001var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_CTCXTM001preview(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CTCXTM001-preview',
      data: [
        {"V1": "LCRUVS", "V2": CTCXTM001var.SINGLEINPUT}
      ],
    );
    if (response.statusCode == 200) {
      final response = await Dio().post(
        server + 'CTCXTM001-confirmdata',
        data: {},
      );
    }
    emit('');
  }

  Future<void> _TRICKER_CTCXTM001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CTCXTM001-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_CTCXTM001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CTCXTM001-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_CTCXTM001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CTCXTM001-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_CTCXTM001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CTCXTM001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_CTCXTM001FINISH

  Future<void> _TRICKER_CTCXTM001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CTCXTM001-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
