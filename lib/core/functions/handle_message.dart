import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:spotify/core/routes/app_router.dart';
import 'package:spotify/core/routes/app_router.gr.dart';
import 'package:spotify/init_dependencies.dart';

void handleMessage(RemoteMessage message) async {
  print(message.data);
  print("here is getting the data: ${message.data}");

  Map<String, dynamic> fgData = message.data;
  final fgRoute = fgData['screen'];
  final fgID = fgData['id'];
  final fgTitle = fgData['title'];

  final fgIndex = fgData['index'];
  final fgTopAlbum = fgData['top-alubums'];

  if (fgTopAlbum != null) {
    // Step 1: Decode the JSON string into a list of dynamic objects
    List<dynamic> fgTopAlbums = jsonDecode(fgTopAlbum);

    // Step 2: Create an empty list to store maps
    List albumList = [];

    print("Here is your list; $fgTopAlbums");

    // Step 3: Iterate over each album in the JSON list and add it to the map list
    fgTopAlbums.forEach((album) {
      albumList.add({
        'artist': album['artist'],
        'duration': album['duration'],
        'id': album['id'],
        'isFavorite': album['isFavorite'],
        'title': album['title'],
      });
    });

    if (fgRoute == "CuponsDetailRoute") {
      print('\x1B[33mThis is successfull.\x1B[0m');
      serviceLocator<AppRouter>()
          .push(MusicRoute(index: int.parse(fgIndex), songsList: albumList));
    }
  }
}
