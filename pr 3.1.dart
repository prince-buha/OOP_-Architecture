import 'dart:io';

int Sum({required List<int> numbers}) {
  int sum = 0;
  for (int no in numbers) {
    sum += no;
  }
  return sum;
}

void main() {
  List<int> MYList = [];
  stdout.write("Enter the number : ");
  Sum = int.parse(stdin.readLineSync()!);
  int result = Sum(numbers: MYList);
  print("Sum of MYList is: $result");
}
