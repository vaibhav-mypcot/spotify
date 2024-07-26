import 'package:fpdart/fpdart.dart';
import 'package:spotify/core/error/failures.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/domain/entities/song.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/domain/repositories/song_repository.dart';

class GetAllSongs implements UseCase<List<Song>, NoParams> {
  final SongRepository songRepository;

  GetAllSongs({required this.songRepository});

  @override
  Future<Either<Failure, List<Song>>> call(NoParams params) async {
    return await songRepository.getSongs();
  }
}