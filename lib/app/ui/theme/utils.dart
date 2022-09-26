import 'package:flutter/material.dart';

class Frame extends StatelessWidget {
  final Widget child;
  Frame({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16), child: child);
  }
}
class MainTitle extends StatelessWidget {
  final String title;
  // final VoidCallback more;
  MainTitle({required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? '',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        // more == null
        //     ? Row()
        //     : InkWell(
        //   onTap: () {
        //     more();
        //   },
        //   child: Row(
        //     children: <Widget>[
        //       Text('더보기'),
        //       Icon(Icons.keyboard_arrow_right_outlined),
        //     ],
        //   ),
        // )
        //Icon(Icons.fiber_manual_record_rounded, color: Color(0xFF828282))
      ],
    );
  }
}
