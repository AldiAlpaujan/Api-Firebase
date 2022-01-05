class User {
  String? id;
  String? name;
  String? job;
  String? avatar;

  User({this.id, this.name, this.job, this.avatar});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'job': job,
        'avatar': avatar,
      };
}
