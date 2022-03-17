import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_shimmer.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';

class LibSectionScrollSkeleton extends StatelessWidget {
  const LibSectionScrollSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 10,
          children: [
            ...List.generate(3, (index) => index)
                .map((e) => SizedBox(
                      width: 0.45 * constraints.maxWidth,
                      child: SizedBox(
                        // height: 500,
                        // width: double.infinity,
                        child: Column(
                          children: [
                            ...List.generate(1, (i) => i)
                                .map(
                                  (e) => LibShimmer.rect(
                                    height: 150,
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ],
        ),
      ),
    );
    // return ;
  }
}
