class UserModel {
  final String message;
  final String token;
  final int studentId;
  final String username;

  UserModel(
      {required this.message,
      required this.token,
      required this.studentId,
      required this.username});
  factory UserModel.fromJson(jsondata) {
    return UserModel(
        message: jsondata["message"],
        token: jsondata["token"],
        studentId: jsondata["student_id"],
        username: jsondata["username"]);
  }
}
