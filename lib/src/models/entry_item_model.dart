class EntryItemModel {
  const EntryItemModel({
    this.text,
    this.date,
  });

  final String text;
  final DateTime date;

  Map<String, dynamic> toJson() => {
        'text': text,
        'date': date.toIso8601String(),
      };

  EntryItemModel fromJson(Map<String, dynamic> json) => EntryItemModel(
        text: json['text'] as String,
        date: DateTime.parse(json['date'] as String),
      );
}
