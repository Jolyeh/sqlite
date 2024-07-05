class Note {
  final int? id;
  String title;
  String description;

  Note({required this.title, required this.description, this.id});

  factory Note.fromJson(Map<String, dynamic> json) => Note(
      id: json['id'], title: json['title'], description: json['description']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'description': description};

  @override
  String toString() {
    return 'Note{id: $id, title: $title, description: $description}';
  }
}
