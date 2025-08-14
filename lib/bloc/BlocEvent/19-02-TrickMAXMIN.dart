import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/P19MAXMIN/MAXMINvar.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoMAXMIN extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_MAXMINgeteachITEM extends TRICKER_Event {}

class TRICKER_MAXMINgeteachGRAPH extends TRICKER_Event {}

class TRICKER_MAXMINconfirmdata extends TRICKER_Event {}

class TRICKER_MAXMINCLEAR extends TRICKER_Event {}

class TRICKER_MAXMINRESETVALUE extends TRICKER_Event {}

class TRICKER_MAXMINSETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_MAXMINFINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_MAXMIN_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_MAXMIN_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoMAXMIN>((event, emit) {
      return _TRICKER_GETINtoMAXMIN('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_MAXMINgeteachITEM>((event, emit) {
      return _TRICKER_MAXMINgeteachITEM('', emit);
    });

    on<TRICKER_MAXMINgeteachGRAPH>((event, emit) {
      return _TRICKER_MAXMINgeteachGRAPH('', emit);
    });

    on<TRICKER_MAXMINconfirmdata>((event, emit) {
      return _TRICKER_MAXMINconfirmdata('', emit);
    });

    on<TRICKER_MAXMINCLEAR>((event, emit) {
      return _TRICKER_MAXMINCLEAR('', emit);
    });

    on<TRICKER_MAXMINRESETVALUE>((event, emit) {
      return _TRICKER_MAXMINRESETVALUE('', emit);
    });

    on<TRICKER_MAXMINSETZERO>((event, emit) {
      return _TRICKER_MAXMINSETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_MAXMINFINISH>((event, emit) {
      return _TRICKER_MAXMINFINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoMAXMIN(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoMAXMIN',
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

  Future<void> _TRICKER_MAXMINgeteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'MAXMIN-geteachITEM',
      data: {
        "ITEMs": MAXMINvar.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_MAXMINgeteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'MAXMIN-geteachGRAPH',
      data: {
        "GAPname": MAXMINvar.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_MAXMINconfirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'MAXMIN-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_MAXMINCLEAR(String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'MAXMIN-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_MAXMINRESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'MAXMIN-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_MAXMINSETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'MAXMIN-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_MAXMINFINISH

  Future<void> _TRICKER_MAXMINFINISH(String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'MAXMIN-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
