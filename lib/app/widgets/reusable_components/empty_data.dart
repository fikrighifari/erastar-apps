part of 'reusable_components.dart';

class EmptyData extends StatelessWidget {
  final String text;
  const EmptyData({
    super.key,
    this.text = 'Data tidak ditemukan.',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            child: Lottie.asset(
              'assets/lottie/not-found.json',
              reverse: true,
            ),
          ),
          TextWidget(
            text,
            // style: defaultTextStyle,
          ),
          const Spacing(height: 24),
        ],
      ),
    );
  }
}
