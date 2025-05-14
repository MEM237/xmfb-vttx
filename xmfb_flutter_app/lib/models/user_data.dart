import 'package:flutter/material.dart';

enum UserStatus { online, offline, away }

class UserData {
  final String name;
  final UserStatus status;
  final Color identifyingColor;
  final String? avatarUrl;
  final String? lastSeen;
  
  UserData({
    required this.name, 
    required this.status,
    required this.identifyingColor,
    this.avatarUrl,
    this.lastSeen,
  });
}