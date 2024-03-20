import 'package:flutter/material.dart';
import 'package:portfolio/custom_appbar.dart';
import 'package:portfolio/learning_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SingleChildScrollView scrollController = const SingleChildScrollView();
  double scrollOffset = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: CustomAppBar(offset: scrollOffset),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return NotificationListener(
                onNotification: (notification) {
                  if (notification is UserScrollNotification) {
                    setState(() {
                      scrollOffset = notification.metrics.pixels;
                    });
                  }
                  return false;
                },
                child: SingleChildScrollView(
                  controller: scrollController.controller,
                  child: LearningItemList(learningItems: [content1, content2, content3, content1],)                ),
              );
            },
          ),
        ));
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
