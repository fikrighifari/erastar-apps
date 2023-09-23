import 'package:erastar_apps/export.dart';

class TopSalesScreen extends StatefulWidget {
  const TopSalesScreen({super.key});

  @override
  State<TopSalesScreen> createState() => _TopSalesScreenState();
}

class _TopSalesScreenState extends State<TopSalesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Top Sales Screen'),
      ),
    );
  }
}
