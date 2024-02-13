import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swara_solution_flutter_machine_test/common_widgets/buttons/common_button.dart';
import 'package:swara_solution_flutter_machine_test/common_widgets/colors/colors.dart';
import 'package:swara_solution_flutter_machine_test/common_widgets/text/text.dart';
import 'package:swara_solution_flutter_machine_test/common_widgets/textfield/textfield_with_text.dart';
import 'package:swara_solution_flutter_machine_test/extensions/extension.dart';
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
                  // textEditingController: loginState.usernameController,
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
                  // onChanged: (String value) {
                  //   loginState.passwordtextfiledOnChange(value);
                  // },
                  // suffixIcon: InkWell(
                  //     onTap: () {
                  //       loginState.passwordVisible =
                  //           !loginState.passwordVisible;
                  //     },
                  //     child: loginState.passwordVisible == false
                  //         ? const Icon(Icons.visibility)
                  //         : const Icon(Icons.visibility_off)),
                  labelText: "Password",
                  // textEditingController: loginState.passwordController,
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
                CommonButtonWidget(
                  label: "Submit",
                  color: Colors.grey,
                  onClick: () {},
                ),
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
