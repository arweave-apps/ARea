import 'package:mobile/service/IService.dart';

class linkedin extends IService {
  @override
  List<String> getAction() {
    // TODO: implement getAction
    throw UnimplementedError();
  }

  @override
  String getIcon() {
    return "assets/linkedin.png";
  }

  @override
  String getName() {
    return "linkedin";
  }

  @override
  List<String> getReaction() {
    // TODO: implement getReaction
    throw UnimplementedError();
  }

  @override
  String getUrl() {
    return "/auth/linkedin";
  }

  @override
  bool getConnexionState() {
    // TODO: implement getConnexionState
    return false;
  }
}