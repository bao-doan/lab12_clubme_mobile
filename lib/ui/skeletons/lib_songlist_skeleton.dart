import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_shimmer.dart';

class LibSonglistSkeleton extends StatelessWidget {
  int count;

  LibSonglistSkeleton({
    this.count = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(count, (i) => i).map((e) => ListTile(
          contentPadding: EdgeInsets.zero,
          leading: LibShimmer.rect(height: 50, width: 50, radius: 0,),
          title: LibShimmer(height: 16,),
          subtitle: LibShimmer(height: 10, width: 10,),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              LibShimmer.rect(height: 25, width: 25),
              SizedBox(width: 10,),
              LibShimmer.rect(height: 25, width: 25),
            ],
          ),
        )).toList()
      ],
    );
  }


}
