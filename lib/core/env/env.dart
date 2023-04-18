import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'OPENAI_API_KEY')
  static final openAIApiKey = _Env.openAIApiKey;

  @EnviedField(varName: 'OPENAI_BASE_URL')
  static final openAIBaseUrl = _Env.openAIBaseUrl;
}
