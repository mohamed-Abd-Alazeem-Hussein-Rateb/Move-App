class SearchMoveModle {
   final int id;
  final String original_title;
  final String? backdrop_path; // السماح بالقيم null
  final String poster_path;
  final String vote_average;
  final String overview;

  SearchMoveModle({
    required this.id,
    required this.original_title,
    this.backdrop_path, // لا حاجة لتحديد required
    required this.poster_path,
    required this.vote_average,
    required this.overview,
  });

  factory SearchMoveModle.fromJson(Map<String, dynamic> json) {
    return SearchMoveModle(
      id: json['id'],
      original_title: json['original_title'] ?? 'No Title', // تأكد من وجود قيم افتراضية
      backdrop_path: json['backdrop_path'], // السماح بـ null
      poster_path: json['poster_path'] ?? '',
      vote_average: json['vote_average'].toString(), // تأكد من التحويل إلى String
      overview: json['overview'] ?? 'No overview available',
    );
  }
}
