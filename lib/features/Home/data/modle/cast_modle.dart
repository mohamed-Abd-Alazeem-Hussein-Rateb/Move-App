class CastModle {
  final int id;
  final String original_name;
  final String? profile_path; // تم تغييرها إلى String?
  final String? character; // تم تغييرها إلى String?

  CastModle({
    required this.id,
    required this.original_name,
    this.profile_path, // يمكن أن تكون null
    this.character, // يمكن أن تكون null
  });

  factory CastModle.fromJson(Map<String, dynamic> json) {
    return CastModle(
      id: json['id'],
      original_name: json['original_name'],
      profile_path: json['profile_path'],
      character: json['character'],
    );
  }
}
