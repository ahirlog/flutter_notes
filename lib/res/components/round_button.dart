import 'package:flutter/material.dart';
import 'package:flutter_notes/res/colors/colors.dart';

class RoundButton extends StatelessWidget {
  final bool loading;
  final String title;
  final double height;
  final double width;
  final VoidCallback onPress;
  final Color textColor;
  final Color buttonColor;

  const RoundButton({
    super.key,
    this.loading = false,
    required this.title,
    this.height = 50,
    this.width = 60,
    required this.onPress,
    this.textColor = AppColor.primaryTextColor,
    this.buttonColor = AppColor.primaryButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
      ),
    );
  }
}
