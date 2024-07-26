import 'package:get_it/get_it.dart';
import 'package:spotify/features/auth/signin/data/datasource/auth_remote_data_source.dart';
import 'package:spotify/features/auth/signin/data/repositories/auth_repository_imp.dart';
import 'package:spotify/features/auth/signin/domain/repositories/auth_repository.dart';
import 'package:spotify/features/auth/signin/domain/usecases/user_sign_in.dart';
import 'package:spotify/features/auth/signin/domain/usecases/user_sign_up.dart';
import 'package:spotify/features/auth/signin/presentation/bloc/auth_bloc.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/data/datasource/songs_remote_data_source.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/data/repositories/song_repository_impl.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/domain/repositories/song_repository.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/domain/usecases/get_all_songs.dart';
import 'package:spotify/features/dashboard/bottom_nav_pages/home/presentation/bloc/song_bloc/song_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initHome();
}

//-- register data source
void _initAuth() {
  serviceLocator

    //--  Data Source
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(),
    )

    //-- Repositories
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
      ),
    )

    //-- Use cases

    ..registerFactory(
      () => UserSignUp(
        authRepositiry: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserSignIn(
        authRepositiry: serviceLocator(),
      ),
    )

    //-- Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        userSignUp: serviceLocator(),
        userSignIn: serviceLocator(),
        // currentUser: serviceLocator(),
        // appUserCubit: serviceLocator(),
      ),
    );
}

//-- home page

void _initHome() {
  serviceLocator
    //--  Data Source
    ..registerFactory<SongsRemoteDataSource>(
      () => SongRemoteDataSourceImpl(),
    )

    //-- Repositories
    ..registerFactory<SongRepository>(
      () => SongRepositoryImpl(
        serviceLocator(),
      ),
    )

    //-- Use cases

    ..registerFactory(
      () => GetAllSongs(
        songRepository: serviceLocator(),
      ),
    )

    //-- Bloc
    ..registerLazySingleton(
      () => SongBloc(
        getAllSongs: serviceLocator(),
      ),
    );
}

// void _initDashboard() {
//   serviceLocator

//     //--  Data Source
//     ..registerFactory<BottomNavTabBloc>(
//       () =,
//     );
// }
