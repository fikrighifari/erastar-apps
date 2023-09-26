import 'package:erastar_apps/app/widgets/reusable_components/reusable_components.dart';
import 'package:erastar_apps/export.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold.withAppBar(
      title: 'Profile',
      centerTitle: true,
      onBack: () {
        Navigator.of(context).pop();
      },
      child: Column(
        children: [TextWidget('Profile')],
      ),
    );
  }
}
