class PlaceModel {
  final String name;
  final String image;
  final String story;
  final String category;
  final String bestTime;
  final String bestSpot;
  final String state;

  PlaceModel({
    required this.name,
    required this.image,
    required this.story,
    required this.category,
    required this.bestTime,
    required this.bestSpot,
    required this.state,
  });

  factory PlaceModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return PlaceModel(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      story: map['story'] ?? '',
      category: map['category'] ?? '',
      bestTime: map['bestTime'] ?? '',
      bestSpot: map['bestSpot'] ?? '',
      state: map['state'] ?? '',
    );
  }
}