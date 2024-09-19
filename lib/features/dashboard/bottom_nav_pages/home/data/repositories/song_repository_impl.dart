import 'package:fpdart/fpdart.dart';
import 'package:spotify/core/error/exceptions.dart';
import 'package:spotify/core/error/failures.dart';
import 'package:spotify/core/error/success.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/data/datasource/songs_remote_data_source.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/domain/entities/song.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/domain/repositories/song_repository.dart';

class SongRepositoryImpl implements SongRepository {
  final SongsRemoteDataSource songFirebaseService;
  SongRepositoryImpl(this.songFirebaseService);

  @override
  Future<Either<Failure, List<Song>>> getSongs() async {
    try {
      final songs = await songFirebaseService.getNewsSongs();
      return right(songs);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Success>> updateFavoriteSongs(
      {required String docID, required bool isFavorite}) async {
    try {
      final songs = await songFirebaseService.updateFavoriteSong(
          songId: docID, favorite: isFavorite);
      return right(Success('success'));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
