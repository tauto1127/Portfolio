import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MyApp());
}

LeaningItem content1 = LeaningItem(
  imageWidget: Image.network('https://picsum.photos/1920/1080'),
  tags: [Tag('Flutter', Colors.blue), Tag('Dart', Colors.blue)],
  progress: Progress.notStarted,
  date: LeaningItemDate(2022, 12),
  title: 'Learning Flutter',
  description:
      'これは学習アイテムカードです。その目的は、学習アイテムをカード形式で表示することです。タイトル、説明、画像があります。また、タグ、進行状況、日付もあります。タグは、学習アイテムのタグを表示するために使用されます。',
);
LeaningItem content2 = LeaningItem(
  imageWidget: Image.network('https://picsum.photos/1920/1080'),
  tags: [Tag('React', Colors.red), Tag('JavaScript', Colors.yellow)],
  progress: Progress.inProgress,
  date: LeaningItemDate(2022, 12),
  title: 'Learning React',
  description:
      'これは学習アイテムカードです。その目的は、学習アイテムをカード形式で表示することです。タイトル、説明、画像があります。また、タグ、進行状況、日付もあります。タグは、学習アイテムのタグを表示するために使用されます。このカードは、ユーザーが学習アイテムの詳細情報にアクセスできるようにするために使用されます。ユーザーは、タイトル、説明、画像、タグ、進行状況、日付などの情報を確認できます。さらに、ユーザーは学習アイテムの進行状況を更新することもできます。このカードは、学習アプリや教育アプリなどのアプリケーションで広く使用されています。',
);
LeaningItem content3 = LeaningItem(
  imageWidget: Image.network('https://picsum.photos/1920/1080'),
  tags: [Tag('Python', Colors.green), Tag('Django', Colors.green)],
  progress: Progress.completed,
  date: LeaningItemDate(2022, 12),
  title: 'Learning Python',
  description:
      'これは学習アイテムカードです。その目的は、学習アイテムをカード形式で表示することです。タイトル、説明、画像があります。また、タグ、進行状況、日付もあります。タグは、学習アイテムのタグを表示するために使用されます。このカードは、ユーザーが学習アイテムの詳細情報にアクセスできるようにするために使用されます。ユーザーは、タイトル、説明、画像、タグ、進行状況、日付などの情報を確認できます。さらに、ユーザーは学習アイテムの進行状況を更新することもできます。このカードは、学習アプリや教育アプリなどのアプリケーションで広く使用されています。',
);

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
        home: Scaffold(
            body: GridView.custom(
                gridDelegate: SliverWovenGridDelegate.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    pattern: [
                      WovenGridTile(3 / 5),
                      WovenGridTile(1),
                    ]),
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) => index.isOdd
                      ? LearningItemCard(leaningItem: content1)
                      : LearningItemCard(leaningItem: content2),
                ))));
  }
}

class LearningItemList extends StatelessWidget {
  const LearningItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return LearningItemCard(
              leaningItem: index.isEven ? content1 : content2);
        });
  }
}

class LearningItemCard extends StatelessWidget {
  final LeaningItem leaningItem;
  final double? width;
  const LearningItemCard({
    super.key,
    required this.leaningItem,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: this.width ?? constraints.maxWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(constraints.maxWidth / 18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          AspectRatio(
              aspectRatio: 16 / 9,
              child: LayoutBuilder(builder: (context, constraintsss) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                        child: ClipRRect(
                            child: leaningItem.imageWidget,
                            borderRadius: BorderRadius.circular(
                                constraintsss.maxWidth / 18))),
                  ],
                );
              })),
          LayoutBuilder(builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: SelectableText(
                      leaningItem.title,
                      style: TextStyle(fontSize: constraints.maxWidth / 20),
                    ),
                  ),
                  SizedBox(height: constraints.maxWidth / 30),
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      // child: SelectableText(
                      //   textAlign: TextAlign.center,
                      //   leaningItem.description,
                      //   style: TextStyle(fontSize: constraints.maxWidth / 30),
                      child: Text(
                        leaningItem.description,
                        style: TextStyle(fontSize: constraints.maxWidth / 30),
                      )),
                  Padding(
                    padding: EdgeInsets.all(constraints.maxWidth / 25),
                    child: Wrap(
                      spacing: constraints.maxWidth / 40,
                      runSpacing: constraints.maxWidth / 40,
                      children: leaningItem.tags
                          .map((tag) => Chip(
                                label: Text(tag.name),
                                backgroundColor: tag.color,
                                labelStyle: TextStyle(
                                    fontSize: constraints.maxWidth /
                                        35), // Adjust the font size here
                              ))
                          .toList(),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       left: constraints.maxWidth / 35,
                  //       right: constraints.maxWidth / 35,
                  //       bottom: constraints.maxWidth / 35),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //           child: SelectableText(
                  //               textAlign: TextAlign.start,
                  //               leaningItem.progress.toString().split('.').last,
                  //               style: TextStyle(
                  //                   fontSize: constraints.maxWidth / 30))),
                  //       Expanded(
                  //         child: SelectableText(
                  //             textAlign: TextAlign.end,
                  //             '${leaningItem.date.year}/${leaningItem.date.month}',
                  //             style: TextStyle(
                  //                 fontSize: constraints.maxWidth / 30)),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            );
          }),
        ]),
      );
    });
  }
}

class LeaningItem {
  final String title;
  final String description;
  final Image imageWidget;
  final List<Tag> tags;
  final Progress progress;
  final LeaningItemDate date;

  LeaningItem(
      {required this.imageWidget,
      required this.tags,
      required this.progress,
      required this.date,
      required this.title,
      required this.description});
}

class Tag {
  final String name;
  final Color color;
  Tag(this.name, this.color);
}

class LeaningItemDate {
  late final int year;
  late final int month;

  LeaningItemDate(int year, int month) {
    if (2000 > year || year > 2200) {
      throw Exception('Year must be between 2000 and 2100');
    }
    if (1 > month || month > 12) {
      throw Exception('Month must be between 1 and 12');
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
