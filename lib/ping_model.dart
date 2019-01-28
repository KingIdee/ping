import 'package:reflectable/reflectable.dart';

class PingReflectable extends Reflectable {
  const PingReflectable() : super(newInstanceCapability);
}

const pingReflectable = const PingReflectable();

class MetaReflector extends Reflectable {
  const MetaReflector() : super(const NewInstanceMetaCapability(MetaCapability));
}

const metaReflector = const MetaReflector();

class MetaCapability {
  const MetaCapability();
}

/// Base PingModel class
@pingReflectable
class PingModel {
  Map<String, dynamic> body;
  PingModel.fromJson(Map<String, dynamic> json): body = json;
}

main() {
}