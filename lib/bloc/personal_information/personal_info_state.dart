
class PersonalInfoState {
  String firstName;
  String lastName;
  bool isEmployed;
  String jobTitle;
  double salary;
  String imagePath;
  bool showLoadingWheel;

  PersonalInfoState(this.firstName, this.lastName, this.isEmployed, this.jobTitle, this.salary, this.imagePath, {this.showLoadingWheel = false});
}