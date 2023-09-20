import 'package:erastar_apps/app/themes/app_themes.dart';
import 'package:erastar_apps/app/themes/color_themes.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 24),
                child: Image.asset(
                  'assets/logo/logo_transparent.png',
                  width: 75,
                ),
              ),
              const TextWidget(
                "Forgot Password",
                color: AppColor.primayRedColor,
                fontSize: 16,
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
              CustomButton(
                height: 50,
                width: MediaQuery.of(context).size.width,
                isRounded: true,
                borderRadius: 10,
                backgroundColor: AppColor.primayRedColor,
                onPressed: () {},
                // _showSuccessDialog,
                // controller.doForgotPassword,
                //     () {
                //   showDialog(
                //       context: context,
                //       builder: (BuildContext context) {
                //         return AlertDialog(
                //           title: Text('Reset Password'),
                //           content: Text(
                //               'Request ganti password berhasil, silakan cek email Anda.'),
                //           actions: <Widget>[
                //             TextButton(
                //               child: Text('OK'),
                //               onPressed: () {
                //                 Get.back();
                //               },
                //             ),
                //           ],
                //         );
                //       });
                // },

                text: const TextWidget(
                  "Ganti Password",
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
