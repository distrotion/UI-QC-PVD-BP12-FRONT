import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P17BLOCKGAUGE/BLOCKGAUGEvar.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoBLOCKGAUGE extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_BLOCKGAUGEgeteachITEM extends TRICKER_Event {}

class TRICKER_BLOCKGAUGEconfirmdata extends TRICKER_Event {}

class TRICKER_BLOCKGAUGECLEAR extends TRICKER_Event {}

class TRICKER_BLOCKGAUGERESETVALUE extends TRICKER_Event {}

class TRICKER_BLOCKGAUGESETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_BLOCKGAUGEFINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_BLOCKGAUGE_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_BLOCKGAUGE_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoBLOCKGAUGE>((event, emit) {
      return _TRICKER_GETINtoBLOCKGAUGE('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_BLOCKGAUGEgeteachITEM>((event, emit) {
      return _TRICKER_BLOCKGAUGEgeteachITEM('', emit);
    });

    on<TRICKER_BLOCKGAUGEconfirmdata>((event, emit) {
      return _TRICKER_BLOCKGAUGEconfirmdata('', emit);
    });

    on<TRICKER_BLOCKGAUGECLEAR>((event, emit) {
      return _TRICKER_BLOCKGAUGECLEAR('', emit);
    });

    on<TRICKER_BLOCKGAUGERESETVALUE>((event, emit) {
      return _TRICKER_BLOCKGAUGERESETVALUE('', emit);
    });

    on<TRICKER_BLOCKGAUGESETZERO>((event, emit) {
      return _TRICKER_BLOCKGAUGESETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_BLOCKGAUGEFINISH>((event, emit) {
      return _TRICKER_BLOCKGAUGEFINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoBLOCKGAUGE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoBLOCKGAUGE',
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

  Future<void> _TRICKER_BLOCKGAUGEgeteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'BLOCKGAUGE-geteachITEM',
      data: {
        "ITEMs": BLOCKGAUGEvar.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_BLOCKGAUGEconfirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'BLOCKGAUGE-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_BLOCKGAUGECLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'BLOCKGAUGE-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_BLOCKGAUGERESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'BLOCKGAUGE-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_BLOCKGAUGESETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'BLOCKGAUGE-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_BLOCKGAUGEFINISH

  Future<void> _TRICKER_BLOCKGAUGEFINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'BLOCKGAUGE-FINISH-APR',
      data: {
        "APRitem": BLOCKGAUGEvar.ItemPickSELECT,
        "APRre": BLOCKGAUGEvar.APPEARANCE,
      },
    );
    emit('OK');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
