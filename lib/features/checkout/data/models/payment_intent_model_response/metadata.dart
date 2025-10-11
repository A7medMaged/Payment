class Metadata {
  final Map<String, String?> values;

  Metadata({Map<String, String?>? values}) : values = values ?? {};

  factory Metadata.fromJson(Map<String, dynamic> json) {
    // Convert all values to String? to match typical Stripe metadata shape
    final map = <String, String?>{};
    json.forEach((key, value) {
      if (value == null) {
        map[key] = null;
      } else {
        map[key] = value.toString();
      }
    });
    return Metadata(values: map);
  }

  Map<String, dynamic> toJson() => Map<String, dynamic>.from(values);
}
