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
                  // onChanged: (String value) {
                  //   loginState.usernametextfiledOnChange(value);
                  // },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Email or Mob No';
                    }
                    return null;
                  },
                ),
                15.0.spaceY,
                Align(
                    alignment: Alignment.centerRight,
                    child: commonText("Sign in With OTP",
                        fontSize: 15, color: greyColor)),
                TextfieldWithText(
                  hintText: "Enter password",
                  // obscureText: loginState.passwordVisible,
                  onChanged: (String value) {
                    if (value != "") {
                      controller.isButtonShow.value = true;
                    } else {
                      controller.isButtonShow.value = false;
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
                    commonText("Remember Me", fontSize: 15, color: greyColor),
                    const Spacer(),
                    commonText("Forgot Password",
                        fontSize: 15, color: greyColor),
                  ],
                ),
                40.0.spaceY,
                Obx(() => CommonButtonWidget(
                      label: "Submit",
                      color: controller.isButtonShow.value == true
                          ? primaryColor
                          : Colors.grey,
                      isLoading: controller.isLoading.value,
                      onClick: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.login();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
