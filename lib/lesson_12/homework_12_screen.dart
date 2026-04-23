import 'package:flutter/material.dart';

class Homework12Screen extends StatefulWidget {
  const Homework12Screen({super.key});

  @override
  State<Homework12Screen> createState() => _Homework12ScreenState();
}

class _Homework12ScreenState extends State<Homework12Screen> {
  int selectedRating = 0;

  final TextEditingController feedbackController = TextEditingController();

  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEF2FC),
      appBar: AppBar(
        title: const Text('Оцінка візиту до магазину'),
      ),

      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 10,
            children: [
              Container(
                height: 80,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromRGBO(0, 0, 0, 0.06),
                      offset: const Offset(0, 1),
                      blurRadius: 0,
                      spreadRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: List.generate(5, (index) {
                    final starNumber = index + 1;
                    final imagePath = starNumber <= selectedRating
                        ? 'assets/images/rating1.png'
                        : 'assets/images/rating2.png';

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedRating == starNumber) {
                            selectedRating = 0;
                          } else {
                            selectedRating = starNumber;
                          }
                        });
                      },
                      child: Image.asset(imagePath, width: 48, height: 48),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    'Яку оціночку поставите відділам?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              MyWidget(
                title: 'Випічка',
              ),
              MyWidget(
                title: 'Лавка традицій',
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 4,
                  top: 4,
                  left: 16,
                  right: 16,
                ),
                child: Text(
                  'Є що додати?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 30,
                  top: 4,
                  left: 16,
                  right: 16,
                ),
                child: TextField(
                  controller: feedbackController,
                  style: TextStyle(
                    color: Color.fromRGBO(32, 33, 36, 0.54),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Поділіться загальним враженням',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.00)),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(32, 33, 36, 0.24),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.00)),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(32, 33, 36, 0.24),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ColoredBox(
        color: Colors.white,
        child: SafeArea(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12,
                right: 16,
                left: 16,
                bottom: 0,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1135BA),
                  overlayColor: Colors.white.withValues(alpha: 0.20),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'Надіслати',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum ReactionType { none, like, dislike }

class MyWidget extends StatefulWidget {
  const MyWidget({
    required this.title,
    super.key,
  });

  final String title;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  ReactionType serviceReaction = ReactionType.none;
  ReactionType assortmentReaction = ReactionType.none;
  final TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              bottom: 8,
              left: 12,
              right: 12,
              top: 8,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFF6F8FD),
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(
                width: 1,
                color: const Color.fromRGBO(19, 19, 30, 0.04),
              ),
            ),
            child: Row(
              spacing: 12,
              children: [
                Expanded(
                  child: Text(
                    'Обслуговування',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (serviceReaction == ReactionType.dislike) {
                        serviceReaction = ReactionType.none;
                      } else {
                        serviceReaction = ReactionType.dislike;
                      }
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: serviceReaction == ReactionType.dislike
                          ? Color(0xFF2358D1)
                          : Color.fromRGBO(19, 19, 30, 0.04),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.thumb_down_alt_outlined,
                      color: serviceReaction == ReactionType.dislike
                          ? Colors.white
                          : Colors.grey.shade700,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (serviceReaction == ReactionType.like) {
                        serviceReaction = ReactionType.none;
                      } else {
                        serviceReaction = ReactionType.like;
                      }
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: serviceReaction == ReactionType.like
                          ? Color(0xFF2358D1)
                          : Color.fromRGBO(19, 19, 30, 0.04),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.thumb_up_alt_outlined,
                      color: serviceReaction == ReactionType.like
                          ? Colors.white
                          : Colors.grey.shade700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              bottom: 8,
              left: 12,
              right: 12,
              top: 8,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFF6F8FD),
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(
                width: 1,
                color: const Color.fromRGBO(19, 19, 30, 0.04),
              ),
            ),
            child: Row(
              spacing: 12,
              children: [
                Expanded(
                  child: Text(
                    'Асортимент',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (assortmentReaction == ReactionType.dislike) {
                        assortmentReaction = ReactionType.none;
                      } else {
                        assortmentReaction = ReactionType.dislike;
                      }
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: assortmentReaction == ReactionType.dislike
                          ? Color(0xFF2358D1)
                          : Color.fromRGBO(19, 19, 30, 0.04),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.thumb_down_alt_outlined,
                      color: assortmentReaction == ReactionType.dislike
                          ? Colors.white
                          : Colors.grey.shade700,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (assortmentReaction == ReactionType.like) {
                        assortmentReaction = ReactionType.none;
                      } else {
                        assortmentReaction = ReactionType.like;
                      }
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: assortmentReaction == ReactionType.like
                          ? Color(0xFF2358D1)
                          : Color.fromRGBO(19, 19, 30, 0.04),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.thumb_up_alt_outlined,
                      color: assortmentReaction == ReactionType.like
                          ? Colors.white
                          : Colors.grey.shade700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
              top: 8,
            ),
            child: TextField(
              controller: commentController,
              style: TextStyle(
                color: Color.fromRGBO(32, 33, 36, 0.54),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                labelText: 'Розкажіть докладніше',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.00)),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(32, 33, 36, 0.24),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.00)),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(32, 33, 36, 0.24),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
