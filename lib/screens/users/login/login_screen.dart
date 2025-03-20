import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inspireui/inspireui.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/tools.dart';
import '../../../common/tools/biometrics_tools.dart';
import '../../../data/boxes.dart';
import '../../../generated/l10n.dart';
import '../../../models/index.dart';
import '../../../modules/dynamic_layout/helper/helper.dart';
import '../../../services/index.dart';
import '../../../widgets/auth/social_login_button_row.dart';
import '../../../widgets/common/custom_text_field.dart';
import '../../../widgets/common/flux_image.dart';
import '../../../widgets/common/login_animation.dart';
import '../../base_screen.dart';
import 'login_screen_web.dart';
import 'mixins/mixin_animation_button_login.dart';
import 'mixins/mixin_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (Layout.isDisplayDesktop(context)) {
      return const LoginScreenWeb();
    }
    return const LoginScreenMobile();
  }
}

class LoginScreenMobile extends StatefulWidget {
  const LoginScreenMobile();

  @override
  BaseScreen<LoginScreenMobile> createState() => _LoginPageState();
}

class _LoginPageState extends BaseScreen<LoginScreenMobile>
    with TickerProviderStateMixin, AnimationButtonLoginMixin, LoginMixin {
  late BuildContext _parentContext;

  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  Future _biometricsLogin(BuildContext context) async {
    var didAuth = await BiometricsTools.instance.localAuth(context);
    if (didAuth) {
      usernameCtrl.text = BiometricsBox().username ?? '';
      passwordCtrl.text = BiometricsBox().password ?? '';
      _onTapLogin();
    }
  }

  void _onTapLogin() {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

    runLogin(context);
  }

  @override
  TextEditingController passwordCtrl = TextEditingController();

  @override
  TextEditingController usernameCtrl = TextEditingController();

  @override
  Future<void> beforeCallLogin() => playAnimation();

  @override
  Future<void> afterCallLogin(bool isLoginSuccess) => stopAnimation();

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _parentContext = context;
    final appModel = Provider.of<AppModel>(context);
    final screenSize = MediaQuery.sizeOf(context);

    final themeConfig = appModel.themeConfig;
    final forgetPasswordUrl =
        appModel.appConfig?.forgetPassword ?? ServerConfig().forgetPassword;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Color(0xffEB1B25),
        title: Image.asset('assets/images/app-bg.png', width: double.infinity,fit: BoxFit.fill),
        elevation: 0.0,
        actions: !Services().widget.isRequiredLogin &&
                !ModalRoute.of(context)!.canPop
            ? [
                IconButton(
                  onPressed: loginDone,
                  icon: const Icon(Icons.close, size: 25),
                )
              ]
            : null,
      ),
      body: SafeArea(
        child: AutoHideKeyboard(
          child: IgnorePointer(
            ignoring: isLoading,
            child: Center(
              child: Consumer<UserModel>(
                builder: (context, model, child) {
                  return Container(
                    // padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    alignment: Alignment.center,
                    width: screenSize.width /
                        (2 / (screenSize.height / screenSize.width)),
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: AutofillGroup(
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: [
                              Container(
                                height: 300,
                                width: double.infinity,
                                color:  Colors.white,
                              ),
                              // Red background with the semi-circle
                              Positioned(
                                top: 0,
                                bottom: 35,
                                left: 0,
                                right: 0,
                                child: ClipPath(
                                  clipper: SemiCircleClipper(),
                                  child: Image.asset('assets/images/app-bg.png',width: double.infinity,fit: BoxFit.fill,),
                                  // child: Container(
                                  //     width: double.infinity,
                                  //     decoration: BoxDecoration(
                                  //       image: DecorationImage(image: AssetImage('assets/images/app-bg.png'),
                                  //       fit: BoxFit.fill,
                                  //       )
                                  //     ),
                                  //     // child: Image.asset('assets/images/app-bg.png',width: double.infinity,fit: BoxFit.contain,),
                                  // ),
                                ),
                              ),
                              // Centered text
                              Positioned(
                                top: 50,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: FractionallySizedBox(
                                  widthFactor: 0.8,
                                  child: FluxImage(
                                    imageUrl: themeConfig.logo,
                                    fit: BoxFit.contain,
                                    useExtendedImage: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            flex: 3,
                            child: SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomTextField(
                                      key: const Key('loginEmailField'),
                                      controller: usernameCtrl,
                                      autofillHints: const [AutofillHints.email],
                                      showCancelIcon: true,
                                      autocorrect: false,
                                      enableSuggestions: false,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.emailAddress,
                                      nextNode: _usernameFocusNode,
                                      decoration: InputDecoration(
                                        labelText: S.of(_parentContext).username,
                                        hintText: S
                                            .of(_parentContext)
                                            .enterYourEmailOrUsername,
                                      ),
                                    ),
                                    CustomTextField(
                                      key: const Key('loginPasswordField'),
                                      autofillHints: const [
                                        AutofillHints.password
                                      ],
                                      obscureText: true,
                                      showEyeIcon: true,
                                      textInputAction: TextInputAction.done,
                                      controller: passwordCtrl,
                                      focusNode: _passwordFocusNode,
                                      decoration: InputDecoration(
                                        labelText: S.of(_parentContext).password,
                                        hintText: S
                                            .of(_parentContext)
                                            .enterYourPassword,
                                      ),
                                    ),
                                    if (kLoginSetting.isResetPasswordSupported)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            launchForgetPasswordURL(
                                                forgetPasswordUrl);
                                          },
                                          behavior: HitTestBehavior.opaque,
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Text(
                                              S.of(context).resetPassword,
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (!kLoginSetting.isResetPasswordSupported)
                                      const SizedBox(height: 50.0),
                                    StaggerAnimation(
                                      key: const Key('loginSubmitButton'),
                                      titleButton: S.of(context).signInWithEmail,
                                      buttonController: loginButtonController.view
                                          as AnimationController,
                                      onTap: () =>
                                          isLoading ? null : _onTapLogin(),
                                    ),
                                    if (BiometricsTools.instance.isLoginSupported)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: IconButton(
                                          iconSize: 50,
                                          onPressed: () =>
                                              _biometricsLogin(context),
                                          icon: const Icon(
                                              Icons.fingerprint_outlined),
                                        ),
                                      ),
                                    if (kLoginSetting.showFacebook ||
                                        kLoginSetting.showSMSLogin ||
                                        kLoginSetting.showGoogleLogin ||
                                        kLoginSetting.showAppleLogin)
                                      Stack(
                                        alignment: AlignmentDirectional.center,
                                        children: <Widget>[
                                          SizedBox(
                                              height: 50.0,
                                              width: 200.0,
                                              child: Divider(
                                                  color: Colors.grey.shade300)),
                                          Container(
                                              height: 30,
                                              width: 40,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .surface),
                                          Text(
                                            S.of(context).or,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey.shade400),
                                          )
                                        ],
                                      ),
                                    SocialLoginButtonRow(
                                      onApplePressed: () =>
                                          loginWithApple(context),
                                      onFacebookPressed: () =>
                                          loginWithFacebook(context),
                                      onGooglePressed: () =>
                                          loginWithGoogle(context),
                                      onSmsPressed: () => loginWithSMS(context),
                                    ),
                                    const SizedBox(height: 30.0),
                                    if (kLoginSetting.enableRegister)
                                      Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(S.of(context).dontHaveAccount),
                                              GestureDetector(
                                                onTap: () {
                                                  NavigateTools.navigateRegister(
                                                      context);
                                                },
                                                child: Text(
                                                  ' ${S.of(context).signup}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    const SizedBox(height: 30.0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SemiCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from top-left
    path.lineTo(0, size.height * 0.4); // Adjust the starting curve height
    path.quadraticBezierTo(
      size.width / 2, // Control point X (center of the width)
      size.height * 1.2, // Control point Y (increase for deeper curve)
      size.width, // End point X (right edge)
      size.height * 0.4, // End point Y (same height as starting curve)
    );
    path.lineTo(size.width, 0); // Close the shape at the top-right corner
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}