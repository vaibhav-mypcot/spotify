import 'package:fpdart/fpdart.dart';
import 'package:spotify/core/error/failures.dart';
import 'package:spotify/core/error/success.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/domain/entities/song.dart';

abstract interface class SongRepository {
  Future<Either<Failure, List<Song>>> getSongs();
  Future<Either<Failure, Success>> updateFavoriteSongs({
    required String docID,
    required bool isFavorite,
  });
}
