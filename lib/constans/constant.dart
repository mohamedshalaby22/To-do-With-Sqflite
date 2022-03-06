import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration decoration = BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    color: Colors.grey[300],
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade600,
        offset: const Offset(5, 5),
        blurRadius: 15,
        spreadRadius: 1,
      ),
      const BoxShadow(
        color: Colors.white,
        offset: Offset(-5, -5),
        blurRadius: 15,
        spreadRadius: 1,
      ),
    ]);
