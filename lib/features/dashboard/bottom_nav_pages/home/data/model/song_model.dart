import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/domain/entities/song.dart';

class SongModel extends Song {
  SongModel({
    required super.id,
    required super.title,
    required super.artist,
    required super.duration,
    required super.releaseDate,
    required super.isFavorite,
  });

  factory SongModel.fromJson(Map<String, dynamic> data) {
    return SongModel(
      id: data['id'] as String,
      title: data['title'] as String,
      artist: data['artist'] as String,
      duration: data['duration'] as num,
      releaseDate: data['releaseDate'] as Timestamp,
      isFavorite: data['isFavorite'] as bool,
    );
  }

  SongModel copyWith({
    String? id,
    
    String? title,
    String? artist,
    num? duration,
    Timestamp? releaseDate,
    bool? isFavorite,
  }) {
    return SongModel(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      duration: duration ?? this.duration,
      releaseDate: releaseDate ?? this.releaseDate,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
