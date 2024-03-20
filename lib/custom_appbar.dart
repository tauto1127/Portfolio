import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double offset;
  const CustomAppBar({super.key, required this.offset});

  static const max = 255 * 10;
  int _calculateOpacity(double offset) {
    if (offset < 0 || offset > max) {
      return 0;
    } else {
      return 255 - (255 * (offset / max)).toInt();
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('offset: $offset');
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        constraints: const BoxConstraints.expand(),
        color: Color.fromARGB(_calculateOpacity(offset), 255, 255, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text("活動成果"),
              onPressed: () {},
            ),
            Text('制約はheight: ${constraints.maxHeight}, width: ${constraints.maxWidth}です。, '),
          ],
        ),
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
