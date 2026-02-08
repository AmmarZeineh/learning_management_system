import 'package:equatable/equatable.dart';

import 'question.dart';

class QuizModel extends Equatable {
	final int? id;
	final int? courseId;
	final int? isFinal;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final List<Question>? questions;

	const QuizModel({
		this.id, 
		this.courseId, 
		this.isFinal, 
		this.createdAt, 
		this.updatedAt, 
		this.questions, 
	});

	factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
				id: json['id'] as int?,
				courseId: json['course_id'] as int?,
				isFinal: json['is_final'] as int?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				questions: (json['questions'] as List<dynamic>?)
						?.map((e) => Question.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'course_id': courseId,
				'is_final': isFinal,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'questions': questions?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				courseId,
				isFinal,
				createdAt,
				updatedAt,
				questions,
		];
	}
}
