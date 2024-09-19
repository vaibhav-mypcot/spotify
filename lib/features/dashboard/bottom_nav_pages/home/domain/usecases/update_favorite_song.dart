import 'package:fpdart/fpdart.dart';
import 'package:spotify/core/error/failures.dart';
import 'package:spotify/core/error/success.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/domain/repositories/song_repository.dart';

class UpdateFavoriteSong
    implements UseCase<Success, UpdateFavoriteSongParames> {
  final SongRepository songRepository;

  UpdateFavoriteSong({required this.songRepository});

  @override
  Future<Either<Failure, Success>> call(
      UpdateFavoriteSongParames params) async {
    return await songRepository.updateFavoriteSongs(
      docID: params.docId,
      isFavorite: params.isFavorite,
    );
  }
}

class UpdateFavoriteSongParames {
  final String docId;
  final bool isFavorite;

  UpdateFavoriteSongParames({
    required this.isFavorite,
    required this.docId,
  });
}
