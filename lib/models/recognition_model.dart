// import 'dart:ui';

// class Recognition {
//   String email;
//   Rect location;
//   List<double> embeddings;
//   double distance;

//   Recognition(this.email, this.location, this.embeddings, this.distance);

//   // Convert to JSON for Firestore
//   Map<String, dynamic> toJson() {
//     return {
//       "email": email,
//       "location": {
//         "left": location.left,
//         "top": location.top,
//         "right": location.right,
//         "bottom": location.bottom,
//       },
//       "embeddings": embeddings,
//       "distance": distance,
//     };
//   }

//   // Create Recognition object from Firestore data
//   factory Recognition.fromJson(Map<String, dynamic> json) {
//     return Recognition(
//       json["email"],
//       Rect.fromLTRB(
//         json["location"]["left"],
//         json["location"]["top"],
//         json["location"]["right"],
//         json["location"]["bottom"],
//       ),
//       List<double>.from(json["embeddings"]),
//       json["distance"],
//     );
//   }
// }
