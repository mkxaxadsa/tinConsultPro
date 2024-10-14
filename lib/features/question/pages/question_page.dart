import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/question.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/others/divider_widget.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../widgets/answer_card.dart';
import '../widgets/correct_answers_dialog.dart';
import '../widgets/timer_card.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int index = 0;
  int correctAnswers = 0;
  int seconds = 20;
  bool canTap = true;
  Timer? _timer;

  void onRestart() {
    if (mounted) context.pop();
    setState(() {
      index = 0;
      correctAnswers = 0;
      seconds = 20;
    });
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (seconds > 0) {
          setState(() {
            seconds--;
          });
        } else {
          _timer?.cancel();
          if (index == 19) {
            if (mounted) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return CorrectAnswersDialog(
                    correctAnswers: correctAnswers,
                    onRestart: onRestart,
                  );
                },
              );
            }
          } else {
            seconds = 20;
            index++;
            setState(() {});
            startTimer();
          }
        }
      },
    );
  }

  void onAnswer(Answer answer) {
    if (!canTap) return;
    _timer?.cancel();
    answer.active = true;
    if (answer.correct) {
      logger('CORRECT!');
      correctAnswers++;
    }
    canTap = false;
    setState(() {});
    Future.delayed(const Duration(seconds: 1), () {
      seconds = 20;
      canTap = true;
      answer.active = false;
      startTimer();
      if (index == 19) {
        _timer?.cancel();
        if (mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return CorrectAnswersDialog(
                correctAnswers: correctAnswers,
                onRestart: onRestart,
              );
            },
          );
        }
      } else {
        index++;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    questionsList.shuffle();
    for (Question questions in questionsList) {
      questions.answers.shuffle();
    }
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    logger('DISPOSE TIMER');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 35 + getStatusBar(context)),
        Center(child: TextR('Question ${index + 1} out of 20', fontSize: 24)),
        const SizedBox(height: 25),
        const DividerWidget(),
        const SizedBox(height: 10),
        TimerCard(seconds: seconds),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: TextB(
            questionsList[index].question,
            fontSize: 24,
            maxLines: 4,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        const SizedBox(height: 30),
        AnswerCard(
          id: 'A',
          answer: questionsList[index].answers[0],
          onPressed: onAnswer,
        ),
        const SizedBox(height: 30),
        AnswerCard(
          id: 'B',
          answer: questionsList[index].answers[1],
          onPressed: onAnswer,
        ),
        const SizedBox(height: 30),
        AnswerCard(
          id: 'C',
          answer: questionsList[index].answers[2],
          onPressed: onAnswer,
        ),
        const SizedBox(height: 30),
        AnswerCard(
          id: 'D',
          answer: questionsList[index].answers[3],
          onPressed: onAnswer,
        ),
        const SizedBox(height: 66),
      ],
    );
  }
}
