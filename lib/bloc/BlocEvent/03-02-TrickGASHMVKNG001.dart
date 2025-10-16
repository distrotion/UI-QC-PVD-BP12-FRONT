import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P3GASHMVPVD001/GASHMVPVD001var.dart';

//-------------------------------------------------
String server = GLOserver;
String serverAUTO = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoGASHMVPVD001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_GASHMVPVD001geteachITEM extends TRICKER_Event {}

class TRICKER_GASHMVPVD001geteachGRAPH extends TRICKER_Event {}

class TRICKER_GASHMVPVD001confirmdata extends TRICKER_Event {}

class TRICKER_GASHMVPVD001confirmdata1 extends TRICKER_Event {}

class TRICKER_GASHMVPVD001confirmdata2 extends TRICKER_Event {}

class TRICKER_GASHMVPVD001confirmdata3 extends TRICKER_Event {}

class TRICKER_GASHMVPVD001CLEAR extends TRICKER_Event {}

class TRICKER_GASHMVPVD001RESETVALUE extends TRICKER_Event {}

class TRICKER_GASHMVPVD001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_GASHMVPVD001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_GASHMVPVD001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_GASHMVPVD001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoGASHMVPVD001>((event, emit) {
      return _TRICKER_GETINtoGASHMVPVD001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_GASHMVPVD001geteachITEM>((event, emit) {
      return _TRICKER_GASHMVPVD001geteachITEM('', emit);
    });

    on<TRICKER_GASHMVPVD001geteachGRAPH>((event, emit) {
      return _TRICKER_GASHMVPVD001geteachGRAPH('', emit);
    });

    on<TRICKER_GASHMVPVD001confirmdata>((event, emit) {
      return _TRICKER_GASHMVPVD001confirmdata('', emit);
    });

    on<TRICKER_GASHMVPVD001confirmdata1>((event, emit) {
      return _TRICKER_GASHMVPVD001confirmdata1('', emit);
    });

    on<TRICKER_GASHMVPVD001confirmdata2>((event, emit) {
      return _TRICKER_GASHMVPVD001confirmdata2('', emit);
    });

    on<TRICKER_GASHMVPVD001confirmdata3>((event, emit) {
      return _TRICKER_GASHMVPVD001confirmdata3('', emit);
    });

    on<TRICKER_GASHMVPVD001CLEAR>((event, emit) {
      return _TRICKER_GASHMVPVD001CLEAR('', emit);
    });

    on<TRICKER_GASHMVPVD001RESETVALUE>((event, emit) {
      return _TRICKER_GASHMVPVD001RESETVALUE('', emit);
    });

    on<TRICKER_GASHMVPVD001SETZERO>((event, emit) {
      return _TRICKER_GASHMVPVD001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_GASHMVPVD001FINISH>((event, emit) {
      return _TRICKER_GASHMVPVD001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoGASHMVPVD001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoGASHMVPVD001',
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

  Future<void> _TRICKER_GASHMVPVD001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD001-geteachITEM',
      data: {
        "ITEMs": GASHMVPVD001var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD001geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD001-geteachGRAPH',
      data: {
        "GAPname": GASHMVPVD001var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD001-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD001confirmdata1(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.23.10.40:1885/' + 'deptmv01',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD001confirmdata2(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.23.10.40:1885/' + 'surfacemv01',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD001confirmdata3(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.23.10.40:1885/' + 'surfacemv01',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD001-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD001-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_GASHMVPVD001FINISH

  Future<void> _TRICKER_GASHMVPVD001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD001-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
