import 'package:mobile/service/IService.dart';

class unsplash extends IService {
  unsplash(bool src) : super(src);

  @override
  List<String> getAction() {
    return [];
  }

  @override
  String getIcon() {
    return "assets/unsplash.png";
  }

  @override
  String getName() {
    return "unsplash";
  }

  @override
  List<String> getReaction() {
    return [];
  }

  @override
  String getUrl() {
    return "/auth/unsplash";
  }
}