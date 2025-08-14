import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P5GASHMVPVD003/GASHMVPVD003var.dart';

//-------------------------------------------------
String server = GLOserver;
String serverAUTO = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoGASHMVPVD003 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_GASHMVPVD003geteachITEM extends TRICKER_Event {}

class TRICKER_GASHMVPVD003geteachGRAPH extends TRICKER_Event {}

class TRICKER_GASHMVPVD003confirmdata extends TRICKER_Event {}

class TRICKER_GASHMVPVD003confirmdata1 extends TRICKER_Event {}

class TRICKER_GASHMVPVD003confirmdata2 extends TRICKER_Event {}

class TRICKER_GASHMVPVD003confirmdata3 extends TRICKER_Event {}

class TRICKER_GASHMVPVD003CLEAR extends TRICKER_Event {}

class TRICKER_GASHMVPVD003RESETVALUE extends TRICKER_Event {}

class TRICKER_GASHMVPVD003SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_GASHMVPVD003FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_GASHMVPVD003_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_GASHMVPVD003_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoGASHMVPVD003>((event, emit) {
      return _TRICKER_GETINtoGASHMVPVD003('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_GASHMVPVD003geteachITEM>((event, emit) {
      return _TRICKER_GASHMVPVD003geteachITEM('', emit);
    });

    on<TRICKER_GASHMVPVD003geteachGRAPH>((event, emit) {
      return _TRICKER_GASHMVPVD003geteachGRAPH('', emit);
    });

    on<TRICKER_GASHMVPVD003confirmdata>((event, emit) {
      return _TRICKER_GASHMVPVD003confirmdata('', emit);
    });

    on<TRICKER_GASHMVPVD003confirmdata1>((event, emit) {
      return _TRICKER_GASHMVPVD003confirmdata1('', emit);
    });

    on<TRICKER_GASHMVPVD003confirmdata2>((event, emit) {
      return _TRICKER_GASHMVPVD003confirmdata2('', emit);
    });
    //
    on<TRICKER_GASHMVPVD003confirmdata3>((event, emit) {
      return _TRICKER_GASHMVPVD003confirmdata3('', emit);
    });

    on<TRICKER_GASHMVPVD003CLEAR>((event, emit) {
      return _TRICKER_GASHMVPVD003CLEAR('', emit);
    });

    on<TRICKER_GASHMVPVD003RESETVALUE>((event, emit) {
      return _TRICKER_GASHMVPVD003RESETVALUE('', emit);
    });

    on<TRICKER_GASHMVPVD003SETZERO>((event, emit) {
      return _TRICKER_GASHMVPVD003SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_GASHMVPVD003FINISH>((event, emit) {
      return _TRICKER_GASHMVPVD003FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoGASHMVPVD003(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoGASHMVPVD003',
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

  Future<void> _TRICKER_GASHMVPVD003geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD003-geteachITEM',
      data: {
        "ITEMs": GASHMVPVD003var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD003geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD003-geteachGRAPH',
      data: {
        "GAPname": GASHMVPVD003var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD003confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD003-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD003confirmdata1(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.101.33.151:1880/' + 'deptmv03',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD003confirmdata2(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.101.33.151:1880/' + 'surfacemv03',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD003confirmdata3(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.101.33.151:1880/' + 'surfacemv03',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD003CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD003-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD003RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD003-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_GASHMVPVD003SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD003-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_GASHMVPVD003FINISH

  Future<void> _TRICKER_GASHMVPVD003FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GASHMVPVD003-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
