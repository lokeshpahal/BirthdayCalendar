import 'dart:async';

import 'package:birthday_calendar/BLoC/bloc.dart';
import 'package:birthday_calendar/model/user_birthday.dart';
import 'package:birthday_calendar/service/notification_service.dart';
import 'package:birthday_calendar/service/shared_prefs.dart';

import 'BirthdayEvent.dart';

class BirthdayBloc implements Bloc {
  late UserBirthday _userBirthday;

  final _birthdayController = StreamController<UserBirthday>();


  StreamSink<UserBirthday> get _inBirthday => _birthdayController.sink;
  Stream<UserBirthday> get birthdayStream => _birthdayController.stream;

  final _birthdayEventController = StreamController<BirthdayEvent>();

  Sink<BirthdayEvent> get birthdayEventSink => _birthdayEventController.sink;

  BirthdayBloc(UserBirthday birthday) {
    _userBirthday = birthday;
    _birthdayEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(BirthdayEvent event) {
    if (event is GetBackgroundColor) {

    } else if (event is UpdateNotificationStatus) {
      _handleNotificationStatusForUser();
    }

    _inBirthday.add(_userBirthday)
  }

  void _handleNotificationStatusForUser() {
    _userBirthday.hasNotification = !_userBirthday.hasNotification;
    SharedPrefs().updateNotificationStatusForBirthday(
        _userBirthday, _userBirthday.hasNotification);
    if (_userBirthday.hasNotification) {
      NotificationService()
          .cancelNotificationForBirthday(_userBirthday);
    } else {
      NotificationService().scheduleNotificationForBirthday(
          _userBirthday,
          "${_userBirthday.name} has an upcoming birthday!");
    }
  }

  @override
  void dispose() {
    _birthdayController.close();
    _birthdayEventController.close();
  }

}