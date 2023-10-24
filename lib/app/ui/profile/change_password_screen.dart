import 'package:erastar_apps/app/controller/profile_controller.dart';
import 'package:erastar_apps/export.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();

  bool _showPassword = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Ubah Password',
      centerTitle: true,
      centralize: true,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(defaultMargin),
            child: CustomContainer(
              width: double.infinity,
              containerType: RoundedContainerType.outlined,
              radius: 10,
              borderColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: Image.asset(
                      'assets/era_star_04.png',
                      width: 75,
                    ),
                  ),
                  const TextWidget('Ubah Password'),
                  CustomTextField(
                    controller: oldPassword,
                    prefixIcon: const Icon(Icons.lock),
                    obscureText: _showPassword,
                    labelText: "Password Baru",
                    hintText: "12345abcde",
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
                  CustomTextField(
                    controller: confirmNewPassword,
                    prefixIcon: const Icon(Icons.lock),
                    obscureText: _showPassword,
                    labelText: "Konfirmasi Password Baru",
                    hintText: "12345abcde",
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primayRedColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: TextWidget.titleSmall(
                      'Update',
                      color: AppColor.whiteColor,
                      fontWeight: boldWeight,
                    ),
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });

                      Future.delayed(const Duration(seconds: 1), () {
                        setState(() async {
                          ProfileController.changePassword(
                            oldPassword.text,
                            confirmNewPassword.text,
                          );
                          UiUtils.successMessage(
                              'Password berhasil diubah', context);
                        });

                        // Perform the logic or navigate to a new screen
                        // ...
                      });
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
