import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'My APPS',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SvgPicture.asset(
                'assets/image/Mobile login-amico.svg',
                height: 350,
              ),
              Form(
                key: loginFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: emailController,
                        validator: (value) => EmailValidator.validate(value!)
                            ? null
                            : "Mohon mengisi email yang valid",
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.blueGrey,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFbdd7d9),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Obx(
                        () => TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value == null) {
                              return null;
                            }
                            if (value.isEmpty) {
                              return 'Password tidak boleh kosong.';
                            }
                            if (value.length <= 5) {
                              return 'Password harus diisi lebih dari 5 karakter.';
                            }
                          },
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.blueGrey,
                          obscureText: controller.isObscure.value,
                          decoration: InputDecoration(
                            hintText: 'Enter your Password',
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFbdd7d9),
                            suffixIcon: InkWell(
                              onTap: () {
                                controller.isObscure.value =
                                    !controller.isObscure.value;
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  controller.isObscure.value
                                      ? 'assets/icons/look-pass.svg'
                                      : 'assets/icons/unlook-pass.svg',
                                  color: const Color(0xFF247881),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.all(24),
                child: Obx(
                  () => ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () async {
                            if (loginFormKey.currentState!.validate()) {
                              await controller.onLogin(emailController.text,
                                  passwordController.text);
                            }
                          },
                    child: const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
