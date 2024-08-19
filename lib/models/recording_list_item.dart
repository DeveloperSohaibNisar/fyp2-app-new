class RecordingListItem {
  final int id;
  final String title;
  final DateTime date;
  final Duration length;

//<editor-fold desc="Data Methods">
  const RecordingListItem({
    required this.id,
    required this.title,
    required this.date,
    required this.length,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecordingListItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          date == other.date &&
          length == other.length);

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ date.hashCode ^ length.hashCode;

  @override
  String toString() {
    return 'RecordingListItem{' +
        ' id: $id,' +
        ' title: $title,' +
        ' date: $date,' +
        ' length: $length,' +
        '}';
  }

  RecordingListItem copyWith({
    int? id,
    String? title,
    DateTime? date,
    Duration? length,
  }) {
    return RecordingListItem(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      length: length ?? this.length,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'date': this.date,
      'length': this.length,
    };
  }

  factory RecordingListItem.fromMap(Map<String, dynamic> map) {
    return RecordingListItem(
      id: map['id'] as int,
      title: map['title'] as String,
      date: map['date'] as DateTime,
      length: map['length'] as Duration,
    );
  }

//</editor-fold>
}
