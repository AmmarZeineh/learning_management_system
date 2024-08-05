import 'package:equatable/equatable.dart';

import 'answer.dart';

class Question extends Equatable {
	final int? id;
	final int? quizId;
	final String? questionText;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final List<Answer>? answers;

	const Question({
		this.id, 
		this.quizId, 
		this.questionText, 
		this.createdAt, 
		this.updatedAt, 
		this.answers, 
	});

	factory Question.fromJson(Map<String, dynamic> json) => Question(
				id: json['id'] as int?,
				quizId: json['quiz_id'] as int?,
				questionText: json['question_text'] as String?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				answers: (json['answers'] as List<dynamic>?)
						?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'quiz_id': quizId,
				'question_text': questionText,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'answers': answers?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				quizId,
				questionText,
				createdAt,
				updatedAt,
				answers,
		];
	}
}
