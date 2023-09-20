import 'package:erastar_apps/app/services/auth_service.dart';
import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = true;
  bool _isPhoneNumberError = false;
  bool _isPasswordError = false;
  bool isLoading = false;

  void _login(AuthServices authServices2) {
    setState(() {
      _isPhoneNumberError = _phoneNumberController.text.isEmpty;
      _isPasswordError = _passwordController.text.isEmpty;

      if (!_isPhoneNumberError && !_isPasswordError) {
        // isLoading = true;
        authServices2
            .loginProfile(
          context,
          _phoneNumberController.text,
          _passwordController.text,
        )
            .then((result) async {
          print(result!.status);
          if (result != null) {
            print('oe');
            if (result.status == "success") {
              print(result.status);
              // dataProfile = result.dataProfile;
              // // dataShift = dataProfile!.shift;
              // LocalStorageService.save("headerToken", result.token.toString());

              // LocalStorageService.save(
              //     "statusVerif", dataProfile!.statusVerifId);

              // HomeController().getShift().then((result) async {
              //   if (result != null) {
              //     if (result.status == "success") {
              //       dataShift = result.shiftData;
              //       await _databaseHelper!.deleteAll();

              //       await _databaseHelper!
              //           .insertProfile(dataProfile!, dataShift!);

              //       Modular.to.popAndPushNamed('/home/');
              //     }
              //   }
              // });
            } else if (result.status == "failed") {
              // isLoading = false;
              print('salah');
              setState(() {});
              // UiUtils.errorMessage(result.message!, context);
            }
          } else {
            isLoading = false;
            setState(() {});
            // print(result!.message);
            // UiUtils.errorMessage(
            //     "Sedang Terjadi Kesalahan Silahkan Coba Kembali", context);
          }
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: Image.asset(
                  'assets/images/logo_transparent.png',
                  width: 75,
                ),
              ),
              const TextWidget.titleMedium(
                "Hi, Selamat Datang!",
                fontSize: 20,
                color: AppColor.primayRedColor,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: _phoneNumberController,
                prefixIcon: const Icon(Icons.mail),
                labelText: "Email",
                hintText: "erastar@mail.com",
                labelStyle: labelTextStyle,
                textStyle: labelTextStyle,
              ),
              CustomTextField(
                controller: _passwordController,
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
                      Modular.to.pushNamed('/auth/forgot-password');
                    },
                    child: const TextWidget(
                      'Forgot Password',
                      color: AppColor.blueColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                height: 50,
                width: MediaQuery.of(context).size.width,
                isRounded: true,
                borderRadius: 10,
                backgroundColor: AppColor.primayRedColor,
                onPressed: () {
                  _login(authServices);
                },
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
