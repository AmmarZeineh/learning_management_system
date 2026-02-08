import 'package:equatable/equatable.dart';

import 'student_course.dart';

class CommentModel extends Equatable {
	final int? id;
	final int? studentCourseId;
	final String? value;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final StudentCourse? studentCourse;

	const CommentModel({
		this.id, 
		this.studentCourseId, 
		this.value, 
		this.createdAt, 
		this.updatedAt, 
		this.studentCourse, 
	});

	factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
				id: json['id'] as int?,
				studentCourseId: json['student_course_id'] as int?,
				value: json['value'] as String?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				studentCourse: json['student_course'] == null
						? null
						: StudentCourse.fromJson(json['student_course'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'student_course_id': studentCourseId,
				'value': value,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'student_course': studentCourse?.toJson(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				studentCourseId,
				value,
				createdAt,
				updatedAt,
				studentCourse,
		];
	}
}
