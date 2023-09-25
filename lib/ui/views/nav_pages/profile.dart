import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../bussiness_logics/controllers/auth_controller.dart';
import '../../route/route.dart';
import '../../widgets/custom_button.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SizedBox(
                width: 200,
                height: 45,
                child: customButton(
                  'Logout',
                  () {
                    Get.find<AuthController>().logout();
                        Get.offAndToNamed(login);
                  },
                ))));
  }
}
