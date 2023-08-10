class TyrePsi {
  final double psi;
  final int temp;
  final bool isLowPressure;

  TyrePsi({
    required this.psi,
    required this.temp,
    required this.isLowPressure,
  });
}

final List<TyrePsi> tyrePsiList = [
  TyrePsi(psi: 23.5, temp: 56, isLowPressure: true),
  TyrePsi(psi: 35.8, temp: 41, isLowPressure: false),
  TyrePsi(psi: 36.4, temp: 41, isLowPressure: false),
  TyrePsi(psi: 35.9, temp: 42, isLowPressure: false),
];
