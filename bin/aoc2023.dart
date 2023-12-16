import 'dart:io';
import 'package:path/path.dart' as p;

void main() {
  //day1();
  //day2();
  //day3();

  day15();
  day16();
}

void day16() {
  var filePath =
      p.join(Directory.current.path, 'lib/puzzle_inputs', 'day16_test.txt');
  File file = File(filePath);
  var lines = file.readAsLinesSync();
}

void day15() {
  var filePath =
      p.join(Directory.current.path, 'lib/puzzle_inputs', 'day15.txt');
  File file = File(filePath);
  var lines = file.readAsLinesSync();

  var segments = lines[0].split(',');
  //part 1
  int totalSum = 0;
  for (int i = 0; i < segments.length; i++) {
    int segmentSum = 0;

    for (int j = 0; j < segments[i].length; j++) {
      //print('${segments[i][j]} in ASCII is ${segments[i].codeUnitAt(j)}');

      segmentSum = segmentSum + segments[i].codeUnitAt(j);
      segmentSum = segmentSum * 17;
      segmentSum = segmentSum.remainder(256);
    }

    totalSum = totalSum + segmentSum;
    //print('Total sum is now: $totalSum');
  }
  print('Day 15 Part 1 Answer: $totalSum');

  // part 2

  var boxesList = {};
  for (int i = 0; i < segments.length; i++) {
    int segmentSum = 0;

    for (int j = 0; j < segments[i].length; j++) {
      //print('${segments[i][j]} in ASCII is ${segments[i].codeUnitAt(j)}');
      if (segments[i][j] == "=") {
        var lens = {segments[i].substring(0, j): segments[i][j + 1]};
        var lensId = segments[i].substring(0, j);

        if (!boxesList.containsKey(segmentSum)) {
          boxesList[segmentSum] = [];
        }

        var lensExists = false;
        for (int k = 0; k < boxesList[segmentSum].length; k++) {
          if (boxesList[segmentSum][k].containsKey(lensId)) {
            boxesList[segmentSum][k] = lens;
            lensExists = true;
          }
        }
        if (!lensExists) {
          var existingList = boxesList[segmentSum];
          existingList.add(lens);

          boxesList[segmentSum] = existingList;
        }
      } else if (segments[i][j] == "-") {
        var toRemove = segments[i].substring(0, j);

        if (boxesList.containsKey(segmentSum)) {
          for (int k = 0; k < boxesList[segmentSum].length; k++) {
            if (boxesList[segmentSum][k].containsKey(toRemove)) {
              boxesList[segmentSum][k].remove(toRemove);

              break;
            }
          }
        }
      } else {
        segmentSum = segmentSum + segments[i].codeUnitAt(j);
        segmentSum = segmentSum * 17;
        segmentSum = segmentSum.remainder(256);
      }
    }

    //print('Total sum is now: $totalSum');
  }
  boxesList.forEach((key, value) {
    for (int i = 0; i < value.length; i++) {
      if (value[i].isEmpty) {
        value.removeAt(i);
      }
    }
  });
  num totalSumPart2 = 0;
  boxesList.forEach((key, value) {
    var values = value.toList();

    if (values.length != null) {
      for (int i = 0; i < values.length; i++) {
        if (!values[i].isEmpty) {
          var multiplier = (key + 1) * (i + 1);
          var addToSum = multiplier * int.parse(values[i].values.first);

          totalSumPart2 += addToSum;
        }
      }
    }
  });

  print('Day 15 Part 2 Answer: $totalSumPart2');
}

void day3() {
  var filePath =
      p.join(Directory.current.path, 'lib/puzzle_inputs', 'day2.txt');
  File file = File(filePath);
  var lines = file.readAsLinesSync();
}

void day2() {
  var filePath =
      p.join(Directory.current.path, 'lib/puzzle_inputs', 'day2.txt');
  File file = File(filePath);
  var lines = file.readAsLinesSync();
  var sum = 0;
  var limits = {'red': 12, 'green': 13, 'blue': 14};

  for (final e in lines) {
    var eSplit = e.split(':');
    int gameNum = int.parse(eSplit[0].replaceAll(RegExp(r'[^0-9]'), ''));
    var pulls = eSplit[1].split(';');
    bool gameCounts = true;
    for (final pull in pulls) {
      var balls = pull.split(',');
      for (final eval in balls) {
        var color = eval.split(' ')[2];

        if (int.parse(eval.split(' ')[1]) > limits[color]!) {
          gameCounts = false;
        }
      }
    }
    if (gameCounts) {
      sum += gameNum;
    }
  }
  print('Day 2 part 1 answer: $sum');
  sum = 0;
  for (final e in lines) {
    var eSplit = e.split(':');
    int gameNum = int.parse(eSplit[0].replaceAll(RegExp(r'[^0-9]'), ''));
    var pulls = eSplit[1].split(';');
    var gameMin = {'red': 0, 'green': 0, 'blue': 0};
    int gameSum = 1;
    for (final pull in pulls) {
      var balls = pull.split(',');
      for (final eval in balls) {
        var color = eval.split(' ')[2];
        if (int.parse(eval.split(' ')[1]) > gameMin[color]!) {
          gameMin[color] = int.parse(eval.split(' ')[1]);
        }
      }
    }
    for (final color in gameMin.values) {
      gameSum *= color;
    }
    sum += gameSum;
  }
  print('Day 2 part 2 answer: $sum');
}

void day1() {
  var filePath =
      p.join(Directory.current.path, 'lib/puzzle_inputs', 'day1.txt');
  File file = File(filePath);
  var lines = file.readAsLinesSync();
  var sum = 0;

  for (final e in lines) {
    var newe = e;
    //part2 - comment out for part 1 solution
    newe = e
        .replaceAll("one", "one1one")
        .replaceAll("two", "two2two")
        .replaceAll("three", "three3three")
        .replaceAll("four", "four4four")
        .replaceAll("five", "five5five")
        .replaceAll("six", "six6six")
        .replaceAll("seven", "seven7seven")
        .replaceAll("eight", "eight8eight")
        .replaceAll("nine", "nine9nine");
    //
    var numStr = newe.replaceAll(RegExp(r'[^0-9]'), '');
    var numStrParsed = numStr[0] + numStr[numStr.length - 1];
    var numInt = int.parse(numStrParsed);
    sum += numInt;
  }
  print('Day 1 answer: $sum');
}
