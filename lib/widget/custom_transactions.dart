import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lmizania/utils/basic_imports.dart';

class CustomTransactionContainer extends StatelessWidget {
  final String label;
  final int amount;
  final IconData icon;
  final Color iconColor;
  final Color containerColor;
  final double rotationAngle;

  CustomTransactionContainer({
    required this.label,
    required this.amount,
    required this.icon,
    required this.iconColor,
    required this.containerColor,
    required this.rotationAngle,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 4, right: 4, bottom: 1),
      width: 165.r,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.24),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              color: iconColor,
            ),
            child: Transform.rotate(
              angle: rotationAngle,
              child: Icon(
                icon,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: CustomStyle.balance2TxtStyle,
              ),
              Text(
                NumberFormat('#,###').format(amount) + ' DA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: amount.toString().length > 7
                      ? 15 * (7 / amount.toString().length)
                      : 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
