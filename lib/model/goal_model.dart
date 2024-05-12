class Goal {
  final String title;
  final String? image;
  final String duration;
  final double progressPercentage;
  final int totalSavings;
  final int depositedAmount;
  final int index;

  Goal({
    required this.index,
    required this.title,
    this.image,
    required this.duration,
    required this.progressPercentage,
    required this.totalSavings,
    required this.depositedAmount,
  });

  // Factory constructor to create Goal objects from a list of data
  factory Goal.fromMap(Map<String, dynamic> map, int index) {
    return Goal(
      index: index,
      title: map['title'],
      image: map['image'],
      duration: map['duration'],
      progressPercentage: map['progressPercentage'],
      totalSavings: map['totalSavings'],
      depositedAmount: map['depositedAmount'],
    );
  }
}


// List of predefined goals
List<Goal> goals = [
  Goal(
    title: 'Laptop',
    image: 'images/laptop.png',
    duration: '3 months',
    progressPercentage: 0.7,
    totalSavings: 235000,
    depositedAmount: 164500, index: 1,
  ),
  Goal(
    title: 'Car',
    image: 'assets/goals/car.png',
    duration: '10 months',
    progressPercentage: 0.5,
    totalSavings: 5200000,
    depositedAmount:2600000, index: 2,
  ),
  Goal(
    title: 'PS 5',
    image: 'assets/goals/ps5.png',
    duration: '2 weeks',
    progressPercentage: 0.3,
    totalSavings: 150000,
    depositedAmount: 45000, index: 3,
  ),
  Goal(
    title: 'FIFA 25',
    duration: '3 days',
    progressPercentage: 0.2,
    totalSavings: 9000,
    depositedAmount: 1800, index: 4,
  ),
];


