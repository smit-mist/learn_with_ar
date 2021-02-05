class AppUser {
  String email, username;
  String id;
  List<dynamic> likedModels = [], createdModels = [];
  AppUser({
    this.email,
    this.createdModels,
    this.likedModels,
    this.username,
    this.id,
  });
}

AppUser createAppUser(Map<String, dynamic> map) {
  return AppUser(
    email: map['email'] ?? 'NO email',
    username: map['username'] ?? 'NO username',
    likedModels: map['liked_models'] ?? [],
    createdModels: map['created_models'] ?? [],
  );
}
