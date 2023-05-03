class Dice {
  final int size;
  late var dice = [];

  Dice({required this.size}) {
    init();
  }

  void init() {
    // 다시 원래크기로 만들기
    dice.clear();
    for (int i = 1; i <= size; i++) {
      dice.add(i);
    }
  }

  void shake() {
    dice.shuffle();
  }

  int pick() {
    int res = dice.first;
    dice.removeAt(0);
    return res;
  }
}