import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/app/commons/style/colors.dart';
import 'package:quiz/app/commons/style/text_style.dart';
import 'package:quiz/app/modules/quiz/controllers/quiz_controller.dart';
import 'package:quiz/app/routes/app_pages.dart';

class QuizView extends GetView<QuizController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundcolor,
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CircleAvatar(
              backgroundImage: NetworkImage(controller.user.photoURL!),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 30),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      width: Get.size.width * 0.4,
                      child: Image.asset(
                        "assets/images/quiz.png",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "Welcome, ${controller.user.displayName!.split(' ')[0]}",
                    style: AppTextStyle.boldStyle(
                        fontSize: 22, color: Colors.grey.shade800),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    ' Score Board',
                    style: TextStyle(fontSize: 20, color: AppColors.textBlack),
                  ),
                ),
                StreamBuilder(
                  stream: controller.firestoreService.users
                      .doc(controller.user.uid)
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(
                                snapshot.data[index]['score'],
                                style: AppTextStyle.semiBoldStyle(fontSize: 14),
                              ),
                              subtitle: Text(
                                snapshot.data[index].toString(),
                                style: AppTextStyle.regularStyle(fontSize: 12),
                              ),
                            );
                          },
                        ),
                      );
                    } else
                      return SizedBox.shrink();
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(
                Routes.QUESTIONS,
              );
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
                  "Play",
                  style: AppTextStyle.semiBoldStyle(
                      fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
