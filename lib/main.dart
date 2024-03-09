import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Row(
        children: [
          Spacer(),
          Flexible(
            flex: 1,
            child: LearningItemCard(leaningItem: LeaningItem(
              imageWidget: Image.network('https://picsum.photos/200/300'),
              tags: [Tag('Flutter', Colors.blue), Tag('Dart', Colors.blue)],
              progress: Progress.notStarted,
              date: LeaningItemDate(2022, 12),
              title: 'Learning Flutter',
              description: 'This is a learning item card',
            ),),
          ),
        ],
      ),
    );
  }
}

class LearningItemCard extends StatelessWidget {
  final LeaningItem leaningItem;
  const LearningItemCard({super.key, required this.leaningItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraintsssssss) {
            //tip AspectiRatioはheightがinfiniteの場合、widthを基準にしてくれる
            return Container(decoration: BoxDecoration(border: Border.all()),child: AspectRatio(child: LayoutBuilder(
              builder: (context, constraintsss) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Text(constraints.maxWidth.toString()),
                    LayoutBuilder(builder: (context, constraints) {
                      return Text('${constraints.maxHeight} ${constraints.maxWidth} ${constraintsss.maxHeight} ${constraintsss.maxWidth} ${constraintsssssss.maxHeight} ${constraintsssssss.maxWidth}');
                    }),
                    Flexible(child: leaningItem.imageWidget),
                  ],
                );
              }
            ), aspectRatio: 16/9));
          }
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            return Text('${constraints.maxHeight} ${constraints.maxWidth}');
          }
        ),
      ]
    );
  }

}

class LeaningItem {
  final String title;
  final String description;
  final Image imageWidget;
  final List<Tag> tags;
  final Progress progress;
  final LeaningItemDate date;

  LeaningItem({required this.imageWidget, required this.tags, required this.progress, required this.date, required this.title, required this.description});
}

class Tag{
  final String name;
  final Color color;
  Tag(this.name, this.color);
}

class LeaningItemDate {
  late final int year;
  late final int month;

  LeaningItemDate(int year, int month) {
    if (2000 > year || year > 2200) {
      throw Exception(
        'Year must be between 2000 and 2100');
    }
    if (1 > month || month > 12) {
      throw Exception(
        'Month must be between 1 and 12');
    }
    this.year = year;
    this.month = month;
  }
}

enum Progress {
  notStarted,
  inProgress,
  completed,
}