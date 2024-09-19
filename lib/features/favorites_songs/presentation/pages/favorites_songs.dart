import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FavoritesSongsPage extends StatelessWidget {
  const FavoritesSongsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Songs')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('songs')
            .where('isFavorite',
                isEqualTo: true) // Filter to only get favorite songs
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // Get the list of favorite songs
          var songs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              var song = songs[index];

              return ListTile(
                title: Text(song['title']), // Assuming 'title' is a field
                trailing: IconButton(
                  icon: Icon(
                    song['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                    color: song['isFavorite'] ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    // Toggle favorite status on click
                    FirebaseFirestore.instance
                        .collection('songs')
                        .doc(song.id)
                        .update({
                      'isFavorite': !song['isFavorite'], // Toggle isFavorite
                    });
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
