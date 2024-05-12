import '../utils/basic_imports.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  const CustomAppBar({
    Key,
    key,
    required this.text,
    required this.onBack,
  }) : super(key: key);

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: AppBar(
        backgroundColor: CustomColors.navorappbar,
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        centerTitle: true,
        leading: Center(child: BackButton(color: Colors.white)),
        title: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
        ),
      ),
    );
  }
}
