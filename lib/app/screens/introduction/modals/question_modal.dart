import 'package:flutter/material.dart';
import 'package:flutter_netflix/app/screens/introduction/modals/components/question_widget.dart';
import 'package:flutter_netflix/app/screens/introduction/modals/const/questions.dart';

class QuestionModal extends StatefulWidget {
  const QuestionModal({Key? key}) : super(key: key);

  @override
  _QuestionModalState createState() => _QuestionModalState();
}

class _QuestionModalState extends State<QuestionModal> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.black87,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Perguntas frequentes',
                  style: TextStyle(fontSize: 28.0, color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: questions.length,
                    itemBuilder: (context, i) {
                      final question = questions[i];
                      return QuestionWidget(question);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
