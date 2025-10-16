import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P14PVDSCT001/PVDSCT001var.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';

//-------------------------------------------------
String server = GLOserver;
String serverAUTO = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoPVDSCT001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_PVDSCT001geteachITEM extends TRICKER_Event {}

class TRICKER_PVDSCT001geteachGRAPH extends TRICKER_Event {}

class TRICKER_PVDSCT001confirmdata extends TRICKER_Event {}

class TRICKER_PVDSCT001confirmdata1 extends TRICKER_Event {}

class TRICKER_PVDSCT001confirmdata2 extends TRICKER_Event {}

class TRICKER_PVDSCT001confirmdata3 extends TRICKER_Event {}

class TRICKER_PVDSCT001CLEAR extends TRICKER_Event {}

class TRICKER_PVDSCT001RESETVALUE extends TRICKER_Event {}

class TRICKER_PVDSCT001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_PVDSCT001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_PVDSCT001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_PVDSCT001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoPVDSCT001>((event, emit) {
      return _TRICKER_GETINtoPVDSCT001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_PVDSCT001geteachITEM>((event, emit) {
      return _TRICKER_PVDSCT001geteachITEM('', emit);
    });

    on<TRICKER_PVDSCT001geteachGRAPH>((event, emit) {
      return _TRICKER_PVDSCT001geteachGRAPH('', emit);
    });

    on<TRICKER_PVDSCT001confirmdata>((event, emit) {
      return _TRICKER_PVDSCT001confirmdata('', emit);
    });

    on<TRICKER_PVDSCT001confirmdata1>((event, emit) {
      return _TRICKER_PVDSCT001confirmdata1('', emit);
    });

    on<TRICKER_PVDSCT001confirmdata2>((event, emit) {
      return _TRICKER_PVDSCT001confirmdata2('', emit);
    });
    //
    on<TRICKER_PVDSCT001confirmdata3>((event, emit) {
      return _TRICKER_PVDSCT001confirmdata3('', emit);
    });

    on<TRICKER_PVDSCT001CLEAR>((event, emit) {
      return _TRICKER_PVDSCT001CLEAR('', emit);
    });

    on<TRICKER_PVDSCT001RESETVALUE>((event, emit) {
      return _TRICKER_PVDSCT001RESETVALUE('', emit);
    });

    on<TRICKER_PVDSCT001SETZERO>((event, emit) {
      return _TRICKER_PVDSCT001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_PVDSCT001FINISH>((event, emit) {
      return _TRICKER_PVDSCT001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoPVDSCT001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoPVDSCT001',
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

  Future<void> _TRICKER_PVDSCT001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'PVDSCT001-geteachITEM',
      data: {
        "ITEMs": PVDSCT001var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_PVDSCT001geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'PVDSCT001-geteachGRAPH',
      data: {
        "GAPname": PVDSCT001var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_PVDSCT001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'PVDSCT001-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_PVDSCT001confirmdata1(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.23.10.40:1900/' + 'BP12PVDSCT001-getauto',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_PVDSCT001confirmdata2(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.23.10.40:1885/' + 'surfacemv03',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_PVDSCT001confirmdata3(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.23.10.40:1885/' + 'surfacemv03',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_PVDSCT001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'PVDSCT001-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_PVDSCT001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'PVDSCT001-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_PVDSCT001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'PVDSCT001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_PVDSCT001FINISH

  Future<void> _TRICKER_PVDSCT001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'PVDSCT001-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
