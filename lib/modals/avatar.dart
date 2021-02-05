class Avatar {
  String name, description, type, modelUrl, imageUrl, ownerId;
  int likes;
  String id;
  Avatar({
    this.id,
    this.imageUrl,
    this.name,
    this.description,
    this.modelUrl,
    this.type,
    this.likes,
    this.ownerId,
  });
}

Avatar createAvatar(Map<String, dynamic> map) {
  return Avatar(
    name: map['name'] ?? 'Name is null',
    imageUrl: map['image'] ?? 'No image url',
    modelUrl: map['url'] ?? 'No model url',
    description: map['description'] ?? 'No description',
    type: map['type'] ?? 'Default',
    ownerId: map['owner']??'No User ID',
    likes: map['likes']??0,
  );
}
