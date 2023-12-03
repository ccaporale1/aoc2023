import 'package:aoc2023/aoc2023.dart' as aoc2023;
import 'dart:io';
import 'package:path/path.dart' as p;

void main() {
  day1();

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
