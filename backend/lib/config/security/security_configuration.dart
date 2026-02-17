import 'package:vaden/vaden.dart';
import 'package:vaden_security/vaden_security.dart';

@Configuration()
class SecurityConfiguration {
  @Bean()
  PasswordEncoder passwordEncoder() {
    return BCryptPasswordEncoder(cost: 10);
  }

  @Bean()
  JwtService jwtService(ApplicationSettings settings) {
    final secret =
        settings['jwt.secret'] ?? settings['secret'] ?? 'default-secret-key';
    return JwtService(secret: secret);
  }

  @Bean()
  HttpSecurity httpSecurity() {
    return HttpSecurity([
      RequestMatcher('/auth/**').permitAll(),
      RequestMatcher('/docs/**').permitAll(),

      AnyRequest().authenticated(),
    ]);
  }
}
