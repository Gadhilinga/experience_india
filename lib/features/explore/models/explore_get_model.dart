
class ExploreGetAllModel {
    final double? costLevel;
    final String? category;
    final String? story;
    final String? bestTime;
    final String? name;
    final String? food;
    final String? state;
    final String? bestSpot;
    final String? image;
    final String? summary;
    final Location? location;

    ExploreGetAllModel({
        this.costLevel,
        this.category,
        this.story,
        this.bestTime,
        this.name,
        this.food,
        this.state,
        this.bestSpot,
        this.image,
        this.summary,
        this.location,
    });

    factory ExploreGetAllModel.fromJson(Map<String, dynamic> json) => ExploreGetAllModel(
        costLevel: json["costLevel"]?.toDouble(),
        category: json["category"],
        story: json["story"],
        bestTime: json["bestTime"],
        name: json["name"],
        food: json["food"],
        state: json["state"],
        bestSpot: json["bestSpot"],
        image: json["image"],
        summary: json["summary"],
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
    );

    Map<String, dynamic> toJson() => {
        "costLevel": costLevel,
        "category": category,
        "story": story,
        "bestTime": bestTime,
        "name": name,
        "food": food,
        "state": state,
        "bestSpot": bestSpot,
        "image": image,
        "summary": summary,
        "location": location?.toJson(),
    };
}





class Location {
    final double? latitude;
    final double? longitude;

    Location({
        this.latitude,
        this.longitude,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["_latitude"]?.toDouble(),
        longitude: json["_longitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "_latitude": latitude,
        "_longitude": longitude,
    };
}


