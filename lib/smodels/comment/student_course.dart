import 'package:equatable/equatable.dart';

import 'user.dart';

class StudentCourse extends Equatable {
	final int? id;
	final int? courseId;
	final int? userId;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final User? user;

	const StudentCourse({
		this.id, 
		this.courseId, 
		this.userId, 
		this.createdAt, 
		this.updatedAt, 
		this.user, 
	});

	factory StudentCourse.fromJson(Map<String, dynamic> json) => StudentCourse(
				id: json['id'] as int?,
				courseId: json['course_id'] as int?,
				userId: json['user_id'] as int?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				user: json['user'] == null
						? null
						: User.fromJson(json['user'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'course_id': courseId,
				'user_id': userId,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'user': user?.toJson(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				courseId,
				userId,
				createdAt,
				updatedAt,
				user,
		];
	}
}
