
class Employee {
  // Properties
  String name;
  int age;
  double salary;

  //Normal constructor
  Employee(this.name, this.age, this.salary);

  void displayInfo() {
    print('Name: $name');
    print('Age: $age');
    print('Salary: $salary');
  }

  double calculateOvertimePay(int hoursWorked, double hourlyRate) { 
    return hoursWorked * hourlyRate;
  }
}

void main () {
  Employee Alice  = new Employee('Alice', 25, 5000.00); 

  print('Employee Information:');
  Alice.displayInfo();

  double overtimePay = Alice.calculateOvertimePay(7, 10.00);
  print('Overtime Pay: $overtimePay');

  print('total salary: ${Alice.salary + overtimePay}');
}