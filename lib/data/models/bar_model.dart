class IndividualBar {
  final int x;
  final double y;
  IndividualBar({required this.x, required this.y});
}

class BarData{


  final double januaryAmount;
  final double februaryAmount;
  final double marchAmount;
  final double aprilAmount;
  final double mayAmount;
  final double juneAmount;
  final double julyAmount;
  final double augustAmount;
  final double septemberAmount;
  final double octoberAmount;
  final double novemberAmount;
  final double decemberAmount;

  BarData({
    required this.januaryAmount,
    required this.februaryAmount,
    required this.marchAmount,
    required this.aprilAmount,
    required this.mayAmount,
    required this.juneAmount,
    required this.julyAmount,
    required this.augustAmount,
    required this.septemberAmount,
    required this.octoberAmount,
    required this.novemberAmount,
    required this.decemberAmount,
  });
    List<IndividualBar> barData = [];
  void initializeBarData(){
   barData = [
      IndividualBar(x: 1, y: januaryAmount),
      IndividualBar(x: 2, y: februaryAmount),
      IndividualBar(x: 3, y: marchAmount),
      IndividualBar(x: 4, y: aprilAmount),
      IndividualBar(x: 5, y: mayAmount),
      IndividualBar(x: 6, y: juneAmount),
      IndividualBar(x: 7, y: julyAmount),
      IndividualBar(x: 8, y: augustAmount),
      IndividualBar(x: 9, y: septemberAmount),
      IndividualBar(x: 10, y: octoberAmount),
      IndividualBar(x: 11, y: novemberAmount),
      IndividualBar(x: 12, y: decemberAmount),
    ];
  }





}