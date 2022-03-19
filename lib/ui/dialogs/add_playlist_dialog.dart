import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_card_inline.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_dialog.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';

class AddPlaylistDialog extends StatefulWidget {
  const AddPlaylistDialog({Key? key}) : super(key: key);

  @override
  _AddPlaylistDialogState createState() => _AddPlaylistDialogState();
}

class _AddPlaylistDialogState extends State<AddPlaylistDialog> {
  onClose() {
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return LibDialog(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text(
              'Add to Playlist',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: () {
                onClose();
              },
              child: LibCardInline(
                image: '',
                label: 'Night party playlist',
              ),
            )
          ],
        ),
      ),
    );
  }
}
