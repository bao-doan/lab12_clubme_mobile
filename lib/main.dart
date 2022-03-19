import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/providers/album_provider.dart';
import 'package:lab12_clubme_mobile/core/providers/artist_provider.dart';
import 'package:lab12_clubme_mobile/core/providers/auth_provider.dart';
import 'package:lab12_clubme_mobile/core/providers/favorite_provider.dart';
import 'package:lab12_clubme_mobile/core/providers/navigation_provider.dart';
import 'package:lab12_clubme_mobile/core/providers/song_provider.dart';
import 'package:lab12_clubme_mobile/ui/pages/favorite_page/favorite_page.dart';
import 'package:lab12_clubme_mobile/ui/pages/setting_page/setting_page.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:lab12_clubme_mobile/core/data/music_data.dart';
import 'package:lab12_clubme_mobile/ui/pages/player_page/player_page.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/playlist_page.dart';
import 'package:lab12_clubme_mobile/core/providers/player_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider(),),
        ChangeNotifierProvider(create: (context) => NavigationProvider(),),
        ChangeNotifierProvider(create: (context) => PlayerProvider(),),
        ChangeNotifierProvider(create: (context) => SongProvider(),),
        ChangeNotifierProvider(create: (context) => ArtistProvider(),),
        ChangeNotifierProvider(create: (context) => AlbumProvider(),),
        ChangeNotifierProvider(create: (context) => FavoriteProvider(),),
      ],
      child: MaterialApp(
        title: 'Clubme by Lab12',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.pinkAccent,
            textTheme: TextTheme(
              headline4: TextStyle(
                color: kTextColor,
              ),
              headline5: TextStyle(
                color: kTextColor,
              ),
              headline6: TextStyle(
                color: kTextColor,
              ),
              subtitle1: TextStyle(
                color: kTextColor.withOpacity(0.6),
              ),
              bodyText1: TextStyle(
                color: kTextColor,
              ),
            )
        ),
        initialRoute: 'explore',
        routes: {
          'explore': (context) => PlaylistPage(),
          'favorites': (context) => FavoritePage(),
          'settings': (context) => SettingPage(),
        },
      ),
    );
  }
}

