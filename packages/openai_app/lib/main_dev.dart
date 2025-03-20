import 'package:flutter/foundation.dart';

import 'src/app_delegate.dart';
import 'src/core/components/configurations/env/env_dev.dart';

void main() {
  environmentDev.addAll({'isStudio': false || kDebugMode});

  AppDelegate().run(environmentDev);
}
