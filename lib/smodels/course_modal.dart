class CourseModel {
  final int courseId;
  final int? price;
  final String courseName;
  final String courseDes;

  CourseModel(
      {required this.courseId,
      required this.price,
      required this.courseName,
      required this.courseDes});
  factory CourseModel.fromJson(jsondata) {
    return CourseModel(
      courseId: jsondata["id"],
      courseName: jsondata["course_name"],
      courseDes: jsondata["course_description"],
      price: jsondata["course_price"],
    );
  }
}
