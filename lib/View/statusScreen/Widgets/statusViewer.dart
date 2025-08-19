import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatusViewer extends StatefulWidget {
  final String name;
  final String userAvatar;
  final DateTime time;
  final String status;

  const StatusViewer({
    super.key,
    required this.name,
    required this.userAvatar,
    required this.time,
    required this.status,
  });

  @override
  State<StatusViewer> createState() => _StatusViewerState();
}

class _StatusViewerState extends State<StatusViewer> {
  double progress = 0.0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        progress += 0.2;
        if (progress >= 1) {
          t.cancel();
          Future.delayed(const Duration(milliseconds: 700), () {
            Navigator.pop(context, true);
          });
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void skipStatus() {
    setState(() {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) {
            Navigator.pop(context, true);
          }
        },
        child: GestureDetector(
          onTap: skipStatus,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(widget.status, fit: BoxFit.contain),
              ),
              Positioned(
                top: 40,
                left: 10,
                right: 10,
                child: Container(
                  height: 4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: MediaQuery.of(context).size.width * progress,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 60,
                left: 16,
                right: 16,
                child: Row(
                  children: [
                    Hero(
                      tag: Key(widget.userAvatar),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(widget.userAvatar),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('hh:mm a').format(widget.time),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
