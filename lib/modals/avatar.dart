class Avatar {
  String name, description, type, modelUrl, imageUrl;
  Avatar({
    this.imageUrl,
    this.name,
    this.description,
    this.modelUrl,
    this.type,
  });
  Avatar createAvatar(Map<String, dynamic> map) {
    return Avatar(
      name: map['name'] ?? 'Name is null',
      imageUrl: map['image'] ?? 'No image url',
      modelUrl: map['url'] ?? 'No model url',
      description: map['description'] ?? 'No description',
      type: map['type'] ?? 'Default',
    );
  }
}
