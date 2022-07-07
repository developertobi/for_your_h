import 'package:flutter/material.dart';

import '../core/constant/colors.dart';

class AppBigButton extends StatelessWidget {
  const AppBigButton({
    Key? key,
    this.onTap,
    required this.title,
    required this.subTitle,
    required this.color1,
    required this.color2,
    required this.logo,
  }) : super(key: key);

  final void Function()? onTap;
  final String title;
  final String subTitle;
  final Color color1;
  final Color color2;
  final Widget? logo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 94,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.dark, width: 2),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              color1,
              color2,
            ],
          ),
        ),
        padding: const EdgeInsets.only(right: 20),
        child: Center(
          child: ListTile(
            leading: Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                border:
                    Border.all(color: Colors.white.withOpacity(0.44), width: 6),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    color1,
                    color2,
                  ],
                ),
              ),
              // child: const Icon(Icons.star),
              child: logo,
            ),
            title: Text(
              title,
              style: const TextStyle(
                color: AppColors.light,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: Text(
              subTitle,
              style: const TextStyle(
                color: Color(0xffE1E1E1),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 14,
              color: AppColors.light,
            ),
          ),
        ),
      ),
    );
  }
}
