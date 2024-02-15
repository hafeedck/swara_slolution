import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/buttons/common_button.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/colors/colors.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/text/text.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/textfield/textfield_with_text.dart';
import 'package:swara_solution_flutter_machine_test/app/extensions/extension.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        elevation: 0,
        bottomOpacity: 0,
        centerTitle: true,
        title: commonText("promilo", color: Colors.black),
      ),
      backgroundColor: whiteColor,
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                50.0.spaceY,
                Center(
                    child: commonText("Hi, Welcome Back!",
                        fontSize: 20, color: Colors.black)),
                25.0.spaceY,
                TextfieldWithText(
                  hintText: "Enter Email or Mob No",
                  labelText: "Please Sign in to continue",
                  textEditingController: controller.usernameController,
                  onChanged: (String value) {
                    if (value != "") {
                      controller.isemailButtonShow.value = true;
                    } else {
                      controller.isemailButtonShow.value = false;
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter a Email id';
                    } else if (!RegExp(
                            "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                        .hasMatch(value)) {
                      return 'Please Enter a valid Email';
                    } else {
                      return null;
                    }
                  },
                ),
                15.0.spaceY,
                Align(
                    alignment: Alignment.centerRight,
                    child: commonText("Sign in With OTP",
                        fontSize: 15, color: primaryColor)),
                TextfieldWithText(
                  hintText: "Enter password",
                  // obscureText: loginState.passwordVisible,
                  onChanged: (String value) {
                    if (value != "") {
                      controller.ispasswordButtonShow.value = true;
                    } else {
                      controller.ispasswordButtonShow.value = false;
                    }
                  },
                  labelText: "Password",
                  textEditingController: controller.passwordController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Password';
                    }
                    return null;
                  },
                ),
                15.0.spaceY,
                Row(
                  children: [
                    const Icon(Icons.check_box_outline_blank),
                    5.0.spaceX,
                    commonText("Remember Me", fontSize: 15, color: greyColor),
                    const Spacer(),
                    commonText("Forgot Password",
                        fontSize: 15, color: primaryColor),
                  ],
                ),
                40.0.spaceY,
                Obx(() => CommonButtonWidget(
                      label: "Submit",
                      color: controller.isemailButtonShow.value == true &&
                              controller.ispasswordButtonShow.value == true
                          ? primaryColor
                          : Colors.grey,
                      isLoading: controller.isLoading.value,
                      onClick: () {
                        if (controller.isemailButtonShow.value == true &&
                            controller.ispasswordButtonShow.value == true) {
                          if (controller.formKey.currentState!.validate()) {
                            controller.login();
                          }
                        }
                      },
                    )),
                20.0.spaceY,
                Stack(
                  children: [
                    const Divider(
                      color: Color.fromARGB(255, 179, 177, 177),
                      height: 20,
                      thickness: 0.5,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Positioned(
                        bottom: 1,
                        left: 180,
                        child: commonText("or",
                            color: Colors.black, fontSize: 20)),
                  ],
                ),
                20.0.spaceY,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/image/google.jpg",
                      height: 30,
                      width: 30,
                    ),
                    Image.asset(
                      "assets/image/linkdin.png",
                      height: 30,
                      width: 30,
                    ),
                    Image.asset(
                      "assets/image/facebook.png",
                      height: 30,
                      width: 30,
                    ),
                    Image.asset(
                      "assets/image/insta.jpg",
                      height: 30,
                      width: 30,
                    ),
                    Image.asset(
                      "assets/image/whatsapp.png",
                      height: 30,
                      width: 30,
                    ),
                  ],
                ).paddingOnly(left: 30, right: 30),
                20.0.spaceY,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonText("Business User?",
                            fontSize: 15, color: greyColor),
                        commonText("Login Here",
                            fontSize: 15, color: primaryColor),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        commonText("Don't Have an Account",
                            fontSize: 15, color: greyColor),
                        commonText("Sign Up",
                            fontSize: 15, color: primaryColor),
                      ],
                    )
                  ],
                ).paddingAll(10),
                commonText("By continuing, You agree To",
                    fontSize: 15, color: greyColor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonText("Promilo ", fontSize: 15, color: greyColor),
                    commonText("Terms Of Use & Privacy Policy",
                        fontSize: 15, color: Colors.black),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
