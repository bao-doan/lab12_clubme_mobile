import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/api/prefs/prefs_client.dart';
import 'package:lab12_clubme_mobile/core/api/resources/song_rest.dart';
import 'package:lab12_clubme_mobile/core/models/artist_model.dart';
import 'package:lab12_clubme_mobile/core/providers/song_provider.dart';
import 'package:lab12_clubme_mobile/ui/animations/lib_fade_animation.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_bottom_navigation.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_button_fill.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_button_outline.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_detail_page.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_song_list.dart';
import 'package:lab12_clubme_mobile/ui/pages/auth_login_register/login_page.dart';
import 'package:lab12_clubme_mobile/ui/pages/auth_login_register/register_page.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/lib_card_artist.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/lib_tag_badge.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/section_albums.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/section_artists.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/section_tags.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:lab12_clubme_mobile/core/data/music_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:lab12_clubme_mobile/core/api/rest_client_mixin.dart';
import 'package:lab12_clubme_mobile/ui/pages/player_page/player_page.dart';
import 'package:lab12_clubme_mobile/core/providers/player_provider.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_background.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_quickplay_panel.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_song_item.dart';
import 'package:lab12_clubme_mobile/ui/utils/payload_helper.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final auth = true;
  @override
  Widget build(BuildContext context) {
    return LibDetailPage(
      title: 'Settings & Account',
      themeMode: 2,
      children: [
        SizedBox(height: 20,),
        // LibFadeAnimation(
        //   child: auth
        //       ? buildProfile()
        //       : buildAuthButtons(context),
        // ),
        SizedBox(height: 50,),
        LibFadeAnimation(
          delay: 0.2,
          child: LayoutBuilder(
            builder: (context, constraints) => SizedBox(
              child: Text(
                'From Creator,\n\nThank you for choosing our Platform for your entertainment.\nHope you have relaxing time with music.\n\nApplication is still under development.\nAny feedback please send email to: <baodoan.tech@gmail.com>\n\nHappy time ♥️',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: kTextColor.withOpacity(0.7),
                  wordSpacing: 2,height: 1.7
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Row buildAuthButtons(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: LibButtonOutline(
              label: 'Login',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginPage(),
                    ),
                );
              }
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: LibButtonFill(
              label: 'Register',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
            ),
          ),
        ],
      );
  }

  Row buildProfile() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: PayloadHelper.imageFromUri(''),
            radius: 45,
          ),
         SizedBox(width: 20,),
         Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             SizedBox(height: 5.0,),
             Text(
               '@username',
               style: TextStyle(
                 color: kTextColor,
               ),
             ),
             SizedBox(height: 20.0,),
             LibButtonOutline(
               label: 'Logout',
             )
           ],
         )
        ],
      );
  }

}
