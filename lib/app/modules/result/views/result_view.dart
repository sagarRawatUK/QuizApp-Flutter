import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/app/commons/style/colors.dart';
import 'package:quiz/app/commons/style/text_style.dart';
import 'package:quiz/app/modules/result/controllers/result_controller.dart';
import 'package:quiz/app/routes/app_pages.dart';

class ResultView extends GetView<ResultController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundcolor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Score Card".toUpperCase(),
                  style: AppTextStyle.semiBoldStyle(
                      fontSize: 20, color: Colors.grey.shade800),
                ),
                SizedBox(height: 20),
                Text(
                  "You got".toUpperCase(),
                  style: AppTextStyle.semiBoldStyle(
                      fontSize: 30, color: Colors.grey.shade800),
                ),
                SizedBox(height: 30),
                CircleAvatar(
                  backgroundColor: AppColors.correct,
                  radius: 80,
                  child: Text(
                    "0/15",
                    style: AppTextStyle.boldStyle(
                        fontSize: 60, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  controller.title.toString().toUpperCase(),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.semiBoldStyle(fontSize: 20),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.offNamed(Routes.QUIZ);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    padding: EdgeInsetsDirectional.only(start: 10),
                    height: 55,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        "Home",
                        style: AppTextStyle.semiBoldStyle(
                            fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
