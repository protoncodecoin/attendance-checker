class StudentRecord {
  String studentId;
  bool isFaceIdComplete;
  bool isLocationAcurate;
  bool isQRCodeComplete;
  bool isDateTimeAccurate;
  bool isComplete;

  StudentRecord(this.studentId, this.isFaceIdComplete, this.isLocationAcurate,
      this.isQRCodeComplete, this.isDateTimeAccurate, this.isComplete);

  /// Convert to JSON for firebase
  Map<String, dynamic> toJson() {
    return {
      "studentId": studentId,
      // "verifiedStudents": verifiedStudents,
      "isFaceIdComplete": isFaceIdComplete,
      "isLocationAcurate": isLocationAcurate,
      "isQRCodeComplete": isQRCodeComplete,
      "isDateTimeAccurate": isDateTimeAccurate,
      "isComplete": isComplete,
    };
  }

  @override
  String toString() {
    return "${StudentRecord(studentId, isFaceIdComplete, isLocationAcurate, isQRCodeComplete, isDateTimeAccurate, isComplete)}";
  }

  /// Convert from JSON to Records
  factory StudentRecord.fromJson(Map<String, dynamic> json) {
    return StudentRecord(
      json["studentId"] as String,
      json['isFaceIdComplete'] as bool,
      json['isLocationAcurate'] as bool,
      json['isQRCodeComplete'] as bool,
      json['isDateTimeAccurate'] as bool,
      json['isComplete'] as bool,
    );
  }
}
