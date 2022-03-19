import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/api/prefs/prefs_client.dart';
import 'package:lab12_clubme_mobile/core/api/resources/song_rest.dart';
import 'package:lab12_clubme_mobile/core/models/artist_model.dart';
import 'package:lab12_clubme_mobile/core/providers/auth_provider.dart';
import 'package:lab12_clubme_mobile/core/providers/song_provider.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_bottom_navigation.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_button_fill.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_detail_page.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_form_input.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_song_list.dart';
import 'package:lab12_clubme_mobile/ui/pages/auth_login_register/register_page.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/lib_card_artist.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/lib_tag_badge.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/section_albums.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/section_artists.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/section_tags.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/playlist_page.dart';
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

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? errorMessage;

  onResetFields() {
    _usernameController.clear();
    _passwordController.clear();
  }

  onSubmit() async {
    if (_formKey.currentState!.validate()) {
      try {
        final provider = Provider.of<AuthProvider>(context, listen: false);
        final result = await provider.login(username: _usernameController.text, password: _passwordController.text);
        print(result);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlaylistPage()),
        );
        onResetFields();
      }
      catch (message) {
        print('thwowwww $message');
        setState(() {
          errorMessage = message as String;
        });
      }
    } else {
      print('Invalid form');
    }
  }

  validatorRequired(String value) {
    return value != null && value.length > 0 ? null : 'Required';
  }

  validatorMinLength(String value, int minLength) {
    final s = minLength > 1 ? 's' : '';
    return value != null && value.length >= minLength ? null : 'At least $minLength character$s';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LibBackground(
        themeMode: 1,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login Account',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: kAccentColor,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 50,),
                  LibFormInput(
                    controller: _usernameController,
                    validator: (String value) {
                      return validatorRequired(value) ?? validatorMinLength(value, 6);
                    },
                    hint: 'Enter your username',
                    onChange: (value) {
                    },
                  ),
                  SizedBox(height: 10,),
                  LibFormInput(
                    controller: _passwordController,
                    validator: (String value) {
                      return validatorRequired(value) ?? validatorMinLength(value, 6);
                    },
                    hint: 'Enter your password',
                    type: 'password',
                    onChange: (value) {
                    },
                  ),
                  SizedBox(height: 40,),
                  errorMessage != null ? Text(
                    'Server Response: $errorMessage',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white60,
                    ),
                  ) : SizedBox(),
                  SizedBox(height: 10,),
                  LibButtonFill(
                    label: 'Login',
                    color: Colors.lightGreen,
                    onTap: () {
                      print('${_usernameController.text}, ${_passwordController.text}');
                      onSubmit();
                    },
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1.0,
                          color: kTextColor.withOpacity(0.7),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'or',
                          style: TextStyle(
                            color: kTextColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1.0,
                          color: kTextColor.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  LibButtonFill(
                    label: 'Register',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage()
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
