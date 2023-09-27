import 'package:erastar_apps/app/themes/themes.dart';
import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _showPassword = true;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Change Password',
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
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Column(
                children: [
                  TextWidget('Change Password'),
                  CustomTextField(
                    // controller: controller.password,
                    prefixIcon: const Icon(Icons.lock),
                    obscureText: _showPassword,
                    labelText: "New Password",
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
