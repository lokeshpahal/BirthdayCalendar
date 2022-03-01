import 'storage_service/storage_service.dart';
import 'storage_service/shared_preferences_storage.dart';
import 'date_service/date_service.dart';
import 'date_service/date_service_impl.dart';
import 'notification_service/notification_service_impl.dart';
import 'notification_service/notification_service.dart';
import 'package:birthday_calendar/pages/settings_page/settings_screen_manager.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerLazySingleton<DateService>(() => DateServiceImpl());
  getIt.registerLazySingleton<StorageService>(() => StorageServiceSharedPreferences());
  getIt.registerLazySingleton<NotificationService>(() => NotificationServiceImpl());
  getIt.registerLazySingleton<SettingsScreenManager>(() => SettingsScreenManager());
}