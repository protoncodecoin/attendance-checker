import 'dart:ui';

class Recognition {
  String email;
  Rect location;
  List<double> embeddings;
  double distance;

  Recognition(this.email, this.location, this.embeddings, this.distance);

  /// Convert to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "embeddings": embeddings,
    };
  }

  factory Recognition.fromJson(Map<String, dynamic> json) {
    return Recognition(
        json["email"], Rect.zero, List<double>.from(json["embeddings"]), 0);
  }
}
