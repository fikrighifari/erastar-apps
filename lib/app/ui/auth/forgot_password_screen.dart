import 'package:erastar_apps/app/services/auth_service.dart';
import 'package:erastar_apps/export.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  bool _isEmailError = false;
  bool isLoading = false;

  void _resetPassword(AuthServices authServices2) {
    setState(() {
      _isEmailError = emailController.text.isEmpty;

      if (!_isEmailError) {
        isLoading = true;

        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            authServices2
                .resetPassowrd(context, emailController.text)
                .then((result) async {
              if (result != null) {
                if (result.data['status'] == 'success') {
                  UiUtils.successMessage(
                    result.data["message"],
                    context,
                  );
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.pop(context);
                  });
                }
              } else {
                isLoading = false;
                UiUtils.successMessage(
                  result.data["message"],
                  context,
                );
              }
            });
          });

          // Perform the logic or navigate to a new screen
          // ...
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var authServices = Provider.of<AuthServices>(context);
    return Scaffold(
      body: Center(
        child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      child: Image.asset(
                        'assets/era_star_04.png',
                        width: 75,
                      ),
                    ),
                    const TextWidget(
                      "Forgot Password",
                      color: AppColor.primayRedColor,
                      fontSize: 16,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: emailController,
                      prefixIcon: const Icon(Icons.mail),
                      labelText: "Email",
                      hintText: "mail@erastarlelangproperty.co.id",
                      labelStyle: labelTextStyle,
                      textStyle: labelTextStyle,
                    ),
                    CustomButton(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      isRounded: true,
                      borderRadius: 10,
                      backgroundColor: AppColor.primayRedColor,
                      onPressed: () {
                        _resetPassword(authServices);
                      },
                      // _showSuccessDialog,
                      // controller.doForgotPasswordScreen,
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
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Container(),
              ],
            )),
      ),
    );
  }
}
