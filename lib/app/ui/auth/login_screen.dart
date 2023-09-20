import 'package:erastar_apps/app/themes/app_themes.dart';
import 'package:erastar_apps/app/themes/color_themes.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 24),
                child: Image.asset(
                  'assets/images/logo_transparent.png',
                  width: 75,
                ),
              ),
              const TextWidget(
                "Hi, Selamat Datang!",
                color: AppColor.primayRedColor,
                fontSize: 20,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                // controller: controller.emailCon,
                prefixIcon: const Icon(Icons.mail),
                labelText: "Email",
                hintText: "erastar@mail.com",
                labelStyle: labelTextStyle,
                textStyle: labelTextStyle,
              ),
              CustomTextField(
                // controller: controller.passCon,
                prefixIcon: const Icon(Icons.lock),
                labelText: "Password",
                hintText: "Password",
                obscureText: _showPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  icon: Icon(
                    _showPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                labelStyle: labelTextStyle,
                textStyle: labelTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // TextWidget(
                  //   "Belum punya akun? ",
                  //   color: AppColors.blackColor,
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.toNamed(
                  //       Routes.REGISTER,
                  //     );
                  //   },
                  //   child: TextWidget(
                  //     "Register",
                  //     color: AppColors.primayRedColor,
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed('/forgot_password');
                      Modular.to.pushNamed('/auth/forgot-password');
                    },
                    child: TextWidget(
                      'Forgot Password',
                      color: AppColor.blueColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                height: 50,
                width: MediaQuery.of(context).size.width,
                isRounded: true,
                borderRadius: 10,
                backgroundColor: AppColor.primayRedColor,
                // onPressed: controller.doLogin,
                text: const TextWidget(
                  "Login",
                  color: AppColor.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
