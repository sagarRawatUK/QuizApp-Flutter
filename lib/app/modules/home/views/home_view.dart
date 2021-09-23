import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/app/commons/style/colors.dart';
import 'package:quiz/app/commons/style/text_style.dart';
import 'package:quiz/app/modules/home/controllers/home_controller.dart';
import 'package:quiz/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/bg.jpg",
                ),
                fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Get Started!",
                style:
                    AppTextStyle.boldStyle(fontSize: 22, color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "A trivia quiz to make your mind sweat. How much can you score ?. Give it a try!",
                textAlign: TextAlign.center,
                style:
                    AppTextStyle.boldStyle(fontSize: 14, color: Colors.white),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  controller.signInGoogle();
                },
                child: Container(
                  padding: EdgeInsetsDirectional.only(start: 10),
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: Image.asset(
                          "assets/images/ic_google.png",
                          scale: 3,
                        ),
                      ),
                      Spacer(),
                      Text("Sign in with Google",
                          style: AppTextStyle.semiBoldStyle(
                              fontSize: 15, color: AppColors.textBlack)),
                      Spacer(flex: 2),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.size.height * 0.12,
              )
            ],
          ),
        ),
      ],
    ));
  }
}
