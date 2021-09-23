import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/app/commons/style/colors.dart';
import 'package:quiz/app/commons/style/text_style.dart';
import 'package:quiz/app/modules/questions/controllers/questions_controller.dart';
import 'package:quiz/app/routes/app_pages.dart';

class QuestionsView extends GetView<QuestionsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundcolor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: AppColors.backgroundcolor,
          title: Text(
            'Questions',
            style: AppTextStyle.boldStyle(
                fontSize: 20, color: AppColors.textBlack),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            FutureBuilder(
              future: controller.getQuestions(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: EdgeInsets.only(top: Get.size.height * 0.4),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: [
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          String question = snapshot.data[index].question
                              .replaceAll("&quot;", "")
                              .replaceAll("&#039;", "");
                          String answer = snapshot.data[index].correct_answer
                              .replaceAll("&quot;", "")
                              .replaceAll("&#039;", "");
                          String option1 = snapshot
                              .data[index].incorrect_answers[0]
                              .replaceAll("&quot;", "")
                              .replaceAll("&#039;", "");
                          String option2 = snapshot
                              .data[index].incorrect_answers[1]
                              .replaceAll("&quot;", "")
                              .replaceAll("&#039;", "");
                          String option3 = snapshot
                              .data[index].incorrect_answers[2]
                              .replaceAll("&quot;", "")
                              .replaceAll("&#039;", "");

                          List<String> allOptions = [
                            answer,
                            option1,
                            option2,
                            option3
                          ];
                          allOptions.shuffle();
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Column(
                              children: [
                                Container(
                                  width: Get.size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                      gradient: AppColors.questionGradient,
                                      borderRadius:
                                          BorderRadiusDirectional.only(
                                              topEnd: Radius.circular(15),
                                              topStart: Radius.circular(15))),
                                  child: Text(
                                    question,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.boldStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                      border: Border.all(
                                          color: Colors.grey.shade300)),
                                  width: Get.size.width,
                                  child: Column(
                                    children: [
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: 4,
                                        itemBuilder: (BuildContext context,
                                            int optionindex) {
                                          return Obx(
                                            () => GestureDetector(
                                              onTap: () {
                                                if (!controller
                                                    .clicked[index].value) {
                                                  if (allOptions[optionindex] ==
                                                      answer) {
                                                    controller
                                                        .questionsList[index]
                                                            [optionindex]
                                                        .value = 1;
                                                    controller.score += 1;
                                                  } else {
                                                    controller
                                                        .questionsList[index]
                                                            [optionindex]
                                                        .value = -1;
                                                  }
                                                  controller.clicked[index]
                                                      .value = true;
                                                  controller
                                                      .totalSolved.value += 1;
                                                }
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 5),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 13),
                                                decoration: BoxDecoration(
                                                    color: controller
                                                                .questionsList[
                                                                    index][
                                                                    optionindex]
                                                                .value ==
                                                            0
                                                        ? Colors.white
                                                        : controller
                                                                    .questionsList[
                                                                        index][
                                                                        optionindex]
                                                                    .value ==
                                                                1
                                                            ? AppColors.correct
                                                            : AppColors.wrong,
                                                    border: Border.all(
                                                        color: Colors
                                                            .grey.shade300),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Text(
                                                  allOptions[optionindex],
                                                  style: AppTextStyle.mediumStyle(
                                                      color: controller
                                                                  .questionsList[
                                                                      index][
                                                                      optionindex]
                                                                  .value ==
                                                              0
                                                          ? Colors.black
                                                          : Colors.white),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            Routes.RESULT,
                            arguments: controller.score.value,
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          padding: EdgeInsetsDirectional.only(start: 10),
                          height: 55,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              "Done",
                              style: AppTextStyle.semiBoldStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else
                  return Center(
                    child: Text(
                      "Network Error",
                      style: AppTextStyle.semiBoldStyle(
                          fontSize: 16, color: AppColors.textBlack),
                    ),
                  );
              },
            ),
          ],
        ));
  }
}
