import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_netflix/app/screens/introduction/modals/components/expanded_widget.dart';
import 'package:flutter_netflix/app/screens/introduction/modals/controllers/question_controller.dart';
import 'package:flutter_netflix/app/screens/introduction/modals/models/question_model.dart';

class QuestionWidget extends StatefulWidget {
  final QuestionModel question;
  const QuestionWidget(
    this.question, {
    Key? key,
  }) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  final AnimateIconController _animationController = AnimateIconController();
  final controller = QuestionController();

  bool _onTap() {
    controller.changeOpen();
    if (controller.isOpen) {
      return _animationController.animateToEnd();
    } else {
      return _animationController.animateToStart();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Observer(
        builder: (_) => Column(
          children: [
            GestureDetector(
              onTap: _onTap,
              child: Container(
                padding: const EdgeInsets.only(left: 16.0),
                color: Colors.grey[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.question.title,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    AnimateIcons(
                      clockwise: false,
                      startIcon: Icons.add,
                      endIcon: Icons.close,
                      startIconColor: Colors.black,
                      endIconColor: Colors.black,
                      duration: const Duration(milliseconds: 300),
                      onStartIconPress: _onTap,
                      onEndIconPress: _onTap,
                      controller: _animationController,
                    ),
                  ],
                ),
              ),
            ),
            ExpandedWidget(
              expand: controller.isOpen,
              child: Container(
                width: double.infinity,
                color: Colors.grey[400],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.question.description,
                    style: const TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
