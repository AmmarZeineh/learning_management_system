import 'package:equatable/equatable.dart';

class Answer extends Equatable {
	final int? id;
	final int? questionId;
	final String? answerText;
	final int? isCorrect;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const Answer({
		this.id, 
		this.questionId, 
		this.answerText, 
		this.isCorrect, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Answer.fromJson(Map<String, dynamic> json) => Answer(
				id: json['id'] as int?,
				questionId: json['question_id'] as int?,
				answerText: json['answer_text'] as String?,
				isCorrect: json['is_correct'] as int?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'question_id': questionId,
				'answer_text': answerText,
				'is_correct': isCorrect,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				questionId,
				answerText,
				isCorrect,
				createdAt,
				updatedAt,
		];
	}
}
