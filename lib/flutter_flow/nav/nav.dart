import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: RootPageContext.wrap(
          appStateNotifier.loggedIn ? NavBarPage() : HomeWidget(),
          errorRoute: state.location,
        ),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => RootPageContext.wrap(
            appStateNotifier.loggedIn ? NavBarPage() : HomeWidget(),
          ),
          routes: [
            FFRoute(
              name: 'Register',
              path: 'register',
              builder: (context, params) => RegisterWidget(
                userReferral: params.getParam('userReferral',
                    ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'ForgetPassword',
              path: 'forget-password',
              builder: (context, params) => ForgetPasswordWidget(),
            ),
            FFRoute(
              name: 'ResetPassword',
              path: 'reset-password',
              builder: (context, params) => ResetPasswordWidget(),
            ),
            FFRoute(
              name: 'Dashboard',
              path: 'dashboard',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Dashboard')
                  : DashboardWidget(
                      defaultDashboard:
                          params.getParam('defaultDashboard', ParamType.String),
                    ),
            ),
            FFRoute(
              name: 'OrderSuccessful',
              path: 'crypto/order-successful',
              requireAuth: true,
              builder: (context, params) => OrderSuccessfulWidget(
                orderAmount: params.getParam('orderAmount', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'OrderActivities',
              path: 'order-activities',
              requireAuth: true,
              builder: (context, params) => OrderActivitiesWidget(),
            ),
            FFRoute(
              name: 'ReadOrder',
              path: 'order/crypto/order-details',
              requireAuth: true,
              builder: (context, params) => ReadOrderWidget(
                orderRef: params.getParam('orderRef',
                    ParamType.DocumentReference, false, ['crypto_orders']),
              ),
            ),
            FFRoute(
              name: 'Welcome',
              path: 'Home',
              requireAuth: true,
              builder: (context, params) => WelcomeWidget(),
            ),
            FFRoute(
              name: 'Notifications',
              path: 'settings/notifications',
              requireAuth: true,
              builder: (context, params) => NotificationsWidget(),
            ),
            FFRoute(
              name: 'Language',
              path: 'dashboard/settings/language',
              requireAuth: true,
              builder: (context, params) => LanguageWidget(),
            ),
            FFRoute(
              name: 'ListOfCryptoOrders',
              path: 'orders/crypto',
              requireAuth: true,
              builder: (context, params) => ListOfCryptoOrdersWidget(),
            ),
            FFRoute(
              name: 'CashCard',
              path: 'cashCard',
              requireAuth: true,
              builder: (context, params) => CashCardWidget(),
            ),
            FFRoute(
              name: 'ListOfWallets',
              path: 'list-of-wallets',
              requireAuth: true,
              builder: (context, params) => ListOfWalletsWidget(),
            ),
            FFRoute(
              name: 'Settings',
              path: 'account/settings',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Settings')
                  : SettingsWidget(),
            ),
            FFRoute(
              name: 'CreateOrder',
              path: 'order/crypto/create',
              requireAuth: true,
              builder: (context, params) => CreateOrderWidget(
                orderType: params.getParam('orderType', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'Profile',
              path: 'account/profile',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Profile')
                  : NavBarPage(
                      initialPage: 'Profile',
                      page: ProfileWidget(),
                    ),
            ),
            FFRoute(
              name: 'ChangePassword',
              path: 'account/security/password',
              requireAuth: true,
              builder: (context, params) => ChangePasswordWidget(),
            ),
            FFRoute(
              name: 'PersonalInformation',
              path: 'account/personal-info',
              requireAuth: true,
              builder: (context, params) => PersonalInformationWidget(),
            ),
            FFRoute(
              name: 'CreatePin',
              path: 'account/security/pin',
              requireAuth: true,
              builder: (context, params) => CreatePinWidget(),
            ),
            FFRoute(
              name: 'Security',
              path: 'account/security',
              requireAuth: true,
              builder: (context, params) => SecurityWidget(),
            ),
            FFRoute(
              name: 'Appearance',
              path: 'dashboard/settings/appearance',
              requireAuth: true,
              builder: (context, params) => AppearanceWidget(),
            ),
            FFRoute(
              name: 'Home',
              path: 'homepage',
              builder: (context, params) => HomeWidget(),
            ),
            FFRoute(
              name: 'AboutUs',
              path: 'about-us',
              builder: (context, params) => AboutUsWidget(),
            ),
            FFRoute(
              name: 'Faqs',
              path: 'faqs',
              builder: (context, params) => FaqsWidget(),
            ),
            FFRoute(
              name: 'Legal',
              path: 'legal',
              builder: (context, params) => LegalWidget(
                postRef: params.getParam('postRef', ParamType.DocumentReference,
                    false, ['dw_posts']),
              ),
            ),
            FFRoute(
              name: 'ListOfUsers',
              path: 'admin/users',
              requireAuth: true,
              builder: (context, params) => ListOfUsersWidget(),
            ),
            FFRoute(
              name: 'CreateUser',
              path: 'admin/create-user',
              requireAuth: true,
              builder: (context, params) => CreateUserWidget(),
            ),
            FFRoute(
              name: 'ListOfPosts-Classic',
              path: 'admin/cms/posts-classic',
              requireAuth: true,
              builder: (context, params) => ListOfPostsClassicWidget(),
            ),
            FFRoute(
              name: 'Single',
              path: 'blogs',
              builder: (context, params) => SingleWidget(
                urlref: params.getParam(
                    'urlref', ParamType.DocumentReference, false, ['dw_posts']),
                viewMode: params.getParam('viewMode', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'ListOfMedia',
              path: 'admin/media',
              requireAuth: true,
              builder: (context, params) => ListOfMediaWidget(),
            ),
            FFRoute(
              name: 'Currency',
              path: 'admin/settings/currency',
              requireAuth: true,
              builder: (context, params) => CurrencyWidget(),
            ),
            FFRoute(
              name: 'Crypto',
              path: 'crypto',
              builder: (context, params) => CryptoWidget(),
            ),
            FFRoute(
              name: 'GiftCards',
              path: 'giftcards',
              builder: (context, params) => GiftCardsWidget(),
            ),
            FFRoute(
              name: 'Contact',
              path: 'contact',
              builder: (context, params) => ContactWidget(),
            ),
            FFRoute(
              name: 'Blog',
              path: 'blog',
              builder: (context, params) => BlogWidget(
                postRef: params.getParam('postRef', ParamType.DocumentReference,
                    false, ['dw_posts']),
              ),
            ),
            FFRoute(
              name: 'AppName',
              path: 'admin/settings/app-name',
              requireAuth: true,
              builder: (context, params) => AppNameWidget(),
            ),
            FFRoute(
              name: 'ListOfServices',
              path: 'dashboard/pay/bills',
              requireAuth: true,
              builder: (context, params) => ListOfServicesWidget(),
            ),
            FFRoute(
              name: 'CreateAirtime',
              path: 'dashboard/bill/create/airtime',
              requireAuth: true,
              builder: (context, params) => CreateAirtimeWidget(),
            ),
            FFRoute(
              name: 'EmailSent-ForgetPassword',
              path: 'email-sent-forget-password',
              builder: (context, params) => EmailSentForgetPasswordWidget(),
            ),
            FFRoute(
              name: 'VerifyOTP',
              path: 'verify-otp',
              builder: (context, params) => VerifyOTPWidget(),
            ),
            FFRoute(
              name: 'VerifyRegister',
              path: 'verify-register',
              builder: (context, params) => VerifyRegisterWidget(),
            ),
            FFRoute(
              name: 'KYC-BVN',
              path: 'account/kyc-bvn',
              requireAuth: true,
              builder: (context, params) => KycBvnWidget(),
            ),
            FFRoute(
              name: 'EditAddress',
              path: 'account/edit-address',
              requireAuth: true,
              builder: (context, params) => EditAddressWidget(),
            ),
            FFRoute(
              name: 'ListOfBillOrders',
              path: 'dashboard/bill/orders',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'ListOfBillOrders')
                  : NavBarPage(
                      initialPage: 'ListOfBillOrders',
                      page: ListOfBillOrdersWidget(),
                    ),
            ),
            FFRoute(
              name: 'FundWallet',
              path: 'dashboard/account/fund-wallet',
              requireAuth: true,
              builder: (context, params) => FundWalletWidget(),
            ),
            FFRoute(
              name: 'AppEmail',
              path: 'admin/settings/app-email',
              requireAuth: true,
              builder: (context, params) => AppEmailWidget(),
            ),
            FFRoute(
              name: 'APIIntegration',
              path: 'admin/settings/api-integration',
              requireAuth: true,
              builder: (context, params) => APIIntegrationWidget(),
            ),
            FFRoute(
              name: 'ListOfAnnonucements',
              path: 'admin/settings/annonucements',
              requireAuth: true,
              builder: (context, params) => ListOfAnnonucementsWidget(),
            ),
            FFRoute(
              name: 'Checkout',
              path: 'checkout2',
              requireAuth: true,
              builder: (context, params) => CheckoutWidget(),
            ),
            FFRoute(
              name: 'Product',
              path: 'product',
              builder: (context, params) => ProductWidget(
                productRef: params.getParam('productRef',
                    ParamType.DocumentReference, false, ['ecommerce_products']),
              ),
            ),
            FFRoute(
              name: 'ListOfProducts',
              path: 'admin/list-of-products',
              requireAuth: true,
              builder: (context, params) => ListOfProductsWidget(),
            ),
            FFRoute(
              name: 'VirtualCard',
              path: 'virtual-card',
              requireAuth: true,
              builder: (context, params) => VirtualCardWidget(),
            ),
            FFRoute(
              name: 'ListOfCardsOrders',
              path: 'card-orders',
              requireAuth: true,
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: ListOfCardsOrdersWidget(),
              ),
            ),
            FFRoute(
              name: 'Plugins',
              path: 'admin/plugins',
              requireAuth: true,
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: PluginsWidget(),
              ),
            ),
            FFRoute(
              name: 'ListOfTransfer',
              path: 'list-of-transfer',
              requireAuth: true,
              builder: (context, params) => ListOfTransferWidget(),
            ),
            FFRoute(
              name: 'Transfer',
              path: 'transfer',
              requireAuth: true,
              builder: (context, params) => TransferWidget(
                transferRef: params.getParam('transferRef', ParamType.String),
                pageNameRef: params.getParam('pageNameRef', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'TransferAmount',
              path: 'transfer-amount',
              requireAuth: true,
              builder: (context, params) => TransferAmountWidget(
                userTransferRef: params.getParam('userTransferRef',
                    ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'FintechSettings',
              path: 'admin/fintech/settings',
              requireAuth: true,
              builder: (context, params) => FintechSettingsWidget(),
            ),
            FFRoute(
              name: 'BillSettings',
              path: 'admin/plugins/bill/settings',
              requireAuth: true,
              builder: (context, params) => BillSettingsWidget(),
            ),
            FFRoute(
              name: 'CryptoSettings',
              path: 'admin/plugins/crypto/settings',
              requireAuth: true,
              builder: (context, params) => CryptoSettingsWidget(),
            ),
            FFRoute(
              name: 'EcommerceSettings',
              path: 'admin/plugins/ecommerce/settings',
              requireAuth: true,
              builder: (context, params) => EcommerceSettingsWidget(),
            ),
            FFRoute(
              name: 'GiftcardsSettings',
              path: 'admin/plugins/giftcard/settings',
              requireAuth: true,
              builder: (context, params) => GiftcardsSettingsWidget(),
            ),
            FFRoute(
              name: 'ListOfBillOrdersForAdmin',
              path: 'admin/bill/users-orders',
              requireAuth: true,
              builder: (context, params) => ListOfBillOrdersForAdminWidget(),
            ),
            FFRoute(
              name: 'Airtime',
              path: 'products/airtime',
              builder: (context, params) => AirtimeWidget(),
            ),
            FFRoute(
              name: 'DataBundle',
              path: 'products/data-bundle',
              builder: (context, params) => DataBundleWidget(),
            ),
            FFRoute(
              name: 'CableTV',
              path: 'products/cable-tv',
              builder: (context, params) => CableTVWidget(),
            ),
            FFRoute(
              name: 'Electricity',
              path: 'products/electricity',
              builder: (context, params) => ElectricityWidget(),
            ),
            FFRoute(
              name: 'InternetWifi',
              path: 'products/internet',
              builder: (context, params) => InternetWifiWidget(),
            ),
            FFRoute(
              name: 'Education',
              path: 'products/education',
              builder: (context, params) => EducationWidget(),
            ),
            FFRoute(
              name: 'OrderSuccessfulBill',
              path: 'dashboard/bill/order/successful',
              requireAuth: true,
              builder: (context, params) => OrderSuccessfulBillWidget(
                typeOfRecipient:
                    params.getParam('typeOfRecipient', ParamType.String),
                productType: params.getParam('productType', ParamType.String),
                amount: params.getParam('amount', ParamType.String),
                customerNumber:
                    params.getParam('customerNumber', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'AppLogo',
              path: 'admin/settings/app-logo',
              requireAuth: true,
              builder: (context, params) => AppLogoWidget(),
            ),
            FFRoute(
              name: 'TransferSuccessful',
              path: 'payment/confirm/success',
              requireAuth: true,
              builder: (context, params) => TransferSuccessfulWidget(
                orderAmount: params.getParam('orderAmount',
                    ParamType.DocumentReference, false, ['billpayment_orders']),
                successMessage:
                    params.getParam('successMessage', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'ListOfRecipients',
              path: 'dashboard/recipients',
              requireAuth: true,
              builder: (context, params) => ListOfRecipientsWidget(),
            ),
            FFRoute(
              name: 'CreateCableTV',
              path: 'dashboard/bill/create/cable-tv',
              requireAuth: true,
              builder: (context, params) => CreateCableTVWidget(),
            ),
            FFRoute(
              name: 'CreateInternetWifi',
              path: 'dashboard/bill/create/wifi',
              requireAuth: true,
              builder: (context, params) => CreateInternetWifiWidget(),
            ),
            FFRoute(
              name: 'CreateTransport',
              path: 'dashboard/bill/create/transport',
              requireAuth: true,
              builder: (context, params) => CreateTransportWidget(),
            ),
            FFRoute(
              name: 'CreateEletricityBill',
              path: 'dashboard/bill/create/eletricity',
              requireAuth: true,
              builder: (context, params) => CreateEletricityBillWidget(),
            ),
            FFRoute(
              name: 'HelpCenter',
              path: 'account/settings/help-center',
              requireAuth: true,
              builder: (context, params) => HelpCenterWidget(),
            ),
            FFRoute(
              name: 'Pincode',
              path: 'account/security/pincode',
              requireAuth: true,
              builder: (context, params) => PincodeWidget(),
            ),
            FFRoute(
              name: 'Biometric',
              path: 'account/settings/biometric',
              requireAuth: true,
              builder: (context, params) => BiometricWidget(),
            ),
            FFRoute(
              name: 'DeleteAccount',
              path: 'dashboard/settings/delete-account',
              requireAuth: true,
              builder: (context, params) => DeleteAccountWidget(),
            ),
            FFRoute(
              name: 'ResetSecurityPin',
              path: 'account/security/pin/reset',
              requireAuth: true,
              builder: (context, params) => ResetSecurityPinWidget(),
            ),
            FFRoute(
              name: 'ListOfEmailTemplates',
              path: 'admin/settings/templates/email',
              requireAuth: true,
              builder: (context, params) => ListOfEmailTemplatesWidget(),
            ),
            FFRoute(
              name: 'Permissions',
              path: 'admin/settings/permissions',
              requireAuth: true,
              builder: (context, params) => PermissionsWidget(),
            ),
            FFRoute(
              name: 'LoginSms',
              path: 'login-sms',
              builder: (context, params) => LoginSmsWidget(),
            ),
            FFRoute(
              name: 'VerifySMSOTP',
              path: 'verify-sms-otp',
              builder: (context, params) => VerifySMSOTPWidget(
                getMobileNumber:
                    params.getParam('getMobileNumber', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'RegisterSms',
              path: 'registerSms',
              builder: (context, params) => RegisterSmsWidget(
                userReferral: params.getParam('userReferral',
                    ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'Links',
              path: 'admin/settings/links',
              requireAuth: true,
              builder: (context, params) => LinksWidget(),
            ),
            FFRoute(
              name: 'SetupApplication',
              path: 'admin/setup/application',
              requireAuth: true,
              builder: (context, params) => SetupApplicationWidget(),
            ),
            FFRoute(
              name: 'ListOfPosts',
              path: 'admin/cms/posts',
              requireAuth: true,
              builder: (context, params) => ListOfPostsWidget(),
            ),
            FFRoute(
              name: 'Themes',
              path: 'admin/themes',
              requireAuth: true,
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: ThemesWidget(),
              ),
            ),
            FFRoute(
              name: 'CreateDataBundle',
              path: 'dashboard/bill/create/data',
              requireAuth: true,
              builder: (context, params) => CreateDataBundleWidget(),
            ),
            FFRoute(
              name: 'DoorWayEditor',
              path: 'admin/cms/doorway-editor',
              requireAuth: true,
              builder: (context, params) => DoorWayEditorWidget(),
            ),
            FFRoute(
              name: 'ChatPage',
              path: 'dashboard/messages/chat',
              requireAuth: true,
              asyncParams: {
                'chatUser': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => ChatPageWidget(
                chatUser: params.getParam('chatUser', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, false, ['chats']),
              ),
            ),
            FFRoute(
              name: 'ListOfChats',
              path: 'dashboard/messages/chats',
              requireAuth: true,
              builder: (context, params) => ListOfChatsWidget(),
            ),
            FFRoute(
              name: 'CreateChat',
              path: 'dashboard/messages/create-chat',
              requireAuth: true,
              asyncParams: {
                'chat': getDoc(['chats'], ChatsRecord.fromSnapshot),
              },
              builder: (context, params) => CreateChatWidget(
                chat: params.getParam('chat', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'CreateGroupChat',
              path: 'createGroupChat',
              requireAuth: true,
              builder: (context, params) => CreateGroupChatWidget(),
            ),
            FFRoute(
              name: 'ManageRecipeints',
              path: 'admin/settings/manage/recipients',
              requireAuth: true,
              builder: (context, params) => ManageRecipeintsWidget(),
            ),
            FFRoute(
              name: 'SetupApplication2',
              path: 'setup/application2',
              requireAuth: true,
              builder: (context, params) => SetupApplication2Widget(),
            ),
            FFRoute(
              name: 'ManageAds',
              path: 'admin/settings/manage-app-ads',
              requireAuth: true,
              builder: (context, params) => ManageAdsWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/homepage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Reqra_Rectangle_Logo_Blue.png',
                      width: 130.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      );
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    Key? key,
    required this.state,
    required this.child,
  }) : super(key: key);

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();
    // Handle erroneous links from Firebase Dynamic Links.
    if (widget.state.location.startsWith('/link?request_ip_version')) {
      SchedulerBinding.instance.addPostFrameCallback((_) => context.go('/'));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
