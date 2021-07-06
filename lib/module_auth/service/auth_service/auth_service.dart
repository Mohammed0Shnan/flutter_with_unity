import 'package:flutter/cupertino.dart';
import 'package:tut/module_auth/enums/auth_status.dart';
import 'package:tut/module_auth/enums/user_type.dart';
import 'package:tut/module_auth/exceptions/auth_exception.dart';
import 'package:tut/module_auth/manager/auth_manager/auth_manager.dart';
import 'package:tut/module_auth/model/app_user.dart';
import 'package:tut/module_auth/presistance/auth_prefs_helper.dart';
import 'package:tut/module_auth/request/login_request/login_request.dart';
import 'package:tut/module_auth/request/register_request/register_request.dart';
import 'package:tut/module_auth/response/login_response/login_response.dart';
import 'package:rxdart/subjects.dart';

class AuthService {
  final AuthPrefsHelper _prefsHelper = AuthPrefsHelper();
  final AuthManager _authManager = AuthManager();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final PublishSubject<AuthStatus> _authSubject = PublishSubject<AuthStatus>();

  String _verificationCode;

  // Delegates
  Future<bool> get isLoggedIn => _prefsHelper.isSignedIn();

  Future<String> get userID => _prefsHelper.getUserId();

  Future<UserRole> get userRole => _prefsHelper.getCurrentRole();

  Stream<AuthStatus> get authListener => _authSubject.stream;

  Future<void> loginApiUser(String email,String password) async {

    // Change This
    LoginResponse loginResult = await _authManager.login(LoginRequest(
      email: email ,
      password: password,
    ));
    if (loginResult == null) {
      _authSubject.addError('Error getting the token from the API');
      throw UnauthorizedException('Error getting the token from the API');
    }

    await Future.wait([
      // _prefsHelper.setUserId(user.uid),
      // _prefsHelper.setEmail(user.email ?? user.uid),
      // _prefsHelper.setPassword(password),
      // _prefsHelper.setAuthSource(source),
      _prefsHelper.setToken(loginResult.token),
      // _prefsHelper.setCurrentRole(role),
    ]);

    _authSubject.add(AuthStatus.AUTHORIZED);
  }

  Future<void> registerApiUser(AppUser user) async {
    // it causes an error while sending data to the server
    try {
      // Create the profile in our database
      await _authManager
          .register(RegisterRequest(
              fullName: user.fullName,
              password: user.password,
              email: user.email,
              confirmPassword: user.confirmPassword
              // This should change from the API side
              ))
          .then((value) {
        if (value) {
          _authSubject.add(AuthStatus.AUTHORIZED);
        } else {
          _authSubject.add(AuthStatus.NOT_LOGGED_IN);
        }
      });
    } catch (e) {
      debugPrint('Already Registered');
    }
  }

  
  /// This confirms Phone Number
  /// @return void
  void confirmWithCode(String code) async {
    try {
      await _authManager.confirmCode(code).then((value) {
        if (value) {
          _authSubject.add(AuthStatus.CODE_SENT);
        } else {
          _authSubject.add(AuthStatus.CODE_TIMEOUT);
        }
      });
    } catch (e) {
      debugPrint('Error In Code');
    }
  }

  /// @return cached token
  /// @throw UnauthorizedException
  /// @throw TokenExpiredException
  Future<String> getToken() async {
    // try {
    //   var tokenDate = await this._prefsHelper.getTokenDate();
    //   var diff = DateTime.now().difference(tokenDate).inMinutes;
    //   if (diff.abs() > 55) {
    //     throw TokenExpiredException('Token is created ${diff} minutes ago');
    //   }
    //   return this._prefsHelper.getToken();
    // } on UnauthorizedException {
    //   await _prefsHelper.deleteToken();
    //   return null;
    // } catch (e) {
    //   return null;
    // }
  }

  /// refresh API token, this is done using Firebase Token Refresh
  Future<String> refreshToken() async {
    // User user = await _auth.currentUser;
    // String email = await _prefsHelper.getEmail();
    // var store = FirebaseFirestore.instance;
    // var existingProfile =
    //     await store.collection('users').doc(user.uid).get().catchError((e) {
    //   _authSubject.addError('Error logging in, firebase account not found');
    //   return;
    // });
    // if (existingProfile.data() == null) {
    //   _authSubject.addError('Error logging in, firebase account not found');
    //   return null;
    // }

    // String password = existingProfile.data()['password'];

    // if (email == null || password == null) {
    //   throw UnauthorizedException('Not Logged in!');
    // }

    // LoginResponse loginResponse = await _authManager.login(LoginRequest(
    //   username: user.uid,
    //   password: password,
    // ));
    // await _prefsHelper.setToken(loginResponse.token);
    // return loginResponse.token;
    return null;
  }

  /// apple specific function
  // Future<OAuthCredential> _createAppleOAuthCred() async {
  //   final nonce = _createNonce(32);
  //   final nativeAppleCred = Platform.isIOS
  //       ? await SignInWithApple.getAppleIDCredential(
  //           scopes: [
  //             AppleIDAuthorizationScopes.email,
  //             AppleIDAuthorizationScopes.fullName,
  //           ],
  //           nonce: sha256.convert(utf8.encode(nonce)).toString(),
  //         )
  //       : await SignInWithApple.getAppleIDCredential(
  //           scopes: [
  //             AppleIDAuthorizationScopes.email,
  //             AppleIDAuthorizationScopes.fullName,
  //           ],
  //           webAuthenticationOptions: WebAuthenticationOptions(
  //             redirectUri: Uri.parse(
  //                 'https://your-project-name.firebaseapp.com/__/auth/handler'),
  //             clientId: 'your.app.bundle.name',
  //           ),
  //           nonce: sha256.convert(utf8.encode(nonce)).toString(),
  //         );

  //   return new OAuthCredential(
  //     providerId: 'apple.com',
  //     // MUST be "apple.com"
  //     signInMethod: 'oauth',
  //     // MUST be "oauth"
  //     accessToken: nativeAppleCred.identityToken,
  //     // propagate Apple ID token to BOTH accessToken and idToken parameters
  //     idToken: nativeAppleCred.identityToken,
  //     rawNonce: nonce,
  //   );
  // }

  // /// apple specific function
  // String _createNonce(int length) {
  //   // final random = Random();
  //   // final charCodes = List<int>.generate(length, (_) {
  //   //   int codeUnit;

  //   //   switch (random.nextInt(3)) {
  //   //     case 0:
  //   //       codeUnit = random.nextInt(10) + 48;
  //   //       break;
  //   //     case 1:
  //   //       codeUnit = random.nextInt(26) + 65;
  //   //       break;
  //   //     case 2:
  //   //       codeUnit = random.nextInt(26) + 97;
  //   //       break;
  //   //   }

  //   //   return codeUnit;
  //   // });

  //   // return String.fromCharCodes(charCodes);
  // }

  Future<void> logout() async {
    // await _auth.signOut();
    // await _prefsHelper.deleteToken();
    // await _prefsHelper.cleanAll();
  }
}
