abstract class BirthdayEvent {}

class GetBackgroundColor implements BirthdayEvent {
  final String elementName;

  GetBackgroundColor(this.elementName);
}

class UpdateNotificationStatus implements BirthdayEvent {}