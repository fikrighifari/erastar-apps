part of 'reusable_components.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? rightWidget;
  final Widget? backButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.rightWidget,
    this.backButton,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: AppColor.primayRedColor,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          backButton ?? Container(),
          TextWidget.titleMedium(
            title,
            color: AppColor.whiteColor,
            fontWeight: boldWeight,
          ),
          rightWidget ?? Container(),
          // IconButton(
          //   icon: Icon(Icons.logout),
          //   onPressed: () {
          //     // Implement logout functionality here
          //   },
          // ),
        ],
      ),
    );
  }
}
