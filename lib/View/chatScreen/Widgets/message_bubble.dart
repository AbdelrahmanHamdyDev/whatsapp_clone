import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class messageBubble extends StatefulWidget {
  final String text;
  final DateTime timestamp;
  final bool isMe;
  final bool animate;

  const messageBubble({
    super.key,
    required this.text,
    required this.timestamp,
    required this.isMe,
    this.animate = false,
  });

  @override
  State<messageBubble> createState() => _messageBubbleState();
}

class _messageBubbleState extends State<messageBubble>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    if (widget.animate) {
      _controller.forward();
    } else {
      _controller.value = 1;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Align(
          alignment: widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 4.h),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            constraints: BoxConstraints(maxWidth: 250.w),
            decoration: BoxDecoration(
              color: widget.isMe
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).scaffoldBackgroundColor,
              border: Border.all(width: 0.3),
              borderRadius: BorderRadius.only(
                topRight: widget.isMe ? Radius.zero : Radius.circular(15.r),
                topLeft: widget.isMe ? Radius.circular(15.r) : Radius.zero,
                bottomLeft: Radius.circular(15.r),
                bottomRight: Radius.circular(15.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  DateFormat('hh:mm a').format(widget.timestamp),
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
