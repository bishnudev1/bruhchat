import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';

import '../../data/hive/user_adapter.dart';

class OnboardingViewmodel extends BaseViewModel {
  hiveStatus() async {
    var box = await Hive.openBox<User>('user');
    print("Hive Current Status: ${box.isEmpty}");
  }
}
