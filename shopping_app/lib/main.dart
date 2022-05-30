import 'presentation/app_page.dart';
import 'application_start_config.dart';

Future<void> main() async {
  ApplicationStartConfig().configureApp(const AppPage());
}
