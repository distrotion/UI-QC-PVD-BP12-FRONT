import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P6SPLINESIZE001/SPLINESIZE001var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoSPLINEGAUGE extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_SPLINEGAUGEgeteachITEM extends TRICKER_Event {}

class TRICKER_SPLINEGAUGEgeteachGRAPH extends TRICKER_Event {}

class TRICKER_SPLINEGAUGEconfirmdata extends TRICKER_Event {}

class TRICKER_SPLINEGAUGEpreview extends TRICKER_Event {}

class TRICKER_SPLINEGAUGECLEAR extends TRICKER_Event {}

class TRICKER_SPLINEGAUGERESETVALUE extends TRICKER_Event {}

class TRICKER_SPLINEGAUGESETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_SPLINEGAUGEFINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_SPLINEGAUGE_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_SPLINEGAUGE_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoSPLINEGAUGE>((event, emit) {
      return _TRICKER_GETINtoSPLINEGAUGE('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_SPLINEGAUGEgeteachITEM>((event, emit) {
      return _TRICKER_SPLINEGAUGEgeteachITEM('', emit);
    });

    on<TRICKER_SPLINEGAUGEpreview>((event, emit) {
      return _TRICKER_SPLINEGAUGEpreview('', emit);
    });

    on<TRICKER_SPLINEGAUGEgeteachGRAPH>((event, emit) {
      return _TRICKER_SPLINEGAUGEgeteachGRAPH('', emit);
    });

    on<TRICKER_SPLINEGAUGEconfirmdata>((event, emit) {
      return _TRICKER_SPLINEGAUGEconfirmdata('', emit);
    });

    on<TRICKER_SPLINEGAUGECLEAR>((event, emit) {
      return _TRICKER_SPLINEGAUGECLEAR('', emit);
    });

    on<TRICKER_SPLINEGAUGERESETVALUE>((event, emit) {
      return _TRICKER_SPLINEGAUGERESETVALUE('', emit);
    });

    on<TRICKER_SPLINEGAUGESETZERO>((event, emit) {
      return _TRICKER_SPLINEGAUGESETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_SPLINEGAUGEFINISH>((event, emit) {
      return _TRICKER_SPLINEGAUGEFINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoSPLINEGAUGE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoSPLINEGAUGE',
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

  Future<void> _TRICKER_SPLINEGAUGEgeteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SPLINEGAUGE-geteachITEM',
      data: {
        "ITEMs": SPLINEGAUGEvar.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_SPLINEGAUGEgeteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SPLINEGAUGE-geteachGRAPH',
      data: {
        "GAPname": SPLINEGAUGEvar.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_SPLINEGAUGEconfirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SPLINEGAUGE-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SPLINEGAUGECLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SPLINEGAUGE-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SPLINEGAUGERESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SPLINEGAUGE-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SPLINEGAUGESETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SPLINEGAUGE-SETZERO',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SPLINEGAUGEpreview(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SPLINEGAUGE-preview',
      data: [
        {
          "V1": "GOOD",
          "V2": SPLINEGAUGEvar.SINGLEINPUT,
          "V3": "NOGOOD",
          "V4": SPLINEGAUGEvar.SINGLEINPUTNG,
        }
      ],
    );
    if (response.statusCode == 200) {
      final response = await Dio().post(
        server + 'SPLINEGAUGE-confirmdata',
        data: {},
      );
    }
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_SPLINEGAUGEFINISH

  Future<void> _TRICKER_SPLINEGAUGEFINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SPLINEGAUGE-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
