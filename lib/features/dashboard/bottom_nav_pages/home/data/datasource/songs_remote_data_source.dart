import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/core/error/exceptions.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/data/model/song_model.dart';

abstract interface class SongsRemoteDataSource {
  Future<List<SongModel>> getNewsSongs();
  Future<String> updateFavoriteSong({
    required String songId,
    required bool favorite,
  });
  // Future<Either> getPlayList();
  // Future<Either> addOrRemoveFavoriteSong(String songId);
  // Future<bool> isFavoriteSong(String songId);
  // Future<Either> getUserFavoriteSongs();
}

class SongRemoteDataSourceImpl implements SongsRemoteDataSource {
  @override
  Future<List<SongModel>> getNewsSongs() async {
    try {
      var data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('releaseDate', descending: true)
          .get();

      print('Runtime type of data: ${data.runtimeType}');
      print('Runtime type of data.docs: ${data.docs.runtimeType}');

      return data.docs.map((song) => SongModel.fromJson(song.data())).toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> updateFavoriteSong(
      {required String songId, required bool favorite}) async {
    try {
      await FirebaseFirestore.instance
          .collection('songs')
          .doc(songId)
          .update({'isFavorite': favorite});

      return 'success';
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  // @override
  // Future<String> updateFavoriteSong({
  //   required
  // }) async{
  //   try {
  //     await FirebaseFirestore.instance
  //       .collection('songs')
  //       .doc(doc.id)
  //       .update({'isFavorite': true});

  //   } catch (e) {
  //     throw ServerException(e.toString());
  //   }
  // }
}
