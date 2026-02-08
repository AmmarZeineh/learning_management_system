import 'package:equatable/equatable.dart';

class User extends Equatable {
	final int? id;
	final String? role;
	final String? username;
	final int? phonenumber;
	final String? email;
	final dynamic emailVerifiedAt;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const User({
		this.id, 
		this.role, 
		this.username, 
		this.phonenumber, 
		this.email, 
		this.emailVerifiedAt, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory User.fromJson(Map<String, dynamic> json) => User(
				id: json['id'] as int?,
				role: json['role'] as String?,
				username: json['username'] as String?,
				phonenumber: json['phonenumber'] as int?,
				email: json['email'] as String?,
				emailVerifiedAt: json['email_verified_at'] as dynamic,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'role': role,
				'username': username,
				'phonenumber': phonenumber,
				'email': email,
				'email_verified_at': emailVerifiedAt,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				role,
				username,
				phonenumber,
				email,
				emailVerifiedAt,
				createdAt,
				updatedAt,
		];
	}
}
