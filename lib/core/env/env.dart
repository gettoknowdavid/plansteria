import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'OPENAI_API_KEY')
  static final String openAIApiKey = _Env.openAIApiKey;

  @EnviedField(varName: 'OPENAI_BASE_URL')
  static final String openAIBaseUrl = _Env.openAIBaseUrl;

  @EnviedField(varName: 'GOOGLE_MAP_API_KEY')
  static final String googleMapApiKey = _Env.googleMapApiKey;
}
