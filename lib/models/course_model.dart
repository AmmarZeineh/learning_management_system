class CourseModel {
  final int courseId;
  final int teacherId;
  final String courseName;
  final String courseType;
  final int coursePrice;
  final int isFinished;
  final String createdAt;
  final String updatedAt;
  final String courseDes;

  CourseModel(
      {required this.courseId,
      required this.isFinished,
      required this.teacherId,
      required this.courseName,
      required this.courseType,
      required this.coursePrice,
      required this.createdAt,
      required this.updatedAt,
      required this.courseDes});

  factory CourseModel.fromJson(jsonData, index) {
    return CourseModel(
        courseId: jsonData['courses'][index]['id'],
        teacherId: jsonData['courses'][index]['teacher_id'],
        courseName: jsonData['courses'][index]['course_name'],
        courseDes: jsonData['courses'][index]['course_description'],
        courseType: jsonData['courses'][index]['course_type'],
        coursePrice: jsonData['courses'][index]['course_price'],
        createdAt: jsonData['courses'][index]['created_at'],
        updatedAt: jsonData['courses'][index]['updated_at'],
        isFinished: jsonData['courses'][index]['is_finished']);
  }
}
