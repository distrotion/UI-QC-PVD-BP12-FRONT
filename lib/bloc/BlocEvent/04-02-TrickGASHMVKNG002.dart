import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P4GASHMVPVD002/GASHMVPVD002var.dart';

//-------------------------------------------------
String server = GLOserver;
String serverAUTO = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoGASHMVPVD002 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_GASHMVPVD002geteachITEM extends TRICKER_Event {}

class TRICKER_GASHMVPVD002geteachGRAPH extends TRICKER_Event {}

class TRICKER_GASHMVPVD002confirmdata extends TRICKER_Event {}

class TRICKER_GASHMVPVD002confirmdata1 extends TRICKER_Event {}

class TRICKER_GASHMVPVD002confirmdata2 extends TRICKER_Event {}

class TRICKER_GASHMVPVD002confirmdata3 extends TRICKER_Event {}

class TRICKER_GASHMVPVD002CLEAR extends TRICKER_Event {}

class TRICKER_GASHMVPVD002RESETVALUE extends TRICKER_Event {}

class TRICKER_GASHMVPVD002SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_GASHMVPVD002FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_GASHMVPVD002_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_GASHMVPVD002_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoGASHMVPVD002>((event, emit) {
      return _TRICKER_GETINtoGASHMVPVD002('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_GASHMVPVD002geteachITEM>((event, emit) {
      return _TRICKER_GASHMVPVD002geteachITEM('', emit);
    });

    on<TRICKER_GASHMVPVD002geteachGRAPH>((event, emit) {
      return _TRICKER_GASHMVPVD002geteachGRAPH('', emit);
    });

    on<TRICKER_GASHMVPVD002confirmdata>((event, emit) {
      return _TRICKER_GASHMVPVD002confirmdata('', emit);
    });

    on<TRICKER_GASHMVPVD002confirmdata1>((event, emit) {
      return _TRICKER_GASHMVPVD002confirmdata1('', emit);
    });

    on<TRICKER_GASHMVPVD002confirmdata2>((event, emit) {
      return _TRICKER_GASHMVPVD002confirmdata2('', emit);
    });
    //
    on<TRICKER_GASHMVPVD002confirmdata3>((event, emit) {
      return _TRICKER_GASHMVPVD002confirmdata3('', emit);
    });

    on<TRICKER_GASHMVPVD002CLEAR>((event, emit) {
      return _TRICKER_GASHMVPVD002CLEAR('', emit);
    });

    on<TRICKER_GASHMVPVD002RESETVALUE>((event, emit) {
      return _TRICKER_GASHMVPVD002RESETVALUE('', emit);
    });

    on<TRICKER_GASHMVPVD002SETZERO>((event, emit) {
      return _TRICKER_GASHMVPVD002SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_GASHMVPVD002FINISH>((event, emit) {
      return _TRICKER_GASHMVPVD002FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoGASHMVPVD002(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoGASHMVPVD002',
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

  Future<void> _TRICKER_GASHMVPVD002geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD002-geteachITEM',
      data: {
        "ITEMs": GASHMVPVD002var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD002geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD002-geteachGRAPH',
      data: {
        "GAPname": GASHMVPVD002var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD002confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD002-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD002confirmdata1(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.23.10.40:1885/' + 'deptmv02',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD002confirmdata2(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.23.10.40:1885/' + 'surfacemv02',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD002confirmdata3(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.23.10.40:1885/' + 'surfacemv02',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD002CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD002-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD002RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD002-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD002SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD002-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_GASHMVPVD002FINISH

  Future<void> _TRICKER_GASHMVPVD002FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD002-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
