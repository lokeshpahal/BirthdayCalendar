import 'dart:async';

import 'package:birthday_calendar/BLoC/bloc.dart';
import 'package:birthday_calendar/model/user_birthday.dart';

class BirthdayBloc implements Bloc {
  UserBirthday? _userBirthday;

  final _birthdayController = StreamController<UserBirthday>();

  Stream<UserBirthday> get birthdayStream => _birthdayController.stream;

  void addBirthday(UserBirthday birthday) {
    _userBirthday = birthday;
    _birthdayController.sink.add(birthday);
  }


  @override
  void dispose() {
    _birthdayController.close();
  }

}