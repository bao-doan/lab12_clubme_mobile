import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/providers/navigation_provider.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/pages/favorite_page/favorite_page.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/playlist_page.dart';
import 'package:lab12_clubme_mobile/ui/pages/setting_page/setting_page.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:provider/provider.dart';

class LibBottomNavigation extends StatefulWidget {

  @override
  _LibBottomNavigationState createState() => _LibBottomNavigationState();

  LibBottomNavigation({
    Key? key
  });
}

class _LibBottomNavigationState extends State<LibBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return LibGlassmorphism(
      blur: 10,
      opacity: 0.2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          // top: 10.0,
        ),
        child: Consumer<NavigationProvider>(
          builder: (context, provider, child) => BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            selectedItemColor: Colors.lightGreenAccent,
            unselectedItemColor: Colors.white,
            currentIndex: provider.currentIndex,
            onTap: (int index) {
              switch (index) {
                case 0: {
                  provider.navigate('explore');
                  Navigator.pushNamed(context, 'explore');
                  break;
                }
                case 1: {
                  provider.navigate('favorites');
                  Navigator.pushNamed(context, 'favorites');
                  break;
                }
                case 2: {
                  provider.navigate('settings');
                  Navigator.pushNamed(context, 'settings');
                  break;
                }
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.music_note),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.heart_fill),
                  label: 'Favorites'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings'
              ),
            ],
          ),
        ),
      ),
    );
  }
}



