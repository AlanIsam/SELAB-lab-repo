import 'myLib.dart' as emp;

String formatCurrency(num value) {
  var str = value.toInt().toString();
  return str.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
}

void main() {
  double extraPayPerHr;
  var william = emp.Employee('Manager', 'Madrid', 5000, 7);

  if (william.salary >= 4000) {
    extraPayPerHr = 10;
  } else {
    extraPayPerHr = 20;
  }

  double total = william.salary + (william.overtimeHr * extraPayPerHr);

  print('Total Salary = \$$total USD');
  print(
      'Total Payment = ${william.salary.toInt()} + (${william.overtimeHr.toInt()} × ${extraPayPerHr.toInt()}) = RM ${formatCurrency(total)}');
}
