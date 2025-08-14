import 'package:fl_chart/fl_chart.dart';

import '../../widget/common/imgset.dart';

class ReportPDFcommonlistvar {
  static bool iscontrol = false;
  static bool canf = true;
  static String PO = '';

  static String STATUS = '';

  static String CUSTOMER = '';
  static String PROCESS = '';
  static String PARTNAME = '';
  static String PARTNO = '';
  static String CUSLOT = '';
  static String TPKLOT = '';
  static String MATERIAL = '';
  static String QTY = '';

  static String PICstd = '';
  static String PIC01 = '';
  static String PIC02 = '';
  static String TYPE = '-';
  static String SCMASKTYPE = SCMASK03;
  static String SCMASKTYPEonTop = '';
  static List<rawlist> rawlistHardness = [];
  static List<rawlist> rawlistCompound = [];
  static List<rawlist> rawlistRoughness = [];
  static List<rawlist> rawlistCORE = [];

  static List<List<rawlist>> rawlistDATA = [];

  static String INSBY = '';
  static String CHECKBY = '';
  static String APPBY = '';

  //rawlistCORE

  static String MATERIALEDIT = '';

  static List<rawlist> rawlistGraph = [];
  static rawlist rawlistGraphCore = rawlist();

  static String remark = '';

  static String PASS = '';

  static String commp = 'Compound layer';

  static String INC01 = '';
  static String INC02 = '';

  static String SignInsBy = '';

  static String QTYEDIT = '';
  static String INCresult = '';

  static List<ReportPDFCommonlist> datalist = [
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
  ];
  static List<ReportPDFCommonlist> datalist_ic = [
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
  ];
  static List<FlSpot> graphupper = [];
  static List<FlSpot> graphdata = [];
  static List<FlSpot> graphdata2 = [];
  static List<FlSpot> graphdata3 = [];
  static List<FlSpot> graphdata4 = [];
  static List<FlSpot> graphunder = [];

  static List<String> Listitemname = [];
}

class ReportPDFCommonlist {
  ReportPDFCommonlist({
    this.ITEM = '',
    this.ITEMname = '',
    this.METHOD = '',
    this.METHODname = '',
    this.SCMARK = '',
    this.FREQ = '',
    this.SPECIFICATION = '',
    this.SPECIFICATIONname = '',
    this.SPECIFICATIONve = '',
    this.RESULT = '',
    this.CONTROLlimmit = '',
    this.DATA01 = '',
    this.DATA02 = '',
    this.DATA03 = '',
    this.DATAAVG = '',
    this.REMARK = '',
  });
  String ITEM;
  String ITEMname = '';
  String METHOD = '';
  String METHODname = '';
  String SCMARK = '';
  String FREQ = '';
  String SPECIFICATION = '';
  String SPECIFICATIONname = '';
  String SPECIFICATIONve = '';
  String RESULT = '';
  String CONTROLlimmit = '';
  String DATA01 = '';
  String DATA02 = '';
  String DATA03 = '';
  String DATAAVG = '';
  String REMARK = '';
}

class rawlist {
  rawlist({
    this.DATANO = '',
    this.DATAPCS = '',
    this.DATA = '',
    this.DATA2 = '',
  });
  String DATANO;
  String DATAPCS = '';
  String DATA = '';
  String DATA2 = '';
}

ReportPDFACTclear() {
  ReportPDFcommonlistvar.PO = '';

  ReportPDFcommonlistvar.CUSTOMER = '';
  ReportPDFcommonlistvar.PROCESS = '';
  ReportPDFcommonlistvar.PARTNAME = '';
  ReportPDFcommonlistvar.PARTNO = '';
  ReportPDFcommonlistvar.CUSLOT = '';
  ReportPDFcommonlistvar.TPKLOT = '';
  ReportPDFcommonlistvar.MATERIAL = '';
  ReportPDFcommonlistvar.QTY = '';
  ReportPDFcommonlistvar.rawlistDATA = [];

  ReportPDFcommonlistvar.PICstd = '';
  ReportPDFcommonlistvar.PIC01 = '';
  ReportPDFcommonlistvar.PIC02 = '';

  ReportPDFcommonlistvar.INSBY = '';
  ReportPDFcommonlistvar.CHECKBY = '';
  ReportPDFcommonlistvar.APPBY = '';

  ReportPDFcommonlistvar.SignInsBy = '';
  ReportPDFcommonlistvar.datalist = [
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
    ReportPDFCommonlist(),
  ];

  ReportPDFcommonlistvar.Listitemname = [];
}
