import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class LearningItemList extends StatelessWidget {
  final List<LearningItem> learningItems;
  const LearningItemList({super.key, required this.learningItems});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: StaggeredGrid.count(crossAxisCount: 2,
       mainAxisSpacing: 25, 
       crossAxisSpacing: 25,  children: learningItems.map((learningItem) => LearningItemCard(leaningItem: learningItem)).toList()),
    );
     }
}

class LearningItemCard extends StatelessWidget {
  final LearningItem leaningItem;
  final double? width;
  final Function(Image image)? imageWidget;
  const LearningItemCard({
    super.key,
    required this.leaningItem,
    this.width,
    this.imageWidget,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: width ?? constraints.maxWidth,
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
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            LayoutBuilder(builder: (context, constraintsss) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                      child: ClipRRect(borderRadius: BorderRadius.circular(constraintsss.maxWidth / 18), child: leaningItem.imageWidget)),
                ],
              );
            }),
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
                                  labelStyle: TextStyle(fontSize: constraints.maxWidth / 35), // Adjust the font size here
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ]),
        ),
      );
    });
  }
}

class LearningItem {
  final String title;
  final String description;
  final Image imageWidget;
  final List<Tag> tags;
  final Progress progress;
  final LeaningItemDate date;

  LearningItem(
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

  LeaningItemDate(this.year, this.month) {
    if (2000 > year || year > 2200) {
      throw Exception('Year must be between 2000 and 2100');
    }
    if (1 > month || month > 12) {
      throw Exception('Month must be between 1 and 12');
    }
  }
}

enum Progress {
  notStarted,
  inProgress,
  completed,
}
LearningItem content1 = LearningItem(
  imageWidget: Image.network('https://picsum.photos/1920/1080'),
  tags: [Tag('Flutter', Colors.blue), Tag('Dart', Colors.blue)],
  progress: Progress.notStarted,
  date: LeaningItemDate(2022, 12),
  title: 'Learning Flutter',
  description: 'これは学習アイテムカードです。その目的は、学習アイテムをカード形式で表示することです。タイトル、説明、画像があります。また、タグ、進行状況、日付もあります。タグは、学習アイテムのタグを表示するために使用されます。',
);
LearningItem content2 = LearningItem(
  imageWidget: Image.network('https://picsum.photos/1080/1920'),
  tags: [Tag('React', Colors.red), Tag('JavaScript', Colors.yellow)],
  progress: Progress.inProgress,
  date: LeaningItemDate(2022, 12),
  title: 'Learning React',
  description:
      'これは学習アイテムカードです。その目的は、学習アイテムをカード形式で表示することです。タイトル、説明、画像があります。また、タグ、進行状況、日付もあります。タグは、学習アイテムのタグを表示するために使用されます。このカードは、ユーザーが学習アイテムの詳細情報にアクセスできるようにするために使用されます。ユーザーは、タイトル、説明、画像、タグ、進行状況、日付などの情報を確認できます。さらに、ユーザーは学習アイテムの進行状況を更新することもできます。このカードは、学習アプリや教育アプリなどのアプリケーションで広く使用されています。',
);
LearningItem content3 = LearningItem(
  imageWidget: Image.network('https://picsum.photos/1920/1080'),
  tags: [Tag('Python', Colors.green), Tag('Django', Colors.green)],
  progress: Progress.completed,
  date: LeaningItemDate(2022, 12),
  title: 'Learning Python',
  description:
      'これは学習アイテムカードです。その目的は、学習アイテムをカード形式で表示することです。タイトル、説明、画像があります。また、タグ、進行状況、日付もあります。タグは、学習アイテムのタグを表示するために使用されます。このカードは、ユーザーが学習アイテムの詳細情報にアクセスできるようにするために使用されます。ユーザーは、タイトル、説明、画像、タグ、進行状況、日付などの情報を確認できます。さらに、ユーザーは学習アイテムの進行状況を更新することもできます。このカードは、学習アプリや教育アプリなどのアプリケーションで広く使用されています。',
);