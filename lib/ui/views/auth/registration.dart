import 'package:ecommarce_app/ui/responsive/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../bussiness_logics/controllers/auth_controller.dart';
import '../../../const/app_colors.dart';
import '../../route/route.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class Registration extends StatelessWidget {
  Registration({super.key});
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  RxBool _value = false.obs;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            child: Container(
              height: SizeConfig.screenHeight,
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      'assets/icons/logo.png',
                      width: 40.w,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    customFormField(
                        TextInputType.text, _nameController, context, 'Name',
                        (val) {
                      if (val.isEmpty) {
                        return 'this field can\'t be empty';
                      }
                    }, prefixIcon: Icons.person_2_outlined),
                    customFormField(TextInputType.emailAddress,
                        _emailController, context, 'Email', (val) {
                      if (val.isEmpty) {
                        return 'this field can\'t be empty';
                      }
                      if (!val.contains(RegExp(r'\@'))) {
                        return 'enter a valid email address';
                      }
                    }, prefixIcon: Icons.email_outlined),
                    customFormField(TextInputType.text, _passwordController,
                        context, 'Password', (val) {
                      if (val.isEmpty) {
                        return 'this field can\'t be empty';
                      }
                    },
                        prefixIcon: Icons.remove_red_eye_outlined,
                        obscureText: true),
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                              value: _value.value,
                              onChanged: (val) {
                                _value.value = val!;
                              }),
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: 'I accept all the',
                              style: TextStyle(color: AppColors.grayColor)),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.toNamed(terms),
                              text: ' Terms & Condition',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                        ]))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: 200,
                        height: 45,
                        child: customButton(
                          'Sign Up',
                          () {
                            if (_formKey.currentState!.validate() &&
                                _value.value == true) {
                              Get.find<AuthController>().signUp(
                                  _nameController.text,
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                  context);
                            } else {
                              print('failed');
                            }
                          },
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),
                        Text('  OR  '),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {},
                          child: Ink(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          AppColors.grayColor.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3))
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset('assets/icons/facebook.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {},
                          child: Ink(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          AppColors.grayColor.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3))
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset('assets/icons/search.png'),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(color: AppColors.grayColor)),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.toNamed(login),
                          text: ' Login',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    ]))
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
