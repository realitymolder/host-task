// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Invitee {
  final int id;
  final String photoUrl;
  Invitee({
    required this.id,
    required this.photoUrl,
  });

  Invitee copyWith({
    int? id,
    String? photoUrl,
  }) {
    return Invitee(
      id: id ?? this.id,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'photoUrl': photoUrl,
    };
  }

  factory Invitee.fromMap(Map<String, dynamic> map) {
    return Invitee(
      id: map['id'] as int,
      photoUrl: map['photoUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Invitee.fromJson(String source) =>
      Invitee.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Invitee(id: $id, photoUrl: $photoUrl)';

  @override
  bool operator ==(covariant Invitee other) {
    if (identical(this, other)) return true;

    return other.id == id && other.photoUrl == photoUrl;
  }

  @override
  int get hashCode => id.hashCode ^ photoUrl.hashCode;
}
