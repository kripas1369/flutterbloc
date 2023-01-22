import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class UserEvents extends Equatable {
  const UserEvents();
}

class LoadUserEvents extends UserEvents {
  @override
  List<Object?> get props => [];
}
