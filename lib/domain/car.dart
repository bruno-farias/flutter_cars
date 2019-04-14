class Car {
  final int id;
  final String name;
  final String category;
  final String description;
  final String image;
  final String video;
  final String latitude;
  final String longitude;

  Car(
      {this.id,
      this.name,
      this.category,
      this.description,
      this.image,
      this.video,
      this.latitude,
      this.longitude});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
        id: json['id'] as int,
        name: json['nome'] as String,
        category: json['tipo'] as String,
        description: json['desc'] as String,
        image: json['urlFoto'] as String,
        video: json['urlVideo'] as String,
        latitude: json['latitude'] as String,
        longitude: json['longitude'] as String);
  }

  @override
  String toString() {
    return 'Car[$id]: $name';
  }
}
