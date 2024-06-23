import 'package:equatable/equatable.dart';

class TeacherModel extends Equatable {
	final String? message;
	final String? token;
	final int? teacherId;
	final String? username;

	const TeacherModel({
		this.message, 
		this.token, 
		this.teacherId, 
		this.username, 
	});

	factory TeacherModel.fromJson(Map<String, dynamic> json) => TeacherModel(
				message: json['message'] as String?,
				token: json['token'] as String?,
				teacherId: json['teacher_id'] as int?,
				username: json['username'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'token': token,
				'teacher_id': teacherId,
				'username': username,
			};

	@override
	List<Object?> get props => [message, token, teacherId, username];
}
