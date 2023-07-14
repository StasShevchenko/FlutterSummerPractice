class UserCredentials {
  final String name;
  final String uniqueKey;

  UserCredentials(
      {required this.name,
        required this.uniqueKey});

  Map<String, dynamic> toJson() {
    return {
      'unique_key' : uniqueKey,
      'name': name,
    };
  }
}
