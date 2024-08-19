
class UsersModel {

  final String name;
  final DateTime creationDate;
  final String password;
  final String confirmPassword;
  final bool isGuest;
  final String email;
UsersModel({
    required this.name,
    required this.creationDate,
    required this.password,
    required this.isGuest,
    required this.email,
  required this.confirmPassword,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          creationDate == other.creationDate &&
          password == other.password &&
          confirmPassword == other.confirmPassword &&
          isGuest == other.isGuest &&
          email == other.email);

  @override
  int get hashCode =>
      name.hashCode ^
      creationDate.hashCode ^
      password.hashCode ^
      confirmPassword.hashCode ^
      isGuest.hashCode ^
      email.hashCode;

  @override
  String toString() {
    return 'UsersModel{' +
        ' name: $name,' +
        ' creationDate: $creationDate,' +
        ' password: $password,' +
        ' confirmPassword: $confirmPassword,' +
        ' isGuest: $isGuest,' +
        ' email: $email,' +
        '}';
  }

  String tostring() {
    return '{' +
        ' email: $email,' +
        ' password: $password,' +
        ' confirmPassword: $password,' +
        ' name: $name,' +
        '}';
  }

  UsersModel copyWith({
    int? uid,
    String? userName,
    DateTime? creationDate,
    String? password,
    String? confirmPassword,
    bool? isGuest,
    String? email,
  }) {
    return UsersModel(
      name: userName ?? this.name,
      creationDate: creationDate ?? this.creationDate,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isGuest: isGuest ?? this.isGuest,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMapnode() {
    return {
      'name': this.name,
      'creationDate': this.creationDate,
      'password': this.password,
      'confirmPassword': this.confirmPassword,
      'isGuest': this.isGuest,
      'email': this.email,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'creationDate': this.creationDate,
      'password': this.password,
      'confirmPassword': this.confirmPassword,
      'isGuest': this.isGuest,
      'email': this.email,
    };
  }

  factory UsersModel.fromMap(Map<String, dynamic> map) {
    return UsersModel(
      name: map['name'] as String,
      creationDate: map['creationDate'] as DateTime,
      password: map['password'] as String,
      confirmPassword: map['confirmPassword'] as String,
      isGuest: map['isGuest'] as bool,
      email: map['email'] as String,
    );
  }

//</editor-fold>
}