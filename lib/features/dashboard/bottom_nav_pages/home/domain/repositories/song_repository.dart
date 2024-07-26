import 'package:fpdart/fpdart.dart';
import 'package:spotify/core/error/failures.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/domain/entities/song.dart';

abstract interface class SongRepository {
  Future<Either<Failure, List<Song>>> getSongs();
}
