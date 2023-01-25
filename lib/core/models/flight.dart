enum FuncaoABordo {
  instrutorVoo(label: 'label'),
  pilotoEmComando(label: 'label'),
  pilotoEmInstrucao(label: 'label'),
  instrutorDeVooEmSolo(label: 'label'),
  coPilotoSinglePilot(label: 'label'),
  coPilotoSinglePilotRegulamentar(label: 'label'),
  coPilotoDualPilot(label: 'label');

  const FuncaoABordo({required this.label});

  final String label;
}

class Flight {
  final String departureField;
  final DateTime departureDateTime;
  final FuncaoABordo funcaoABordo;
  final bool isSimulated;
  String? duration;
  String? landingField;
  int? numPousos;
  double? milesOfNavigation;
  String? matricula;
  double? tempoDiurno;
  double? tempoNavegacao;
  double? tempoInstrumentoReal;
  bool isCursoPcComIn = false;
  String? anacAluno;
  String? obs;

  Flight(
    this.departureField,
    this.departureDateTime,
    this.isSimulated,
    this.funcaoABordo,
  );
}
