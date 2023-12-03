import 'package:aoc2023/aoc2023.dart' as aoc2023;
import 'dart:io';
import 'package:path/path.dart' as p;

void main() {
  //day1();
  day2();

}

void day2() {
  var filePath = p.join(Directory.current.path, 'lib/puzzle_inputs', 'day2.txt');
  File file = File(filePath);
  var lines = file.readAsLinesSync();
  var sum = 0;
  var limits = {'red':12,'green':13,'blue':14};

  for(final e in lines){
    var eSplit = e.split(':');
    int gameNum = int.parse(eSplit[0].replaceAll(RegExp(r'[^0-9]'),'')); 
    var pulls = eSplit[1].split(';');
    bool gameCounts = true;
    for (final pull in pulls) {
      var balls = pull.split(',');
      for (final eval in balls) {

        var color = eval.split(' ')[2];

        if ( int.parse(eval.split(' ')[1]) > limits[color]! ) {
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
  for(final e in lines){
    var eSplit = e.split(':');
    int gameNum = int.parse(eSplit[0].replaceAll(RegExp(r'[^0-9]'),'')); 
    var pulls = eSplit[1].split(';');
    var gameMin = {'red':0,'green':0,'blue':0};
    int gameSum = 1;
    for (final pull in pulls) {
      var balls = pull.split(',');
      for (final eval in balls) {

        var color = eval.split(' ')[2];
        if ( int.parse(eval.split(' ')[1]) > gameMin[color]! ) {
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

  var filePath = p.join(Directory.current.path, 'lib/puzzle_inputs', 'day1.txt');
  File file = File(filePath);
  var lines = file.readAsLinesSync();
  var sum = 0;

  for(final e in lines){
    var newe = e;
    //part2 - comment out for part 1 solution
    newe = e.replaceAll("one", "one1one")
      .replaceAll("two", "two2two")
      .replaceAll("three", "three3three")
      .replaceAll("four", "four4four")
      .replaceAll("five", "five5five")
      .replaceAll("six", "six6six")
      .replaceAll("seven", "seven7seven")
      .replaceAll("eight", "eight8eight")
      .replaceAll("nine", "nine9nine");
    //
    var numStr = newe.replaceAll(RegExp(r'[^0-9]'),''); 
    var numStrParsed = numStr[0]+numStr[numStr.length -1];
    var numInt = int.parse(numStrParsed);
    sum += numInt;
  }
  print('Day 1 answer: $sum');
}
