import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P2PVDKNG/APPPVDvar.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoAPPPVD extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_APPPVDgeteachITEM extends TRICKER_Event {}

class TRICKER_APPPVDconfirmdata extends TRICKER_Event {}

class TRICKER_APPPVDCLEAR extends TRICKER_Event {}

class TRICKER_APPPVDRESETVALUE extends TRICKER_Event {}

class TRICKER_APPPVDSETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_APPPVDFINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_APPPVD_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_APPPVD_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoAPPPVD>((event, emit) {
      return _TRICKER_GETINtoAPPPVD('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_APPPVDgeteachITEM>((event, emit) {
      return _TRICKER_APPPVDgeteachITEM('', emit);
    });

    on<TRICKER_APPPVDconfirmdata>((event, emit) {
      return _TRICKER_APPPVDconfirmdata('', emit);
    });

    on<TRICKER_APPPVDCLEAR>((event, emit) {
      return _TRICKER_APPPVDCLEAR('', emit);
    });

    on<TRICKER_APPPVDRESETVALUE>((event, emit) {
      return _TRICKER_APPPVDRESETVALUE('', emit);
    });

    on<TRICKER_APPPVDSETZERO>((event, emit) {
      return _TRICKER_APPPVDSETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_APPPVDFINISH>((event, emit) {
      return _TRICKER_APPPVDFINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoAPPPVD(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoAPPPVD',
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

  Future<void> _TRICKER_APPPVDgeteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'APPPVD-geteachITEM',
      data: {
        "ITEMs": APPPVDvar.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_APPPVDconfirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'APPPVD-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_APPPVDCLEAR(String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'APPPVD-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_APPPVDRESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'APPPVD-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_APPPVDSETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'APPPVD-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_APPPVDFINISH

  Future<void> _TRICKER_APPPVDFINISH(String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'APPPVD-FINISH-APR',
      data: {
        "APRitem": APPPVDvar.ItemPickSELECT,
        "APRre": APPPVDvar.APPEARANCE,
      },
    );
    emit('OK');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
