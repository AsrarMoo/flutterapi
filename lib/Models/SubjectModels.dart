class SubjectModel {
  int id;
  String title;
  String subject;
  String overview; // إضافة الحقل overview
  String photo;
  int totalCourses;

  SubjectModel({
    required this.id,
    required this.title,
    required this.subject,
    required this.overview, // تضمين الحقل overview في المُنشئ
    required this.photo,
    required this.totalCourses,
  });

  // تحويل JSON إلى كائن SubjectModel
  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'],
      title: json['title'],
      subject: json['subject'],
      overview: json['overview'], // تضمين الحقل overview هنا
      photo: json['photo'],
      totalCourses: json['total_courses'],
    );
  }

  // تحويل SubjectModel إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subject': subject,
      'overview': overview, // تضمين الحقل overview هنا
      'photo': photo,
      'total_courses': totalCourses,
    };
  }
}
