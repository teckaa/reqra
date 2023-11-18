import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'af', 'fr', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? afText = '',
    String? frText = '',
    String? esText = '',
  }) =>
      [enText, afText, frText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Register
  {
    'hemzq6we': {
      'en': 'Let’s Get Started',
      'af': 'Laat ons begin',
      'es': 'Empecemos',
      'fr': 'Commençons',
    },
    'dztgm8if': {
      'en': 'Sign up with Google',
      'af': 'Sluit aan by Google',
      'es': 'Regístrate con Google',
      'fr': 'Inscrivez-vous avec Google',
    },
    'hjkocsgv': {
      'en': 'Firstname is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'f4p2hbjy': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'k8wrre2a': {
      'en': 'Lastname is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'wtnvb5qk': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'vfvc7kgx': {
      'en': 'Field is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    '9r6uvsu4': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    '18idpaez': {
      'en': 'Field is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    '9b4wkdrb': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    '1omafuzw': {
      'en': 'Phone Number is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    '1ka4f81y': {
      'en': 'Your phone number must consist of 10 digits.',
      'af': '',
      'es': '',
      'fr': '',
    },
    'vz0nz6ou': {
      'en': 'Your phone number must consist of 10 digits.',
      'af': '',
      'es': '',
      'fr': '',
    },
    'et0af17w': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ee6359jt': {
      'en': 'Field is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'wkmhwn77': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    '3cs30fup': {
      'en': 'Email is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'cdpb8nw3': {
      'en': 'Password must be at least 6 characters long.',
      'af': '',
      'es': '',
      'fr': '',
    },
    'orwyuual': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ng8a566e': {
      'en': 'Password is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    '79dmemel': {
      'en': 'Password must be at least 6 characters long.',
      'af': '',
      'es': '',
      'fr': '',
    },
    'iwx5afg0': {
      'en': 'Password must not exceed 20 characters in length.',
      'af': '',
      'es': '',
      'fr': '',
    },
    'szu9cwau': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ldj9abke': {
      'en': 'Confirm Password is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    '4jthjtru': {
      'en': 'Confirm Password must be at least 6 characters long.',
      'af': '',
      'es': '',
      'fr': '',
    },
    '4zomla87': {
      'en': 'Confirm Password must not exceed 20 characters in length.',
      'af': '',
      'es': '',
      'fr': '',
    },
    '0nh07t3k': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'q4ujqrnw': {
      'en': 'Already have an account? ',
      'af': 'Reeds \'n rekening?',
      'es': '¿Ya tienes una cuenta?',
      'fr': 'Vous avez déjà un compte?',
    },
    'oj9dq5kk': {
      'en': 'Sign in',
      'af': 'Meld aan',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
    },
    'apkvh2kz': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ForgetPassword
  {
    'e7wmbtfi': {
      'en': 'Forget Password',
      'af': 'Wagwoord vergeet',
      'es': 'Contraseña olvidada',
      'fr': 'Mot de passe oublié',
    },
    '3atksh5z': {
      'en':
          'Enter your email address and we\'ll send you a link to reset your password.',
      'af':
          'Voer jou e-posadres in en ons sal vir jou \'n skakel stuur om jou wagwoord terug te stel.',
      'es':
          'Ingrese su dirección de correo electrónico y le enviaremos un enlace para restablecer su contraseña.',
      'fr':
          'Entrez votre adresse e-mail et nous vous enverrons un lien pour réinitialiser votre mot de passe.',
    },
    'qz6qwqo2': {
      'en': 'Back to login? ',
      'af': 'Terug na aanmelding?',
      'es': '¿Atrás para iniciar sesión?',
      'fr': 'Retour connexion?',
    },
    'rygvvs16': {
      'en': 'Click here',
      'af': 'Klik hier',
      'es': 'haga clic aquí',
      'fr': 'Cliquez ici',
    },
    'tdynm9ka': {
      'en': 'Email is required',
      'af': 'E-pos word vereis',
      'es': 'correo electronico es requerido',
      'fr': 'L\'e-mail est requis',
    },
    'l8ni1n7p': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'tntene2b': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ResetPassword
  {
    'id8xetmo': {
      'en': 'Reset your Password',
      'af': 'Herstel jou wagwoord',
      'es': 'Restablecer su contraseña',
      'fr': 'réinitialisez votre mot de passe',
    },
    '2w3vc6uo': {
      'en': 'Email is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    '504f37ei': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ua2a8y96': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Dashboard
  {
    'l36kba0b': {
      'en': 'Dashboard',
      'af': 'Dashboard',
      'es': 'Panel',
      'fr': 'Tableau de bord',
    },
    'wc92huun': {
      'en': 'Dashboard',
      'af': 'Dashboard',
      'es': 'Panel',
      'fr': 'Tableau de bord',
    },
  },
  // OrderSuccessful
  {
    '072bqf8a': {
      'en': 'Plugins',
      'af': 'Rekeningbetalings',
      'es': 'Pagos de facturas',
      'fr': 'Paiements de factures',
    },
    'nskfu4hp': {
      'en': 'Order Created',
      'af': 'Transaksie suksesvol',
      'es': 'Transacción exitosa',
      'fr': 'Transaction réussie',
    },
    'ojhlgj2a': {
      'en': 'Orders',
      'af': 'Bestellings',
      'es': 'Pedidos',
      'fr': 'Ordres',
    },
  },
  // OrderActivities
  {
    'vnqn03wx': {
      'en': 'Order activities',
      'af': 'Bestel aktiwiteite',
      'es': 'Ordenar actividades',
      'fr': 'Commander des activités',
    },
    'dbhkt2rm': {
      'en': 'Activity on this order',
      'af': 'Aktiwiteit op hierdie bestelling',
      'es': 'Actividad en este pedido',
      'fr': 'Activité sur cette commande',
    },
    '46hjoaoi': {
      'en': 'Beginning of Activity',
      'af': 'Begin van aktiwiteit',
      'es': 'Comienzo de la Actividad',
      'fr': 'Début d\'activité',
    },
    'a9gnkqdp': {
      'en': 'Created Date & Time [Date and time]',
      'af': 'Geskep datum en tyd [Datum en tyd]',
      'es': 'Fecha y hora de creación [fecha y hora]',
      'fr': 'Date et heure de création [Date et heure]',
    },
    'dil2skqa': {
      'en': 'Order Status -',
      'af': 'Bestellingstatus -',
      'es': 'Estado del pedido -',
      'fr': 'Statut de la commande -',
    },
    'd0y3lfep': {
      'en': 'Pending',
      'af': 'Hangende',
      'es': 'Pendiente',
      'fr': 'En attente',
    },
    'ohpdbpwb': {
      'en': 'Created Date & Time [Date and time]',
      'af': 'Geskep datum en tyd [Datum en tyd]',
      'es': 'Fecha y hora de creación [fecha y hora]',
      'fr': 'Date et heure de création [Date et heure]',
    },
    '1udrzcax': {
      'en': 'Order Status -',
      'af': 'Bestellingstatus -',
      'es': 'Estado del pedido -',
      'fr': 'Statut de la commande -',
    },
    '1e7b4lpg': {
      'en': 'Processing',
      'af': 'Verwerking',
      'es': 'Procesando',
      'fr': 'Traitement',
    },
    'sjt3hr9x': {
      'en': 'Created Date & Time [Date and time]',
      'af': 'Geskep datum en tyd [Datum en tyd]',
      'es': 'Fecha y hora de creación [fecha y hora]',
      'fr': 'Date et heure de création [Date et heure]',
    },
    'rke2fqee': {
      'en': 'Order Status -',
      'af': 'Bestellingstatus -',
      'es': 'Estado del pedido -',
      'fr': 'Statut de la commande -',
    },
    'u5r1os7x': {
      'en': 'Completed',
      'af': 'Voltooi',
      'es': 'Terminado',
      'fr': 'Complété',
    },
    '3y5a2vhn': {
      'en': 'Created Date & Time [Date and time]',
      'af': 'Geskep datum en tyd [Datum en tyd]',
      'es': 'Fecha y hora de creación [fecha y hora]',
      'fr': 'Date et heure de création [Date et heure]',
    },
    '4c3vl6kv': {
      'en': 'Order Status -',
      'af': 'Bestellingstatus -',
      'es': 'Estado del pedido -',
      'fr': 'Statut de la commande -',
    },
    'u36j7sz6': {
      'en': 'Rejected',
      'af': 'Verwerp',
      'es': 'Rechazado',
      'fr': 'Rejeté',
    },
    'tt336wy2': {
      'en': 'Created Date & Time [Date and time]',
      'af': 'Geskep datum en tyd [Datum en tyd]',
      'es': 'Fecha y hora de creación [fecha y hora]',
      'fr': 'Date et heure de création [Date et heure]',
    },
    'e8h28upf': {
      'en': 'Order Status -',
      'af': 'Bestellingstatus -',
      'es': 'Estado del pedido -',
      'fr': 'Statut de la commande -',
    },
    'w0c1twlk': {
      'en': 'Cancel',
      'af': 'Kanselleer',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
  },
  // ReadOrder
  {
    'i8bchdd4': {
      'en': 'Checkout',
      'af': 'Uitteken',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    '4hbexkwg': {
      'en': 'Order Amount',
      'af': 'Bestelbedrag',
      'es': 'Total de la orden',
      'fr': 'Montant de la commande',
    },
    'pmm6z9pe': {
      'en': 'Network',
      'af': 'Netwerk',
      'es': 'Red',
      'fr': 'Réseau',
    },
    'hehk06pq': {
      'en': 'Order summary',
      'af': 'Bestelling opsomming',
      'es': 'Resumen del pedido',
      'fr': 'Récapitulatif de la commande',
    },
    '9wa3cwoe': {
      'en': 'Date',
      'af': 'Datum',
      'es': 'Fecha',
      'fr': 'Date',
    },
    'tfouq6kl': {
      'en': 'Order Reference',
      'af': 'Bestellingsverwysing',
      'es': 'Pedir Referencia',
      'fr': 'Référence de l\'achat',
    },
    'mjxgtqcw': {
      'en': 'Order Id',
      'af': '',
      'es': '',
      'fr': '',
    },
    'a1nw3mfl': {
      'en': 'Amount Tender',
      'af': 'Bedrag Tender',
      'es': 'Cantidad Oferta',
      'fr': 'Montant de l\'offre',
    },
    '3j8n8i5w': {
      'en': 'Exchange Rate',
      'af': 'Wisselkoers',
      'es': 'Tipo de cambio',
      'fr': 'Taux de change',
    },
    'emc8w494': {
      'en': 'Received',
      'af': 'Ontvang',
      'es': 'Recibió',
      'fr': 'Reçu',
    },
    'xkjzdomm': {
      'en': 'Payment method',
      'af': 'Betaalmetode',
      'es': 'método de pago',
      'fr': 'Méthode de paiement',
    },
    'wz4vveqh': {
      'en': 'Bank Transfer',
      'af': 'Bankoorplasing',
      'es': 'Transferencia bancaria',
      'fr': 'Virement',
    },
    '1b074cl5': {
      'en': 'Bank Name',
      'af': 'Bank Naam',
      'es': 'Nombre del banco',
      'fr': 'Nom de banque',
    },
    '94yaosgd': {
      'en': 'Account Name',
      'af': 'Rekeningnaam',
      'es': 'Nombre de la cuenta',
      'fr': 'Nom du compte',
    },
    '3q78edsl': {
      'en': 'Swift Code',
      'af': 'Snelkode',
      'es': 'código SWIFT',
      'fr': 'Code rapide',
    },
    'qvag1l5a': {
      'en': 'Routing Number',
      'af': 'Roeterings nommer',
      'es': 'Número de ruta',
      'fr': 'Numéro de routage',
    },
    '28sk4qc2': {
      'en': 'Country',
      'af': 'Land',
      'es': 'País',
      'fr': 'Pays',
    },
  },
  // Welcome
  {
    'i5vubcvs': {
      'en': 'Simplify bill payment: quick, effortless, and convenient!',
      'af': 'Vereenvoudig rekeningbetaling: vinnig, moeiteloos en gerieflik!',
      'es':
          'Simplifique el pago de facturas: ¡rápido, sin esfuerzo y conveniente!',
      'fr':
          'Simplifiez le paiement des factures : rapide, sans effort et pratique !',
    },
  },
  // Notifications
  {
    'wo5d2798': {
      'en': 'Notifications',
      'af': 'Kennisgewings',
      'es': 'Notificaciones',
      'fr': 'Avis',
    },
    'mv3aw5oa': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'af':
          'Kies hieronder watter kennisgewings jy wil ontvang en ons sal die instellings opdateer.',
      'es':
          'Elija qué notificaciones desea recibir a continuación y actualizaremos la configuración.',
      'fr':
          'Choisissez les notifications que vous souhaitez recevoir ci-dessous et nous mettrons à jour les paramètres.',
    },
    'majiite8': {
      'en': 'Push Notifications',
      'af': 'Stoot kennisgewings',
      'es': 'Notificaciones push',
      'fr': 'Notifications push',
    },
    'tgyc4n2d': {
      'en': 'Turn on or off push notifications.',
      'af':
          'Ontvang stootkennisgewings van ons toepassing op \'n semi-gereelde basis.',
      'es':
          'Reciba notificaciones Push de nuestra aplicación de forma semi regular.',
      'fr':
          'Recevez des notifications Push de notre application sur une base semi-régulière.',
    },
    '7tp6c5u2': {
      'en': 'Email Notifications',
      'af': 'Sekuriteit',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    'ypkitn3k': {
      'en': 'Turn on or off emal notifications.',
      'af': 'Ontvang \'n kennisgewing vir alle sekuriteitsaksies.',
      'es': 'Reciba una notificación de todas las acciones de seguridad.',
      'fr': 'Recevez une notification pour toutes les actions de sécurité.',
    },
    'z70psqqp': {
      'en': 'Settings',
      'af': 'Instellings',
      'es': 'Ajustes',
      'fr': 'Paramètres',
    },
  },
  // Language
  {
    'ctxxkir2': {
      'en': 'Language',
      'af': 'Taal',
      'es': 'Idioma',
      'fr': 'Langue',
    },
    'diik0ulv': {
      'en': 'Change your default language',
      'af': 'Verander jou verstektaal',
      'es': 'Cambia tu idioma predeterminado',
      'fr': 'Changer votre langue par défaut',
    },
    '2i8ctuq9': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ListOfCryptoOrders
  {
    'gnnjb559': {
      'en': 'Cryptos',
      'af': 'Kripto\'s',
      'es': 'criptos',
      'fr': 'Cryptos',
    },
    '3nom5rux': {
      'en': 'Orders',
      'af': 'Bestellings',
      'es': 'Pedidos',
      'fr': 'Ordres',
    },
  },
  // CashCard
  {
    'jce8zjsy': {
      'en': 'Gift cards',
      'af': 'Geskenkbewyse',
      'es': 'Tarjetas de regalo',
      'fr': 'Cartes cadeaux',
    },
    'tyaia7d3': {
      'en': 'Meet The Cash Card',
      'af': 'Ontmoet die kontantkaart',
      'es': 'Conozca la tarjeta de efectivo',
      'fr': 'Découvrez la carte de paiement',
    },
    'rr3cqaq2': {
      'en': 'The customizable, no hidden fee, instant discounts debit card',
      'af':
          'Die aanpasbare, geen verborge fooi, onmiddellike afslag debietkaart',
      'es':
          'La tarjeta de débito personalizable, sin cargos ocultos y con descuentos instantáneos',
      'fr':
          'La carte de débit personnalisable, sans frais cachés, à rabais instantanés',
    },
    'hqy5in24': {
      'en': 'Now For Anyone 13+',
      'af': 'Nou vir enigiemand 13+',
      'es': 'Ahora para cualquier persona mayor de 13 años',
      'fr': 'Maintenant pour toute personne de 13 ans et plus',
    },
    'khbd15va': {
      'en':
          'Just get a parent or guardian to sign off, and you can order your own',
      'af': 'Kry net \'n ouer of voog om af te teken, en jy kan jou eie bestel',
      'es':
          'Solo pídale a uno de sus padres o tutores que firme, y usted puede ordenar su propio',
      'fr':
          'Demandez simplement à un parent ou à un tuteur de signer et vous pourrez commander le vôtre',
    },
    'a6zv58u5': {
      'en': 'Save With It',
      'af': 'Spaar daarmee',
      'es': 'Ahorra con eso',
      'fr': 'Économisez avec',
    },
    'jl93fwqi': {
      'en': 'Add Boosts for instant savings on your everyday spending',
      'af':
          'Voeg hupstoot by vir onmiddellike besparings op jou daaglikse uitgawes',
      'es': 'Agregue Boosts para ahorros instantáneos en sus gastos diarios',
      'fr':
          'Ajoutez des Boosts pour des économies instantanées sur vos dépenses quotidiennes',
    },
    '161ugspt': {
      'en': 'Get Free Cash Card',
      'af': 'Kry gratis kontantkaart',
      'es': 'Obtenga una tarjeta de efectivo gratis',
      'fr': 'Obtenez une carte de paiement gratuite',
    },
    '1v80f52p': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ListOfWallets
  {
    'llkpk81b': {
      'en': 'List all wallet',
      'af': 'Lys alle beursies',
      'es': 'Listar todas las carteras',
      'fr': 'Lister tous les portefeuilles',
    },
    'ugtz4uur': {
      'en': 'Coin',
      'af': 'Munt',
      'es': 'Moneda',
      'fr': 'Pièce de monnaie',
    },
    'c9v0giwl': {
      'en': 'Wallet',
      'af': 'Beursie',
      'es': 'Billetera',
      'fr': 'Portefeuille',
    },
    'zd6vjjeh': {
      'en': 'Rates',
      'af': 'Tariewe',
      'es': 'Tarifas',
      'fr': 'Les taux',
    },
    'jiwfklt5': {
      'en': 'Sell',
      'af': 'Verkoop',
      'es': 'Vender',
      'fr': 'Vendre',
    },
    'fuc0xe4a': {
      'en': 'Buy',
      'af': 'Koop',
      'es': 'Comprar',
      'fr': 'Acheter',
    },
    'czt036qo': {
      'en': 'Action',
      'af': 'Aksie',
      'es': 'Acción',
      'fr': 'Action',
    },
    '55d5hucz': {
      'en': 'Update',
      'af': 'Opdateer',
      'es': 'Actualizar',
      'fr': 'Mise à jour',
    },
    'has65kjh': {
      'en': 'Read',
      'af': 'Lees',
      'es': 'Leer',
      'fr': 'Lire',
    },
    'ude112n6': {
      'en': 'Delete',
      'af': 'Vee uit',
      'es': 'Borrar',
      'fr': 'Supprimer',
    },
    'q7po3243': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Settings
  {
    'qxceu07v': {
      'en': 'Settings',
      'af': 'Instellings',
      'es': 'Ajustes',
      'fr': 'Paramètres',
    },
    'mmu6bxus': {
      'en': 'More',
      'af': 'Meer',
      'es': 'Más',
      'fr': 'Plus',
    },
  },
  // CreateOrder
  {
    'p4q90th9': {
      'en': 'Create order',
      'af': 'Skep bestelling',
      'es': 'Crear orden',
      'fr': 'Créer une commande',
    },
    'gcbdqasz': {
      'en': 'Amount',
      'af': 'Bedrag',
      'es': 'Cantidad',
      'fr': 'Montant',
    },
    'i252jy05': {
      'en': 'Recipient',
      'af': 'Ontvanger',
      'es': 'Recipiente',
      'fr': 'Destinataire',
    },
    'h6a5atfb': {
      'en': 'Review',
      'af': 'Resensie',
      'es': 'Revisar',
      'fr': 'Revoir',
    },
    'vnx8q62o': {
      'en': 'Confirm',
      'af': 'Bevestig',
      'es': 'Confirmar',
      'fr': 'Confirmer',
    },
    'hdk3bmk1': {
      'en':
          'Please confirm the recipient information before submitting this order and keep in mind that order submitted may not be reversed.',
      'af':
          'Bevestig asseblief die begunstigde-inligting voordat u hierdie bestelling indien en hou in gedagte dat bestelling wat ingedien word nie omgekeer mag word nie.',
      'es':
          'Confirme la información del beneficiario antes de enviar este pedido y tenga en cuenta que el pedido enviado no se puede revertir.',
      'fr':
          'Veuillez confirmer les informations sur le bénéficiaire avant de soumettre cette commande et gardez à l\'esprit que la commande soumise ne peut pas être annulée.',
    },
    '7hu0kqa4': {
      'en': 'Bank Name',
      'af': 'Bank Naam',
      'es': 'Nombre del banco',
      'fr': 'Nom de banque',
    },
    '834k0tm5': {
      'en': 'Account Number',
      'af': 'Rekening nommer',
      'es': 'Número de cuenta',
      'fr': 'Numéro de compte',
    },
    'fryodclo': {
      'en': 'Account Name',
      'af': 'Rekeningnaam',
      'es': 'Nombre de la cuenta',
      'fr': 'Nom du compte',
    },
    'vpaxh64u': {
      'en': 'Order summary',
      'af': 'Bestelling opsomming',
      'es': 'Resumen del pedido',
      'fr': 'Récapitulatif de la commande',
    },
    '5pe9g0f1': {
      'en': 'Date',
      'af': 'Datum',
      'es': 'Fecha',
      'fr': 'Date',
    },
    'l9zrnoe5': {
      'en': 'Order Reference',
      'af': 'Bestellingsverwysing',
      'es': 'Pedir Referencia',
      'fr': 'Référence de l\'achat',
    },
    'ae32vpou': {
      'en': 'Order Id',
      'af': '',
      'es': '',
      'fr': '',
    },
    'nezjbs2a': {
      'en': 'Amount Tender',
      'af': 'Bedrag Tender',
      'es': 'Cantidad Oferta',
      'fr': 'Montant de l\'offre',
    },
    '02f1qa87': {
      'en': 'Exchange Rate',
      'af': 'Wisselkoers',
      'es': 'Tipo de cambio',
      'fr': 'Taux de change',
    },
    'xidclh6l': {
      'en': 'Received',
      'af': 'Ontvang',
      'es': 'Recibió',
      'fr': 'Reçu',
    },
    '39h9zplx': {
      'en': 'Payment method',
      'af': 'Betaalmetode',
      'es': 'método de pago',
      'fr': 'Méthode de paiement',
    },
    'a4zqzs4u': {
      'en': 'Bank Transfer',
      'af': 'Bankoorplasing',
      'es': 'Transferencia bancaria',
      'fr': 'Virement',
    },
    '69w6g6kz': {
      'en': 'Recipient',
      'af': 'Bank Naam',
      'es': 'Nombre del banco',
      'fr': 'Nom de banque',
    },
    'oga3smk7': {
      'en': 'Bank Name',
      'af': 'Bank Naam',
      'es': 'Nombre del banco',
      'fr': 'Nom de banque',
    },
    'zzedy3ln': {
      'en': 'Account Number',
      'af': 'Rekeningnaam',
      'es': 'Nombre de la cuenta',
      'fr': 'Nom du compte',
    },
    'igwl67pm': {
      'en': 'Account Name',
      'af': 'Rekeningnaam',
      'es': 'Nombre de la cuenta',
      'fr': 'Nom du compte',
    },
    'iagnrg55': {
      'en': 'Country',
      'af': 'Land',
      'es': 'País',
      'fr': 'Pays',
    },
    '9whfgq5s': {
      'en': 'Save as new recipient',
      'af': 'Stoor as nuwe ontvanger',
      'es': 'Guardar como nuevo destinatario',
      'fr': 'Enregistrer comme nouveau destinataire',
    },
    'oy1kcbq6': {
      'en': 'You sell exactly',
      'af': 'Jy verkoop presies',
      'es': 'vendes exactamente',
      'fr': 'Vous vendez exactement',
    },
    '7p4z426u': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    '3vxdu3el': {
      'en': '1000',
      'af': '100',
      'es': '100',
      'fr': '100',
    },
    '3aks9swg': {
      'en': ' price: ',
      'af': 'prys:',
      'es': 'precio:',
      'fr': 'prix:',
    },
    'j9hfrd06': {
      'en': '1.00 ',
      'af': '0.00',
      'es': '0.00',
      'fr': '0,00',
    },
    'ola2fthp': {
      'en': ' / ',
      'af': ',',
      'es': ',',
      'fr': ',',
    },
    'zupii52d': {
      'en': 'Bank transfer fee',
      'af': 'Bankoordragfooi',
      'es': 'Tarifa de transferencia bancaria',
      'fr': 'Frais de virement bancaire',
    },
    'lzf0svsn': {
      'en': 'Transaction fee',
      'af': 'Transaksie fooi',
      'es': 'Tarifa de transacción',
      'fr': 'Frais de transaction',
    },
    'h5hdiwq4': {
      'en': 'Recipient get',
      'af': 'Jy verkoop presies',
      'es': 'vendes exactamente',
      'fr': 'Vous vendez exactement',
    },
    'mnuz0qp4': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    '0axyjeke': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'vknh4b3x': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    're4cdliv': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '6vft703x': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ne0iah17': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'j6zi27z0': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // Login
  {
    'rfz28my4': {
      'en': 'Log in to your account',
      'af': 'Teken in op jou rekening',
      'es': 'Ingrese a su cuenta',
      'fr': 'Connectez-vous à votre compte',
    },
    'tts8mxya': {
      'en': 'Login with Google',
      'af': 'Teken in met Google',
      'es': 'Iniciar sesión con Google',
      'fr': 'Connectez-vous avec Google',
    },
    'acitrn6w': {
      'en': 'Forget your Password? ',
      'af': 'Vergeet jou wagwoord?',
      'es': '¿Olvidaste tu contraseña?',
      'fr': 'Mot de passe oublié?',
    },
    '0kzm3ffw': {
      'en': 'Reset it here',
      'af': 'Stel dit hier terug',
      'es': 'restablecerlo aquí',
      'fr': 'Réinitialisez-le ici',
    },
    'm9q38f6t': {
      'en': 'Email is required',
      'af': 'E-pos word vereis',
      'es': 'correo electronico es requerido',
      'fr': 'L\'e-mail est requis',
    },
    'mpwyn8ww': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'u4hqt87f': {
      'en': 'Password is required',
      'af': 'Wagwoord word benodig',
      'es': 'se requiere contraseña',
      'fr': 'Mot de passe requis',
    },
    'ykcrfe3g': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'atw8cwuv': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Profile
  {
    'gb74p4ec': {
      'en': 'Profile',
      'af': 'Profiel',
      'es': 'Perfil',
      'fr': 'Profil',
    },
    '2x1eu8hw': {
      'en': 'Profile',
      'af': 'Profiel',
      'es': 'Perfil',
      'fr': 'Profil',
    },
  },
  // ChangePassword
  {
    '5pw78nua': {
      'en': 'Security',
      'af': 'Sekuriteit',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    'pd2v7wad': {
      'en': 'Current password is required',
      'af': 'Huidige wagwoord word vereis',
      'es': 'Se requiere contraseña actual',
      'fr': 'Le mot de passe actuel est requis',
    },
    '4id9zge0': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'gcr1o33o': {
      'en': 'New password is required',
      'af': 'Nuwe wagwoord word vereis',
      'es': 'Se requiere una nueva contraseña',
      'fr': 'Un nouveau mot de passe est requis',
    },
    'cv3siog7': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'w7ektosl': {
      'en': 'Confirm password is required',
      'af': 'Bevestig wagwoord word vereis',
      'es': 'Se requiere confirmar contraseña',
      'fr': 'Confirmer le mot de passe est requis',
    },
    '24nz0zr8': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '1f8umz86': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // PersonalInformation
  {
    'dmyaqwqd': {
      'en': 'Edit profile',
      'af': 'Wysig profiel',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    'j9irkz7q': {
      'en': 'Gender',
      'af': 'Geslag',
      'es': 'Género',
      'fr': 'Genre',
    },
    'md8qitod': {
      'en': 'Male',
      'af': 'Manlik',
      'es': 'Masculino',
      'fr': 'Mâle',
    },
    'o9y935e7': {
      'en': 'Female',
      'af': 'Vroulik',
      'es': 'Femenino',
      'fr': 'Femelle',
    },
    '4l4ysc4m': {
      'en': 'Firstname  is required',
      'af': 'Voornaam word vereis',
      'es': 'Se requiere el primer nombre',
      'fr': 'Le prénom est requis',
    },
    '5h77za1e': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '8aa4ixyp': {
      'en': 'Lastname is required',
      'af': 'Van word vereis',
      'es': 'Se requiere apellido',
      'fr': 'Le nom de famille est requis',
    },
    's6pao7t6': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'swa7ienu': {
      'en': 'Email is required',
      'af': 'E-pos word vereis',
      'es': 'correo electronico es requerido',
      'fr': 'L\'e-mail est requis',
    },
    'rfvmtso0': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'bf8v8mgx': {
      'en': 'Phone Number is required',
      'af': 'Telefoonnommer word vereis',
      'es': 'Se requiere número de teléfono',
      'fr': 'Le numéro de téléphone est requis',
    },
    'tlhq89z8': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ifwhfg97': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // CreatePin
  {
    '20z2c1xe': {
      'en': 'Security pin',
      'af': 'Sekuriteits kode',
      'es': 'PIN Seguridad',
      'fr': 'Code de securité',
    },
    '5lf6haa2': {
      'en':
          'Changing your 6-digit security PIN safeguards your account, and you must not share it with anyone.',
      'af': '',
      'es': '',
      'fr': '',
    },
    'co78dzqz': {
      'en': 'Forget your pin? ',
      'af': 'Vergeet jou wagwoord?',
      'es': '¿Olvidaste tu contraseña?',
      'fr': 'Mot de passe oublié?',
    },
    'w0hgv595': {
      'en': 'Reset it here',
      'af': 'Stel dit hier terug',
      'es': 'restablecerlo aquí',
      'fr': 'Réinitialisez-le ici',
    },
    'jsa2ebb8': {
      'en': 'Current is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'tqni5ru6': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'xvigdg0y': {
      'en': 'Pin is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    '9jbqtowt': {
      'en': 'Pin must be 6 digits',
      'af': '',
      'es': '',
      'fr': '',
    },
    'medci0hd': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    '2s1vqb8y': {
      'en': 'Confirm pin is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    '7tid9txh': {
      'en': 'Confirm pin must be 6 digits',
      'af': '',
      'es': '',
      'fr': '',
    },
    'n7qd1pi9': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'dno43ny7': {
      'en':
          'Your 6-digit security PIN protects your account, and it is critical that you do not share it with anybody.',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ueuqlvxt': {
      'en': 'Pin is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    '2t4zf9er': {
      'en': 'Pin must be 6 digits',
      'af': '',
      'es': '',
      'fr': '',
    },
    'u9q5bwl1': {
      'en': 'Pin must be 6 digits',
      'af': '',
      'es': '',
      'fr': '',
    },
    'dvu7ai0b': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    '5k1jie2z': {
      'en': 'Confirm pin is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'f682u6a5': {
      'en': 'Confirm pin must be 6 digits',
      'af': '',
      'es': '',
      'fr': '',
    },
    'r94c9og0': {
      'en': 'Confirm pin must be 6 digits',
      'af': '',
      'es': '',
      'fr': '',
    },
    '0qvnms0f': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'cydjdnuf': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Security
  {
    '7jhmw0ix': {
      'en': ' Security',
      'af': 'Sekuriteit',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    'w1zyhr1i': {
      'en': 'Change password',
      'af': 'Verander wagwoord',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
    },
    'w00h8jf8': {
      'en': 'Security pin',
      'af': 'Sekuriteits kode',
      'es': 'PIN Seguridad',
      'fr': 'Code de securité',
    },
    'otxk25uj': {
      'en': 'More',
      'af': 'Meer',
      'es': 'Más',
      'fr': 'Plus',
    },
  },
  // Appearance
  {
    '50l4d5ye': {
      'en': 'Appearance',
      'af': 'Voorkoms',
      'es': 'Apariencia',
      'fr': 'Apparence',
    },
    '89a423dp': {
      'en':
          'Your application mode will change when you activate Day or Night mode.',
      'af':
          'Jou toepassingsmodus sal verander wanneer jy Dag- of Nagmodus aktiveer.',
      'es': 'Su modo de aplicación cambiará cuando active el modo Día o Noche.',
      'fr':
          'Votre mode d\'application changera lorsque vous activerez le mode Jour ou Nuit.',
    },
    'rhy98fol': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Home
  {
    'z9rdek4b': {
      'en': 'Welcome, App Owner!',
      'af': 'Vereenvoudig rekeningbetaling: vinnig, moeiteloos en gerieflik!',
      'es':
          'Simplifique el pago de facturas: ¡rápido, sin esfuerzo y conveniente!',
      'fr':
          'Simplifiez le paiement des factures : rapide, sans effort et pratique !',
    },
    'ej35l586': {
      'en':
          'You will now be redirected to the setup page to configure your app.',
      'af': 'Vereenvoudig rekeningbetaling: vinnig, moeiteloos en gerieflik!',
      'es':
          'Simplifique el pago de facturas: ¡rápido, sin esfuerzo y conveniente!',
      'fr':
          'Simplifiez le paiement des factures : rapide, sans effort et pratique !',
    },
    'fubvg0ro': {
      'en': 'Airtime',
      'af': 'Lugtyd',
      'es': 'Tiempo en antena',
      'fr': 'Temps d\'antenne',
    },
    'dqx296e3': {
      'en':
          'Top up your airtime now! Stay connected and never miss a call. Quick and secure payment options. Recharge hassle-free today!',
      'af':
          'Vul nou jou lugtyd aan! Bly verbind en mis nooit \'n oproep nie. Vinnige en veilige betaalopsies. Herlaai vandag moeitevry!',
      'es':
          '¡Recarga tu tiempo aire ahora! Manténgase conectado y nunca pierda una llamada. Opciones de pago rápidas y seguras. ¡Recarga sin problemas hoy!',
      'fr':
          'Rechargez votre temps d\'antenne maintenant ! Restez connecté et ne manquez jamais un appel. Options de paiement rapides et sécurisées. Rechargez sans tracas aujourd\'hui !',
    },
    'pt3sdln4': {
      'en': 'Eletricity',
      'af': 'Elektrisiteit',
      'es': 'electricidad',
      'fr': 'Électricité',
    },
    'zip6vw45': {
      'en':
          'Power up your life! Pay electricity bills with ease and keep the lights on. Fast, secure, and convenient payment options. Switch on now!',
      'af':
          'Versterk jou lewe! Betaal elektrisiteitsrekeninge met gemak en hou die ligte aan. Vinnige, veilige en gerieflike betaalopsies. Skakel nou aan!',
      'es':
          '¡Enciende tu vida! Pague las facturas de electricidad con facilidad y mantenga las luces encendidas. Opciones de pago rápidas, seguras y convenientes. ¡Enciéndelo ahora!',
      'fr':
          'Boostez votre vie ! Payez facilement vos factures d\'électricité et gardez les lumières allumées. Options de paiement rapides, sécurisées et pratiques. Allumez maintenant !',
    },
    '4v012xda': {
      'en': 'Cable TV and More',
      'af': 'Kabel-TV en meer',
      'es': 'Televisión por cable y más',
      'fr': 'Télévision par câble et plus',
    },
    '05ic2u71': {
      'en':
          'Pay cable TV bills now and enjoy uninterrupted shows. Quick and secure payment options are available. Tune in today!',
      'af':
          'Betaal nou kabel-TV-rekeninge en geniet ononderbroke programme. Vinnige en veilige betaalopsies is beskikbaar. Skakel vandag in!',
      'es':
          'Pague sus facturas de televisión por cable ahora y disfrute de programas ininterrumpidos. Hay opciones de pago rápidas y seguras disponibles. ¡Sintonízate hoy!',
      'fr':
          'Payez vos factures de télévision par câble maintenant et profitez d\'émissions ininterrompues. Des options de paiement rapides et sécurisées sont disponibles. Branchez-vous aujourd\'hui !',
    },
    'th0hli8k': {
      'en': 'Continue',
      'af': 'Aanhou',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
    'i6w7758f': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // AboutUs
  {
    '1ko4coia': {
      'en': 'The only trading app you’ll ever need',
      'af': 'Die enigste handelstoepassing wat u ooit sal benodig',
      'es': 'La única aplicación comercial que necesitará',
      'fr': 'La seule application de trading dont vous aurez besoin',
    },
    'wa7gjt6e': {
      'en':
          'We are not a traditional financial institution but a dedicated crypto vendor committed to simplifying the trading experience for everyone. Our primary goal is to empower individuals by providing them with user-friendly tools and resources to navigate the world of cryptocurrency trading effortlessly',
      'af':
          'Ons is nie \'n tradisionele finansiële instelling nie, maar \'n toegewyde kripto-verkoper wat daartoe verbind is om die handelservaring vir almal te vereenvoudig. Ons primêre doel is om individue te bemagtig deur aan hulle gebruikersvriendelike gereedskap en hulpbronne te voorsien om moeiteloos deur die wêreld van kriptokurtehandel te navigeer',
      'es':
          'No somos una institución financiera tradicional, sino un proveedor de criptomonedas dedicado y comprometido a simplificar la experiencia comercial para todos. Nuestro objetivo principal es empoderar a las personas brindándoles herramientas y recursos fáciles de usar para navegar por el mundo del comercio de criptomonedas sin esfuerzo.',
      'fr':
          'Nous ne sommes pas une institution financière traditionnelle, mais un fournisseur de crypto dédié engagé à simplifier l\'expérience de trading pour tous. Notre objectif principal est d\'autonomiser les individus en leur fournissant des outils et des ressources conviviaux pour naviguer sans effort dans le monde du trading de crypto-monnaie.',
    },
    '1fuvd7aw': {
      'en': 'Revolutionizing Crypto Trading for Everyone',
      'af': 'Revolusionerende Crypto Trading vir almal',
      'es': 'Revolucionando el comercio de criptomonedas para todos',
      'fr': 'Révolutionner le trading crypto pour tout le monde',
    },
    'z728rri5': {
      'en':
          'At Teckaa Pay, we are on a mission to redefine the way people trade cryptocurrencies. As a dedicated crypto vendor, we differentiate ourselves from traditional financial institutions by focusing solely on making trading easier and more accessible to individuals like you.',
      'af':
          'By Teckaa Pay is ons op \'n missie om die manier waarop mense kripto-geldeenhede verhandel, te herdefinieer. As \'n toegewyde kripto-verkoper, onderskei ons onsself van tradisionele finansiële instellings deur uitsluitlik daarop te fokus om handel makliker en meer toeganklik te maak vir individue soos jy.',
      'es':
          'En Teckaa Pay, tenemos la misión de redefinir la forma en que las personas comercian con criptomonedas. Como proveedor de criptomonedas dedicado, nos diferenciamos de las instituciones financieras tradicionales al centrarnos únicamente en hacer que el comercio sea más fácil y accesible para personas como usted.',
      'fr':
          'Chez Teckaa Pay, nous avons pour mission de redéfinir la façon dont les gens négocient les crypto-monnaies. En tant que fournisseur de cryptographie dédié, nous nous différencions des institutions financières traditionnelles en nous concentrant uniquement sur la simplification et l\'accessibilité des échanges pour des personnes comme vous.',
    },
    'x8r4531s': {
      'en': 'Why Choose Us?',
      'af': 'Waarom ons kies?',
      'es': '¿Por qué elegirnos?',
      'fr': 'Pourquoi nous choisir?',
    },
    'sdplabmq': {
      'en': 'Simplified Trading Experience',
      'af': 'Vereenvoudigde handelservaring',
      'es': 'Experiencia comercial simplificada',
      'fr': 'Expérience de trading simplifiée',
    },
    '0yosogjy': {
      'en':
          'Your security is our top priority. We have implemented advanced security measures to ensure that your funds and personal information are protected at all times. Our platform utilizes robust encryption techniques and two-factor authentication to safeguard against unauthorized access and fraud.',
      'af':
          'Jou sekuriteit is ons topprioriteit. Ons het gevorderde sekuriteitsmaatreëls geïmplementeer om te verseker dat jou fondse en persoonlike inligting te alle tye beskerm word. Ons platform gebruik robuuste enkripsietegnieke en twee-faktor-verifikasie om teen ongemagtigde toegang en bedrog te beskerm.',
      'es':
          'Su seguridad es nuestra principal prioridad. Hemos implementado medidas de seguridad avanzadas para garantizar que sus fondos e información personal estén protegidos en todo momento. Nuestra plataforma utiliza sólidas técnicas de cifrado y autenticación de dos factores para protegerse contra el acceso no autorizado y el fraude.',
      'fr':
          'Votre sécurité est notre priorité absolue. Nous avons mis en place des mesures de sécurité avancées pour nous assurer que vos fonds et vos informations personnelles sont protégés à tout moment. Notre plate-forme utilise des techniques de cryptage robustes et une authentification à deux facteurs pour se protéger contre les accès non autorisés et la fraude.',
    },
    'zftbx5wy': {
      'en': 'Diverse Cryptocurrency Selection',
      'af': 'Diverse kripto-geldeenhede seleksie',
      'es': 'Selección diversa de criptomonedas',
      'fr': 'Sélection diversifiée de crypto-monnaie',
    },
    'r7pj9j0h': {
      'en': 'Cutting-Edge Security Measures',
      'af': 'Voorpunt-sekuriteitsmaatreëls',
      'es': 'Medidas de seguridad de vanguardia',
      'fr': 'Mesures de sécurité de pointe',
    },
    '2o2iomh6': {
      'en': 'Dedicated Customer Support',
      'af': 'Toegewyde kliëntediens',
      'es': 'Atención al cliente dedicada',
      'fr': 'Support client dédié',
    },
    'f6mhpzsh': {
      'en':
          'We value your satisfaction and are here to assist you whenever you need us. Our friendly and knowledgeable customer support team is available round the clock to address your inquiries, resolve any issues, and provide guidance. Your success is our success, and we are committed to going the extra mile to support you on your crypto trading journey.',
      'af':
          'Ons waardeer jou tevredenheid en is hier om jou by te staan ​​wanneer jy ons ook al nodig het. Ons vriendelike en kundige kliëntediensspan is 24 uur per dag beskikbaar om u navrae aan te spreek, enige probleme op te los en leiding te gee. Jou sukses is ons sukses, en ons is daartoe verbind om die ekstra myl te loop om jou te ondersteun op jou kripto-handelsreis.',
      'es':
          'Valoramos su satisfacción y estamos aquí para ayudarlo cuando nos necesite. Nuestro amable y experto equipo de atención al cliente está disponible las 24 horas para atender sus consultas, resolver cualquier problema y brindar orientación. Su éxito es nuestro éxito, y estamos comprometidos a hacer un esfuerzo adicional para ayudarlo en su viaje de comercio de criptomonedas.',
      'fr':
          'Nous apprécions votre satisfaction et sommes là pour vous aider chaque fois que vous avez besoin de nous. Notre équipe d\'assistance à la clientèle amicale et compétente est disponible 24 heures sur 24 pour répondre à vos demandes, résoudre tout problème et vous fournir des conseils. Votre succès est notre succès, et nous nous engageons à faire un effort supplémentaire pour vous accompagner dans votre parcours de trading crypto.',
    },
    'pk2u3iu8': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Faqs
  {
    'pu0e66r8': {
      'en': 'Faq',
      'af': 'Gereelde vrae',
      'es': 'Preguntas más frecuentes',
      'fr': 'FAQ',
    },
    'getjyidw': {
      'en':
          'We created the FAQ (Frequently Asked Questions) section to address any concerns you may have.',
      'af':
          'Ons het die FAQ (Gereelde Vrae)-afdeling geskep om enige bekommernisse wat u mag hê, aan te spreek.',
      'es':
          'Creamos la sección de Preguntas Frecuentes (FAQ, por sus siglas en inglés) para abordar cualquier inquietud que pueda tener.',
      'fr':
          'Nous avons créé la section FAQ (Foire Aux Questions) pour répondre à toutes vos préoccupations.',
    },
    'cdfbt1au': {
      'en': 'Frequently Asked Questions',
      'af': 'Gereelde Vrae',
      'es': 'Preguntas frecuentes',
      'fr': 'Questions fréquemment posées',
    },
    'xbp2b6ak': {
      'en': 'Why Should I use Teckaa pay',
      'af': 'Hoekom moet ek Teckaa pay gebruik',
      'es': '¿Por qué debo usar el pago de Teckaa?',
      'fr': 'Pourquoi devrais-je utiliser Teckaa pay',
    },
    '00topuar': {
      'en':
          'Cryptocurrency transactions traded with us can be near-instantaneous. This eliminates the need for waiting periods associated with traditional payment methods. Faster transactions contribute to a smoother and more efficient payment experience for both you and your customers.',
      'af':
          'Cryptocurrency-transaksies wat met ons verhandel word, kan byna oombliklik wees. Dit elimineer die behoefte aan wagperiodes wat met tradisionele betaalmetodes geassosieer word. Vinniger transaksies dra by tot \'n gladder en doeltreffender betaalervaring vir beide jou en jou kliënte.',
      'es':
          'Las transacciones de criptomonedas negociadas con nosotros pueden ser casi instantáneas. Esto elimina la necesidad de períodos de espera asociados con los métodos de pago tradicionales. Las transacciones más rápidas contribuyen a una experiencia de pago más fluida y eficiente tanto para usted como para sus clientes.',
      'fr':
          'Les transactions de crypto-monnaie échangées avec nous peuvent être quasi instantanées. Cela élimine le besoin de périodes d\'attente associées aux méthodes de paiement traditionnelles. Des transactions plus rapides contribuent à une expérience de paiement plus fluide et plus efficace pour vous et vos clients.',
    },
    '6pzo8ode': {
      'en': 'How long does it take to get paid?',
      'af': 'Hoe lank neem dit om betaal te word?',
      'es': '¿Cuánto tiempo se tarda en cobrar?',
      'fr': 'Combien de temps faut-il pour être payé ?',
    },
    'tkwragku': {
      'en':
          'After we receive the Crypto assets, we process your payment instantly but sometimes the time it takes to get paid can vary depending on several factors, including the bank you\'re using and any additional processing or verification steps involved. Here are some common scenarios:\n\n1. Cryptocurrency Payments: Cryptocurrency payments are typically processed quickly. The exact speed can vary depending on the blockchain network and the specific cryptocurrency you\'re dealing with. In general, cryptocurrency transactions can be near-instantaneous or take a few minutes to be confirmed on the blockchain.\n\n2. Bank Transfers: Bank transfers can take varying amounts of time depending on factors such as the countries involved, banking systems, and intermediary processes. Domestic bank transfers within the same country often clear within a few business days. However, international bank transfers can take longer, ranging from a few business days to even a week or more, depending on the countries and banks involved.\n\n3. Payment Processors: If you\'re using a payment processor or third-party service to handle your payments, the processing time may depend on their internal procedures. Some payment processors offer faster payouts, usually within a few business days, while others may have longer processing times, particularly for large transactions or specific currencies.\n\n4. Withdrawal Policies: Certain platforms or services may have specific withdrawal policies in place. They might require manual approval or verification processes before releasing funds. These additional steps can add some additional time to the payment process.\n\nIt\'s important to review our terms and conditions, We provide you with an estimate or timeline for payments. If you\'re unsure, it\'s recommended to reach out to our customer support for more precise information regarding payment processing times.\n\nRemember, external factors such as holidays, weekends, and unforeseen circumstances can also affect payment processing times.',
      'af':
          'Nadat ons die Crypto-bates ontvang het, verwerk ons ​​jou betaling onmiddellik, maar soms kan die tyd wat dit neem om betaal te word, wissel na gelang van verskeie faktore, insluitend die bank wat jy gebruik en enige bykomende verwerkings- of verifikasiestappe wat betrokke is. Hier is \'n paar algemene scenario\'s:\n\n1. Cryptocurrency-betalings: Cryptocurrency-betalings word tipies vinnig verwerk. Die presiese spoed kan wissel na gelang van die blokkettingnetwerk en die spesifieke cryptocurrency waarmee jy te doen het. Oor die algemeen kan kripto-geldeenheidtransaksies byna onmiddellik wees of \'n paar minute neem om op die blokketting bevestig te word.\n\n2. Bankoorplasings: Bankoorplasings kan wisselende hoeveelhede tyd neem, afhangende van faktore soos die betrokke lande, bankstelsels en tussengangerprosesse. Binnelandse bankoorplasings binne dieselfde land word dikwels binne \'n paar werksdae skoongemaak. Internasionale bankoorplasings kan egter langer neem, wat wissel van \'n paar werksdae tot selfs \'n week of meer, afhangende van die betrokke lande en banke.\n\n3. Betalingsverwerkers: As jy \'n betalingsverwerker of derdepartydiens gebruik om jou betalings te hanteer, kan die verwerkingstyd van hul interne prosedures afhang. Sommige betalingsverwerkers bied vinniger uitbetalings, gewoonlik binne \'n paar werksdae, terwyl ander langer verwerkingstye kan hê, veral vir groot transaksies of spesifieke geldeenhede.\n\n4. Onttrekkingsbeleide: Sekere platforms of dienste kan spesifieke onttrekkingsbeleide in plek hê. Hulle benodig dalk handmatige goedkeuring of verifikasieprosesse voordat fondse vrygestel word. Hierdie bykomende stappe kan \'n bietjie bykomende tyd by die betaalproses voeg.\n\nDit is belangrik om ons bepalings en voorwaardes te hersien. Ons gee jou \'n skatting of tydlyn vir betalings. As jy onseker is, word dit aanbeveel om ons kliëntediens te kontak vir meer presiese inligting oor betalingsverwerkingstye.\n\nOnthou, eksterne faktore soos vakansiedae, naweke en onvoorsiene omstandighede kan ook betalingsverwerkingstye beïnvloed.',
      'es':
          'Después de que recibimos los activos criptográficos, procesamos su pago al instante, pero a veces el tiempo que lleva recibir el pago puede variar según varios factores, incluido el banco que está utilizando y cualquier proceso adicional o pasos de verificación involucrados. Estos son algunos escenarios comunes:\n\n1. Pagos de criptomonedas: los pagos de criptomonedas generalmente se procesan rápidamente. La velocidad exacta puede variar según la red de la cadena de bloques y la criptomoneda específica con la que estés tratando. En general, las transacciones de criptomonedas pueden ser casi instantáneas o tardar unos minutos en confirmarse en la cadena de bloques.\n\n2. Transferencias bancarias: las transferencias bancarias pueden demorar cantidades variables según factores como los países involucrados, los sistemas bancarios y los procesos intermediarios. Las transferencias bancarias nacionales dentro del mismo país a menudo se liquidan en unos pocos días hábiles. Sin embargo, las transferencias bancarias internacionales pueden demorar más, desde unos pocos días hábiles hasta incluso una semana o más, según los países y bancos involucrados.\n\n3. Procesadores de pagos: si está utilizando un procesador de pagos o un servicio de terceros para manejar sus pagos, el tiempo de procesamiento puede depender de sus procedimientos internos. Algunos procesadores de pago ofrecen pagos más rápidos, generalmente en unos pocos días hábiles, mientras que otros pueden tener tiempos de procesamiento más prolongados, en particular para transacciones grandes o monedas específicas.\n\n4. Políticas de retiro: Ciertas plataformas o servicios pueden tener políticas de retiro específicas. Es posible que requieran procesos manuales de aprobación o verificación antes de liberar fondos. Estos pasos adicionales pueden agregar algo de tiempo adicional al proceso de pago.\n\nEs importante que revise nuestros términos y condiciones. Le proporcionamos una estimación o un cronograma para los pagos. Si no está seguro, se recomienda comunicarse con nuestro servicio de atención al cliente para obtener información más precisa sobre los tiempos de procesamiento de pagos.\n\nRecuerde, factores externos como días festivos, fines de semana y circunstancias imprevistas también pueden afectar los tiempos de procesamiento de pagos.',
      'fr':
          'Une fois que nous avons reçu les actifs Crypto, nous traitons votre paiement instantanément, mais parfois le temps nécessaire pour être payé peut varier en fonction de plusieurs facteurs, y compris la banque que vous utilisez et toute étape de traitement ou de vérification supplémentaire impliquée. Voici quelques scénarios courants :\n\n1. Paiements en crypto-monnaie : Les paiements en crypto-monnaie sont généralement traités rapidement. La vitesse exacte peut varier en fonction du réseau blockchain et de la crypto-monnaie spécifique avec laquelle vous traitez. En général, les transactions de crypto-monnaie peuvent être quasi instantanées ou prendre quelques minutes pour être confirmées sur la blockchain.\n\n2. Virements bancaires : Les virements bancaires peuvent prendre des délais variables en fonction de facteurs tels que les pays concernés, les systèmes bancaires et les processus intermédiaires. Les virements bancaires nationaux dans le même pays sont souvent compensés en quelques jours ouvrables. Cependant, les virements bancaires internationaux peuvent prendre plus de temps, allant de quelques jours ouvrables à une semaine ou plus, selon les pays et les banques concernées.\n\n3. Processeurs de paiement : si vous utilisez un processeur de paiement ou un service tiers pour gérer vos paiements, le temps de traitement peut dépendre de leurs procédures internes. Certains processeurs de paiement offrent des paiements plus rapides, généralement en quelques jours ouvrables, tandis que d\'autres peuvent avoir des délais de traitement plus longs, en particulier pour les transactions importantes ou des devises spécifiques.\n\n4. Politiques de retrait : certaines plateformes ou certains services peuvent avoir mis en place des politiques de retrait spécifiques. Ils peuvent nécessiter des processus d\'approbation ou de vérification manuels avant de débloquer des fonds. Ces étapes supplémentaires peuvent ajouter du temps supplémentaire au processus de paiement.\n\nIl est important de revoir nos termes et conditions, nous vous fournissons une estimation ou un calendrier de paiement. En cas de doute, il est recommandé de contacter notre service clientèle pour obtenir des informations plus précises sur les délais de traitement des paiements.\n\nN\'oubliez pas que des facteurs externes tels que les jours fériés, les week-ends et les circonstances imprévues peuvent également affecter les délais de traitement des paiements.',
    },
    'y6pv3w4v': {
      'en': 'What happens if I create an order but fail to submit the receipt?',
      'af':
          'Wat gebeur as ek \'n bestelling skep, maar versuim om die kwitansie in te dien?',
      'es': '¿Qué sucede si creo un pedido pero no envío el recibo?',
      'fr':
          'Que se passe-t-il si je crée une commande mais que je n\'envoie pas le reçu ?',
    },
    '55q7mmaa': {
      'en':
          'The consequences of failing to submit the receipt for an order can vary, Here are some common scenarios:\n\n1. Order Cancellation: In many cases, if you fail to submit the receipt within the specified timeframe, the system may automatically cancel your order. This could result in the loss of the opportunity to complete the transaction and receive the desired product or service.\n\n2. Payment Reversal: If you have already made a payment but fail to provide the receipt, the system may reverse the transaction and refund your money. This is often done to protect both parties involved in the transaction and ensure transparency and accountability.\n\nIt is crucial to carefully read and understand the terms and conditions, as well as any specific instructions or requirements, before creating an order. If you encounter any issues or difficulties in submitting the receipt, it is recommended to promptly communicate with our customer support to explain the situation and seek assistance. Clear communication and adherence to guidelines can help avoid potential problems and maintain a positive user experience.',
      'af':
          'Die gevolge van die versuim om die kwitansie vir \'n bestelling in te dien kan verskil. Hier is \'n paar algemene scenario\'s:\n\n1. Kansellasie van bestelling: In baie gevalle, as jy versuim om die kwitansie binne die gespesifiseerde tydraamwerk in te dien, kan die stelsel jou bestelling outomaties kanselleer. Dit kan lei tot die verlies van die geleentheid om die transaksie te voltooi en die verlangde produk of diens te ontvang.\n\n2. Terugskrywing van betaling: As jy reeds \'n betaling gemaak het, maar versuim om die kwitansie te verskaf, kan die stelsel die transaksie omkeer en jou geld terugbetaal. Dit word dikwels gedoen om beide partye wat by die transaksie betrokke is te beskerm en deursigtigheid en aanspreeklikheid te verseker.\n\nDit is van kardinale belang om die bepalings en voorwaardes, sowel as enige spesifieke instruksies of vereistes, noukeurig te lees en te verstaan ​​voordat \'n bestelling geskep word. As jy enige probleme of probleme ondervind met die indiening van die kwitansie, word dit aanbeveel om dadelik met ons kliëntediens te kommunikeer om die situasie te verduidelik en hulp te soek. Duidelike kommunikasie en nakoming van riglyne kan help om potensiële probleme te vermy en \'n positiewe gebruikerservaring te handhaaf.',
      'es':
          'Las consecuencias de no enviar el recibo de un pedido pueden variar. Estos son algunos escenarios comunes:\n\n1. Cancelación del pedido: en muchos casos, si no envía el recibo dentro del plazo especificado, el sistema puede cancelar automáticamente su pedido. Esto podría resultar en la pérdida de la oportunidad de completar la transacción y recibir el producto o servicio deseado.\n\n2. Reversión de pago: si ya realizó un pago pero no proporciona el recibo, el sistema puede revertir la transacción y reembolsarle el dinero. Esto se hace a menudo para proteger a ambas partes involucradas en la transacción y garantizar la transparencia y la responsabilidad.\n\nEs crucial leer detenidamente y comprender los términos y condiciones, así como cualquier instrucción o requisito específico, antes de crear un pedido. Si encuentra algún problema o dificultad para enviar el recibo, se recomienda comunicarse de inmediato con nuestro servicio de atención al cliente para explicar la situación y buscar ayuda. La comunicación clara y el cumplimiento de las pautas pueden ayudar a evitar posibles problemas y mantener una experiencia de usuario positiva.',
      'fr':
          'Les conséquences de ne pas soumettre le reçu d\'une commande peuvent varier. Voici quelques scénarios courants :\n\n1. Annulation de commande : Dans de nombreux cas, si vous ne soumettez pas le reçu dans le délai spécifié, le système peut automatiquement annuler votre commande. Cela pourrait entraîner la perte de la possibilité de conclure la transaction et de recevoir le produit ou le service souhaité.\n\n2. Annulation de paiement : Si vous avez déjà effectué un paiement mais que vous ne fournissez pas le reçu, le système peut annuler la transaction et vous rembourser votre argent. Cela est souvent fait pour protéger les deux parties impliquées dans la transaction et assurer la transparence et la responsabilité.\n\nIl est essentiel de lire attentivement et de comprendre les termes et conditions, ainsi que toutes les instructions ou exigences spécifiques, avant de créer une commande. Si vous rencontrez des problèmes ou des difficultés lors de la soumission du reçu, il est recommandé de communiquer rapidement avec notre service client pour expliquer la situation et demander de l\'aide. Une communication claire et le respect des directives peuvent aider à éviter les problèmes potentiels et à maintenir une expérience utilisateur positive.',
    },
    'tb9ugtbi': {
      'en': 'What would happen if I wasn\'t paid on time?',
      'af': 'Wat sou gebeur as ek nie betyds betaal word nie?',
      'es': '¿Qué pasaría si no me pagaran a tiempo?',
      'fr': 'Que se passerait-il si je n\'étais pas payé à temps ?',
    },
    '2gf7enqu': {
      'en':
          'If you have sent cryptocurrency and you haven\'t received payment on time, it\'s important to follow these steps:\n\n1. Check Transaction Confirmation: Verify that the transaction has been successfully confirmed on the blockchain. Use a blockchain explorer or the wallet you used to send the cryptocurrency to confirm the transaction\'s status. Ensure that the transaction has enough confirmations to be considered final.\n\n2. Contact Us: Reach out to our customer support or contact their designated support channels to inquire about the delay in payment. Provide them with relevant transaction details, such as the transaction ID, date, and amount. Seek clarification on the situation and ask for an update on the payment status.\n\n3. Review our Policies: Familiarize yourself with our terms and conditions regarding payment processing times and dispute resolution. Determine if there are any specific provisions or procedures for addressing delayed payments.\n\nUnderstanding our specific procedures and seeking assistance directly from our customer support will provide you with the most accurate information and guidance regarding your situation.',
      'af':
          'As jy cryptocurrency gestuur het en jy het nie betaling betyds ontvang nie, is dit belangrik om hierdie stappe te volg:\n\n1. Gaan transaksiebevestiging na: Verifieer dat die transaksie suksesvol op die blokketting bevestig is. Gebruik \'n blokkettingverkenner of die beursie wat jy gebruik het om die kripto-geldeenheid te stuur om die transaksie se status te bevestig. Maak seker dat die transaksie genoeg bevestigings het om as finaal beskou te word.\n\n2. Kontak ons: Reik uit na ons kliëntediens of kontak hul aangewese ondersteuningskanale om navraag te doen oor die vertraging in betaling. Voorsien hulle van relevante transaksiebesonderhede, soos die transaksie-ID, datum en bedrag. Soek opheldering oor die situasie en vra vir \'n opdatering oor die betalingstatus.\n\n3. Hersien ons Beleide: Vergewis uself van ons bepalings en voorwaardes rakende betalingsverwerkingstye en dispuutoplossing. Bepaal of daar enige spesifieke bepalings of prosedures is om vertraagde betalings aan te spreek.\n\nOm ons spesifieke prosedures te verstaan ​​en om hulp direk van ons kliëntediens te soek, sal jou die mees akkurate inligting en leiding oor jou situasie verskaf.',
      'es':
          'Si has enviado criptomonedas y no has recibido el pago a tiempo, es importante seguir estos pasos:\n\n1. Verifique la confirmación de la transacción: verifique que la transacción se haya confirmado con éxito en la cadena de bloques. Use un explorador de blockchain o la billetera que usó para enviar la criptomoneda para confirmar el estado de la transacción. Asegúrese de que la transacción tenga suficientes confirmaciones para ser considerada final.\n\n2. Comuníquese con nosotros: comuníquese con nuestro servicio de atención al cliente o comuníquese con sus canales de soporte designados para consultar sobre el retraso en el pago. Bríndeles los detalles relevantes de la transacción, como el ID de la transacción, la fecha y el monto. Busque aclaraciones sobre la situación y solicite una actualización sobre el estado del pago.\n\n3. Revise nuestras Políticas: familiarícese con nuestros términos y condiciones con respecto a los tiempos de procesamiento de pagos y la resolución de disputas. Determine si existen disposiciones o procedimientos específicos para abordar los pagos atrasados.\n\nComprender nuestros procedimientos específicos y buscar ayuda directamente de nuestro servicio de atención al cliente le brindará la información y orientación más precisas con respecto a su situación.',
      'fr':
          'Si vous avez envoyé de la crypto-monnaie et que vous n\'avez pas reçu le paiement à temps, il est important de suivre ces étapes :\n\n1. Vérifiez la confirmation de la transaction : vérifiez que la transaction a été confirmée avec succès sur la blockchain. Utilisez un explorateur de blockchain ou le portefeuille que vous avez utilisé pour envoyer la crypto-monnaie pour confirmer le statut de la transaction. Assurez-vous que la transaction a suffisamment de confirmations pour être considérée comme définitive.\n\n2. Contactez-nous : contactez notre service clientèle ou contactez leurs canaux de support désignés pour vous renseigner sur le retard de paiement. Fournissez-leur les détails pertinents de la transaction, tels que l\'ID de la transaction, la date et le montant. Demandez des éclaircissements sur la situation et demandez une mise à jour sur l\'état du paiement.\n\n3. Consultez nos politiques : Familiarisez-vous avec nos termes et conditions concernant les délais de traitement des paiements et la résolution des litiges. Déterminez s\'il existe des dispositions ou des procédures spécifiques pour traiter les retards de paiement.\n\nComprendre nos procédures spécifiques et demander de l\'aide directement auprès de notre service clientèle vous fournira les informations et les conseils les plus précis concernant votre situation.',
    },
    'ln83pm6k': {
      'en': 'What should I do if I forget my account password?',
      'af': 'Wat moet ek doen as ek my rekeningwagwoord vergeet?',
      'es': '¿Qué debo hacer si olvido la contraseña de mi cuenta?',
      'fr': 'Que dois-je faire si j\'oublie le mot de passe de mon compte ?',
    },
    '43aany76': {
      'en':
          'If you forget your account password, don\'t worry. Here are the steps you can take to regain access to your account:\n\n1. Password Reset: We have a \"Forgot Password\" or \"Reset Password\" option on the login page. Click on this link, and it will typically prompt you to enter the email address associated with your account.\n\n2. Email Notification: After entering your email address, we will send you an email with instructions on how to reset your password. Check your inbox (including the spam or junk folder) for this email. It may contain a link or a temporary password that you can use to regain access to your account.\n\n3. Password Update: Follow the instructions provided in the email to reset your password. Usually, you will be directed to a password reset page where you can enter a new password of your choice. Choose a strong, unique password that you haven\'t used before and ensure it meets any specific requirements set by the platform (e.g., minimum length, special characters).\n\n4. Two-Factor Authentication (2FA): If you had enabled 2FA on your account, you may need to follow additional steps to regain access. This could involve providing backup codes, answering security questions, or verifying your identity through a secondary authentication method.\n\n5. Contact Customer Support: If you encounter any difficulties during the password reset process or if you don\'t receive the password reset email, it\'s advisable to reach out to our customer support team or service. We will be able to guide you through the account recovery process and assist you in regaining access to your account.\n\nRemember to choose a strong, unique password and consider using a reputable password manager to securely store and manage your passwords. This can help prevent future password-related issues and enhance the security of your accounts.',
      'af':
          'As jy jou rekeningwagwoord vergeet, moenie bekommerd wees nie. Hier is die stappe wat jy kan neem om weer toegang tot jou rekening te kry:\n\n1. Wagwoordherstel: Ons het \'n \"Wagwoord vergeet\" of \"Herstel wagwoord\" opsie op die aanmeldbladsy. Klik op hierdie skakel, en dit sal jou tipies vra om die e-posadres wat met jou rekening geassosieer word, in te voer.\n\n2. E-poskennisgewing: Nadat ons jou e-posadres ingevoer het, sal ons vir jou \'n e-pos stuur met instruksies oor hoe om jou wagwoord terug te stel. Gaan jou inkassie (insluitend die strooipos- of gemors-lêergids) na vir hierdie e-pos. Dit kan \'n skakel of \'n tydelike wagwoord bevat wat jy kan gebruik om weer toegang tot jou rekening te kry.\n\n3. Wagwoordopdatering: Volg die instruksies wat in die e-pos verskaf word om jou wagwoord terug te stel. Gewoonlik sal jy na \'n wagwoordterugstelbladsy gelei word waar jy \'n nuwe wagwoord van jou keuse kan invoer. Kies \'n sterk, unieke wagwoord wat jy nog nie voorheen gebruik het nie en maak seker dit voldoen aan enige spesifieke vereistes wat deur die platform gestel word (bv. minimum lengte, spesiale karakters).\n\n4. Twee-faktor-verifikasie (2FA): As jy 2FA op jou rekening geaktiveer het, sal jy dalk addisionele stappe moet volg om toegang te kry. Dit kan die verskaffing van rugsteunkodes behels, die beantwoording van sekuriteitsvrae of die verifikasie van jou identiteit deur \'n sekondêre stawingsmetode.\n\n5. Kontak Kliëntediens: As jy enige probleme ondervind tydens die wagwoordterugstelproses of as jy nie die wagwoordterugstel-e-pos ontvang nie, is dit raadsaam om ons kliëntediensspan of diens te kontak. Ons sal jou deur die rekeningherwinningsproses kan lei en jou help om weer toegang tot jou rekening te kry.\n\nOnthou om \'n sterk, unieke wagwoord te kies en oorweeg dit om \'n betroubare wagwoordbestuurder te gebruik om jou wagwoorde veilig te stoor en te bestuur. Dit kan help om toekomstige wagwoordverwante kwessies te voorkom en die sekuriteit van jou rekeninge te verbeter.',
      'es':
          'Si olvida la contraseña de su cuenta, no se preocupe. Estos son los pasos que puede seguir para recuperar el acceso a su cuenta:\n\n1. Restablecimiento de contraseña: tenemos una opción de \"Olvidé mi contraseña\" o \"Restablecer contraseña\" en la página de inicio de sesión. Haga clic en este enlace y, por lo general, le pedirá que ingrese la dirección de correo electrónico asociada con su cuenta.\n\n2. Notificación por correo electrónico: después de ingresar su dirección de correo electrónico, le enviaremos un correo electrónico con instrucciones sobre cómo restablecer su contraseña. Verifique su bandeja de entrada (incluida la carpeta de spam o basura) para este correo electrónico. Puede contener un enlace o una contraseña temporal que puede usar para recuperar el acceso a su cuenta.\n\n3. Actualización de contraseña: siga las instrucciones provistas en el correo electrónico para restablecer su contraseña. Por lo general, se le dirigirá a una página de restablecimiento de contraseña donde puede ingresar una nueva contraseña de su elección. Elija una contraseña segura y única que no haya usado antes y asegúrese de que cumpla con los requisitos específicos establecidos por la plataforma (por ejemplo, longitud mínima, caracteres especiales).\n\n4. Autenticación de dos factores (2FA): si había habilitado 2FA en su cuenta, es posible que deba seguir pasos adicionales para recuperar el acceso. Esto podría implicar proporcionar códigos de respaldo, responder preguntas de seguridad o verificar su identidad a través de un método de autenticación secundario.\n\n5. Comuníquese con Atención al cliente: si encuentra alguna dificultad durante el proceso de restablecimiento de contraseña o si no recibe el correo electrónico de restablecimiento de contraseña, es recomendable comunicarse con nuestro equipo o servicio de atención al cliente. Podremos guiarlo a través del proceso de recuperación de la cuenta y ayudarlo a recuperar el acceso a su cuenta.\n\nRecuerde elegir una contraseña fuerte y única y considere usar un administrador de contraseñas confiable para almacenar y administrar sus contraseñas de manera segura. Esto puede ayudar a prevenir futuros problemas relacionados con contraseñas y mejorar la seguridad de sus cuentas.',
      'fr':
          'Si vous oubliez le mot de passe de votre compte, ne vous inquiétez pas. Voici les étapes à suivre pour récupérer l\'accès à votre compte :\n\n1. Réinitialisation du mot de passe : nous avons une option \"Mot de passe oublié\" ou \"Réinitialiser le mot de passe\" sur la page de connexion. Cliquez sur ce lien, et il vous demandera généralement d\'entrer l\'adresse e-mail associée à votre compte.\n\n2. Notification par e-mail : Après avoir saisi votre adresse e-mail, nous vous enverrons un e-mail contenant des instructions pour réinitialiser votre mot de passe. Vérifiez votre boîte de réception (y compris le dossier spam ou courrier indésirable) pour cet e-mail. Il peut contenir un lien ou un mot de passe temporaire que vous pouvez utiliser pour retrouver l\'accès à votre compte.\n\n3. Mise à jour du mot de passe : suivez les instructions fournies dans l\'e-mail pour réinitialiser votre mot de passe. Habituellement, vous serez dirigé vers une page de réinitialisation de mot de passe où vous pourrez entrer un nouveau mot de passe de votre choix. Choisissez un mot de passe fort et unique que vous n\'avez jamais utilisé auparavant et assurez-vous qu\'il répond à toutes les exigences spécifiques définies par la plate-forme (par exemple, longueur minimale, caractères spéciaux).\n\n4. Authentification à deux facteurs (2FA) : Si vous aviez activé 2FA sur votre compte, vous devrez peut-être suivre des étapes supplémentaires pour retrouver l\'accès. Cela peut impliquer de fournir des codes de secours, de répondre à des questions de sécurité ou de vérifier votre identité via une méthode d\'authentification secondaire.\n\n5. Contacter le support client : Si vous rencontrez des difficultés lors du processus de réinitialisation du mot de passe ou si vous ne recevez pas l\'e-mail de réinitialisation du mot de passe, il est conseillé de contacter notre équipe ou service de support client. Nous pourrons vous guider tout au long du processus de récupération de compte et vous aider à retrouver l\'accès à votre compte.\n\nN\'oubliez pas de choisir un mot de passe fort et unique et envisagez d\'utiliser un gestionnaire de mots de passe réputé pour stocker et gérer vos mots de passe en toute sécurité. Cela peut aider à prévenir de futurs problèmes liés aux mots de passe et à améliorer la sécurité de vos comptes.',
    },
    'vs72cton': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Legal
  {
    'va5dkcdu': {
      'en': '[post_cat]',
      'af': '',
      'es': '',
      'fr': '',
    },
    'okrudizr': {
      'en': '[post_cat]',
      'af': '',
      'es': '',
      'fr': '',
    },
    'oepuxt4y': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ListOfUsers
  {
    '7qhutlur': {
      'en': 'Users',
      'af': 'Gebruikers',
      'es': 'Usuarios',
      'fr': 'Utilisateurs',
    },
    'zrzlnzar': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // CreateUser
  {
    'wayi2l6o': {
      'en': 'New User',
      'af': 'Nuwe gebruiker',
      'es': 'Nuevo Usuario',
      'fr': 'Nouvel utilisateur',
    },
    '9upahqrf': {
      'en': 'Firstname is required',
      'af': 'Voornaam word vereis',
      'es': 'Se requiere el primer nombre',
      'fr': 'Le prénom est requis',
    },
    'fqmsbzok': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '839kvg43': {
      'en': 'Lastname is required',
      'af': 'Van word vereis',
      'es': 'Se requiere apellido',
      'fr': 'Le nom de famille est requis',
    },
    'vuhutti0': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '1iucdpgd': {
      'en': 'Email is required',
      'af': 'E-pos word vereis',
      'es': 'correo electronico es requerido',
      'fr': 'L\'e-mail est requis',
    },
    'hdgu1yqa': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'qb7vlkvz': {
      'en': 'Phone Number is required',
      'af': 'Telefoonnommer word vereis',
      'es': 'Se requiere número de teléfono',
      'fr': 'Le numéro de téléphone est requis',
    },
    'e6f937u4': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ca2ecl4q': {
      'en': 'Phone is required',
      'af': 'Foon word vereis',
      'es': 'Se requiere teléfono',
      'fr': 'Le téléphone est requis',
    },
    'kmp3nvvp': {
      'en': 'Minimum of 6 charaters',
      'af': 'Minimum van 6 karakters',
      'es': 'Mínimo de 6 caracteres',
      'fr': 'Minimum de 6 caractères',
    },
    '1pdlk3gh': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'm9tuy5f0': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ListOfPosts-Classic
  {
    'os1pfff9': {
      'en': 'Posts',
      'af': 'Plasings',
      'es': 'Publicaciones',
      'fr': 'Des postes',
    },
    'f99bnwh8': {
      'en': 'Title',
      'af': 'Titel',
      'es': 'Título',
      'fr': 'Titre',
    },
    'bdnriunm': {
      'en': 'Date',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ja09e7h2': {
      'en': 'Date',
      'af': '',
      'es': '',
      'fr': '',
    },
    'mv9omsdx': {
      'en': 'Author',
      'af': 'Skrywer',
      'es': 'Autor',
      'fr': 'Auteur',
    },
    'h088fuwa': {
      'en': 'Author',
      'af': 'Skrywer',
      'es': 'Autor',
      'fr': 'Auteur',
    },
    'f972tvsb': {
      'en': 'Created At',
      'af': 'Geskep by',
      'es': 'Creado en',
      'fr': 'Créé à',
    },
    'musxp02v': {
      'en': 'Action',
      'af': 'Aksie',
      'es': 'Acción',
      'fr': 'Action',
    },
    'kij6b6gx': {
      'en': 'View',
      'af': 'Lees',
      'es': 'Leer',
      'fr': 'Lire',
    },
    'ohh6xnoe': {
      'en': 'Update',
      'af': 'Lees',
      'es': 'Leer',
      'fr': 'Lire',
    },
    'yh43l0ya': {
      'en': 'Delete',
      'af': 'Vee uit',
      'es': 'Borrar',
      'fr': 'Supprimer',
    },
    'l7ayz0ff': {
      'en': 'You have not yet created any content.',
      'af': 'Jy het nog geen inhoud geskep nie.',
      'es': 'Aún no has creado ningún contenido.',
      'fr': 'Vous n\'avez encore créé aucun contenu.',
    },
    'fhqvuta8': {
      'en':
          'Hey there! 👋 Let\'s kick things off and start creating some amazing content! ',
      'af':
          'Haai daar! 👋 Kom ons skop dinge af en begin wonderlike inhoud skep!',
      'es': '¡Hola! 👋 ¡Comencemos y comencemos a crear contenido increíble!',
      'fr':
          'Salut! 👋 Commençons et commençons à créer du contenu incroyable !',
    },
    'wbmbf99b': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Single
  {
    '8vtm87ju': {
      'en': 'Preview mode',
      'af': '',
      'es': '',
      'fr': '',
    },
    'tug0n12w': {
      'en': 'Related articles',
      'af': 'Verwante artikels',
      'es': 'Artículos relacionados',
      'fr': 'Articles Liés',
    },
    '7scluyjk': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ListOfMedia
  {
    'kuixnnj1': {
      'en': 'Media',
      'af': 'Plasings',
      'es': 'Publicaciones',
      'fr': 'Des postes',
    },
    'psdudk0m': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Currency
  {
    '61mknlw6': {
      'en': 'Currency',
      'af': 'Geldeenheid',
      'es': 'Divisa',
      'fr': 'Devise',
    },
    '1ms2j2fd': {
      'en': 'Choose your default language',
      'af': 'Telefoon nommer',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
    },
    'itk7o5nj': {
      'en': 'Choose package',
      'af': 'Soek',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    '3u8s4uh0': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Crypto
  {
    't9l0149h': {
      'en': 'Why exchange crypto assets with us?',
      'af': 'Waarom kripto-bates met ons uitruil?',
      'es': '¿Por qué intercambiar criptoactivos con nosotros?',
      'fr': 'Pourquoi échanger des crypto-actifs avec nous ?',
    },
    'bst5akh3': {
      'en': 'Buy',
      'af': 'Koop',
      'es': 'Comprar',
      'fr': 'Acheter',
    },
    'ryurox3m': {
      'en':
          'Buy your cryptocurrencies, including popular options like Bitcoin, Ethereum, Dogecoin, USDT, and more. We strive to offer a comprehensive range of digital assets, ensuring you have ample choices to align with your assets.',
      'af':
          'Koop jou kripto-geldeenhede, insluitend gewilde opsies soos Bitcoin, Ethereum, Dogecoin, USDT, en meer. Ons streef daarna om \'n omvattende reeks digitale bates aan te bied, om te verseker dat u genoeg keuses het om met u bates in lyn te kom.',
      'es':
          'Compre sus criptomonedas, incluidas opciones populares como Bitcoin, Ethereum, Dogecoin, USDT y más. Nos esforzamos por ofrecer una amplia gama de activos digitales, asegurando que tenga amplias opciones para alinearse con sus activos.',
      'fr':
          'Achetez vos crypto-monnaies, y compris des options populaires telles que Bitcoin, Ethereum, Dogecoin, USDT, etc. Nous nous efforçons d\'offrir une gamme complète d\'actifs numériques, en vous assurant d\'avoir suffisamment de choix pour vous aligner sur vos actifs.',
    },
    'hz69qwjv': {
      'en': 'Sell',
      'af': 'Verkoop',
      'es': 'Vender',
      'fr': 'Vendre',
    },
    'mrdozb86': {
      'en':
          'We understand the importance of getting the best value for your crypto assets. Our platform offers competitive rates, ensuring you receive a fair and favorable price when selling your digital currencies. We strive to provide you with optimal returns on your investments.',
      'af':
          'Ons verstaan ​​die belangrikheid daarvan om die beste waarde vir u kripto-bates te kry. Ons platform bied mededingende tariewe, wat verseker dat jy \'n billike en gunstige prys ontvang wanneer jy jou digitale geldeenhede verkoop. Ons streef daarna om u optimale opbrengs op u beleggings te bied.',
      'es':
          'Entendemos la importancia de obtener el mejor valor para sus criptoactivos. Nuestra plataforma ofrece tarifas competitivas, lo que garantiza que reciba un precio justo y favorable al vender sus monedas digitales. Nos esforzamos por brindarle rendimientos óptimos de sus inversiones.',
      'fr':
          'Nous comprenons l\'importance d\'obtenir la meilleure valeur pour vos actifs cryptographiques. Notre plateforme propose des tarifs compétitifs, vous garantissant un prix juste et avantageux lors de la vente de vos devises numériques. Nous nous efforçons de vous offrir un rendement optimal sur vos investissements.',
    },
    '9x8wn7ex': {
      'en': 'Buy and Sell with Ease',
      'af': 'Koop en verkoop met gemak',
      'es': 'Compra y vende con facilidad',
      'fr': 'Achetez et vendez en toute simplicité',
    },
    'v12kjdz9': {
      'en':
          'We offer a simple and secure way to buy and sell in the most popular cryptocurrencies available. Unlock the potential of digital assets and become a part of the rapidly evolving crypto market.',
      'af':
          'Ons bied \'n eenvoudige en veilige manier om te koop en te verkoop in die gewildste kripto-geldeenhede beskikbaar. Ontsluit die potensiaal van digitale bates en word deel van die vinnig ontwikkelende kripto-mark.',
      'es':
          'Ofrecemos una forma simple y segura de comprar y vender en las criptomonedas más populares disponibles. Libere el potencial de los activos digitales y conviértase en parte del mercado criptográfico en rápida evolución.',
      'fr':
          'Nous offrons un moyen simple et sécurisé d\'acheter et de vendre dans les crypto-monnaies les plus populaires disponibles. Libérez le potentiel des actifs numériques et faites partie du marché de la cryptographie en évolution rapide.',
    },
    'hlqix3wh': {
      'en': 'Sell Your Digital Assets with Ease',
      'af': 'Verkoop jou digitale bates met gemak',
      'es': 'Venda sus activos digitales con facilidad',
      'fr': 'Vendez vos actifs numériques en toute simplicité',
    },
    '7yjsgbex': {
      'en':
          'Our user-friendly platform is designed to cater to both seasoned traders and newcomers to the crypto space. With intuitive interfaces and comprehensive trading tools, you can easily navigate the buying process and sell your crypto assets.',
      'af':
          'Ons gebruikersvriendelike platform is ontwerp om voorsiening te maak vir beide ervare handelaars en nuwelinge in die kripto-ruimte. Met intuïtiewe koppelvlakke en omvattende handelsinstrumente kan jy maklik deur die koopproses navigeer en jou kripto-bates verkoop.',
      'es':
          'Nuestra plataforma fácil de usar está diseñada para atender tanto a los comerciantes experimentados como a los recién llegados al espacio criptográfico. Con interfaces intuitivas y herramientas comerciales integrales, puede navegar fácilmente por el proceso de compra y vender sus criptoactivos.',
      'fr':
          'Notre plate-forme conviviale est conçue pour répondre à la fois aux commerçants chevronnés et aux nouveaux arrivants dans l\'espace crypto. Avec des interfaces intuitives et des outils de trading complets, vous pouvez facilement naviguer dans le processus d\'achat et vendre vos actifs cryptographiques.',
    },
    'o1pjjj83': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // GiftCards
  {
    'f7artbx6': {
      'en': 'Why trade Gift Cards with us?',
      'af': 'Waarom geskenkbewyse met ons verhandel?',
      'es': '¿Por qué intercambiar tarjetas de regalo con nosotros?',
      'fr': 'Pourquoi échanger des cartes-cadeaux avec nous ?',
    },
    'mnb11d2d': {
      'en': 'Sell',
      'af': 'Verkoop',
      'es': 'Vender',
      'fr': 'Vendre',
    },
    'oiwfrxkp': {
      'en':
          'We understand the importance of getting the most out of your gift cards. That\'s why we offer competitive rates to ensure you receive top value for your unwanted cards. Sell with confidence, knowing that you\'re getting a fair deal.',
      'af':
          'Ons verstaan ​​hoe belangrik dit is om die meeste uit jou geskenkbewyse te kry. Dit is hoekom ons mededingende tariewe bied om te verseker dat jy topwaarde vir jou ongewenste kaarte ontvang. Verkoop met selfvertroue, met die wete dat jy \'n billike transaksie kry.',
      'es':
          'Entendemos la importancia de aprovechar al máximo sus tarjetas de regalo. Es por eso que ofrecemos tarifas competitivas para garantizar que reciba el mejor valor por sus tarjetas no deseadas. Venda con confianza, sabiendo que está recibiendo un trato justo.',
      'fr':
          'Nous comprenons l\'importance de tirer le meilleur parti de vos cartes-cadeaux. C\'est pourquoi nous offrons des tarifs compétitifs pour vous assurer de recevoir la meilleure valeur pour vos cartes non désirées. Vendez en toute confiance, sachant que vous obtenez une offre équitable.',
    },
    '5qlcbw1q': {
      'en': 'Trade, Sell, Shop',
      'af': 'Handel, verkoop, inkopies doen',
      'es': 'Intercambiar, vender, comprar',
      'fr': 'Commerce, vente, boutique',
    },
    'o57ldmxf': {
      'en':
          'We specialize in making gift card buying and selling a breeze. Say goodbye to unused gift cards and hello to instant cash or exciting new shopping opportunities. Whether you have unwanted gift cards gathering dust or are looking to snag amazing deals, our platform has got you covered.',
      'af':
          'Ons spesialiseer daarin om geskenkbewyse te koop en te verkoop \'n briesie. Sê totsiens vir ongebruikte geskenkbewyse en hallo vir onmiddellike kontant of opwindende nuwe inkopiegeleenthede. Of jy ongewenste geskenkbewyse het wat stof vergaar of op soek is na wonderlike aanbiedings, ons platform het jou gedek.',
      'es':
          'Nos especializamos en hacer que la compra y venta de tarjetas de regalo sea muy sencilla. Diga adiós a las tarjetas de regalo sin usar y dé la bienvenida al dinero en efectivo instantáneo oa nuevas y emocionantes oportunidades de compra. Ya sea que tenga tarjetas de regalo no deseadas acumulando polvo o esté buscando obtener ofertas increíbles, nuestra plataforma lo tiene cubierto.',
      'fr':
          'Nous nous spécialisons dans l\'achat et la vente de cartes-cadeaux en un clin d\'œil. Dites adieu aux cartes-cadeaux inutilisées et bonjour aux espèces instantanées ou aux nouvelles opportunités de magasinage. Que vous ayez des cartes-cadeaux indésirables qui ramassent la poussière ou que vous cherchiez à décrocher des offres incroyables, notre plateforme est là pour vous.',
    },
    '0fhyalq3': {
      'en': 'Cash in on Gift Cards',
      'af': 'Kontant in geskenkbewyse',
      'es': 'Dinero en efectivo en tarjetas de regalo',
      'fr': 'Encaisser des cartes-cadeaux',
    },
    'exof7cz6': {
      'en':
          'Our streamlined process ensures quick and secure transactions, giving you peace of mind while buying or selling gift cards. Say goodbye to lengthy wait times and hello to instant results.',
      'af':
          'Ons vaartbelynde proses verseker vinnige en veilige transaksies, wat jou gemoedsrus gee terwyl jy geskenkbewyse koop of verkoop. Sê totsiens vir lang wagtye en hallo vir onmiddellike resultate.',
      'es':
          'Nuestro proceso simplificado garantiza transacciones rápidas y seguras, lo que le brinda tranquilidad al comprar o vender tarjetas de regalo. Di adiós a los largos tiempos de espera y hola a los resultados instantáneos.',
      'fr':
          'Notre processus simplifié garantit des transactions rapides et sécurisées, vous offrant une tranquillité d\'esprit lors de l\'achat ou de la vente de cartes-cadeaux. Dites adieu aux longs délais d\'attente et bonjour aux résultats instantanés.',
    },
    '6vdoowee': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Contact
  {
    '1a66gu30': {
      'en': 'Contact Us',
      'af': 'Kontak Ons',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
    },
    '3zp6iw98': {
      'en':
          'We pride ourselves on providing exceptional customer service. We value your time and strive to respond to all inquiries promptly. Please fill out the contact form below, and we\'ll get back to you as soon as possible.',
      'af':
          'Ons is trots daarop om uitsonderlike kliëntediens te lewer. Ons waardeer jou tyd en streef daarna om stiptelik op alle navrae te reageer. Vul asseblief die kontakvorm hieronder in, en ons sal so gou moontlik na jou terugkom.',
      'es':
          'Nos enorgullecemos de brindar un servicio al cliente excepcional. Valoramos su tiempo y nos esforzamos por responder a todas las consultas con prontitud. Complete el formulario de contacto a continuación y nos pondremos en contacto con usted lo antes posible.',
      'fr':
          'Nous sommes fiers de fournir un service client exceptionnel. Nous apprécions votre temps et nous nous efforçons de répondre rapidement à toutes les demandes. Veuillez remplir le formulaire de contact ci-dessous, et nous vous répondrons dans les plus brefs délais.',
    },
    '9jvfnzto': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Blog
  {
    'perbpil9': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // AppName
  {
    'mlfbofyv': {
      'en': 'App Name',
      'af': 'Programnaam',
      'es': 'Nombre de la aplicación',
      'fr': 'Nom de l\'application',
    },
    '9xymbkfl': {
      'en': 'What\'s your app/site name?',
      'af': 'Wat is jou program/werfnaam?',
      'es': '¿Cuál es el nombre de su aplicación/sitio?',
      'fr': 'Quel est le nom de votre application/site ?',
    },
    'u2nwcl2u': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ListOfServices
  {
    'm3uwt71i': {
      'en': 'Services',
      'af': 'Dienste',
      'es': 'Servicios',
      'fr': 'Prestations de service',
    },
    '9wdf9v4n': {
      'en': 'Services',
      'af': 'Dienste',
      'es': 'Servicios',
      'fr': 'Prestations de service',
    },
    'tdcqlbfi': {
      'en':
          'Discover our selection of services designed to make your life easier.',
      'af':
          'Ontdek ons ​​keuse van dienste wat ontwerp is om jou lewe makliker te maak.',
      'es':
          'Descubre nuestra selección de servicios pensados ​​para hacerte la vida más fácil.',
      'fr':
          'Découvrez notre sélection de services conçus pour vous faciliter la vie.',
    },
    'mjdeq1hw': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // CreateAirtime
  {
    'ov3v642l': {
      'en': 'Airtime / Top Up',
      'af': '',
      'es': '',
      'fr': '',
    },
    '68z90eap': {
      'en': 'Network Provider',
      'af': 'Netwerk',
      'es': 'Red',
      'fr': 'Réseau',
    },
    'lndxisxz': {
      'en': 'Phone Number',
      'af': 'Telefoon nommer',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
    },
    'qoma264x': {
      'en': 'Recipient',
      'af': 'Ontvanger',
      'es': 'Recipiente',
      'fr': 'Destinataire',
    },
    'a4osk2w3': {
      'en': '08123456789',
      'af': '08123456789',
      'es': '08123456789',
      'fr': '08123456789',
    },
    '0xito67f': {
      'en': 'Choose an Amount',
      'af': '',
      'es': '',
      'fr': '',
    },
    'v99uwn3l': {
      'en': 'NGN',
      'af': '',
      'es': '',
      'fr': '',
    },
    'soxlajpq': {
      'en': 'Insufficient funds',
      'af': '',
      'es': '',
      'fr': '',
    },
    'yooxcoai': {
      'en': 'Phone Number is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'tblwq2wb': {
      'en': 'Phone numbers must be 11 digits long.',
      'af': '',
      'es': '',
      'fr': '',
    },
    'tpellcad': {
      'en': 'Phone numbers must be 11 digits long.',
      'af': '',
      'es': '',
      'fr': '',
    },
    'lmy0ujcu': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'rh5zumsf': {
      'en': 'Field is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'qh7jji7x': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'l3u0qmr4': {
      'en': 'Field is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'x69jvuvo': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ng8rx1cw': {
      'en': 'Field is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ncuy0pi6': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'plr7y4ea': {
      'en': 'Field is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'hmxc6qlx': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'qyw3wqh3': {
      'en': 'Field is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'q8qdhyi7': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'xoce3wjg': {
      'en': 'Amount is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'f9io12w8': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ige9oayf': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // EmailSent-ForgetPassword
  {
    'pqcrhs08': {
      'en': 'Email Sent',
      'af': 'E-pos is gestuur',
      'es': 'Email enviado',
      'fr': 'Email envoyé',
    },
    'x45udtig': {
      'en':
          'We have sent an email to your registered email address. Please log in to your email account and follow the link provided to reset your password',
      'af':
          'Ons het \'n e-pos na jou geregistreerde e-posadres gestuur. Meld asseblief aan by jou e-posrekening en volg die skakel wat verskaf word om jou wagwoord terug te stel',
      'es':
          'Hemos enviado un correo electrónico a su dirección de correo electrónico registrada. Inicie sesión en su cuenta de correo electrónico y siga el enlace provisto para restablecer su contraseña',
      'fr':
          'Nous avons envoyé un e-mail à votre adresse e-mail enregistrée. Veuillez vous connecter à votre compte de messagerie et suivre le lien fourni pour réinitialiser votre mot de passe',
    },
    'nb0kqxi2': {
      'en': 'Back to login? ',
      'af': 'Terug na aanmelding?',
      'es': '¿Atrás para iniciar sesión?',
      'fr': 'Retour connexion?',
    },
    'xnwy9e2k': {
      'en': 'Click here',
      'af': 'Klik hier',
      'es': 'haga clic aquí',
      'fr': 'Cliquez ici',
    },
    'e0c5vhvp': {
      'en': 'Email is required',
      'af': 'E-pos word vereis',
      'es': 'correo electronico es requerido',
      'fr': 'L\'e-mail est requis',
    },
    '0g86nlol': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '4yzo8s36': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // VerifyOTP
  {
    '5o2bkgh8': {
      'en': 'Verify your E-mail Address',
      'af': 'Bevestig jou e-pos adres',
      'es': 'Verifique su dirección de correo electrónico',
      'fr': 'Vérifiez votre adresse e-mail',
    },
    'g0ewgtbm': {
      'en':
          'Please check your email inbox for the One-Time Password (OTP) we sent to the email address you provided',
      'af':
          'Gaan asseblief jou e-pos inkassie na vir die Eenmalige Wagwoord (OTP) wat ons gestuur het na die e-posadres wat jy verskaf het',
      'es':
          'Verifique la bandeja de entrada de su correo electrónico para obtener la contraseña de un solo uso (OTP) que enviamos a la dirección de correo electrónico que proporcionó',
      'fr':
          'Veuillez vérifier votre boîte de réception pour le mot de passe à usage unique (OTP) que nous avons envoyé à l\'adresse e-mail que vous avez fournie',
    },
    'heb4bvqd': {
      'en': 'Resend Code',
      'af': 'Herstuur kode',
      'es': 'Reenviar codigo',
      'fr': 'Renvoyer le code',
    },
    'bos86q4g': {
      'en': 'Pin code is required',
      'af': 'Pinkode word vereis',
      'es': 'Se requiere código pin',
      'fr': 'Le code PIN est requis',
    },
    'l6wf3zum': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // VerifyRegister
  {
    'rem2mytg': {
      'en': 'Email Sent',
      'af': 'E-pos is gestuur',
      'es': 'Email enviado',
      'fr': 'Email envoyé',
    },
    'ex9s4wba': {
      'en':
          'We have sent an email to your registered email address. Please log in to your email account and follow the link provided to reset your password',
      'af':
          'Ons het \'n e-pos na jou geregistreerde e-posadres gestuur. Meld asseblief aan by jou e-posrekening en volg die skakel wat verskaf word om jou wagwoord terug te stel',
      'es':
          'Hemos enviado un correo electrónico a su dirección de correo electrónico registrada. Inicie sesión en su cuenta de correo electrónico y siga el enlace provisto para restablecer su contraseña',
      'fr':
          'Nous avons envoyé un e-mail à votre adresse e-mail enregistrée. Veuillez vous connecter à votre compte de messagerie et suivre le lien fourni pour réinitialiser votre mot de passe',
    },
    'dto1qfc6': {
      'en': 'Back to login? ',
      'af': 'Terug na aanmelding?',
      'es': '¿Atrás para iniciar sesión?',
      'fr': 'Retour connexion?',
    },
    '3qgyxt8i': {
      'en': 'Click here',
      'af': 'Klik hier',
      'es': 'haga clic aquí',
      'fr': 'Cliquez ici',
    },
    'irlp5or3': {
      'en': 'Email is required',
      'af': 'E-pos word vereis',
      'es': 'correo electronico es requerido',
      'fr': 'L\'e-mail est requis',
    },
    'lolgadsp': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '33p4vxw6': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // KYC-BVN
  {
    'm2gc9xot': {
      'en': 'Security',
      'af': 'Profiel',
      'es': 'Perfil',
      'fr': 'Profil',
    },
    'gwq672m5': {
      'en': 'Link your BVN (11-digit)',
      'af': 'Koppel jou BVN (11-syfer)',
      'es': 'Vincula tu BVN (11 dígitos)',
      'fr': 'Liez votre BVN (11 chiffres)',
    },
    'zb2uxeyx': {
      'en': 'Proceed',
      'af': 'Voortgaan',
      'es': 'Proceder',
      'fr': 'Procéder',
    },
    '06fmyfbp': {
      'en': 'BVN is required',
      'af': 'BVN word vereis',
      'es': 'Se requiere BVN',
      'fr': 'BVN est requis',
    },
    'bq43ebkr': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '99dowtls': {
      'en': 'Profile',
      'af': 'Profiel',
      'es': 'Perfil',
      'fr': 'Profil',
    },
  },
  // EditAddress
  {
    'x3nrkkol': {
      'en': 'Address',
      'af': 'Adres',
      'es': 'DIRECCIÓN',
      'fr': 'Adresse',
    },
    'c3b7b7d8': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'ekbkf0au': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'r165mkhp': {
      'en': 'Street is required',
      'af': 'Straat word vereis',
      'es': 'Se requiere calle',
      'fr': 'La rue est obligatoire',
    },
    'm5us89v2': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'o9994z7u': {
      'en': 'Zipcode is required',
      'af': 'Poskode word vereis',
      'es': 'Se requiere código postal',
      'fr': 'Le code postal est requis',
    },
    '4kv565ou': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '0672gyvh': {
      'en': 'City is required',
      'af': 'Stad word vereis',
      'es': 'Ciudad es requerida',
      'fr': 'La ville est obligatoire',
    },
    '50wnxtwn': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'lq5miw77': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ListOfBillOrders
  {
    'rkjomihq': {
      'en': 'Bill Payments',
      'af': 'Rekeningbetalings',
      'es': 'Pagos de facturas',
      'fr': 'Paiements de factures',
    },
    'nbsgtf8l': {
      'en': 'Order Summary',
      'af': '\'n Opsomming van jou bestellingaktiwiteit',
      'es': 'Un resumen de la actividad de su pedido',
      'fr': 'Un résumé de votre activité de commande',
    },
    'u8zj0fna': {
      'en': 'Orders',
      'af': 'Bestellings',
      'es': 'Pedidos',
      'fr': 'Ordres',
    },
  },
  // FundWallet
  {
    'brfwq3o1': {
      'en': 'Fund wallet',
      'af': 'Rekening Inligting',
      'es': 'Información de la cuenta',
      'fr': 'Information sur le compte',
    },
    '4fd0fbqe': {
      'en': 'Profile',
      'af': 'Profiel',
      'es': 'Perfil',
      'fr': 'Profil',
    },
  },
  // AppEmail
  {
    'sx9q2md3': {
      'en': 'Emails',
      'af': 'E-posse',
      'es': 'Correos electrónicos',
      'fr': 'E-mails',
    },
    'iyretv9q': {
      'en': 'Put in your general email here',
      'af': 'Plaas jou algemene e-pos hier',
      'es': 'Pon aquí tu correo electrónico general',
      'fr': 'Entrez votre email général ici',
    },
    'c1zbs2dh': {
      'en': 'Email is required',
      'af': 'E-pos word vereis',
      'es': 'correo electronico es requerido',
      'fr': 'L\'e-mail est requis',
    },
    'be4jqq6h': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'k9dbqemm': {
      'en': 'Email is required',
      'af': 'E-pos word vereis',
      'es': 'correo electronico es requerido',
      'fr': 'L\'e-mail est requis',
    },
    'q1ef27s8': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '9iq5grnh': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '03kj5m8w': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '16chif8l': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // APIIntegration
  {
    'wfccbom2': {
      'en': 'API Integration',
      'af': 'Kommunikasie Api',
      'es': 'API de comunicación',
      'fr': 'API de communication',
    },
    'xgju2frs': {
      'en': 'Email',
      'af': 'E-pos Api',
      'es': 'API de correo electrónico',
      'fr': 'API de messagerie',
    },
    'atxkenp2': {
      'en': 'Email',
      'af': 'E-pos',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'pk6isizn': {
      'en':
          'You can choose from the following most use transactional email APIs.',
      'af':
          'Jy kan kies uit die volgende mees gebruikte transaksionele e-pos API\'s.',
      'es':
          'Puede elegir entre las siguientes API de correo electrónico transaccional más utilizadas.',
      'fr':
          'Vous pouvez choisir parmi les API de messagerie transactionnelle les plus utilisées suivantes.',
    },
    'yiah00eh': {
      'en': 'Provider name',
      'af': 'Naam van die verskaffer',
      'es': 'Nombre del proveedor',
      'fr': 'Nom du fournisseur',
    },
    'lx2zijsj': {
      'en': 'Brevo',
      'af': 'Brevo',
      'es': 'brevo',
      'fr': 'Brevo',
    },
    'hccs7tud': {
      'en': 'Mailgun',
      'af': 'Posgeweer',
      'es': 'Pistola de correo',
      'fr': 'Mailgun',
    },
    'z1a5ed90': {
      'en': 'Mailchimp',
      'af': 'Mailchimp',
      'es': 'mailchimp',
      'fr': 'MailChimp',
    },
    '0iuyyu0y': {
      'en': 'Amazon SES',
      'af': 'Amazon SES',
      'es': 'Amazon SES',
      'fr': 'Amazon SE',
    },
    '4zxpt8xp': {
      'en': 'Mailjet',
      'af': 'Mailjet',
      'es': 'Mailjet',
      'fr': 'Mailjet',
    },
    'cggysjbi': {
      'en': 'Mandrill',
      'af': 'Mandril',
      'es': 'Mandril',
      'fr': 'Mandrill',
    },
    '1f31osqu': {
      'en': 'Elastic Email',
      'af': 'Elastiese e-pos',
      'es': 'Correo electrónico elástico',
      'fr': 'E-mail élastique',
    },
    '5s8rbt2m': {
      'en': 'SMTP.com',
      'af': 'SMTP.com',
      'es': 'SMTP.com',
      'fr': 'SMTP.com',
    },
    'lb6xa8zj': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'es': 'Por favor selecciona...',
      'fr': 'Veuillez sélectionner...',
    },
    'u709ofw8': {
      'en': 'Search for an item...',
      'af': 'Soek vir \'n item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'aowa4z25': {
      'en': 'Sms',
      'af': 'Sms Api',
      'es': 'SMS API',
      'fr': 'API SMS',
    },
    'cxadofhg': {
      'en': 'SMS',
      'af': 'SMS',
      'es': 'SMS',
      'fr': 'SMS',
    },
    'l6v6dpw3': {
      'en':
          'You can choose from the following most use transactional SMS APIs.',
      'af':
          'Jy kan kies uit die volgende mees gebruikte transaksionele SMS API\'s.',
      'es':
          'Puede elegir entre las siguientes API de SMS transaccionales más utilizadas.',
      'fr':
          'Vous pouvez choisir parmi les API SMS transactionnelles les plus utilisées suivantes.',
    },
    'flq93n8v': {
      'en': 'Provider name',
      'af': 'Naam van die verskaffer',
      'es': 'Nombre del proveedor',
      'fr': 'Nom du fournisseur',
    },
    'cprf38mh': {
      'en': 'Brevo',
      'af': 'Brevo',
      'es': 'brevo',
      'fr': 'Brevo',
    },
    'szi7r05o': {
      'en': 'Twilio',
      'af': 'Twilio',
      'es': 'Twilio',
      'fr': 'Twilio',
    },
    'efhlqq7y': {
      'en': 'Nexmo',
      'af': 'Nexmo',
      'es': 'Nexmo',
      'fr': 'Nexmo',
    },
    'wb5elz58': {
      'en': 'Plivo',
      'af': 'Plivo',
      'es': 'Plivo',
      'fr': 'Plivo',
    },
    '0medoq45': {
      'en': 'Msg91',
      'af': 'Msg91',
      'es': 'Msg91',
      'fr': 'Msg91',
    },
    't5vu4jdd': {
      'en': 'Clickatell',
      'af': 'Clickatell',
      'es': 'Clickatell',
      'fr': 'Clickatell',
    },
    '7ekome91': {
      'en': 'TextMagic',
      'af': 'TextMagic',
      'es': 'TextMagic',
      'fr': 'TextMagic',
    },
    'bi71d42p': {
      'en': 'Africa\'s Talking',
      'af': 'Afrika se praat',
      'es': 'Hablando de África',
      'fr': 'L\'Afrique parle',
    },
    'blqczzet': {
      'en': 'Clickatell',
      'af': 'Clickatell',
      'es': 'Clickatell',
      'fr': 'Clickatell',
    },
    'vxqaqr4v': {
      'en': 'Infobip',
      'af': 'Infobip',
      'es': 'infobip',
      'fr': 'Infobip',
    },
    'teiafngf': {
      'en': 'BulkSMS',
      'af': 'GrootmaatSMS',
      'es': 'SMS masivos',
      'fr': 'SMS en masse',
    },
    'l4fer7ha': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'es': 'Por favor selecciona...',
      'fr': 'Veuillez sélectionner...',
    },
    'uuqd1a2e': {
      'en': 'Search for an item...',
      'af': 'Soek vir \'n item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'tu1jmaqx': {
      'en': 'Live chat',
      'af': 'Live Chat Api',
      'es': 'API de chat en vivo',
      'fr': 'API de chat en direct',
    },
    'qrzmqvi9': {
      'en': 'Live chat ',
      'af': 'Live Chat',
      'es': 'Chat en vivo',
      'fr': 'Chat en direct',
    },
    'cw92psra': {
      'en':
          'Live chat enables real-time interaction between users and support agents. Users can quickly ask questions, seek help, or report issues directly within the app. This instant support fosters better customer satisfaction and loyalty, as users feel valued and heard.',
      'af':
          'Regstreekse klets maak intydse interaksie tussen gebruikers en ondersteuningsagente moontlik. Gebruikers kan vinnig vrae vra, hulp soek of kwessies direk binne die toepassing rapporteer. Hierdie kitsondersteuning bevorder beter klanttevredenheid en lojaliteit, aangesien gebruikers gewaardeer en gehoor voel.',
      'es':
          'El chat en vivo permite la interacción en tiempo real entre los usuarios y los agentes de soporte. Los usuarios pueden hacer preguntas rápidamente, buscar ayuda o informar problemas directamente dentro de la aplicación. Este soporte instantáneo fomenta una mayor satisfacción y lealtad del cliente, ya que los usuarios se sienten valorados y escuchados.',
      'fr':
          'Le chat en direct permet une interaction en temps réel entre les utilisateurs et les agents de support. Les utilisateurs peuvent rapidement poser des questions, demander de l\'aide ou signaler des problèmes directement dans l\'application. Ce support instantané favorise une meilleure satisfaction et fidélité des clients, car les utilisateurs se sentent valorisés et entendus.',
    },
    'qnd7kt7u': {
      'en': 'Provider name',
      'af': 'Naam van die verskaffer',
      'es': 'Nombre del proveedor',
      'fr': 'Nom du fournisseur',
    },
    '5pc5e1ke': {
      'en': 'LiveChat',
      'af': 'LiveChat',
      'es': 'Chat en vivo',
      'fr': 'Chat en direct',
    },
    '6dqd0lxg': {
      'en': 'Zendesk Chat',
      'af': 'Zendesk Chat',
      'es': 'Chat de Zendesk',
      'fr': 'Chat Zendesk',
    },
    '3qrl4fuz': {
      'en': 'Intercom',
      'af': 'Interkom',
      'es': 'Intercomunicador',
      'fr': 'Interphone',
    },
    'hvb66izd': {
      'en': 'Freshchat',
      'af': 'Freshchat',
      'es': 'Freshchat',
      'fr': 'Freshchat',
    },
    'q95rvrbv': {
      'en': 'Tawk.to',
      'af': 'Tawk.to',
      'es': 'Tawk a',
      'fr': 'Tawk.to',
    },
    'gae3e33i': {
      'en': 'Drift',
      'af': 'Dryf',
      'es': 'Deriva',
      'fr': 'Dérive',
    },
    '3yau97ga': {
      'en': 'Crisp',
      'af': 'Bros',
      'es': 'Crujiente',
      'fr': 'Croustillant',
    },
    'jt9dyw6d': {
      'en': 'Olark',
      'af': 'Olark',
      'es': 'Olark',
      'fr': 'Olark',
    },
    'mc13hen7': {
      'en': 'HelpCrunch',
      'af': 'HelpCrunch',
      'es': 'AyudaCrunch',
      'fr': 'AideCrunch',
    },
    'gcggdpvw': {
      'en': 'Chatra',
      'af': 'Chatra',
      'es': 'chatra',
      'fr': 'Châtra',
    },
    'rqxns8gq': {
      'en': 'Brevo',
      'af': 'Brevo',
      'es': 'brevo',
      'fr': 'Brevo',
    },
    'fdxekjob': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'es': 'Por favor selecciona...',
      'fr': 'Veuillez sélectionner...',
    },
    '3ijf6mbc': {
      'en': 'Search for an item...',
      'af': 'Soek vir \'n item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    '5zkud4t4': {
      'en': 'Chat visibility',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ht3tgjmv': {
      'en': 'Where would you like the live chat to appear?',
      'af': '',
      'es': '',
      'fr': '',
    },
    'pw24lcss': {
      'en': 'Frontend',
      'af': 'Voorkant',
      'es': 'Interfaz',
      'fr': 'L\'extrémité avant',
    },
    'luyqhr8e': {
      'en': 'Enable live chat on Frontend of your website',
      'af': 'Aktiveer regstreekse klets op die voorkant van jou webwerf',
      'es': 'Habilite el chat en vivo en la interfaz de su sitio web',
      'fr': 'Activez le chat en direct sur le frontend de votre site Web',
    },
    'ek8jcurx': {
      'en': 'Web app',
      'af': 'Web App',
      'es': 'Aplicación Web',
      'fr': 'Application Web',
    },
    'xfuba9i9': {
      'en': 'Enable live chat on your web app',
      'af': 'Aktiveer regstreekse klets op jou webtoepassing',
      'es': 'Habilite el chat en vivo en su aplicación web',
      'fr': 'Activer le chat en direct sur votre application Web',
    },
    'i582m1jn': {
      'en': 'Mobile app',
      'af': 'Mobiele toepassing',
      'es': 'Aplicación movil',
      'fr': 'Application mobile',
    },
    '1dxrmog1': {
      'en': 'Enable live chat on your mobile app',
      'af': 'Aktiveer regstreekse klets op jou mobiele toepassing',
      'es': 'Habilite el chat en vivo en su aplicación móvil',
      'fr': 'Activez le chat en direct sur votre application mobile',
    },
    '4bhefe8n': {
      'en': 'Pexels',
      'af': '',
      'es': '',
      'fr': '',
    },
    'lpkx12jw': {
      'en': 'Pexels',
      'af': 'SMS',
      'es': 'SMS',
      'fr': 'SMS',
    },
    '8dtmy4sk': {
      'en':
          'To enable the Pexels API and obtain an API key\n\nVisit the Pexels API page (https://www.pexels.com/api/) and request access to the API by clicking on the \"Request Access\" button. You might need to provide some information about how you plan to use the API.',
      'af':
          'Jy kan kies uit die volgende mees gebruikte transaksionele SMS API\'s.',
      'es':
          'Puede elegir entre las siguientes API de SMS transaccionales más utilizadas.',
      'fr':
          'Vous pouvez choisir parmi les API SMS transactionnelles les plus utilisées suivantes.',
    },
    'x4jl3uml': {
      'en': 'Pexels Monthly Statistics',
      'af': '',
      'es': '',
      'fr': '',
    },
    'rvs10wz3': {
      'en': 'Total request limit',
      'af': '',
      'es': '',
      'fr': '',
    },
    '620kgrj6': {
      'en': 'Remaining requests',
      'af': '',
      'es': '',
      'fr': '',
    },
    'v73blxd4': {
      'en': 'Monthly period roll over',
      'af': '',
      'es': '',
      'fr': '',
    },
    'm5nrt1n6': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ListOfAnnonucements
  {
    'foef0h91': {
      'en': 'Annonucements',
      'af': 'Aankondigings',
      'es': 'Anuncios',
      'fr': 'Annonces',
    },
    '6madjbfr': {
      'en': 'Enable',
      'af': 'Aktiveer',
      'es': 'Permitir',
      'fr': 'Activer',
    },
    '5x4ci6ks': {
      'en':
          'If you have recent or significant news to share, display a message in a bar across the top of your application or pop-up. When enabled, the Announcement Bar will be viewable on both your desktop and mobile website.',
      'af':
          'As jy onlangse of belangrike nuus het om te deel, vertoon \'n boodskap in \'n balk bo-aan jou toepassing of opspringer. Wanneer dit geaktiveer is, sal die aankondigingbalk sigbaar wees op beide jou rekenaar- en mobiele webwerf.',
      'es':
          'Si tiene noticias recientes o importantes para compartir, muestre un mensaje en una barra en la parte superior de su aplicación o ventana emergente. Cuando está habilitada, la barra de anuncios se podrá ver tanto en su escritorio como en su sitio web móvil.',
      'fr':
          'Si vous avez des nouvelles récentes ou importantes à partager, affichez un message dans une barre en haut de votre application ou pop-up. Lorsqu\'elle est activée, la barre d\'annonces sera visible à la fois sur votre ordinateur de bureau et sur votre site Web mobile.',
    },
    'hptv1phs': {
      'en': 'Title',
      'af': 'Titel',
      'es': 'Título',
      'fr': 'Titre',
    },
    'pcamwbuy': {
      'en': 'By - ',
      'af': 'Deur -',
      'es': 'Por -',
      'fr': 'Par -',
    },
    'pery7sit': {
      'en': 'Created At',
      'af': 'Geskep by',
      'es': 'Creado en',
      'fr': 'Créé à',
    },
    'szgdj3o1': {
      'en': 'Action',
      'af': 'Aksie',
      'es': 'Acción',
      'fr': 'Action',
    },
    'w086ak5p': {
      'en': 'Read',
      'af': 'Lees',
      'es': 'Leer',
      'fr': 'Lire',
    },
    'fl1xa9jl': {
      'en': 'Delete',
      'af': 'Vee uit',
      'es': 'Borrar',
      'fr': 'Supprimer',
    },
    'enzjns3p': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Checkout
  {
    'nr6z5r1e': {
      'en': 'Your Cart',
      'af': '',
      'es': '',
      'fr': '',
    },
    'jm3n6mve': {
      'en': 'Below is the list of items in your cart.',
      'af': '',
      'es': '',
      'fr': '',
    },
    '0kr1nhg1': {
      'en': 'Air Max',
      'af': '',
      'es': '',
      'fr': '',
    },
    '852sk2gl': {
      'en': 'Size: ',
      'af': '',
      'es': '',
      'fr': '',
    },
    'e7i8ps8b': {
      'en': '12',
      'af': '',
      'es': '',
      'fr': '',
    },
    'zg3ot2tk': {
      'en': '\$124.00',
      'af': '',
      'es': '',
      'fr': '',
    },
    'j3df4l61': {
      'en':
          'Men\'s Sleeveless Fitness T-Shirt\nTumbled Grey/Flat Silver/Heather/Black',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ougzfv9v': {
      'en': 'Remove',
      'af': '',
      'es': '',
      'fr': '',
    },
    'idaa6ryq': {
      'en': 'Air Max',
      'af': '',
      'es': '',
      'fr': '',
    },
    'tvd8z021': {
      'en': 'Size: ',
      'af': '',
      'es': '',
      'fr': '',
    },
    'riraeicu': {
      'en': '12',
      'af': '',
      'es': '',
      'fr': '',
    },
    'rs23t41a': {
      'en': '\$117.00',
      'af': '',
      'es': '',
      'fr': '',
    },
    'qhxqcrim': {
      'en':
          'Men\'s Sleeveless Fitness T-Shirt\nTumbled Grey/Flat Silver/Heather/Black',
      'af': '',
      'es': '',
      'fr': '',
    },
    'wpvz4alz': {
      'en': 'Remove',
      'af': '',
      'es': '',
      'fr': '',
    },
    'fhk3u8ud': {
      'en': 'Order Summary',
      'af': '',
      'es': '',
      'fr': '',
    },
    '7x80vqdq': {
      'en': 'Below is a list of your items.',
      'af': '',
      'es': '',
      'fr': '',
    },
    'rjiq3xht': {
      'en': 'Price Breakdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'u3tgdbwk': {
      'en': 'Base Price',
      'af': '',
      'es': '',
      'fr': '',
    },
    '1030k259': {
      'en': '\$156.00',
      'af': '',
      'es': '',
      'fr': '',
    },
    '8trtebmc': {
      'en': 'Taxes',
      'af': '',
      'es': '',
      'fr': '',
    },
    'yhl0n4sf': {
      'en': '\$24.20',
      'af': '',
      'es': '',
      'fr': '',
    },
    'zwac9otz': {
      'en': 'Shipping Fee',
      'af': '',
      'es': '',
      'fr': '',
    },
    'uf9xh3ky': {
      'en': '\$40.00',
      'af': '',
      'es': '',
      'fr': '',
    },
    'tvqn8isx': {
      'en': 'Total',
      'af': '',
      'es': '',
      'fr': '',
    },
    '8kva0p5g': {
      'en': '\$230.20',
      'af': '',
      'es': '',
      'fr': '',
    },
    'pkaoa80t': {
      'en': 'Home',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // Product
  {
    '1axhnbxh': {
      'en': 'Zion Limited',
      'af': '',
      'es': '',
      'fr': '',
    },
    'y8evljfl': {
      'en': '\$156.00',
      'af': '',
      'es': '',
      'fr': '',
    },
    '4893j7x3': {
      'en': 'Retailed by Nike',
      'af': '',
      'es': '',
      'fr': '',
    },
    '5e1u70iq': {
      'en': '4/5 Reviews',
      'af': '',
      'es': '',
      'fr': '',
    },
    'pwh7n6an': {
      'en': 'DESCRIPTION',
      'af': '',
      'es': '',
      'fr': '',
    },
    '6mhkyh75': {
      'en':
          'With a down-to-earth persona and abilities that are out of this world, Zion is unlike anybody else. On court, the gentle spirit who\'s all about family transforms into an unmatched force of unstoppable athleticism and speed.',
      'af': '',
      'es': '',
      'fr': '',
    },
    'trqwgjnh': {
      'en': 'SIZE',
      'af': '',
      'es': '',
      'fr': '',
    },
    'fskfozd8': {
      'en': '4',
      'af': '',
      'es': '',
      'fr': '',
    },
    'q7bx0wsb': {
      'en': '5',
      'af': '',
      'es': '',
      'fr': '',
    },
    'dmj8iefw': {
      'en': '6',
      'af': '',
      'es': '',
      'fr': '',
    },
    'gn94t28a': {
      'en': '7',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ntv5pl11': {
      'en': '8',
      'af': '',
      'es': '',
      'fr': '',
    },
    '9rgz03ja': {
      'en': '9',
      'af': '',
      'es': '',
      'fr': '',
    },
    'w8vusbmr': {
      'en': '10',
      'af': '',
      'es': '',
      'fr': '',
    },
    'h2aiin5p': {
      'en': '11',
      'af': '',
      'es': '',
      'fr': '',
    },
    'sf89p57x': {
      'en': '12',
      'af': '',
      'es': '',
      'fr': '',
    },
    'keypecmn': {
      'en': '13',
      'af': '',
      'es': '',
      'fr': '',
    },
    'yweuwqla': {
      'en': '14',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ri75voyz': {
      'en': 'Add to Cart',
      'af': '',
      'es': '',
      'fr': '',
    },
    '31lvehbr': {
      'en': 'Home',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // ListOfProducts
  {
    'iozbgnn3': {
      'en': 'eCommerce - Products',
      'af': 'Plasings',
      'es': 'Publicaciones',
      'fr': 'Des postes',
    },
    'l7dy2f1i': {
      'en': 'Product',
      'af': 'Titel',
      'es': 'Título',
      'fr': 'Titre',
    },
    'l366mnav': {
      'en': '0.00',
      'af': '',
      'es': '',
      'fr': '',
    },
    'rrop8kfc': {
      'en': 'SKU',
      'af': 'Skrywer',
      'es': 'Autor',
      'fr': 'Auteur',
    },
    'xs610ubx': {
      'en': 'Author',
      'af': 'Skrywer',
      'es': 'Autor',
      'fr': 'Auteur',
    },
    'flr0xb05': {
      'en': 'Stock',
      'af': 'Geskep by',
      'es': 'Creado en',
      'fr': 'Créé à',
    },
    '0cqvubt3': {
      'en': 'Action',
      'af': 'Aksie',
      'es': 'Acción',
      'fr': 'Action',
    },
    'puq7wb5i': {
      'en': 'Read',
      'af': 'Lees',
      'es': 'Leer',
      'fr': 'Lire',
    },
    'con8sdsl': {
      'en': 'Delete',
      'af': 'Vee uit',
      'es': 'Borrar',
      'fr': 'Supprimer',
    },
    'kwr4oihs': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // VirtualCard
  {
    '2is1oclw': {
      'en': 'Cards',
      'af': '',
      'es': '',
      'fr': '',
    },
    'rqc9ptfw': {
      'en': 'Card details',
      'af': 'Betaalmetode',
      'es': 'método de pago',
      'fr': 'Méthode de paiement',
    },
    '7wi85y5z': {
      'en': 'Virtual',
      'af': 'Bankoorplasing',
      'es': 'Transferencia bancaria',
      'fr': 'Virement',
    },
    'mb0hewwt': {
      'en': 'Name on Card',
      'af': 'Bank Naam',
      'es': 'Nombre del banco',
      'fr': 'Nom de banque',
    },
    'yxxx68pk': {
      'en': '[Fullname]',
      'af': '',
      'es': '',
      'fr': '',
    },
    'jum07v3j': {
      'en': 'Card Number',
      'af': 'Rekeningnaam',
      'es': 'Nombre de la cuenta',
      'fr': 'Nom du compte',
    },
    '5pcspl8y': {
      'en': '[card-number]',
      'af': '',
      'es': '',
      'fr': '',
    },
    'xq0qhkli': {
      'en': 'Valid Till',
      'af': 'Snelkode',
      'es': 'código SWIFT',
      'fr': 'Code rapide',
    },
    'z6u90gun': {
      'en': '[07/28]',
      'af': '',
      'es': '',
      'fr': '',
    },
    'arz7spww': {
      'en': 'CVV',
      'af': 'Roeterings nommer',
      'es': 'Número de ruta',
      'fr': 'Numéro de routage',
    },
    '8nz0rl28': {
      'en': '[CVV]',
      'af': '',
      'es': '',
      'fr': '',
    },
    'tpermccp': {
      'en': 'Card Type',
      'af': 'Land',
      'es': 'País',
      'fr': 'Pays',
    },
    '09njr9q4': {
      'en': '[Visa]',
      'af': '',
      'es': '',
      'fr': '',
    },
    'szaqvydf': {
      'en': 'Billing Address',
      'af': 'Betaalmetode',
      'es': 'método de pago',
      'fr': 'Méthode de paiement',
    },
    'u09d4l5y': {
      'en': 'Bill Address',
      'af': 'Bank Naam',
      'es': 'Nombre del banco',
      'fr': 'Nom de banque',
    },
    '7df53qqt': {
      'en': '[Addres]',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ue8xxtv6': {
      'en': 'City/Region',
      'af': 'Rekeningnaam',
      'es': 'Nombre de la cuenta',
      'fr': 'Nom du compte',
    },
    'ey4vtc1k': {
      'en': '[City]',
      'af': '',
      'es': '',
      'fr': '',
    },
    'nw7umhs1': {
      'en': 'State',
      'af': 'Snelkode',
      'es': 'código SWIFT',
      'fr': 'Code rapide',
    },
    'sk8eiydy': {
      'en': '[State]',
      'af': '',
      'es': '',
      'fr': '',
    },
    'dqcxt6ia': {
      'en': 'Zip code',
      'af': 'Snelkode',
      'es': 'código SWIFT',
      'fr': 'Code rapide',
    },
    'r3gspe24': {
      'en': '[Zip code]',
      'af': '',
      'es': '',
      'fr': '',
    },
    'u24jbkx5': {
      'en': 'Country',
      'af': 'Snelkode',
      'es': 'código SWIFT',
      'fr': 'Code rapide',
    },
    'u89q7z32': {
      'en': '[Country]',
      'af': '',
      'es': '',
      'fr': '',
    },
    'frhm5dm7': {
      'en': 'Recent Transactions',
      'af': '\'n Opsomming van jou bestellingaktiwiteit',
      'es': 'Un resumen de la actividad de su pedido',
      'fr': 'Un résumé de votre activité de commande',
    },
    'fr9b2pju': {
      'en': 'Home',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // ListOfCardsOrders
  {
    'lc0t26ia': {
      'en': 'Cards',
      'af': 'Rekeningbetalings',
      'es': 'Pagos de facturas',
      'fr': 'Paiements de factures',
    },
    'j1ppcjig': {
      'en': 'Card Transactions',
      'af': '\'n Opsomming van jou bestellingaktiwiteit',
      'es': 'Un resumen de la actividad de su pedido',
      'fr': 'Un résumé de votre activité de commande',
    },
    'i3pqr76k': {
      'en': 'Orders',
      'af': 'Bestellings',
      'es': 'Pedidos',
      'fr': 'Ordres',
    },
  },
  // Plugins
  {
    'kynfmobu': {
      'en': 'Plugins',
      'af': 'Rekeningbetalings',
      'es': 'Pagos de facturas',
      'fr': 'Paiements de factures',
    },
    'xft6fp5m': {
      'en': 'Plugins / Apps',
      'af': '\'n Opsomming van jou bestellingaktiwiteit',
      'es': 'Un resumen de la actividad de su pedido',
      'fr': 'Un résumé de votre activité de commande',
    },
    'jrl14xw9': {
      'en': 'Orders',
      'af': 'Bestellings',
      'es': 'Pedidos',
      'fr': 'Ordres',
    },
  },
  // ListOfTransfer
  {
    'pth2ienj': {
      'en': 'Transfer',
      'af': 'Dienste',
      'es': 'Servicios',
      'fr': 'Prestations de service',
    },
    'vm7gxm4p': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Transfer
  {
    '3heuog5f': {
      'en': 'Enter account number',
      'af': 'Voer rekeningnommer in',
      'es': 'Ingrese el número de cuenta',
      'fr': 'Entrez le numéro de compte',
    },
    'zbmlf15x': {
      'en': '0123456789',
      'af': '0123456789',
      'es': '0123456789',
      'fr': '0123456789',
    },
    'eqgtpvtc': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    '3i5ddltp': {
      'en': 'Your account number or bank is invalid.',
      'af': 'Jou rekeningnommer of bank is ongeldig.',
      'es': 'Su número de cuenta o banco no es válido.',
      'fr': 'Votre numéro de compte ou votre banque n\'est pas valide.',
    },
    '19uhuro5': {
      'en': 'Proceed',
      'af': 'Voortgaan',
      'es': 'Proceder',
      'fr': 'Procéder',
    },
    'g1zels2w': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'm2546rxe': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '4foq9d1x': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'm8yhtqzz': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'sj4qfs88': {
      'en': 'Continue',
      'af': 'Voortgaan',
      'es': 'Proceder',
      'fr': 'Procéder',
    },
    'fwxvoiiw': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // TransferAmount
  {
    'm8t0cs24': {
      'en': 'Transfer',
      'af': '',
      'es': '',
      'fr': '',
    },
    'w35ehu58': {
      'en': 'Send',
      'af': 'Voortgaan',
      'es': 'Proceder',
      'fr': 'Procéder',
    },
    '9hyfdnfp': {
      'en': 'Amount is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'l0clym5h': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    '33h4wley': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // FintechSettings
  {
    'ma5hfixp': {
      'en': 'Fintech - Settings',
      'af': '',
      'es': '',
      'fr': '',
    },
    'w3zxk59o': {
      'en': 'Home',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // BillSettings
  {
    'sgy5l1cp': {
      'en': 'Bill Payments - Settings',
      'af': 'Dienste',
      'es': 'Servicios',
      'fr': 'Prestations de service',
    },
    'p4vmwc6n': {
      'en': 'APIs & Currency',
      'af': 'E-pos Api',
      'es': 'API de correo electrónico',
      'fr': 'API de messagerie',
    },
    'yzr0lkme': {
      'en': 'Public API Key',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ye7qonsr': {
      'en': 'Public API Key',
      'af': '',
      'es': '',
      'fr': '',
    },
    'zrzkt6bq': {
      'en': 'Test API Key',
      'af': '',
      'es': '',
      'fr': '',
    },
    '91sv4oju': {
      'en': 'Provider',
      'af': 'Platform verstek geldeenheid',
      'es': 'Moneda predeterminada de la plataforma',
      'fr': 'Devise par défaut de la plateforme',
    },
    'myt4mx9h': {
      'en': 'Flutterwave',
      'af': 'Nigerië',
      'es': 'Nigeria',
      'fr': 'Nigeria',
    },
    't2gvhtko': {
      'en': 'Paystack',
      'af': '',
      'es': '',
      'fr': '',
    },
    'p0uoer16': {
      'en': 'Interswitch',
      'af': '',
      'es': '',
      'fr': '',
    },
    'fku8dpfm': {
      'en': 'Select...',
      'af': 'Kies...',
      'es': 'Seleccionar...',
      'fr': 'Sélectionner...',
    },
    '04bfckj4': {
      'en': 'Search for an item...',
      'af': 'Soek vir \'n item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'j7zkkkwp': {
      'en': 'Default Country',
      'af': 'Platform verstek geldeenheid',
      'es': 'Moneda predeterminada de la plataforma',
      'fr': 'Devise par défaut de la plateforme',
    },
    '9e431ul1': {
      'en': 'NG',
      'af': 'Nigerië',
      'es': 'Nigeria',
      'fr': 'Nigeria',
    },
    '90vgkulr': {
      'en': 'GH',
      'af': '',
      'es': '',
      'fr': '',
    },
    'gxdu4c6h': {
      'en': 'USA',
      'af': '',
      'es': '',
      'fr': '',
    },
    'lhcpwu0c': {
      'en': 'Select...',
      'af': 'Kies...',
      'es': 'Seleccionar...',
      'fr': 'Sélectionner...',
    },
    '7kf09052': {
      'en': 'Search for an item...',
      'af': 'Soek vir \'n item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'ng4b0iq7': {
      'en': 'Provider Api Key is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'rmbh242w': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    '4ir8twqh': {
      'en': 'Cash Back',
      'af': 'Boodskap',
      'es': 'Mensaje',
      'fr': 'Message',
    },
    'gt4iywc2': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // CryptoSettings
  {
    'fkt912hp': {
      'en': 'Cryptos - Settings',
      'af': 'Dienste',
      'es': 'Servicios',
      'fr': 'Prestations de service',
    },
    'nemhlgb9': {
      'en': 'General',
      'af': '',
      'es': '',
      'fr': '',
    },
    '8ppremnq': {
      'en': 'Sell',
      'af': 'Verkoop',
      'es': 'Vender',
      'fr': 'Vendre',
    },
    '141dmq14': {
      'en': 'Let users sell crypto on your platform',
      'af': 'Verkoop vanaf jou platform',
      'es': 'Vende desde tu plataforma',
      'fr': 'Vendez depuis votre plateforme',
    },
    '3m7kpjsi': {
      'en': 'Buy',
      'af': 'Koop',
      'es': 'Comprar',
      'fr': 'Acheter',
    },
    '8xr899nl': {
      'en': 'Let users buy crypto on your platform',
      'af': 'Koop vanaf jou platform',
      'es': 'Compra desde tu plataforma',
      'fr': 'Achetez depuis votre plateforme',
    },
    'jzfgmsll': {
      'en': 'Fee/Currency',
      'af': '',
      'es': '',
      'fr': '',
    },
    'sci0cqc1': {
      'en': 'Transactions or Bank Fees',
      'af': 'Transaksies of bankfooie',
      'es': 'Transacciones o comisiones bancarias',
      'fr': 'Transactions ou frais bancaires',
    },
    'w738lzce': {
      'en': 'Do you charge for transactions?',
      'af': 'Vra jy vir transaksies?',
      'es': '¿Cobras por las transacciones?',
      'fr': 'Facturez-vous les transactions ?',
    },
    '9aa61us6': {
      'en': 'Do you charge for bank transfer?',
      'af': 'Betaal jy vir bankoorplasing?',
      'es': '¿Cobras por transferencia bancaria?',
      'fr': 'Chargez-vous le virement bancaire ?',
    },
    'yg0c05uf': {
      'en': 'Tax',
      'af': 'Belasting',
      'es': 'Impuesto',
      'fr': 'Impôt',
    },
    '89a4t32p': {
      'en': 'Tax/VAT',
      'af': 'Belasting/BTW',
      'es': 'Impuestos/IVA',
      'fr': 'Taxe/TVA',
    },
    'sjls93am': {
      'en': 'Apis',
      'af': '',
      'es': '',
      'fr': '',
    },
    'k9kaad3h': {
      'en': 'Hello World',
      'af': '',
      'es': '',
      'fr': '',
    },
    'f47bj80w': {
      'en': 'Crypto Application Settings',
      'af': '',
      'es': '',
      'fr': '',
    },
    'o8yeaqlr': {
      'en':
          'Configure your application settings, including currency selection, transaction fee, transfer fee, and API preferences. Customize these options to tailor your experience to your specific needs.',
      'af': '',
      'es': '',
      'fr': '',
    },
    '0fqa4mcp': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // EcommerceSettings
  {
    '8jrn3qf5': {
      'en': 'Ecommerce - Settings',
      'af': 'Dienste',
      'es': 'Servicios',
      'fr': 'Prestations de service',
    },
    'h7uetmd4': {
      'en': 'Transactions or Bank Fees',
      'af': 'Transaksies of bankfooie',
      'es': 'Transacciones o comisiones bancarias',
      'fr': 'Transactions ou frais bancaires',
    },
    'oph3bofm': {
      'en': 'Do you charge for transactions?',
      'af': 'Vra jy vir transaksies?',
      'es': '¿Cobras por las transacciones?',
      'fr': 'Facturez-vous les transactions ?',
    },
    'jykvbcep': {
      'en': 'Do you charge for Bank Transfer?',
      'af': 'Betaal jy vir bankoorplasing?',
      'es': '¿Cobras por transferencia bancaria?',
      'fr': 'Chargez-vous le virement bancaire ?',
    },
    'h7pes0zv': {
      'en': 'Tax',
      'af': 'Belasting',
      'es': 'Impuesto',
      'fr': 'Impôt',
    },
    'pbzgc50j': {
      'en': 'Tax/VAT',
      'af': 'Belasting/BTW',
      'es': 'Impuestos/IVA',
      'fr': 'Taxe/TVA',
    },
    'm9kcgk98': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // GiftcardsSettings
  {
    'm3dm3df4': {
      'en': 'Giftcards - Settings',
      'af': 'Dienste',
      'es': 'Servicios',
      'fr': 'Prestations de service',
    },
    '2cvdadvc': {
      'en': 'Sell',
      'af': 'Verkoop',
      'es': 'Vender',
      'fr': 'Vendre',
    },
    'ivk155ph': {
      'en': 'Sell from your platform',
      'af': 'Verkoop vanaf jou platform',
      'es': 'Vende desde tu plataforma',
      'fr': 'Vendez depuis votre plateforme',
    },
    'cx0fhvzc': {
      'en': 'Buy',
      'af': 'Koop',
      'es': 'Comprar',
      'fr': 'Acheter',
    },
    'jp9fsf7l': {
      'en': 'Buy from your platform',
      'af': 'Koop vanaf jou platform',
      'es': 'Compra desde tu plataforma',
      'fr': 'Achetez depuis votre plateforme',
    },
    '8rzbxof9': {
      'en': 'Transactions or bank fees',
      'af': 'Transaksies of bankfooie',
      'es': 'Transacciones o comisiones bancarias',
      'fr': 'Transactions ou frais bancaires',
    },
    'cob0ezwo': {
      'en': 'Do you charge for transactions?',
      'af': 'Vra jy vir transaksies?',
      'es': '¿Cobras por las transacciones?',
      'fr': 'Facturez-vous les transactions ?',
    },
    'xtynbvb8': {
      'en': 'Do you charge for bank transfer?',
      'af': 'Betaal jy vir bankoorplasing?',
      'es': '¿Cobras por transferencia bancaria?',
      'fr': 'Chargez-vous le virement bancaire ?',
    },
    '2z1kzj2t': {
      'en': 'Tax',
      'af': 'Belasting',
      'es': 'Impuesto',
      'fr': 'Impôt',
    },
    'l845vvja': {
      'en': 'Tax/VAT',
      'af': 'Belasting/BTW',
      'es': 'Impuestos/IVA',
      'fr': 'Taxe/TVA',
    },
    '4qzd550j': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ListOfBillOrdersForAdmin
  {
    'ei3dr9xv': {
      'en': 'Bill Payments - Orders',
      'af': 'Rekeningbetalings',
      'es': 'Pagos de facturas',
      'fr': 'Paiements de factures',
    },
    'lyglyi9t': {
      'en': 'A summary of order activity',
      'af': '\'n Opsomming van jou bestellingaktiwiteit',
      'es': 'Un resumen de la actividad de su pedido',
      'fr': 'Un résumé de votre activité de commande',
    },
    'vvohs1uf': {
      'en': 'Orders',
      'af': 'Bestellings',
      'es': 'Pedidos',
      'fr': 'Ordres',
    },
  },
  // Airtime
  {
    'whqqc6in': {
      'en': 'Pay for Airtime',
      'af': 'Betaal vir lugtyd',
      'es': 'Pagar por tiempo aire',
      'fr': 'Payer le temps d\'antenne',
    },
    '2lq7mqdu': {
      'en':
          'Enjoy the ease of topping up your mobile airtime instantly using our bill payment app. Stay connected with just a few taps!',
      'af':
          'Geniet die gemak om u mobiele lugtyd onmiddellik aan te vul deur ons rekeningbetalingsprogram te gebruik. Bly verbind met net \'n paar krane!',
      'es':
          'Disfrute de la facilidad de recargar su tiempo aire móvil al instante utilizando nuestra aplicación de pago de facturas. ¡Manténgase conectado con solo unos pocos toques!',
      'fr':
          'Profitez de la facilité de recharger instantanément votre temps d\'antenne mobile à l\'aide de notre application de paiement de factures. Restez connecté en quelques clics !',
    },
    '3py2edmg': {
      'en': 'Convenient Airtime Top-Up',
      'af': 'Gerieflike lugtyd-aanvulling',
      'es': 'Cómoda recarga de tiempo aire',
      'fr': 'Recharge de temps d\'antenne pratique',
    },
    'd06ztx62': {
      'en':
          'Stay effortlessly connected with our bill payment app\'s convenient airtime top-up feature. Say goodbye to the inconvenience of searching for a physical recharge card or running out of calling credit at critical moments. With just a few taps on your device, you can instantly replenish your mobile airtime. Whether it\'s for work or personal use, our app ensures you\'re always connected when you need it most.',
      'af':
          'Bly moeiteloos verbind met ons rekeningbetaling-toepassing se gerieflike lugtyd-aanvulling-funksie. Sê totsiens vir die ongerief om na \'n fisieke herlaaikaart te soek of om op kritieke oomblikke sonder belkrediet te raak. Met net \'n paar tik op jou toestel kan jy jou mobiele lugtyd onmiddellik aanvul. Of dit nou vir werk of persoonlike gebruik is, ons app verseker dat jy altyd gekoppel is wanneer jy dit die nodigste het.',
      'es':
          'Manténgase conectado sin esfuerzo con la conveniente función de recarga de tiempo aire de nuestra aplicación de pago de facturas. Dile adiós a los inconvenientes de buscar una tarjeta de recarga física o quedarte sin crédito para llamar en momentos críticos. Con solo unos pocos toques en su dispositivo, puede recargar instantáneamente su tiempo aire móvil. Ya sea para uso laboral o personal, nuestra aplicación garantiza que siempre esté conectado cuando más lo necesita.',
      'fr':
          'Restez connecté sans effort grâce à la fonction pratique de recharge de temps d\'antenne de notre application de paiement de factures. Dites adieu aux désagréments liés à la recherche d\'une carte de recharge physique ou au manque de crédit d\'appel aux moments critiques. En quelques clics sur votre appareil, vous pouvez instantanément reconstituer votre temps d\'antenne mobile. Que ce soit pour le travail ou pour un usage personnel, notre application garantit que vous êtes toujours connecté lorsque vous en avez le plus besoin.',
    },
    'ih7fs87c': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // DataBundle
  {
    '5064iuc8': {
      'en': 'Purchase Data Bundles',
      'af': 'Koop databundels',
      'es': 'Comprar paquetes de datos',
      'fr': 'Acheter des forfaits de données',
    },
    'qrmo5w5j': {
      'en':
          'Get your data fix effortlessly. Buy data bundles of your choice through our app and stay connected to the digital world without interruption.',
      'af':
          'Kry jou data moeiteloos reg. Koop databundels van jou keuse deur ons toepassing en bly sonder onderbreking verbind met die digitale wêreld.',
      'es':
          'Obtenga sus datos arreglados sin esfuerzo. Compra paquetes de datos de tu elección a través de nuestra aplicación y mantente conectado al mundo digital sin interrupciones.',
      'fr':
          'Réparez vos données sans effort. Achetez les forfaits de données de votre choix via notre application et restez connecté au monde numérique sans interruption.',
    },
    'dqqthkl0': {
      'en': 'Seamless Data Bundle Transactions',
      'af': 'Naatlose databondeltransaksies',
      'es': 'Transacciones de paquetes de datos sin interrupciones',
      'fr': 'Transactions de paquets de données transparentes',
    },
    'ift65cnb': {
      'en':
          'Enjoy uninterrupted access to the digital world with our bill payment app\'s seamless data bundle purchase feature. No more worrying about data running out in the middle of an important task or an exciting online session. Our app lets you choose and purchase data bundles tailored to your needs, so you can browse, stream, and communicate with ease. Say goodbye to data stress and stay connected on your terms.',
      'af':
          'Geniet ononderbroke toegang tot die digitale wêreld met ons rekeningbetalingsprogram se naatlose databondelaankoopfunksie. Moenie meer bekommer oor data wat opraak te midde van \'n belangrike taak of \'n opwindende aanlyn sessie nie. Met ons toepassing kan jy databundels kies en koop wat volgens jou behoeftes aangepas is, sodat jy met gemak kan blaai, stroom en kommunikeer. Sê totsiens vir datastres en bly op jou voorwaardes verbind.',
      'es':
          'Disfrute de acceso ininterrumpido al mundo digital con la función de compra de paquetes de datos sin interrupciones de nuestra aplicación de pago de facturas. Ya no tendrás que preocuparte por que los datos se agoten en medio de una tarea importante o de una emocionante sesión en línea. Nuestra aplicación te permite elegir y comprar paquetes de datos adaptados a tus necesidades, para que puedas navegar, transmitir y comunicarte con facilidad. Dígale adiós al estrés de los datos y manténgase conectado según sus propios términos.',
      'fr':
          'Profitez d\'un accès ininterrompu au monde numérique grâce à la fonction d\'achat de forfaits de données transparente de notre application de paiement de factures. Ne vous inquiétez plus de l\'épuisement des données au milieu d\'une tâche importante ou d\'une session en ligne passionnante. Notre application vous permet de choisir et d\'acheter des forfaits de données adaptés à vos besoins, afin que vous puissiez naviguer, diffuser et communiquer facilement. Dites adieu au stress lié aux données et restez connecté selon vos conditions.',
    },
    'red0oe80': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // CableTV
  {
    'kfgqoder': {
      'en': 'Cable TV Subscription',
      'af': 'Kabel TV-intekening',
      'es': 'Suscripción de televisión por cable',
      'fr': 'Abonnement à la télévision par câble',
    },
    'pscj1ln0': {
      'en':
          'Renew your cable TV subscription stress-free. Pay for your favorite channels and enjoy uninterrupted entertainment with our bill payment app.',
      'af':
          'Hernu jou kabel-TV-intekening stresvry. Betaal vir jou gunsteling kanale en geniet ononderbroke vermaak met ons rekeningbetalingsprogram.',
      'es':
          'Renueva tu suscripción de TV por cable sin estrés. Paga tus canales favoritos y disfruta de entretenimiento ininterrumpido con nuestra aplicación de pago de facturas.',
      'fr':
          'Renouvelez votre abonnement à la télévision par câble sans stress. Payez vos chaînes préférées et profitez d\'un divertissement ininterrompu avec notre application de paiement de factures.',
    },
    '5uhhupuv': {
      'en': 'Streamline Your TV Entertainment',
      'af': 'Stroomlyn jou TV-vermaak',
      'es': 'Optimice su entretenimiento televisivo',
      'fr': 'Rationalisez votre divertissement télévisé',
    },
    '6dm09ymi': {
      'en':
          'Elevate your TV entertainment experience with our bill payment app\'s cable TV subscription renewal feature. No more interruptions during your favorite shows or missing out on live events due to overdue payments. Our app makes it a breeze to renew your cable TV subscription, giving you access to a world of entertainment at your fingertips. Say hello to uninterrupted viewing pleasure.',
      'af':
          'Verhoog jou TV-vermaakervaring met ons rekeningbetalingsprogram se kabel-TV-intekeninghernuwingsfunksie. Geen onderbrekings meer tydens jou gunstelingprogramme of uitmis op regstreekse geleenthede as gevolg van agterstallige betalings nie. Ons toepassing maak dit \'n briesie om jou kabel-TV-intekening te hernu, wat jou toegang gee tot \'n wêreld van vermaak binne jou vingers. Sê hallo vir ononderbroke kykgenot.',
      'es':
          'Mejore su experiencia de entretenimiento televisivo con la función de renovación de suscripción a televisión por cable de nuestra aplicación de pago de facturas. No más interrupciones durante tus programas favoritos ni perderte eventos en vivo debido a pagos atrasados. Nuestra aplicación facilita la renovación de su suscripción de televisión por cable, brindándole acceso a un mundo de entretenimiento al alcance de su mano. Saluda al placer visual ininterrumpido.',
      'fr':
          'Améliorez votre expérience de divertissement télévisé grâce à la fonction de renouvellement de l\'abonnement à la télévision par câble de notre application de paiement de factures. Fini les interruptions pendant vos émissions préférées ou les événements en direct manqués en raison de retards de paiement. Notre application facilite le renouvellement de votre abonnement à la télévision par câble, vous donnant accès à un monde de divertissement à portée de main. Dites bonjour au plaisir visuel ininterrompu.',
    },
    'ny2o1afr': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Electricity
  {
    'voa4m3u9': {
      'en': 'Settle your Electricity Bills',
      'af': 'Vereffen jou elektrisiteitsrekeninge',
      'es': 'Liquida tus facturas de electricidad',
      'fr': 'Réglez vos factures d\'électricité',
    },
    '49iq9tqx': {
      'en':
          'Never miss a due date again! Use our app to pay your electricity bills on time, ensuring uninterrupted power supply.',
      'af':
          'Moet nooit weer \'n sperdatum mis nie! Gebruik ons ​​toepassing om u elektrisiteitsrekeninge betyds te betaal, en verseker ononderbroke kragtoevoer.',
      'es':
          '¡Nunca más te pierdas una fecha de vencimiento! Utilice nuestra aplicación para pagar sus facturas de electricidad a tiempo, garantizando un suministro de energía ininterrumpido.',
      'fr':
          'Ne manquez plus jamais une date d\'échéance ! Utilisez notre application pour payer vos factures d\'électricité à temps, garantissant ainsi une alimentation électrique ininterrompue.',
    },
    'nbqhda91': {
      'en': 'Hassle-Free Electricity Bill Payments',
      'af': 'Probleemvrye elektrisiteitsrekeningbetalings',
      'es': 'Pagos de facturas de electricidad sin complicaciones',
      'fr': 'Paiements de factures d\'électricité sans tracas',
    },
    'o0vj0xz3': {
      'en':
          'Keep the lights on without the hassle using our bill payment app\'s hassle-free electricity bill payment feature. Avoid the stress of queuing at payment centers or risking late fees. With our app, you can securely and promptly settle your electricity bills, ensuring a continuous power supply to your home or business. Enjoy peace of mind knowing your payments are always on time.',
      'af':
          'Hou die ligte aan sonder die moeite deur ons rekeningbetalingsprogram se moeitevrye elektrisiteitsrekeningbetalingsfunksie te gebruik. Vermy die stres van toustaan ​​by betalingsentrums of die risiko van laat fooie. Met ons toepassing kan u u elektrisiteitsrekeninge veilig en vinnig vereffen, wat \'n deurlopende kragtoevoer na u huis of besigheid verseker. Geniet gemoedsrus met die wete dat u betalings altyd betyds is.',
      'es':
          'Mantenga las luces encendidas sin complicaciones utilizando la función de pago de facturas de electricidad sin complicaciones de nuestra aplicación de pago de facturas. Evite el estrés de hacer cola en los centros de pago o arriesgarse a cargos por pagos atrasados. Con nuestra app podrás liquidar tus facturas de luz de forma segura y rápida, asegurando un suministro continuo de energía a tu hogar o negocio. Disfrute de la tranquilidad de saber que sus pagos siempre se realizan a tiempo.',
      'fr':
          'Gardez les lumières allumées sans tracas grâce à la fonction de paiement de facture d\'électricité sans tracas de notre application de paiement de factures. Évitez le stress de faire la queue dans les centres de paiement ou de risquer des frais de retard. Avec notre application, vous pouvez régler vos factures d\'électricité en toute sécurité et rapidement, garantissant ainsi une alimentation électrique continue à votre maison ou votre entreprise. Ayez l\'esprit tranquille en sachant que vos paiements sont toujours à temps.',
    },
    'vqbpk3gp': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // InternetWifi
  {
    'cxlp3l8a': {
      'en': 'Internet/Wifi Payments',
      'af': 'Internet/Wifi betalings',
      'es': 'Pagos por Internet/Wifi',
      'fr': 'Paiements Internet/Wi-Fi',
    },
    'vkab5hg1': {
      'en':
          'Never miss a due date again! Use our app to pay your electricity bills on time, ensuring uninterrupted power supply.',
      'af':
          'Moet nooit weer \'n sperdatum mis nie! Gebruik ons ​​toepassing om u elektrisiteitsrekeninge betyds te betaal, en verseker ononderbroke kragtoevoer.',
      'es':
          '¡Nunca más te pierdas una fecha de vencimiento! Utilice nuestra aplicación para pagar sus facturas de electricidad a tiempo, garantizando un suministro de energía ininterrumpido.',
      'fr':
          'Ne manquez plus jamais une date d\'échéance ! Utilisez notre application pour payer vos factures d\'électricité à temps, garantissant ainsi une alimentation électrique ininterrompue.',
    },
    'xthlpmhr': {
      'en': 'Stay Connected with Ease',
      'af': 'Bly met gemak verbind',
      'es': 'Manténgase conectado con facilidad',
      'fr': 'Restez connecté en toute simplicité',
    },
    'rnted13o': {
      'en':
          'Maintain seamless online connectivity with our bill payment app\'s internet/Wifi payment feature. Avoid disruptions to your work, study, or leisure activities by ensuring your internet/Wifi services are always up and running. Our app streamlines the payment process, allowing you to easily settle your internet/Wifi bills and enjoy uninterrupted access to the digital world. Stay connected effortlessly, anytime, anywhere.',
      'af':
          'Handhaaf naatlose aanlynverbinding met ons rekeningbetalingsprogram se internet-/Wifi-betalingsfunksie. Vermy ontwrigting van jou werk-, studie- of ontspanningsaktiwiteite deur te verseker dat jou internet-/Wifi-dienste altyd aan die gang is. Ons toepassing stroomlyn die betaalproses, sodat jy maklik jou internet-/Wifi-rekeninge kan vereffen en ononderbroke toegang tot die digitale wêreld kan geniet. Bly moeiteloos verbind, enige tyd, enige plek.',
      'es':
          'Mantenga una conectividad en línea perfecta con la función de pago por Internet/Wifi de nuestra aplicación de pago de facturas. Evite interrupciones en su trabajo, estudio o actividades de ocio asegurándose de que sus servicios de Internet/Wifi estén siempre en funcionamiento. Nuestra aplicación agiliza el proceso de pago, permitiéndole liquidar fácilmente sus facturas de Internet/Wifi y disfrutar de acceso ininterrumpido al mundo digital. Manténgase conectado sin esfuerzo, en cualquier momento y en cualquier lugar.',
      'fr':
          'Maintenez une connectivité en ligne transparente grâce à la fonction de paiement Internet/Wifi de notre application de paiement de factures. Évitez les perturbations de votre travail, de vos études ou de vos loisirs en vous assurant que vos services Internet/Wifi sont toujours opérationnels. Notre application rationalise le processus de paiement, vous permettant de régler facilement vos factures Internet/Wifi et de profiter d\'un accès ininterrompu au monde numérique. Restez connecté sans effort, à tout moment et en tout lieu.',
    },
    'gk89dro6': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Education
  {
    '33bb4305': {
      'en': 'Education PIN',
      'af': 'Onderwys-PIN',
      'es': 'PIN de educación',
      'fr': 'Code PIN d\'éducation',
    },
    '9y6di0rc': {
      'en':
          'Ensure academic success with our bill payment app\'s simplified process for acquiring educational PINs, including those for exams like WAEC, NECO, and more. We understand the critical role these PINs play in your educational journey. With our app, you can conveniently purchase the necessary PINs, eliminating the need for time-consuming visits to physical outlets or banks.',
      'af':
          'Verseker akademiese sukses met ons rekeningbetalingsprogram se vereenvoudigde proses vir die verkryging van opvoedkundige PIN\'s, insluitend dié vir eksamens soos WAEC, NECO, en meer. Ons verstaan ​​die kritieke rol wat hierdie PIN\'s in jou opvoedkundige reis speel. Met ons toepassing kan jy gerieflik die nodige PIN\'s koop, wat die behoefte aan tydrowende besoeke aan fisiese afsetpunte of banke uitskakel.',
      'es':
          'Garantice el éxito académico con el proceso simplificado de nuestra aplicación de pago de facturas para adquirir PIN educativos, incluidos aquellos para exámenes como WAEC, NECO y más. Entendemos el papel fundamental que desempeñan estos PIN en su viaje educativo. Con nuestra aplicación, puede comprar cómodamente los PIN necesarios, eliminando la necesidad de realizar largas visitas a establecimientos físicos o bancos.',
      'fr':
          'Assurez la réussite scolaire grâce au processus simplifié de notre application de paiement de factures pour l\'acquisition de codes PIN éducatifs, y compris ceux pour des examens tels que WAEC, NECO, etc. Nous comprenons le rôle essentiel que jouent ces codes PIN dans votre parcours éducatif. Avec notre application, vous pouvez facilement acheter les codes PIN nécessaires, éliminant ainsi le besoin de visites fastidieuses dans les points de vente physiques ou les banques.',
    },
    'g3xv193l': {
      'en': 'Simplified Educational PIN Procurement',
      'af': 'Vereenvoudigde opvoedkundige PIN-verkryging',
      'es': 'Adquisición de PIN educativo simplificado',
      'fr': 'Achat simplifié de codes PIN éducatifs',
    },
    'pess30nv': {
      'en':
          'Prepare for exams like WAEC, NECO, and others with ease, knowing that securing your educational PINs is just a few taps away. Whether you\'re a student or a parent supporting your child\'s education, our app empowers you to navigate the educational landscape confidently. Unlock opportunities and open doors to a brighter future with our hassle-free educational PIN procurement feature.',
      'af':
          'Berei met gemak voor vir eksamens soos WAEC, NECO en ander, met die wete dat dit net \'n paar tikke weg is om jou opvoedkundige PIN\'s te beveilig. Of jy nou \'n student of \'n ouer is wat jou kind se opvoeding ondersteun, ons app bemagtig jou om die opvoedkundige landskap met selfvertroue te navigeer. Ontsluit geleenthede en maak deure oop na \'n beter toekoms met ons moeitevrye opvoedkundige PIN-verkrygingsfunksie.',
      'es':
          'Prepárese para exámenes como WAEC, NECO y otros con facilidad, sabiendo que proteger sus PIN educativos está a solo unos toques de distancia. Si usted es un estudiante o un padre que apoya la educación de su hijo, nuestra aplicación le permite navegar con confianza en el panorama educativo. Descubra oportunidades y abra puertas a un futuro mejor con nuestra función de adquisición de PIN educativo sin complicaciones.',
      'fr':
          'Préparez-vous facilement à des examens tels que WAEC, NECO et autres, sachant que la sécurisation de vos codes PIN éducatifs n\'est qu\'à quelques clics. Que vous soyez étudiant ou parent soutenant l\'éducation de votre enfant, notre application vous permet de naviguer en toute confiance dans le paysage éducatif. Débloquez des opportunités et ouvrez les portes d’un avenir meilleur grâce à notre fonction d’achat de codes PIN éducatifs sans tracas.',
    },
    '888lfyfl': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // OrderSuccessfulBill
  {
    'sr5psr3r': {
      'en': 'Done',
      'af': 'Klaar',
      'es': 'Hecho',
      'fr': 'Fait',
    },
    'rvryu4lt': {
      'en': 'You just purchase ',
      'af': 'Jy koop net',
      'es': 'tu acabas de comprar',
      'fr': 'vous venez d\'acheter',
    },
    'k6iugdw7': {
      'en': 'to',
      'af': 'aan',
      'es': 'a',
      'fr': 'à',
    },
    'uutvgct6': {
      'en': 'Orders',
      'af': 'Bestellings',
      'es': 'Pedidos',
      'fr': 'Ordres',
    },
  },
  // AppLogo
  {
    'bnkozl7r': {
      'en': 'App Logo',
      'af': 'App-logo',
      'es': 'Logotipo de la aplicación',
      'fr': 'Logo de l\'application',
    },
    'ywyv9b5l': {
      'en':
          'Please take a moment to upload your app logo, which is the visual representation that defines your app\'s identity and engages users. If you haven\'t created a logo yet, consider visiting , ',
      'af':
          'Neem asseblief \'n oomblik om jou programlogo op te laai, wat die visuele voorstelling is wat jou program se identiteit definieer en gebruikers betrek. As jy nog nie \'n logo geskep het nie, oorweeg dit om ,',
      'es':
          'Tómese un momento para cargar el logotipo de su aplicación, que es la representación visual que define la identidad de su aplicación y atrae a los usuarios. Si aún no ha creado un logotipo, considere visitar ,',
      'fr':
          'Veuillez prendre un moment pour télécharger le logo de votre application, qui est la représentation visuelle qui définit l\'identité de votre application et engage les utilisateurs. Si vous n\'avez pas encore créé de logo, pensez à visiter ,',
    },
    'v0oof6ag': {
      'en': 'Canva (canva.com)',
      'af': 'Canva (canva.com)',
      'es': 'Canva (canva.com)',
      'fr': 'Canva (canva.com)',
    },
    '4n5bacfn': {
      'en': ' a user-friendly design platform, to craft a unique emblem.',
      'af':
          '\'n gebruikersvriendelike ontwerpplatform, om \'n unieke embleem te maak.',
      'es':
          'una plataforma de diseño fácil de usar, para crear un emblema único.',
      'fr':
          'une plateforme de conception conviviale, pour créer un emblème unique.',
    },
    'ztisz91g': {
      'en': 'Light Mode',
      'af': 'Ligte modus',
      'es': 'Modo de luz',
      'fr': 'Mode lumière',
    },
    '4rranvts': {
      'en':
          'Please upload your light mode logo here in PNG, JPEG, or JPG format.',
      'af':
          'Laai asseblief jou ligmodus-logo hier in PNG-, JPEG- of JPG-formaat op.',
      'es':
          'Cargue aquí su logotipo de modo de luz en formato PNG, JPEG o JPG.',
      'fr':
          'Veuillez télécharger votre logo en mode lumière ici au format PNG, JPEG ou JPG.',
    },
    'z29z0ezq': {
      'en': 'Square logo (100by100)',
      'af': 'Vierkantige logo (100 by 100)',
      'es': 'Logotipo cuadrado (100by100)',
      'fr': 'Logo carré (100x100)',
    },
    'vug6kzcl': {
      'en': 'Rectangle logo (400by100)',
      'af': 'Reghoek-logo (400 by 100)',
      'es': 'Logotipo rectangular (400by100)',
      'fr': 'Logo rectangulaire (400x100)',
    },
    '5l134qo6': {
      'en': 'Dark Mode',
      'af': 'Donker modus',
      'es': 'modo oscuro',
      'fr': 'Mode sombre',
    },
    '91nl9mlp': {
      'en':
          'Please upload your dark mode logo here in PNG, JPEG, or JPG format.',
      'af':
          'Laai asseblief jou donkermodus-logo hier in PNG-, JPEG- of JPG-formaat op.',
      'es':
          'Cargue aquí su logotipo de modo oscuro en formato PNG, JPEG o JPG.',
      'fr':
          'Veuillez télécharger votre logo en mode sombre ici au format PNG, JPEG ou JPG.',
    },
    'e62bgjvu': {
      'en': 'Square logo (100by100)',
      'af': 'Vierkantige logo (100 by 100)',
      'es': 'Logotipo cuadrado (100by100)',
      'fr': 'Logo carré (100x100)',
    },
    '25y8xv84': {
      'en': 'Rectangle logo (400by100)',
      'af': 'Reghoek-logo (400 by 100)',
      'es': 'Logotipo rectangular (400by100)',
      'fr': 'Logo rectangulaire (400x100)',
    },
    'xtji96wl': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // TransferSuccessful
  {
    'do0hzw7b': {
      'en': 'Payment',
      'af': 'Betaling',
      'es': 'Pago',
      'fr': 'Paiement',
    },
    '0trutlzi': {
      'en': 'Transfer Successful',
      'af': 'Oordrag suksesvol',
      'es': 'Transferencia exitosa',
      'fr': 'Transfert réussi',
    },
    't69eczqd': {
      'en': 'Orders',
      'af': 'Bestellings',
      'es': 'Pedidos',
      'fr': 'Ordres',
    },
  },
  // ListOfRecipients
  {
    'k5j1x69u': {
      'en': 'Recipients',
      'af': 'Ontvangers',
      'es': 'Destinatarios',
      'fr': 'Destinataires',
    },
    '8yuuhdzu': {
      'en': 'Phone Number',
      'af': '',
      'es': '',
      'fr': '',
    },
    'z70wtlfu': {
      'en': 'Name',
      'af': 'Naam',
      'es': 'Nombre',
      'fr': 'Nom',
    },
    'aibrg28c': {
      'en': 'Action',
      'af': 'Aksie',
      'es': 'Acción',
      'fr': 'Action',
    },
    '8ujqrvge': {
      'en': 'Edit',
      'af': 'Wysig',
      'es': 'Editar',
      'fr': 'Modifier',
    },
    'y1xhwku6': {
      'en': 'Read',
      'af': 'Lees',
      'es': 'Leer',
      'fr': 'Lire',
    },
    'gsxbydzl': {
      'en': 'Delete',
      'af': 'Vee uit',
      'es': 'Borrar',
      'fr': 'Supprimer',
    },
    'zloukyt6': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // CreateCableTV
  {
    'n1jsiu8g': {
      'en': 'Cable TV',
      'af': 'Kabel TV',
      'es': 'Televisión por cable',
      'fr': 'Télévision par câble',
    },
    'pk3n05fl': {
      'en': 'Service Provider',
      'af': 'Diensverskaffer',
      'es': 'Proveedor de servicio',
      'fr': 'Fournisseur de services',
    },
    'rcj7hwu2': {
      'en': 'Smart Card Number',
      'af': 'Slimkaartnommer',
      'es': 'Número de tarjeta inteligente',
      'fr': 'Numéro de carte à puce',
    },
    'vhk1y6hv': {
      'en': 'Recipient',
      'af': 'Ontvanger',
      'es': 'Recipiente',
      'fr': 'Destinataire',
    },
    '55kswji0': {
      'en': '0123456789',
      'af': '0123456789',
      'es': '0123456789',
      'fr': '0123456789',
    },
    'ogar7s2o': {
      'en': 'Type of Service',
      'af': 'Tipe diens',
      'es': 'Tipo de servicio',
      'fr': 'Type de service',
    },
    'zow2afxb': {
      'en': 'Provider',
      'af': 'Verskaffer',
      'es': 'Proveedor',
      'fr': 'Fournisseur',
    },
    'qlmtraut': {
      'en': 'Biller Code',
      'af': 'Biller kode',
      'es': 'Código de facturador',
      'fr': 'Code de facturation',
    },
    'ilsst63d': {
      'en': 'Item Code',
      'af': 'Itemkode',
      'es': 'Código del objeto',
      'fr': 'Code de l\'article',
    },
    'yi62abf5': {
      'en': 'Short Name',
      'af': 'Kort naam',
      'es': 'Nombre corto',
      'fr': 'Nom court',
    },
    'cwu2wu44': {
      'en': 'Provider Fee',
      'af': 'Verskaffersfooi',
      'es': 'Tarifa del proveedor',
      'fr': 'Frais du fournisseur',
    },
    'n33ij9as': {
      'en': 'Country',
      'af': 'Land',
      'es': 'País',
      'fr': 'Pays',
    },
    'yz8u8s61': {
      'en': 'Currency\n',
      'af': 'Geldeenheid',
      'es': 'Divisa',
      'fr': 'Devise',
    },
    'g9wqgxh8': {
      'en': 'Price',
      'af': 'Prys',
      'es': 'Precio',
      'fr': 'Prix',
    },
    '9nptuphx': {
      'en': 'Smart Card is required',
      'af': 'Slimkaart word vereis',
      'es': 'Se requiere tarjeta inteligente',
      'fr': 'Une carte à puce est requise',
    },
    'qjfa1h98': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'zq97qvxn': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'ftt5rmsx': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'cm97mu44': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'nqps69dt': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '4bmnystu': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'ss92v35p': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '107slvwy': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '3i9j47lm': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '5yd6ds0n': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '0pd0ph6l': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'wh0984m0': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'pl03u4or': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'w1afl4qa': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // CreateInternetWifi
  {
    'tecr8xqj': {
      'en': 'Buy Wifi/Internet',
      'af': 'Koop Wifi/Internet',
      'es': 'Comprar Wifi/Internet',
      'fr': 'Acheter Wifi/Internet',
    },
    'xmown15g': {
      'en': 'Network Provider',
      'af': 'Netwerkverskaffer',
      'es': 'Proveedor de red',
      'fr': 'Fournisseur de réseau',
    },
    'pmyfv4bq': {
      'en': 'Account Number',
      'af': 'Rekening nommer',
      'es': 'Número de cuenta',
      'fr': 'Numéro de compte',
    },
    'ltb7h05k': {
      'en': 'Recipient',
      'af': 'Ontvanger',
      'es': 'Recipiente',
      'fr': 'Destinataire',
    },
    'yl6xuqlr': {
      'en': '08123456789',
      'af': '08123456789',
      'es': '08123456789',
      'fr': '08123456789',
    },
    'o0573cbg': {
      'en': 'Insuffencience Balance',
      'af': 'Onvoldoende balans',
      'es': 'Equilibrio de insuficiencia',
      'fr': 'Équilibre d\'insuffisance',
    },
    'uh72f5dp': {
      'en': 'Type of Service',
      'af': 'Tipe diens',
      'es': 'Tipo de servicio',
      'fr': 'Type de service',
    },
    'mt1e8khc': {
      'en': 'Provider',
      'af': 'Verskaffer',
      'es': 'Proveedor',
      'fr': 'Fournisseur',
    },
    'mm6y5y0q': {
      'en': 'Biller Code',
      'af': 'Biller kode',
      'es': 'Código de facturador',
      'fr': 'Code de facturation',
    },
    'kmoe23xl': {
      'en': 'Item Code',
      'af': 'Itemkode',
      'es': 'Código del objeto',
      'fr': 'Code de l\'article',
    },
    '53s5bmc7': {
      'en': 'Short Name',
      'af': 'Kort naam',
      'es': 'Nombre corto',
      'fr': 'Nom court',
    },
    '1g2czndi': {
      'en': 'Provider Fee',
      'af': 'Verskaffersfooi',
      'es': 'Tarifa del proveedor',
      'fr': 'Frais du fournisseur',
    },
    'jjllz8qa': {
      'en': 'Country',
      'af': 'Land',
      'es': 'País',
      'fr': 'Pays',
    },
    'ljgsm5c7': {
      'en': 'Currency\n',
      'af': 'Geldeenheid',
      'es': 'Divisa',
      'fr': 'Devise',
    },
    'b4xctoot': {
      'en': 'Price',
      'af': 'Prys',
      'es': 'Precio',
      'fr': 'Prix',
    },
    '8m8ik94l': {
      'en': 'Choose your network provider',
      'af': 'Kies jou netwerkverskaffer',
      'es': 'Elija su proveedor de red',
      'fr': 'Choisissez votre fournisseur de réseau',
    },
    '8liq8mjx': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'zhwca2y6': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '5kcy9yp6': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'rwjfh33d': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'tsst3kqq': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '7cs1jvkf': {
      'en': 'Chose your package',
      'af': 'Kies jou pakket',
      'es': 'Elige tu paquete',
      'fr': 'Choisissez votre forfait',
    },
    'evx1qag8': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'bylctgph': {
      'en': 'Phone number is required',
      'af': 'Telefoonnommer word vereis',
      'es': 'Se requiere número de teléfono',
      'fr': 'Le numéro de téléphone est requis',
    },
    'e9nxcr9n': {
      'en': 'Phone number must be 11 digits long',
      'af': 'Telefoonnommer moet 11 syfers lank wees',
      'es': 'El número de teléfono debe tener 11 dígitos',
      'fr': 'Le numéro de téléphone doit comporter 11 chiffres',
    },
    '6gquyzi0': {
      'en': 'Phone number must be 11 digits long',
      'af': 'Telefoonnommer moet 11 syfers lank wees',
      'es': 'El número de teléfono debe tener 11 dígitos',
      'fr': 'Le numéro de téléphone doit comporter 11 chiffres',
    },
    'oxuzqmlq': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    't8xj42by': {
      'en': 'Amount is required',
      'af': 'Bedrag word vereis',
      'es': 'Se requiere cantidad',
      'fr': 'Le montant est requis',
    },
    'yzsc18a8': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'xas0aomx': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // CreateTransport
  {
    'he6x8xnu': {
      'en': 'Pay for Transport',
      'af': 'Betaal vir vervoer',
      'es': 'Pagar por el transporte',
      'fr': 'Payer le transport',
    },
    '2a13vphj': {
      'en': 'Biller code',
      'af': 'Biller kode',
      'es': 'código de facturador',
      'fr': 'Code de facturation',
    },
    'lte12x8s': {
      'en': 'Item code',
      'af': 'Itemkode',
      'es': 'Código del objeto',
      'fr': 'Code de l\'article',
    },
    '5vadn9td': {
      'en': 'Product name',
      'af': 'Produk Naam',
      'es': 'Nombre del producto',
      'fr': 'Nom du produit',
    },
    '976y4jnj': {
      'en': 'Lcc Number',
      'af': 'Lcc nommer',
      'es': 'Número de tarjeta de crédito',
      'fr': 'Numéro LCC',
    },
    'js37qm3d': {
      'en': '08123456789',
      'af': '08123456789',
      'es': '08123456789',
      'fr': '08123456789',
    },
    'u71kg1t0': {
      'en': 'Amount',
      'af': 'Bedrag',
      'es': 'Cantidad',
      'fr': 'Montant',
    },
    '8sglwx8b': {
      'en': '0.00',
      'af': '0.00',
      'es': '0.00',
      'fr': '0,00',
    },
    '3wlnywvr': {
      'en': 'NGN',
      'af': 'NGN',
      'es': 'NGN',
      'fr': 'NGN',
    },
    'qg5g180y': {
      'en': 'Choose your network',
      'af': 'Kies jou netwerk',
      'es': 'Elige tu red',
      'fr': 'Choisissez votre réseau',
    },
    '3cd4h750': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '5k8y63pg': {
      'en': 'Phone number is required',
      'af': 'Telefoonnommer word vereis',
      'es': 'Se requiere número de teléfono',
      'fr': 'Le numéro de téléphone est requis',
    },
    '114vltsf': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '8nsaqobu': {
      'en': 'Amount is required',
      'af': 'Bedrag word vereis',
      'es': 'Se requiere cantidad',
      'fr': 'Le montant est requis',
    },
    'zxpehveh': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'stv87mjx': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // CreateEletricityBill
  {
    'tzuhs3jz': {
      'en': 'Electricity',
      'af': 'Elektrisiteit',
      'es': 'Electricidad',
      'fr': 'Électricité',
    },
    'iqlgknr7': {
      'en': 'Service Provider',
      'af': 'Diensverskaffer',
      'es': 'Proveedor de servicio',
      'fr': 'Fournisseur de services',
    },
    '0x3cuig5': {
      'en': 'Meter Number',
      'af': 'Meter nommer',
      'es': 'Número de medidor',
      'fr': 'Numéro de compteur',
    },
    '4ka0dbmf': {
      'en': 'Recipient',
      'af': 'Ontvanger',
      'es': 'Recipiente',
      'fr': 'Destinataire',
    },
    'pf0nlmel': {
      'en': '012345678901234',
      'af': '012345678901234',
      'es': '012345678901234',
      'fr': '012345678901234',
    },
    's9ekyhs6': {
      'en': 'Type of Service',
      'af': 'Tipe diens',
      'es': 'Tipo de servicio',
      'fr': 'Type de service',
    },
    'iwd9lzu4': {
      'en': 'Provider',
      'af': 'Verskaffer',
      'es': 'Proveedor',
      'fr': 'Fournisseur',
    },
    'oh3xdly9': {
      'en': 'Biller Code',
      'af': 'Biller kode',
      'es': 'Código de facturador',
      'fr': 'Code de facturation',
    },
    '771r4rlb': {
      'en': 'Item Code',
      'af': 'Itemkode',
      'es': 'Código del objeto',
      'fr': 'Code de l\'article',
    },
    '1whrefpj': {
      'en': 'Short Name',
      'af': 'Kort naam',
      'es': 'Nombre corto',
      'fr': 'Nom court',
    },
    '3721x4gw': {
      'en': 'Provider Fee',
      'af': 'Verskaffersfooi',
      'es': 'Tarifa del proveedor',
      'fr': 'Frais du fournisseur',
    },
    'ej8mj8t9': {
      'en': 'Country',
      'af': 'Land',
      'es': 'País',
      'fr': 'Pays',
    },
    '012zb4x9': {
      'en': 'Currency\n',
      'af': 'Geldeenheid',
      'es': 'Divisa',
      'fr': 'Devise',
    },
    '4wgbg7nr': {
      'en': 'Choose an Amount',
      'af': 'Kies \'n bedrag',
      'es': 'Elija una cantidad',
      'fr': 'Choisissez un montant',
    },
    '1210glts': {
      'en': 'Amount',
      'af': 'Bedrag',
      'es': 'Cantidad',
      'fr': 'Montant',
    },
    'sjuex8p7': {
      'en': '1000 -100,000',
      'af': '1000 -100,000',
      'es': '1000-100.000',
      'fr': '1 000 à 100 000',
    },
    '29v4m3sw': {
      'en': 'NGN',
      'af': 'NGN',
      'es': 'NGN',
      'fr': 'NGN',
    },
    'qmvjllhm': {
      'en': 'Insufficient funds',
      'af': 'Onvoldoende fondse',
      'es': 'Fondos insuficientes',
      'fr': 'Fonds insuffisants',
    },
    '20h76ldq': {
      'en': 'Phone Number is required',
      'af': 'Telefoonnommer word vereis',
      'es': 'Se requiere número de teléfono',
      'fr': 'Le numéro de téléphone est requis',
    },
    'icfazal8': {
      'en': 'Phone numbers must be 11 digits long.',
      'af': 'Telefoonnommers moet 11 syfers lank wees.',
      'es': 'Los números de teléfono deben tener 11 dígitos.',
      'fr': 'Les numéros de téléphone doivent comporter 11 chiffres.',
    },
    'p4tyq31c': {
      'en': 'Phone numbers must be 11 digits long.',
      'af': 'Telefoonnommers moet 11 syfers lank wees.',
      'es': 'Los números de teléfono deben tener 11 dígitos.',
      'fr': 'Les numéros de téléphone doivent comporter 11 chiffres.',
    },
    '5i8s14ft': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '7umzlutr': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '4ri0rr3j': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'g2akmi2r': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'x31a0uud': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '2lewti91': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'txekrpyb': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '47xu63mi': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '5o1r4dh3': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ekdcn6cj': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '5ejaxuiq': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'uspjqq8l': {
      'en': 'Amount is required',
      'af': 'Bedrag word vereis',
      'es': 'Se requiere cantidad',
      'fr': 'Le montant est requis',
    },
    'p7sd1rj7': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '0yaw57q9': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // HelpCenter
  {
    'y7upyrzr': {
      'en': 'Help & Support',
      'af': 'Hulp en ondersteuning',
      'es': 'Servicio de asistencia',
      'fr': 'Support d\'aide',
    },
    '6kie06uu': {
      'en': 'Tap the number to call ',
      'af': 'Tik die nommer om te bel',
      'es': 'Toca el número para llamar',
      'fr': 'Appuyez sur le numéro à appeler',
    },
    'bx6apyig': {
      'en': 'Tap to send us message',
      'af': 'Tik om vir ons boodskap te stuur',
      'es': 'Toca para enviarnos un mensaje',
      'fr': 'Appuyez pour nous envoyer un message',
    },
    'zc9fpobl': {
      'en': 'Tap to chat with us',
      'af': 'Tik om met ons te gesels',
      'es': 'Toca para chatear con nosotros',
      'fr': 'Appuyez pour discuter avec nous',
    },
    'wa0hperd': {
      'en': 'Click here to add Live Chat',
      'af': 'Klik hier om Live Chat by te voeg',
      'es': 'Haga clic aquí para agregar chat en vivo',
      'fr': 'Cliquez ici pour ajouter le chat en direct',
    },
    '2z4gx497': {
      'en': 'Settings',
      'af': 'Instellings',
      'es': 'Ajustes',
      'fr': 'Paramètres',
    },
  },
  // Pincode
  {
    '19ovuo8h': {
      'en': 'Not your account? ',
      'af': 'Nie jou rekening nie?',
      'es': '¿No es tu cuenta?',
      'fr': 'Pas votre compte ?',
    },
    'p7ni669o': {
      'en': 'Logout',
      'af': 'Teken uit',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    'cbh0ic05': {
      'en': 'Profile',
      'af': 'Profiel',
      'es': 'Perfil',
      'fr': 'Profil',
    },
  },
  // Biometric
  {
    '8cbh7wnj': {
      'en': 'Biometrics',
      'af': 'Biometrie',
      'es': 'Biometría',
      'fr': 'Biométrie',
    },
    '7pxui478': {
      'en': 'Biometrics',
      'af': 'Biometrie',
      'es': 'Biometría',
      'fr': 'Biométrie',
    },
    's1vgm8ze': {
      'en': 'Activate FaceID or Biometrics',
      'af': 'Aktiveer FaceID of Biometrie',
      'es': 'Activar FaceID o Biometría',
      'fr': 'Activer FaceID ou la biométrie',
    },
    'c3hww3zn': {
      'en': 'Settings',
      'af': 'Instellings',
      'es': 'Ajustes',
      'fr': 'Paramètres',
    },
  },
  // DeleteAccount
  {
    'zv3d1d2c': {
      'en': 'Delete Account',
      'af': 'Skrap rekening',
      'es': 'Borrar cuenta',
      'fr': 'Supprimer le compte',
    },
    '3xkx92c8': {
      'en': 'Before your close your account',
      'af': 'Voordat jy jou rekening sluit',
      'es': 'Antes de cerrar tu cuenta',
      'fr': 'Avant de fermer votre compte',
    },
    '6jiqjcl6': {
      'en':
          'Hello there! Why are you here? Do you want your account deleted or deactivated? If so, please be sure to utilize any funds you have in your wallet to buy any of our products before making the request. If your closure request is approved, you won\'t be able to sign in again, and any funds in your wallet will be gone. This decision cannot be reversed.',
      'af':
          'Hallo daar! Hoekom is jy hier? Wil jy hê jou rekening moet uitgevee of gedeaktiveer word? Indien wel, maak asseblief seker dat u enige fondse wat u in u beursie het, gebruik om enige van ons produkte te koop voordat u die versoek rig. As jou sluitingsversoek goedgekeur word, sal jy nie weer kan aanmeld nie, en enige fondse in jou beursie sal weg wees. Hierdie besluit kan nie omgekeer word nie.',
      'es':
          '¡Hola! ¿Por qué estás aquí? ¿Quieres que tu cuenta sea eliminada o desactivada? Si es así, asegúrese de utilizar todos los fondos que tenga en su billetera para comprar cualquiera de nuestros productos antes de realizar la solicitud. Si se aprueba su solicitud de cierre, no podrá volver a iniciar sesión y todos los fondos de su billetera desaparecerán. Esta decisión no se puede revertir.',
      'fr':
          'Bonjour! Pourquoi es-tu ici? Souhaitez-vous que votre compte soit supprimé ou désactivé ? Si tel est le cas, assurez-vous d\'utiliser tous les fonds dont vous disposez dans votre portefeuille pour acheter l\'un de nos produits avant de faire la demande. Si votre demande de fermeture est approuvée, vous ne pourrez plus vous reconnecter et tous les fonds de votre portefeuille disparaîtront. Cette décision ne peut être annulée.',
    },
    'tvl0227q': {
      'en': 'Settings',
      'af': 'Instellings',
      'es': 'Ajustes',
      'fr': 'Paramètres',
    },
  },
  // ResetSecurityPin
  {
    'ezvrutmi': {
      'en': 'Confirm your email address',
      'af': 'Bevestig U E-Posadres',
      'es': 'Confirme su dirección de correo electrónico',
      'fr': 'Confirmez votre adresse email',
    },
    'jbmqcu7c': {
      'en':
          'We will send a code to your registered email to confirm the change',
      'af':
          'Ons sal \'n kode na jou geregistreerde e-pos stuur om die verandering te bevestig',
      'es':
          'Le enviaremos un código a su correo electrónico registrado para confirmar el cambio.',
      'fr':
          'Nous enverrons un code à votre adresse e-mail enregistrée pour confirmer le changement',
    },
    'hbvq7128': {
      'en': 'Resend code',
      'af': 'Herstuur kode',
      'es': 'Reenviar codigo',
      'fr': 'Renvoyer le code',
    },
    '48vobcap': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ListOfEmailTemplates
  {
    'zu85yew2': {
      'en': 'Email Templates',
      'af': 'E-pos sjablone',
      'es': 'Plantillas de correo electrónico',
      'fr': 'Modèles d\'e-mails',
    },
    '2e3dhv5n': {
      'en': 'Email Settings',
      'af': 'E-posinstellings',
      'es': 'Ajustes del correo electrónico',
      'fr': 'Paramètres de messagerie',
    },
    '0z9y2pwi': {
      'en': 'Template Name',
      'af': 'Sjabloon Naam',
      'es': 'Nombre de la plantilla',
      'fr': 'Nom du modèle',
    },
    'ik2m1xn6': {
      'en': 'Type',
      'af': 'Tik',
      'es': 'Tipo',
      'fr': 'Taper',
    },
    'xysxk0an': {
      'en': 'Recipient(s)\t',
      'af': 'Ontvanger(s)',
      'es': 'Destinatario(s)',
      'fr': 'Destinataire(s)',
    },
    'fhgqik0m': {
      'en': 'Action',
      'af': 'Aksie',
      'es': 'Acción',
      'fr': 'Action',
    },
    '6nt8i6bg': {
      'en': 'Preview',
      'af': 'Voorskou',
      'es': 'Avance',
      'fr': 'Aperçu',
    },
    'bx7ka53d': {
      'en': 'Manage',
      'af': 'Bestuur',
      'es': 'Administrar',
      'fr': 'Gérer',
    },
    'gja4z0c9': {
      'en': 'Delete',
      'af': 'Vee uit',
      'es': 'Borrar',
      'fr': 'Supprimer',
    },
    '20efk6r9': {
      'en': 'Send Test',
      'af': 'Stuur toets',
      'es': 'Enviar prueba',
      'fr': 'Envoyer le test',
    },
    '6pmpkf33': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Permissions
  {
    'g79vyi6e': {
      'en': 'Roles and Permissions',
      'af': 'Rolle en Toestemmings',
      'es': 'Roles y permisos',
      'fr': 'Rôles et autorisations',
    },
    'abfhuupi': {
      'en': 'Roles and Permissions',
      'af': 'Rolle en Toestemmings',
      'es': 'Roles y permisos',
      'fr': 'Rôles et autorisations',
    },
    'djytbg22': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // LoginSms
  {
    '0cflz9xy': {
      'en': 'Log in via Sms',
      'af': 'Meld aan via sms',
      'es': 'Iniciar sesión vía SMS',
      'fr': 'Connectez-vous par SMS',
    },
    'oj3poegf': {
      'en': 'Forget your password? ',
      'af': 'Vergeet jou wagwoord?',
      'es': '¿Olvidaste tu contraseña?',
      'fr': 'Mot de passe oublié?',
    },
    'p1dbt4su': {
      'en': 'Reset it here',
      'af': 'Stel dit hier terug',
      'es': 'Restablecerlo aquí',
      'fr': 'Réinitialisez-le ici',
    },
    'joel7jtt': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // VerifySMSOTP
  {
    '2zrynfcs': {
      'en': 'Verify your Phone Number',
      'af': 'Verifieer jou foonnommer',
      'es': 'Verifica tu numero de telefono',
      'fr': 'Vérifiez votre numéro de téléphone',
    },
    'hv3spon8': {
      'en': 'Wrong number?',
      'af': 'Verkeerde nommer?',
      'es': '¿Número equivocado?',
      'fr': 'Mauvais numéro?',
    },
    'dhw7pppi': {
      'en': 'Didn\'t received the OTP?',
      'af': 'Het u nie die OTP ontvang nie?',
      'es': '¿No recibiste la OTP?',
      'fr': 'Vous n\'avez pas reçu l\'OTP ?',
    },
    'ixcrkktj': {
      'en': 'Resend Code',
      'af': 'Herstuur kode',
      'es': 'Reenviar codigo',
      'fr': 'Renvoyer le code',
    },
    'smfkfj7v': {
      'en': 'Pin code is required',
      'af': 'Pinkode word vereis',
      'es': 'Se requiere código PIN',
      'fr': 'Le code PIN est requis',
    },
    'ivdvbm12': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // RegisterSms
  {
    'afrkirbs': {
      'en': 'Sign up with your Phone Number',
      'af': 'Sluit aan met jou foonnommer',
      'es': 'Regístrate con tu número de teléfono',
      'fr': 'Inscrivez-vous avec votre numéro de téléphone',
    },
    'r4uvquxq': {
      'en': 'Already have an account? ',
      'af': 'Reeds \'n rekening?',
      'es': '¿Ya tienes una cuenta?',
      'fr': 'Vous avez déjà un compte?',
    },
    'q236mrnh': {
      'en': 'Sign in',
      'af': 'Meld aan',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
    },
    'ptxjo6bj': {
      'en': 'Firstname is required',
      'af': 'Voornaam word vereis',
      'es': 'Se requiere el primer nombre',
      'fr': 'Le prénom est requis',
    },
    'w7mo88xq': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '7kwe6ysg': {
      'en': 'Lastname is required',
      'af': 'Van word vereis',
      'es': 'El apellido es obligatorio',
      'fr': 'Le nom de famille est obligatoire',
    },
    'hurglgq6': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'zeht3qwe': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'liloobf8': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'i0mb4gd1': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '7kzp75i4': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '86lwuvi7': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '1tw1dvwd': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '0zlwagmm': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '27aso85h': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'di9lg71x': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '6zm6i3ac': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '4hzvnlj8': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'f8fig42n': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'p0w7lpcl': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Links
  {
    'biipgjfi': {
      'en': 'Connect your App Store & Web',
      'af': 'Koppel jou App Store en Web',
      'es': 'Conecte su App Store y Web',
      'fr': 'Connectez votre App Store et votre Web',
    },
    'acojserg': {
      'en':
          'Please provide your Web App URL, Apple App Store URL, Google Play Store URL, Mac OS App Store URL, Windows Store App URL, and Linux Store URL in the links below. \n\nEnsure you test all download links on different devices and browsers to guarantee they work correctly. \n\nPlease note that we are currently working on supporting Mac OS App Store, Windows Store, and Linux Store URLs, and these platforms are not fully supported yet. \n\nRemember to keep these links updated whenever you release a new version of your app or if your app\'s URLs change.',
      'af':
          'Verskaf asseblief jou webtoepassings-URL, Apple-toepassingswinkel-URL, Google Play Winkel-URL, Mac OS-toepassingswinkel-URL, Windows Winkel-toepassings-URL en Linux Winkel-URL in die skakels hieronder.\n\nMaak seker dat jy alle aflaaiskakels op verskillende toestelle en blaaiers toets om te verseker dat hulle korrek werk.\n\nNeem asseblief kennis dat ons tans besig is om Mac OS App Store, Windows Store en Linux Store URL\'s te ondersteun, en hierdie platforms word nog nie ten volle ondersteun nie.\n\nOnthou om hierdie skakels bygewerk te hou wanneer jy ook al \'n nuwe weergawe van jou program vrystel of as jou program se URL\'e verander.',
      'es':
          'Proporcione la URL de su aplicación web, la URL de la tienda de aplicaciones de Apple, la URL de la tienda de Google Play, la URL de la tienda de aplicaciones de Mac OS, la URL de la tienda de Windows y la URL de la tienda de Linux en los enlaces siguientes.\n\nAsegúrese de probar todos los enlaces de descarga en diferentes dispositivos y navegadores para garantizar que funcionen correctamente.\n\nTenga en cuenta que actualmente estamos trabajando para admitir las URL de Mac OS App Store, Windows Store y Linux Store, y estas plataformas aún no son totalmente compatibles.\n\nRecuerde mantener estos enlaces actualizados cada vez que publique una nueva versión de su aplicación o si las URL de su aplicación cambian.',
      'fr':
          'Veuillez fournir l\'URL de votre application Web, l\'URL de l\'App Store Apple, l\'URL du Google Play Store, l\'URL de l\'App Store Mac OS, l\'URL de l\'application Windows Store et l\'URL de la boutique Linux dans les liens ci-dessous.\n\nAssurez-vous de tester tous les liens de téléchargement sur différents appareils et navigateurs pour garantir qu\'ils fonctionnent correctement.\n\nVeuillez noter que nous travaillons actuellement sur la prise en charge des URL du Mac OS App Store, du Windows Store et du Linux Store, et que ces plates-formes ne sont pas encore entièrement prises en charge.\n\nN\'oubliez pas de maintenir ces liens à jour chaque fois que vous publiez une nouvelle version de votre application ou si les URL de votre application changent.',
    },
    'rbhhugxt': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ListOfPosts
  {
    '37hmnndh': {
      'en': 'Posts',
      'af': 'Plasings',
      'es': 'Publicaciones',
      'fr': 'Des postes',
    },
    '64e7jjmv': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Themes
  {
    'hvfg038o': {
      'en': 'Themes',
      'af': 'Temas',
      'es': 'Temas',
      'fr': 'Thèmes',
    },
    'enwrtfy5': {
      'en': 'Orders',
      'af': 'Bestellings',
      'es': 'Pedidos',
      'fr': 'Ordres',
    },
  },
  // CreateDataBundle
  {
    'nabx7ldb': {
      'en': 'Buy Data Bundle',
      'af': 'Koop databundel',
      'es': 'Comprar paquete de datos',
      'fr': 'Acheter un forfait de données',
    },
    '6k6btq5n': {
      'en': 'Network Provider',
      'af': 'Netwerkverskaffer',
      'es': 'Proveedor de red',
      'fr': 'Fournisseur de réseau',
    },
    'bk6022a6': {
      'en': 'Phone Number',
      'af': 'Telefoon nommer',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
    },
    'apouyzfi': {
      'en': 'Recipient',
      'af': 'Ontvanger',
      'es': 'Recipiente',
      'fr': 'Destinataire',
    },
    'nxd58y8o': {
      'en': '08123456789',
      'af': '08123456789',
      'es': '08123456789',
      'fr': '08123456789',
    },
    'xz9az4ow': {
      'en': 'Type of Service',
      'af': 'Tipe diens',
      'es': 'Tipo de servicio',
      'fr': 'Type de service',
    },
    'vopcxrwv': {
      'en': 'Provider',
      'af': 'Verskaffer',
      'es': 'Proveedor',
      'fr': 'Fournisseur',
    },
    '7mlhmgfa': {
      'en': 'Biller Code',
      'af': 'Biller kode',
      'es': 'Código de facturador',
      'fr': 'Code de facturation',
    },
    '2yiiceob': {
      'en': 'Item Code',
      'af': 'Itemkode',
      'es': 'Código del objeto',
      'fr': 'Code de l\'article',
    },
    'jpn9svwv': {
      'en': 'Short Name',
      'af': 'Kort naam',
      'es': 'Nombre corto',
      'fr': 'Nom court',
    },
    '64mlqx59': {
      'en': 'Provider Fee',
      'af': 'Verskaffersfooi',
      'es': 'Tarifa del proveedor',
      'fr': 'Frais du fournisseur',
    },
    '1rl4mjsa': {
      'en': 'Country',
      'af': 'Land',
      'es': 'País',
      'fr': 'Pays',
    },
    'cvxkffdk': {
      'en': 'Currency\n',
      'af': 'Geldeenheid',
      'es': 'Divisa',
      'fr': 'Devise',
    },
    '2y2wz5pd': {
      'en': 'Price',
      'af': 'Prys',
      'es': 'Precio',
      'fr': 'Prix',
    },
    'hcrrpsjs': {
      'en': 'Choose your network provider',
      'af': 'Kies jou netwerkverskaffer',
      'es': 'Elija su proveedor de red',
      'fr': 'Choisissez votre fournisseur de réseau',
    },
    'klv9t5jd': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'plmpt8ml': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'esd3gubi': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'cb2hq5tc': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'owtzuh87': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'agnog0dv': {
      'en': 'Chose your package',
      'af': 'Kies jou pakket',
      'es': 'Elige tu paquete',
      'fr': 'Choisissez votre forfait',
    },
    'ftsqmpa2': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'uanxzugc': {
      'en': 'Phone number is required',
      'af': 'Telefoonnommer word vereis',
      'es': 'Se requiere número de teléfono',
      'fr': 'Le numéro de téléphone est requis',
    },
    'xao91d62': {
      'en': 'Phone number must be 11 digits long',
      'af': 'Telefoonnommer moet 11 syfers lank wees',
      'es': 'El número de teléfono debe tener 11 dígitos',
      'fr': 'Le numéro de téléphone doit comporter 11 chiffres',
    },
    'z6gosnir': {
      'en': 'Phone number must be 11 digits long',
      'af': 'Telefoonnommer moet 11 syfers lank wees',
      'es': 'El número de teléfono debe tener 11 dígitos',
      'fr': 'Le numéro de téléphone doit comporter 11 chiffres',
    },
    'h31ppk6e': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '7z6mrhc3': {
      'en': 'Amount is required',
      'af': 'Bedrag word vereis',
      'es': 'Se requiere cantidad',
      'fr': 'Le montant est requis',
    },
    'oyd1228j': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'kumd11h6': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // DoorWayEditor
  {
    'l7o2ss5w': {
      'en': 'Undo your design',
      'af': 'Ontdoen jou ontwerp',
      'es': 'Deshacer tu diseño',
      'fr': 'Annulez votre conception',
    },
    '7eexa0at': {
      'en': 'Undo your design',
      'af': 'Ontdoen jou ontwerp',
      'es': 'Deshacer tu diseño',
      'fr': 'Annulez votre conception',
    },
    '26yv7f88': {
      'en': '[Hello DoorWay Editor]',
      'af': '[Hallo DoorWay Editor]',
      'es': '[Hola editor de DoorWay]',
      'fr': '[Bonjour l\'éditeur de DoorWay]',
    },
    'e97r40z3': {
      'en': 'Desktop view',
      'af': 'Desktop-aansig',
      'es': 'Vista de escritorio',
      'fr': 'Vue du bureau',
    },
    '2ux7102p': {
      'en': 'Tablet view',
      'af': 'Tabletaansig',
      'es': 'Vista de tableta',
      'fr': 'Vue tablette',
    },
    'ihx0kkx4': {
      'en': 'Mobile view',
      'af': 'Mobiele aansig',
      'es': 'Vista móvil',
      'fr': 'Vue mobile',
    },
    'ylddn36g': {
      'en': 'Undo your design',
      'af': 'Ontdoen jou ontwerp',
      'es': 'Deshacer tu diseño',
      'fr': 'Annulez votre conception',
    },
    '94znh7dv': {
      'en': 'Redo your design',
      'af': 'Herhaal jou ontwerp',
      'es': 'Rehace tu diseño',
      'fr': 'Refaites votre conception',
    },
    '5m0sotnr': {
      'en': 'Redo your design',
      'af': 'Herhaal jou ontwerp',
      'es': 'Rehace tu diseño',
      'fr': 'Refaites votre conception',
    },
    'msu32gzh': {
      'en': 'Basic',
      'af': 'Basies',
      'es': 'Básico',
      'fr': 'Basique',
    },
    'wjr5yl8o': {
      'en': 'Media',
      'af': 'Media',
      'es': 'Medios de comunicación',
      'fr': 'Médias',
    },
    'fwj2p4dj': {
      'en': 'Layout',
      'af': 'Uitleg',
      'es': 'Disposición',
      'fr': 'Mise en page',
    },
    'oof9tr7d': {
      'en': 'Advance',
      'af': 'Bevorder',
      'es': 'Avance',
      'fr': 'Avance',
    },
    '3k94l573': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ChatPage
  {
    'qpka78ab': {
      'en': 'Hello World',
      'af': 'Hello Wêreld',
      'es': 'Hola Mundo',
      'fr': 'Bonjour le monde',
    },
    'twkpg6yv': {
      'en': 'Group Chat',
      'af': 'Groepklets',
      'es': 'Grupo de chat',
      'fr': 'Discussion de groupe',
    },
  },
  // ListOfChats
  {
    'r04lksoj': {
      'en': 'All Chats',
      'af': 'Alle geselsies',
      'es': 'Todos los chats',
      'fr': 'Toutes les discussions',
    },
  },
  // CreateChat
  {
    'y5pn506n': {
      'en': 'Add Users to Chat',
      'af': 'Voeg gebruikers by Chat',
      'es': 'Agregar usuarios al chat',
      'fr': 'Ajouter des utilisateurs au chat',
    },
    'm7g1dm3n': {
      'en': 'Select the users to add to chat.',
      'af': 'Kies die gebruikers om by klets te voeg.',
      'es': 'Seleccione los usuarios para agregar al chat.',
      'fr': 'Sélectionnez les utilisateurs à ajouter au chat.',
    },
  },
  // CreateGroupChat
  {
    'c5gzyyx5': {
      'en': 'Create Group Chat',
      'af': 'Skep Groepklets',
      'es': 'Crear chat grupal',
      'fr': 'Créer une discussion de groupe',
    },
    'fw6jr2t8': {
      'en': 'Select the friends to add to chat.',
      'af': 'Kies die vriende om by klets te voeg.',
      'es': 'Seleccione los amigos para agregar al chat.',
      'fr': 'Sélectionnez les amis à ajouter au chat.',
    },
    '2av1dko5': {
      'en': 'Create Chat',
      'af': 'Skep Chat',
      'es': 'Crear chat',
      'fr': 'Créer une discussion',
    },
  },
  // ManageRecipeints
  {
    '64zvehmr': {
      'en': 'Manage Recipeints',
      'af': 'Bestuur resepte',
      'es': 'Administrar recetas',
      'fr': 'Gérer les recettes',
    },
    '64r4dq64': {
      'en':
          'Manage recipients effortlessly! Enable or disable various types like Phone Numbers, Meter Numbers, Smart Card Numbers, and more, according to your needs.',
      'af':
          'Bestuur ontvangers moeiteloos! Aktiveer of deaktiveer verskeie tipes soos telefoonnommers, meternommers, slimkaartnommers en meer, volgens jou behoeftes.',
      'es':
          '¡Administre destinatarios sin esfuerzo! Habilite o deshabilite varios tipos, como números de teléfono, números de medidor, números de tarjetas inteligentes y más, según sus necesidades.',
      'fr':
          'Gérez les destinataires sans effort ! Activez ou désactivez différents types tels que les numéros de téléphone, les numéros de compteur, les numéros de carte à puce, etc., en fonction de vos besoins.',
    },
    'r3alxjzm': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // SetupApplication2
  {
    '2b02l34i': {
      'en': 'DoorWay',
      'af': 'Deurpad',
      'es': 'Puerta',
      'fr': 'Porte',
    },
    'altmswth': {
      'en': 'Restart',
      'af': 'Begin oor',
      'es': 'Reanudar',
      'fr': 'Redémarrage',
    },
    'rafi6v6t': {
      'en':
          'Preparation Steps: Firebase Account Setup and FlutterFlow Configuration',
      'af':
          'Voorbereidingsstappe: Firebase-rekeningopstelling en FlutterFlow-konfigurasie',
      'es':
          'Pasos de preparación: configuración de la cuenta de Firebase y configuración de FlutterFlow',
      'fr':
          'Étapes de préparation : configuration du compte Firebase et configuration de FlutterFlow',
    },
    'u9ifakcq': {
      'en':
          'Before proceeding, kindly ensure you have set up an account with Firebase and configured your app within the FlutterFlow platform. This step is essential for a smooth app creation process. Thank you!',
      'af':
          'Voordat jy voortgaan, maak asseblief seker dat jy \'n rekening by Firebase opgestel het en jou toepassing binne die FlutterFlow-platform opgestel het. Hierdie stap is noodsaaklik vir \'n gladde programskeppingsproses. Dankie!',
      'es':
          'Antes de continuar, asegúrese de haber configurado una cuenta con Firebase y configurado su aplicación dentro de la plataforma FlutterFlow. Este paso es esencial para un proceso de creación de aplicaciones sin problemas. ¡Gracias!',
      'fr':
          'Avant de continuer, assurez-vous d\'avoir créé un compte avec Firebase et configuré votre application sur la plateforme FlutterFlow. Cette étape est essentielle pour un processus de création d’application fluide. Merci!',
    },
    'm017luak': {
      'en': 'Firebase Account Setup:',
      'af': 'Firebase-rekeningopstelling:',
      'es': 'Configuración de la cuenta de Firebase:',
      'fr': 'Configuration du compte Firebase :',
    },
    '3szrjs84': {
      'en':
          '1) Go to the Firebase website.\n2) Sign in or create a new account.\n3) Create a new Firebase project.\n4) Configure Firebase authentication, database, and storage according to your app\'s needs.\n',
      'af':
          '1) Gaan na die Firebase-webwerf.\n2) Meld aan of skep \'n nuwe rekening.\n3) Skep \'n nuwe Firebase-projek.\n4) Stel Firebase-stawing, databasis en berging op volgens jou program se behoeftes.',
      'es':
          '1) Vaya al sitio web de Firebase.\n2) Inicia sesión o crea una cuenta nueva.\n3) Crea un nuevo proyecto de Firebase.\n4) Configure la autenticación, la base de datos y el almacenamiento de Firebase según las necesidades de su aplicación.',
      'fr':
          '1) Accédez au site Web Firebase.\n2) Connectez-vous ou créez un nouveau compte.\n3) Créez un nouveau projet Firebase.\n4) Configurez l\'authentification, la base de données et le stockage Firebase en fonction des besoins de votre application.',
    },
    'fxtcdo4m': {
      'en': 'FlutterFlow Configuration:',
      'af': 'FlutterFlow-konfigurasie:',
      'es': 'Configuración de FlutterFlow:',
      'fr': 'Configuration FlutterFlow :',
    },
    '52jtzaa9': {
      'en':
          '1) Log in to your FlutterFlow account.\n2) Create a new project or open an existing one.\n3) Connect your Firebase project by entering your Firebase credentials.\n4) Design your app\'s UI and functionality using FlutterFlow\'s drag-and-drop interface.\n5) Test your app to ensure Firebase integration is working correctly.\n6) Deploy your app when you\'re ready for it to go live.',
      'af':
          '1) Meld aan by jou FlutterFlow-rekening.\n2) Skep \'n nuwe projek of maak \'n bestaande een oop.\n3) Koppel jou Firebase-projek deur jou Firebase-eiebewyse in te voer.\n4) Ontwerp jou toepassing se UI en funksionaliteit deur FlutterFlow se sleep-en-los koppelvlak te gebruik.\n5) Toets jou program om te verseker dat Firebase-integrasie reg werk.\n6) Ontplooi jou toepassing wanneer jy gereed is om dit regstreeks te laat gaan.',
      'es':
          '1) Inicie sesión en su cuenta FlutterFlow.\n2) Cree un nuevo proyecto o abra uno existente.\n3) Conecte su proyecto de Firebase ingresando sus credenciales de Firebase.\n4) Diseñe la interfaz de usuario y la funcionalidad de su aplicación utilizando la interfaz de arrastrar y soltar de FlutterFlow.\n5) Pruebe su aplicación para asegurarse de que la integración de Firebase funcione correctamente.\n6) Implemente su aplicación cuando esté listo para su lanzamiento.',
      'fr':
          '1) Connectez-vous à votre compte FlutterFlow.\n2) Créez un nouveau projet ou ouvrez-en un existant.\n3) Connectez votre projet Firebase en saisissant vos identifiants Firebase.\n4) Concevez l\'interface utilisateur et les fonctionnalités de votre application à l\'aide de l\'interface glisser-déposer de FlutterFlow.\n5) Testez votre application pour vous assurer que l\'intégration de Firebase fonctionne correctement.\n6) Déployez votre application lorsque vous êtes prêt à la mettre en ligne.',
    },
    'rgj52nk7': {
      'en': 'Yes, I have completed the setup.',
      'af': 'Ja, ek het die opstelling voltooi.',
      'es': 'Sí, he completado la configuración.',
      'fr': 'Oui, j\'ai terminé la configuration.',
    },
    'pw5n0gei': {
      'en': 'Application Details',
      'af': 'Aansoekbesonderhede',
      'es': 'Detalles de la aplicación',
      'fr': 'Détails de la demande',
    },
    'byzs6kuw': {
      'en': 'Please fill in the application details below.',
      'af': 'Vul asseblief die aansoekbesonderhede hieronder in.',
      'es': 'Complete los detalles de la solicitud a continuación.',
      'fr': 'Veuillez remplir les détails de la candidature ci-dessous.',
    },
    'vpl21ohh': {
      'en': 'Owner Information & First User Details',
      'af': 'Eienaarinligting en eerste gebruikerbesonderhede',
      'es': 'Información del propietario y detalles del primer usuario',
      'fr':
          'Informations sur le propriétaire et détails du premier utilisateur',
    },
    'dmjuwq7y': {
      'en':
          'You are the first user and owner of this application. Please provide your information below to get started.',
      'af':
          'Jy is die eerste gebruiker en eienaar van hierdie toepassing. Verskaf asseblief jou inligting hieronder om te begin.',
      'es':
          'Eres el primer usuario y propietario de esta aplicación. Proporcione su información a continuación para comenzar.',
      'fr':
          'Vous êtes le premier utilisateur et propriétaire de cette application. Veuillez fournir vos informations ci-dessous pour commencer.',
    },
    'qkwqimau': {
      'en': 'Back to App Information?',
      'af': 'Terug na programinligting?',
      'es': '¿Volver a la información de la aplicación?',
      'fr': 'Retour aux informations sur l\'application ?',
    },
    '1xn5jd6h': {
      'en': 'Install DoorWay',
      'af': 'Installeer DoorWay',
      'es': 'Instalar puerta',
      'fr': 'Installer DoorWay',
    },
    'ts83qqzu': {
      'en': 'You\'re moments away from creating your app.',
      'af': 'Jy is oomblikke weg van die skep van jou toepassing.',
      'es': 'Estás a unos minutos de crear tu aplicación.',
      'fr': 'Vous êtes sur le point de créer votre application.',
    },
    '2kg0bc48': {
      'en': 'Back',
      'af': 'Terug',
      'es': 'Atrás',
      'fr': 'Dos',
    },
    'iz587t3z': {
      'en': 'Installation Completed',
      'af': 'Installasie voltooi',
      'es': 'Instalación completa',
      'fr': 'Installation terminée',
    },
    'dkqi1dcp': {
      'en':
          'Your app is now ready. Click the button below to access your dashboard and start exploring the powerful features of your new application.',
      'af':
          'Jou toepassing is nou gereed. Klik op die knoppie hieronder om toegang tot jou kontroleskerm te kry en die kragtige kenmerke van jou nuwe toepassing te begin verken.',
      'es':
          'Tu aplicación ya está lista. Haga clic en el botón a continuación para acceder a su panel y comenzar a explorar las potentes funciones de su nueva aplicación.',
      'fr':
          'Votre application est maintenant prête. Cliquez sur le bouton ci-dessous pour accéder à votre tableau de bord et commencer à explorer les puissantes fonctionnalités de votre nouvelle application.',
    },
    'xmble5ka': {
      'en': 'Seamless Installation',
      'af': 'Naatlose installasie',
      'es': 'Instalación perfecta',
      'fr': 'Installation transparente',
    },
    'okldhne9': {
      'en':
          'Effortlessly set up our user-friendly bill payment system. Enjoy quick integration, secure transactions, and a hassle-free experience for both you and your users. Get started today!',
      'af':
          'Stel ons gebruikersvriendelike rekeningbetalingstelsel moeiteloos op. Geniet vinnige integrasie, veilige transaksies en \'n moeitevrye ervaring vir beide jou en jou gebruikers. Begin vandag!',
      'es':
          'Configure sin esfuerzo nuestro sistema de pago de facturas fácil de usar. Disfrute de una integración rápida, transacciones seguras y una experiencia sin complicaciones tanto para usted como para sus usuarios. ¡Empiece hoy!',
      'fr':
          'Configurez sans effort notre système de paiement de factures convivial. Profitez d\'une intégration rapide, de transactions sécurisées et d\'une expérience sans tracas pour vous et vos utilisateurs. Commencer aujourd\'hui!',
    },
  },
  // ManageAds
  {
    'xupohahn': {
      'en': 'Manage your App Ads',
      'af': 'E-pos sjablone',
      'es': 'Plantillas de correo electrónico',
      'fr': 'Modèles d\'e-mails',
    },
    '5qonxrtp': {
      'en':
          'Empower your app\'s success! Start creating and managing text and image-based ads, enhancing visibility and engagement. Remember, these ads will exclusively appear on your users\' dashboards. Elevate your app\'s impact!',
      'af': '',
      'es': '',
      'fr': '',
    },
    '9rpkts68': {
      'en': 'Ads Name',
      'af': 'Sjabloon Naam',
      'es': 'Nombre de la plantilla',
      'fr': 'Nom du modèle',
    },
    'vttnu7ao': {
      'en': 'Type',
      'af': 'Tik',
      'es': 'Tipo',
      'fr': 'Taper',
    },
    'kbe7o8wa': {
      'en': 'Date',
      'af': 'Ontvanger(s)',
      'es': 'Destinatario(s)',
      'fr': 'Destinataire(s)',
    },
    'zcmiogsu': {
      'en': 'Action',
      'af': 'Aksie',
      'es': 'Acción',
      'fr': 'Action',
    },
    'nv0ttfch': {
      'en': 'Preview',
      'af': 'Voorskou',
      'es': 'Avance',
      'fr': 'Aperçu',
    },
    '9qgf6we8': {
      'en': 'Update',
      'af': 'Bestuur',
      'es': 'Administrar',
      'fr': 'Gérer',
    },
    'bvstlmqa': {
      'en': 'Delete',
      'af': 'Vee uit',
      'es': 'Borrar',
      'fr': 'Supprimer',
    },
    '236canuv': {
      'en': 'Delete',
      'af': 'Stuur toets',
      'es': 'Enviar prueba',
      'fr': 'Envoyer le test',
    },
    'wzzo1lkr': {
      'en': 'Delete this Ads',
      'af': 'Vee hierdie advertensies uit',
      'es': 'Eliminar estos anuncios',
      'fr': 'Supprimer cette annonce',
    },
    'cb8r4480': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // OrderBarcodeDetail
  {
    'sfwl2uuy': {
      'en': 'Tips on how to deposit',
      'af': 'Wenke oor hoe om te deponeer',
      'es': 'Consejos sobre cómo depositar',
      'fr': 'Conseils sur la façon de déposer',
    },
    'katcy7di': {
      'en':
          'To deposit, copy the wallet below or use the barcode, and make sure you send funds to the right network and use priority.',
      'af':
          'Om te deponeer, kopieer die beursie hieronder of gebruik die strepieskode, en maak seker dat jy fondse na die regte netwerk stuur en prioriteit gebruik.',
      'es':
          'Para depositar, copie la billetera a continuación o use el código de barras, y asegúrese de enviar fondos a la red correcta y usar la prioridad.',
      'fr':
          'Pour déposer, copiez le portefeuille ci-dessous ou utilisez le code-barres, et assurez-vous d\'envoyer des fonds au bon réseau et d\'utiliser la priorité.',
    },
    'q3wwmj46': {
      'en': 'Network',
      'af': 'Netwerk',
      'es': 'Red',
      'fr': 'Réseau',
    },
  },
  // ConfirmOrder
  {
    'y8h0ingo': {
      'en':
          'Please confirm the recipient information before submitting this order and keep in mind that order submitted may not be reversed.',
      'af':
          'Bevestig asseblief die begunstigde-inligting voordat u hierdie bestelling indien en hou in gedagte dat bestelling wat ingedien word nie omgekeer mag word nie.',
      'es':
          'Confirme la información del beneficiario antes de enviar este pedido y tenga en cuenta que el pedido enviado no se puede revertir.',
      'fr':
          'Veuillez confirmer les informations sur le bénéficiaire avant de soumettre cette commande et gardez à l\'esprit que la commande soumise ne peut pas être annulée.',
    },
    'n1endo4c': {
      'en': 'Bank Name',
      'af': 'Bank Naam',
      'es': 'Nombre del banco',
      'fr': 'Nom de banque',
    },
    'ix92gsuw': {
      'en': 'Account Number',
      'af': 'Rekening nommer',
      'es': 'Número de cuenta',
      'fr': 'Numéro de compte',
    },
    'rzd2h9ta': {
      'en': 'Account Name',
      'af': 'Rekeningnaam',
      'es': 'Nombre de la cuenta',
      'fr': 'Nom du compte',
    },
  },
  // DWHeader
  {
    'b4yxua96': {
      'en': 'View Homepage',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // ListOfCryptoOrderComp
  {
    'g2k4eu00': {
      'en': 'Date',
      'af': 'Datum',
      'es': 'Fecha',
      'fr': 'Date',
    },
    'qq01s266': {
      'en': 'Type',
      'af': 'Tik',
      'es': 'Tipo',
      'fr': 'Taper',
    },
    '41slxolw': {
      'en': 'Tendered',
      'af': 'Tender',
      'es': 'licitado',
      'fr': 'Soumis',
    },
    'ci0hmlj4': {
      'en': 'Received',
      'af': 'Ontvang',
      'es': 'Recibió',
      'fr': 'Reçu',
    },
    'mqws5yks': {
      'en': 'Reference',
      'af': 'Verwysing',
      'es': 'Referencia',
      'fr': 'Référence',
    },
    'pskmvtjf': {
      'en': 'Status',
      'af': 'Status',
      'es': 'Estado',
      'fr': 'Statut',
    },
  },
  // ChooseRecipient
  {
    'vp7qqy73': {
      'en': 'Search',
      'af': 'Soek',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
  },
  // Header-Abuja
  {
    'c7z1ft9c': {
      'en':
          'With our new app, trading is now simple. More information can be found by',
      'af':
          'Met ons nuwe toepassing is handel nou eenvoudig. Meer inligting kan gevind word by',
      'es':
          'Con nuestra nueva aplicación, el comercio ahora es simple. Se puede encontrar más información por',
      'fr':
          'Avec notre nouvelle application, le trading est désormais simple. Plus d\'informations peuvent être trouvées par',
    },
    'hbbetpg8': {
      'en': ' clicking here.',
      'af': 'hier te klik.',
      'es': 'haciendo clic aquí.',
      'fr': 'en cliquant ici.',
    },
    'ksfyvhu5': {
      'en': 'Dashboard',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // Footer-Abuja
  {
    'tizom5ez': {
      'en': 'Get Started for Free ',
      'af': 'Begin dit is gratis',
      'es': 'Comience es gratis',
      'fr': 'Commencez c\'est gratuit',
    },
    'cbb7mxzn': {
      'en':
          'Get started now and embark on a seamless and rewarding trading adventure with us. We are here to simplify the trading process.',
      'af':
          'Begin nou en begin \'n naatlose en lonende handelsavontuur saam met ons. Ons is hier om die handelsproses te vereenvoudig.',
      'es':
          'Comience ahora y embárquese en una aventura comercial fluida y gratificante con nosotros. Estamos aquí para simplificar el proceso de negociación.',
      'fr':
          'Commencez dès maintenant et lancez-vous avec nous dans une aventure commerciale transparente et enrichissante. Nous sommes ici pour simplifier le processus de trading.',
    },
    '3wibf5f3': {
      'en': 'Initiatives',
      'af': 'Inisiatiewe',
      'es': 'Iniciativas',
      'fr': 'Initiatives',
    },
    'h07s0jpd': {
      'en': 'About Us',
      'af': 'Oor ons',
      'es': 'Sobre nosotros',
      'fr': 'À propos de nous',
    },
    'tqhhtt2k': {
      'en': 'Blog',
      'af': 'Blog',
      'es': 'Blog',
      'fr': 'Blog',
    },
    'a62dkmf4': {
      'en': 'Faq',
      'af': 'Gereelde vrae',
      'es': 'Preguntas más frecuentes',
      'fr': 'FAQ',
    },
    '96966e29': {
      'en': 'Legal',
      'af': 'Wettig',
      'es': 'Legal',
      'fr': 'Légal',
    },
    '0ihggri6': {
      'en': 'Terms of Use',
      'af': 'Gebruiksvoorwaardes',
      'es': 'Condiciones de uso',
      'fr': 'Conditions d\'utilisation',
    },
    '00rj32x5': {
      'en': 'Privacy Policy',
      'af': 'Privaatheidsbeleid',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    'xodo4v4h': {
      'en': 'Follow us',
      'af': 'Volg ons',
      'es': 'Síganos',
      'fr': 'Suivez-nous',
    },
    'wkie07fh': {
      'en': 'Facebook',
      'af': 'Facebook',
      'es': 'Facebook',
      'fr': 'Facebook',
    },
    '0twvkf5h': {
      'en': 'Twitter',
      'af': 'Twitter',
      'es': 'Gorjeo',
      'fr': 'Twitter',
    },
    'fe47q7lr': {
      'en': 'Instagram',
      'af': 'Instagram',
      'es': 'Instagram',
      'fr': 'Instagram',
    },
    'x8fx9njo': {
      'en': 'Tiktok',
      'af': 'Tiktok',
      'es': 'Tik Tok',
      'fr': 'TIC Tac',
    },
    'wls7gnk8': {
      'en': 'Contact us',
      'af': 'Kontak Ons',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
    },
    'ay7d0gnw': {
      'en': 'hello@teckaa.com',
      'af': 'hallo@teckaa.com',
      'es': 'hola@teckaa.com',
      'fr': 'hello@teckaa.com',
    },
    '3en2pzhr': {
      'en': '+1234567890',
      'af': '+1234567890',
      'es': '+1234567890',
      'fr': '+1234567890',
    },
    '021ofsci': {
      'en': '+0987654321',
      'af': '+0987654321',
      'es': '+0987654321',
      'fr': '+0987654321',
    },
    'jatatix9': {
      'en': 'Available all on devices',
      'af': 'Beskikbaar beide op die web en op',
      'es': 'Disponible tanto en la web como en',
      'fr': 'Disponible à la fois sur le web et sur',
    },
    'qaxqonu4': {
      'en':
          'Reqra is a crypto vendor, not a bank or fintech, what we do is provide bill payment service. This means that Reqra allows its customers to pay their bills using cryptocurrency.',
      'af':
          'Teckaa Pay is \'n kripto-verskaffer, nie \'n bank of fintech nie. Bankdienste word verskaf deur gelisensieerde bankvennote',
      'es':
          'Teckaa Pay es un proveedor de criptomonedas, no un banco ni una fintech. Los servicios bancarios son proporcionados por socios bancarios autorizados',
      'fr':
          'Teckaa Pay est un fournisseur de crypto, pas une banque ou une fintech. Les services bancaires sont fournis par des partenaires bancaires agréés',
    },
    '4iv0yl3l': {
      'en': 'Language',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // ReadUser
  {
    'odk1uj8v': {
      'en': 'Role',
      'af': '',
      'es': '',
      'fr': '',
    },
    'hsr393c9': {
      'en': 'Phone',
      'af': 'Foon',
      'es': 'Teléfono',
      'fr': 'Téléphone',
    },
    '8y8ib527': {
      'en': 'Email',
      'af': 'E-pos',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'wkwuf5f4': {
      'en': 'Orders',
      'af': 'Bestellings',
      'es': 'Pedidos',
      'fr': 'Ordres',
    },
    '16p21tur': {
      'en': 'Recipients',
      'af': 'Begunstigdes',
      'es': 'Beneficiarios',
      'fr': 'Les bénéficiaires',
    },
    'g08rn76m': {
      'en': 'Bank Details',
      'af': 'Bankbesonderhede',
      'es': 'Detalles del banco',
      'fr': 'Coordonnées bancaires',
    },
    'irulde9j': {
      'en': 'Bank account information',
      'af': 'Bankrekening inligting',
      'es': 'información de cuenta bancaria',
      'fr': 'information de compte bancaire',
    },
    '2qh9mhab': {
      'en': 'Funding',
      'af': '',
      'es': '',
      'fr': '',
    },
    's0q6lc40': {
      'en': 'Account Overview',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ayq99o6n': {
      'en': 'Balance',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // ListOfCategories
  {
    'yylfxlvf': {
      'en': 'Categories Name',
      'af': 'Kat naam',
      'es': 'nombre del gato',
      'fr': 'Nom du chat',
    },
    'vcxj6pzo': {
      'en': 'Action',
      'af': 'Aksie',
      'es': 'Acción',
      'fr': 'Action',
    },
    '0um5snba': {
      'en': 'Read',
      'af': 'Lees',
      'es': 'Leer',
      'fr': 'Lire',
    },
    'wl52y44f': {
      'en': 'Delete',
      'af': 'Vee uit',
      'es': 'Borrar',
      'fr': 'Supprimer',
    },
  },
  // CreateCategory
  {
    '03ci3gsm': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'nvhr6xpc': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // UpdateCategory
  {
    'u6ta2oyv': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'nfz6gak0': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // PasswordTextField
  {
    'x76563jl': {
      'en': 'Password',
      'af': 'Wagwoord',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
  },
  // DropdownBasic
  {
    'hyi33j3t': {
      'en': 'Option 1',
      'af': 'Opsie 1',
      'es': 'Opción 1',
      'fr': 'Option 1',
    },
  },
  // SearchTextFieldWithTextButton
  {
    'e34m8lce': {
      'en': 'Search',
      'af': 'Soek',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
  },
  // ReadRecipient
  {
    'i7azxg6e': {
      'en': 'Bank name',
      'af': 'bank Naam',
      'es': 'Nombre del banco',
      'fr': 'Nom de banque',
    },
    '2zdlxta3': {
      'en': 'Name on account',
      'af': 'Naam op rekening',
      'es': 'Nombre en la cuenta',
      'fr': 'Le nom sur le compte',
    },
    'qh1gxa3p': {
      'en': 'Account number',
      'af': 'Rekening nommer',
      'es': 'Número de cuenta',
      'fr': 'Numéro de compte',
    },
  },
  // ProductsDropdown-Abuja
  {
    'o0jrr9er': {
      'en': 'Crypto Currency',
      'af': 'Kripto geldeenheid',
      'es': 'Moneda criptográfica',
      'fr': 'Monnaie cryptographique',
    },
    'ij63jjaw': {
      'en': 'Trade your crypto assets and get paid instantly',
      'af': 'Verhandel jou kripto-bates en word onmiddellik betaal',
      'es': 'Comercia con tus criptoactivos y recibe pagos al instante',
      'fr': 'Échangez vos actifs cryptographiques et soyez payé instantanément',
    },
    '8f9wmf75': {
      'en': 'Gift Cards',
      'af': 'Geskenkbewyse',
      'es': 'Tarjetas de regalo',
      'fr': 'Cartes cadeaux',
    },
    'n2up74bn': {
      'en': 'Exchange gift cards and be paid right away.',
      'af': 'Ruil geskenkbewyse uit en word dadelik betaal.',
      'es': 'Intercambie tarjetas de regalo y reciba su pago de inmediato.',
      'fr': 'Échangez des cartes-cadeaux et soyez payé immédiatement.',
    },
  },
  // MobileDropdown-Abuja
  {
    'rzibozbs': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
    'e7qb05d8': {
      'en': 'About Us',
      'af': 'Oor ons',
      'es': 'Sobre nosotros',
      'fr': 'À propos de nous',
    },
    '601jfb8s': {
      'en': 'Products',
      'af': 'Produkte',
      'es': 'Productos',
      'fr': 'Des produits',
    },
    'rla3bc1u': {
      'en': 'Crypto',
      'af': 'Kripto',
      'es': 'Cripto',
      'fr': 'Crypto',
    },
    'znxm8ca9': {
      'en': 'Gift Cards',
      'af': 'Geskenkbewyse',
      'es': 'Tarjetas de regalo',
      'fr': 'Cartes cadeaux',
    },
    'pkkaurja': {
      'en': 'Blog',
      'af': 'Blog',
      'es': 'Blog',
      'fr': 'Blog',
    },
    '77jnbf7v': {
      'en': 'Faqs',
      'af': 'Gereelde vrae',
      'es': 'Preguntas frecuentes',
      'fr': 'FAQ',
    },
  },
  // ModalDropDown
  {
    'ysbobla6': {
      'en': 'Profile and Preferences',
      'af': 'Profiel en voorkeure',
      'es': 'Perfil y preferencias',
      'fr': 'Profil et préférences',
    },
    'ti8ttiey': {
      'en': 'Get in Touch',
      'af': 'Kontak my',
      'es': 'Ponerse en contacto',
      'fr': 'Entrer en contact',
    },
    'jbcy3e80': {
      'en': 'Sign Out',
      'af': 'Teken uit',
      'es': 'Desconectar',
      'fr': 'Se déconnecter',
    },
  },
  // ListOfUsersComp
  {
    'kesvt1jy': {
      'en': 'Fullname',
      'af': 'Volle naam',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
    },
    'y3zij53m': {
      'en': 'Phone Number',
      'af': 'E-pos',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'ywbuvc3l': {
      'en': 'Created Date',
      'af': 'Geskep datum',
      'es': 'Fecha de creación',
      'fr': 'Date de création',
    },
    '66w94mfd': {
      'en': 'Status',
      'af': 'Status',
      'es': 'Estado',
      'fr': 'Statut',
    },
  },
  // TransactionDetails
  {
    'in8u1dci': {
      'en': 'Date',
      'af': 'Datum',
      'es': 'Fecha',
      'fr': 'Date',
    },
    'p9gtom93': {
      'en': 'Order Reference',
      'af': 'Bestellingsverwysing',
      'es': 'Pedir Referencia',
      'fr': 'Référence de l\'achat',
    },
    'od0drti9': {
      'en': 'Type',
      'af': 'Bestellingsverwysing',
      'es': 'Pedir Referencia',
      'fr': 'Référence de l\'achat',
    },
    'invrydj9': {
      'en': 'Provider',
      'af': 'Bestellingsverwysing',
      'es': 'Pedir Referencia',
      'fr': 'Référence de l\'achat',
    },
    't3wxd01d': {
      'en': 'Amount',
      'af': 'Bedrag Tender',
      'es': 'Cantidad Oferta',
      'fr': 'Montant de l\'offre',
    },
  },
  // UpdateUser
  {
    '2kr9vb7u': {
      'en': 'Gender',
      'af': 'Geslag',
      'es': 'Género',
      'fr': 'Genre',
    },
    '214kpf8y': {
      'en': 'Male',
      'af': 'Manlik',
      'es': 'Masculino',
      'fr': 'Mâle',
    },
    'cfmlppqe': {
      'en': 'Female',
      'af': 'Vroulik',
      'es': 'Femenino',
      'fr': 'Femelle',
    },
    'eccq8bqn': {
      'en': 'Address',
      'af': 'Adres',
      'es': 'DIRECCIÓN',
      'fr': 'Adresse',
    },
    'jwleu1mq': {
      'en': 'Show more',
      'af': '',
      'es': '',
      'fr': '',
    },
    '88beivce': {
      'en': 'Show less',
      'af': '',
      'es': '',
      'fr': '',
    },
    'dfp837iq': {
      'en': 'This is the role of the user',
      'af': '',
      'es': '',
      'fr': '',
    },
    '22k5vb9f': {
      'en': 'Firstname  is required',
      'af': 'Voornaam word vereis',
      'es': 'Se requiere el primer nombre',
      'fr': 'Le prénom est requis',
    },
    'fo3rsmdk': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ea54x08z': {
      'en': 'Lastname is required',
      'af': 'Van word vereis',
      'es': 'Se requiere apellido',
      'fr': 'Le nom de famille est requis',
    },
    'afci9epd': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'jptfhh74': {
      'en': 'Email is required',
      'af': 'E-pos word vereis',
      'es': 'correo electronico es requerido',
      'fr': 'L\'e-mail est requis',
    },
    'whim24sc': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'f7ky09ca': {
      'en': 'Phone Number is required',
      'af': 'Telefoonnommer word vereis',
      'es': 'Se requiere número de teléfono',
      'fr': 'Le numéro de téléphone est requis',
    },
    '355mhyik': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // CloseIcon
  {
    'nvwrlh1m': {
      'en': 'Close',
      'af': 'Naby',
      'es': 'Cerca',
      'fr': 'Fermer',
    },
  },
  // ListOfBillOrderComp
  {
    'fc58xqjh': {
      'en': 'Transactions',
      'af': 'Kliënt',
      'es': 'Cliente',
      'fr': 'Client',
    },
    'ydddb5bk': {
      'en': 'Customer',
      'af': 'Kliënt',
      'es': 'Cliente',
      'fr': 'Client',
    },
    '3te6sigw': {
      'en': 'Reference',
      'af': 'Verwysing',
      'es': 'Referencia',
      'fr': 'Référence',
    },
    '6lyanjtz': {
      'en': 'Date Purchased',
      'af': 'Datum gekoop',
      'es': 'Fecha de compra',
      'fr': 'Date d\'achat',
    },
    'acmzqhy7': {
      'en': 'Type',
      'af': 'Tik',
      'es': 'Tipo',
      'fr': 'Taper',
    },
    'lhstkqrp': {
      'en': 'Amount',
      'af': 'Bedrag',
      'es': 'Cantidad',
      'fr': 'Montant',
    },
  },
  // DashboardForBillUser
  {
    'abu54m1p': {
      'en': 'Quick Actions',
      'af': 'Vinnige aksies',
      'es': 'Acciones rápidas',
      'fr': 'Actions rapides',
    },
    '9r6fweoh': {
      'en': 'Recent Activity',
      'af': 'Onlangse aktiwiteite',
      'es': 'Actividad reciente',
      'fr': 'Activité récente',
    },
  },
  // FilterBillOrders
  {
    '6tx1fp3t': {
      'en': 'Network Type',
      'af': 'Netwerk tipe',
      'es': 'Tipo de red',
      'fr': 'Type de réseau',
    },
    'tjj1hhba': {
      'en': 'All',
      'af': 'Almal',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'gxf3rxm3': {
      'en': 'Airtime',
      'af': 'MTN',
      'es': 'MTN',
      'fr': 'MTN',
    },
    'cej4t361': {
      'en': 'Data Bundle',
      'af': 'Airtel',
      'es': 'Airtel',
      'fr': 'Airtel',
    },
    '0s1t3oyq': {
      'en': 'Cable TV',
      'af': 'Glo',
      'es': 'Glo',
      'fr': 'Glo',
    },
    'whu2dg6v': {
      'en': 'Wifi',
      'af': '9 selfoon',
      'es': '9Móvil',
      'fr': '9Mobile',
    },
    'r42y8bbn': {
      'en': 'Eletricity',
      'af': '',
      'es': '',
      'fr': '',
    },
    '62okal6e': {
      'en': 'Transfer',
      'af': '',
      'es': '',
      'fr': '',
    },
    'tdovzmt6': {
      'en': 'Date Created',
      'af': 'Datum geskep',
      'es': 'Fecha de creacion',
      'fr': 'Date créée',
    },
  },
  // FilterUsers
  {
    '4g8r06or': {
      'en': 'Status',
      'af': 'Status',
      'es': 'Estado',
      'fr': 'Statut',
    },
    'hqqi7nr7': {
      'en': 'All',
      'af': 'Almal',
      'es': 'Todo',
      'fr': 'Tous',
    },
    '6usocogn': {
      'en': 'Active',
      'af': 'Aktief',
      'es': 'Activo',
      'fr': 'Actif',
    },
    '0cu80x4v': {
      'en': 'Suspended',
      'af': 'Geskors',
      'es': 'Suspendido',
      'fr': 'Suspendu',
    },
    'geye3pnj': {
      'en': 'Date Created',
      'af': 'Datum geskep',
      'es': 'Fecha de creacion',
      'fr': 'Date créée',
    },
  },
  // ReadMedia
  {
    'iis6cviz': {
      'en': 'Date: ',
      'af': 'Datum:',
      'es': 'Fecha:',
      'fr': 'Date:',
    },
    'qog8zdrr': {
      'en': 'Delete',
      'af': 'Vee uit',
      'es': 'Borrar',
      'fr': 'Supprimer',
    },
    'ou3zf4f5': {
      'en': '[photo url]',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // CreateAnnouncement
  {
    'eslhud5c': {
      'en':
          'If you have recent or significant news to share, display a message in a bar across the top of your application or pop-up. When enabled, the Announcement Bar will be viewable on both your desktop and mobile website.',
      'af':
          'As jy onlangse of belangrike nuus het om te deel, vertoon \'n boodskap in \'n balk bo-aan jou toepassing of opspringer. Wanneer dit geaktiveer is, sal die aankondigingbalk sigbaar wees op beide jou rekenaar- en mobiele webwerf.',
      'es':
          'Si tiene noticias recientes o importantes para compartir, muestre un mensaje en una barra en la parte superior de su aplicación o ventana emergente. Cuando está habilitada, la barra de anuncios se podrá ver tanto en su escritorio como en su sitio web móvil.',
      'fr':
          'Si vous avez des nouvelles récentes ou importantes à partager, affichez un message dans une barre en haut de votre application ou pop-up. Lorsqu\'elle est activée, la barre d\'annonces sera visible à la fois sur votre ordinateur de bureau et sur votre site Web mobile.',
    },
    '6aq7b4wz': {
      'en': 'Title is required',
      'af': 'Titel word vereis',
      'es': 'Se requiere título',
      'fr': 'Le titre est requis',
    },
    '819zi0e6': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '71in92fn': {
      'en': 'Message is required',
      'af': 'Boodskap word vereis',
      'es': 'El mensaje es obligatorio',
      'fr': 'Un message est requis',
    },
    '1jj3vq43': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // UpdateAnnouncement
  {
    'rcrrf0jm': {
      'en':
          'If you have recent or significant news to share, display a message in a bar across the top of your application or pop-up. When enabled, the Announcement Bar will be viewable on both your desktop and mobile website.',
      'af':
          'As jy onlangse of belangrike nuus het om te deel, vertoon \'n boodskap in \'n balk bo-aan jou toepassing of opspringer. Wanneer dit geaktiveer is, sal die aankondigingbalk sigbaar wees op beide jou rekenaar- en mobiele webwerf.',
      'es':
          'Si tiene noticias recientes o importantes para compartir, muestre un mensaje en una barra en la parte superior de su aplicación o ventana emergente. Cuando está habilitada, la barra de anuncios se podrá ver tanto en su escritorio como en su sitio web móvil.',
      'fr':
          'Si vous avez des nouvelles récentes ou importantes à partager, affichez un message dans une barre en haut de votre application ou pop-up. Lorsqu\'elle est activée, la barre d\'annonces sera visible à la fois sur votre ordinateur de bureau et sur votre site Web mobile.',
    },
    'ux5acg8d': {
      'en': 'Title is required',
      'af': 'Titel word vereis',
      'es': 'Se requiere título',
      'fr': 'Le titre est requis',
    },
    'o9j1g8zn': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ay2wap22': {
      'en': 'Message is required',
      'af': 'Boodskap word vereis',
      'es': 'El mensaje es obligatorio',
      'fr': 'Un message est requis',
    },
    'lt8gwkwk': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // BankDetailsComp
  {
    't3hplwkk': {
      'en': 'Account name',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ytno30bk': {
      'en': 'Account number',
      'af': '',
      'es': '',
      'fr': '',
    },
    '9zwfkk28': {
      'en': 'Bank name',
      'af': '',
      'es': '',
      'fr': '',
    },
    '61nysss0': {
      'en': 'Currency',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // DashboardForCryptoUser
  {
    '5xjkl307': {
      'en': 'Current BTC Price',
      'af': 'REKENING BALANS',
      'es': 'SALDO DE LA CUENTA',
      'fr': 'SOLDE DU COMPTE',
    },
    'g63y23cx': {
      'en': '******',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // DashboardForGiftcardUser
  {
    'oeqijeuu': {
      'en': 'Recent Activity',
      'af': 'Onlangse aktiwiteite',
      'es': 'Actividad reciente',
      'fr': 'Activité récente',
    },
    '59wc2xfh': {
      'en': '20',
      'af': '20',
      'es': '20',
      'fr': '20',
    },
  },
  // CreateWallet
  {
    'abaf5jtr': {
      'en': 'Choose Coin',
      'af': '',
      'es': '',
      'fr': '',
    },
    'qpj1dz0p': {
      'en': 'Hint here',
      'af': '',
      'es': '',
      'fr': '',
    },
    'c89390xd': {
      'en': 'Coin code',
      'af': '',
      'es': '',
      'fr': '',
    },
    'swixm5y6': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'xo9yjtg6': {
      'en': 'Field is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    's79uzl4c': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'irlekoeu': {
      'en': 'Field is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'eppp08c9': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ksslxwnw': {
      'en': 'Wallet address is required',
      'af': 'Wallet-adres word vereis',
      'es': 'Se requiere la dirección de la billetera',
      'fr': 'L\'adresse du portefeuille est requise',
    },
    'oqao76cd': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'qzxyj4mu': {
      'en': 'Selling rate is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'xtu2uh55': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ahlzso1s': {
      'en': 'Buying rate is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'aepn52c3': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // ListOfCoinsFromApi
  {
    '2u6ti79y': {
      'en': 'Search',
      'af': 'Soek',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
  },
  // UpdateWallet
  {
    'lupjsow9': {
      'en': 'Choose Coin',
      'af': '',
      'es': '',
      'fr': '',
    },
    'gijlopqk': {
      'en': 'Hint here',
      'af': '',
      'es': '',
      'fr': '',
    },
    'qwisap0i': {
      'en': 'Coin code',
      'af': '',
      'es': '',
      'fr': '',
    },
    't5fpsw00': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    '99aw29th': {
      'en': 'Wallet address is required',
      'af': 'Wallet-adres word vereis',
      'es': 'Se requiere la dirección de la billetera',
      'fr': 'L\'adresse du portefeuille est requise',
    },
    'e2m4vcal': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // ReadWallet
  {
    'dne8j609': {
      'en': 'Coin name:',
      'af': 'Muntstuk naam:',
      'es': 'Nombre de la moneda:',
      'fr': 'Nom de la pièce :',
    },
    '28exdsv8': {
      'en': 'Coin shortname:',
      'af': 'Muntstuk kortnaam:',
      'es': 'Nombre corto de la moneda:',
      'fr': 'Nom abrégé de la pièce :',
    },
    'k65756g7': {
      'en': 'Network:',
      'af': 'Netwerk:',
      'es': 'Red:',
      'fr': 'Réseau:',
    },
    'zquanzo5': {
      'en': 'Wallet:',
      'af': 'Beursie:',
      'es': 'Billetera:',
      'fr': 'Portefeuille:',
    },
    'd1hlacj2': {
      'en': 'Currency:',
      'af': 'Geldeenheid:',
      'es': 'Divisa:',
      'fr': 'Devise:',
    },
    's0l033tk': {
      'en': 'Buying rate:',
      'af': 'Koopkoers:',
      'es': 'Tipo de cambio comprador:',
      'fr': 'Taux d\'achat :',
    },
    'c6hxayvq': {
      'en': 'Selling rate:',
      'af': 'Verkoopkoers:',
      'es': 'Tasa de ventas:',
      'fr': 'Taux de vente:',
    },
  },
  // CreateRecipientComp
  {
    'q3iqvmpk': {
      'en': 'Country',
      'af': 'Land',
      'es': 'País',
      'fr': 'Pays',
    },
    'zqvxcxid': {
      'en': 'Nigeria',
      'af': 'Nigerië',
      'es': 'Nigeria',
      'fr': 'Nigeria',
    },
    'msk49wpc': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'es': 'Por favor selecciona...',
      'fr': 'Veuillez sélectionner...',
    },
    'a551900n': {
      'en': 'Search for an item...',
      'af': 'Soek vir \'n item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    's5o2c0bq': {
      'en': 'Who’s your New Recipient?',
      'af': 'Wie is jou nuwe ontvanger?',
      'es': '¿Quién es tu nuevo destinatario?',
      'fr': 'Qui est votre nouveau destinataire ?',
    },
    '6kln8nhs': {
      'en': 'Myself',
      'af': 'Ekself',
      'es': 'Mí mismo',
      'fr': 'Moi-même',
    },
    '7uqf8nnj': {
      'en': 'Myself',
      'af': 'Ekself',
      'es': 'Mí mismo',
      'fr': 'Moi-même',
    },
    'adhd91g3': {
      'en': 'Someone else',
      'af': 'Iemand anders',
      'es': 'Alguien más',
      'fr': 'Quelqu\'un d\'autre',
    },
    'nbhtggvy': {
      'en': 'Select...',
      'af': 'Kies...',
      'es': 'Seleccionar...',
      'fr': 'Sélectionner...',
    },
    'y89w44t3': {
      'en': 'Search for an item...',
      'af': 'Soek vir \'n item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'mwpob8cz': {
      'en': 'Enter Account Number',
      'af': 'Voer rekeningnommer in',
      'es': 'Ingrese el número de cuenta',
      'fr': 'Entrez le numéro de compte',
    },
    '0bvyhy30': {
      'en': '0123456789',
      'af': '0123456789',
      'es': '0123456789',
      'fr': '0123456789',
    },
    'p04bvrmm': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ul3d2rlo': {
      'en': 'Your account number or bank is invalid.',
      'af': 'Jou rekeningnommer of bank is ongeldig.',
      'es': 'Su número de cuenta o banco no es válido.',
      'fr': 'Votre numéro de compte ou votre banque n\'est pas valide.',
    },
    'vc2o39y8': {
      'en': ' Bank name is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'udgx9q7r': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'k49ev06h': {
      'en': 'Account Number is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '7izhe1ps': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ugvr78zy': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'm7ytt0wd': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // GetRecipientData
  {
    'rlvyaft3': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '7xvv7d2d': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'r2brcz0i': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '0fo9ubxv': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // ProductComposer
  {
    'yw7gb6jb': {
      'en': 'Details',
      'af': '',
      'es': '',
      'fr': '',
    },
    'igqbx3pa': {
      'en': 'Description',
      'af': '',
      'es': '',
      'fr': '',
    },
    'lyqxo6k3': {
      'en': 'Description',
      'af': 'Soek vir bedrag',
      'es': 'Buscar cantidad',
      'fr': 'Recherche de montant',
    },
    '6fkbexl3': {
      'en': 'Profile I',
      'af': '',
      'es': '',
      'fr': '',
    },
    'zknq50tt': {
      'en': 'Featured image',
      'af': 'Uitstalprent',
      'es': 'Foto principal',
      'fr': 'L\'image sélectionnée',
    },
    'd81rznux': {
      'en': 'Clear',
      'af': 'Duidelik',
      'es': 'Claro',
      'fr': 'Clair',
    },
    'k039qc4t': {
      'en': 'Inventory',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ly6xhvv3': {
      'en': 'Price',
      'af': '',
      'es': '',
      'fr': '',
    },
    'va859tfo': {
      'en': 'Stock',
      'af': '',
      'es': '',
      'fr': '',
    },
    '05hxd5dc': {
      'en': 'Products Categories',
      'af': '',
      'es': '',
      'fr': '',
    },
    '0pjsr616': {
      'en': 'Categories',
      'af': 'Kategorieë',
      'es': 'Categorías',
      'fr': 'Catégories',
    },
    'v3w12gic': {
      'en': 'Option 1',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // ListOfProductCategories
  {
    'ffyuznc1': {
      'en': 'Cat name',
      'af': 'Kat naam',
      'es': 'nombre del gato',
      'fr': 'Nom du chat',
    },
    'vs5eanfv': {
      'en': 'Action',
      'af': 'Aksie',
      'es': 'Acción',
      'fr': 'Action',
    },
    '3p5b31cy': {
      'en': 'Read',
      'af': 'Lees',
      'es': 'Leer',
      'fr': 'Lire',
    },
    'zf19cyrv': {
      'en': 'Delete',
      'af': 'Vee uit',
      'es': 'Borrar',
      'fr': 'Supprimer',
    },
  },
  // CreateProductCategory
  {
    'ow369bf5': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'a5r8dxmn': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // UpdateProductCategory
  {
    'azzr1a6l': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'ckb5xzs2': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // DashboardForECommerceUser
  {
    '1n0r1b49': {
      'en': 'ACCOUNT BALANCE',
      'af': 'REKENING BALANS',
      'es': 'SALDO DE LA CUENTA',
      'fr': 'SOLDE DU COMPTE',
    },
    '8d97wdcr': {
      'en': '₦22,029.00',
      'af': '₦22 029,00',
      'es': '₦22,029.00',
      'fr': '₦22,029.00',
    },
    'fa3guasn': {
      'en': 'Recent Activity',
      'af': 'Onlangse aktiwiteite',
      'es': 'Actividad reciente',
      'fr': 'Activité récente',
    },
    'gt2dsnno': {
      'en': '20',
      'af': '20',
      'es': '20',
      'fr': '20',
    },
  },
  // ConfirmTransferDetails
  {
    'rx93wnz3': {
      'en': 'You are sending',
      'af': '',
      'es': '',
      'fr': '',
    },
    'd3ilnhrt': {
      'en': 'Recipient',
      'af': '',
      'es': '',
      'fr': '',
    },
    'v13zndpu': {
      'en': 'Transaction Pin',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // DashboardForFintechUser
  {
    'q0ac9epj': {
      'en': 'View card details',
      'af': '',
      'es': '',
      'fr': '',
    },
    'tishad18': {
      'en': 'Recent Transactions',
      'af': 'Onlangse aktiwiteite',
      'es': 'Actividad reciente',
      'fr': 'Activité récente',
    },
  },
  // CreditCard
  {
    'op2hft8x': {
      'en': '4039  3893  8990  3903',
      'af': '',
      'es': '',
      'fr': '',
    },
    'h34o73qr': {
      'en': 'VALID\nTILL',
      'af': '',
      'es': '',
      'fr': '',
    },
    '172uv9ro': {
      'en': '07 / 28',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // ListOfCardsOrderComp
  {
    'iinyj24a': {
      'en': 'Date',
      'af': 'Kliënt',
      'es': 'Cliente',
      'fr': 'Client',
    },
    'yv5k78o8': {
      'en': 'MTN',
      'af': 'MTN',
      'es': 'MTN',
      'fr': 'MTN',
    },
    '8w6l5ifx': {
      'en': 'Merchant',
      'af': 'Verwysing',
      'es': 'Referencia',
      'fr': 'Référence',
    },
    'gdz2tnnq': {
      'en': 'Date Purchased',
      'af': 'Datum gekoop',
      'es': 'Fecha de compra',
      'fr': 'Date d\'achat',
    },
    '3dfjzl4t': {
      'en': 'Type',
      'af': 'Tik',
      'es': 'Tipo',
      'fr': 'Taper',
    },
    'hug4kj1u': {
      'en': 'Amount',
      'af': 'Bedrag',
      'es': 'Cantidad',
      'fr': 'Montant',
    },
  },
  // CopyIcon
  {
    'l14hmsvg': {
      'en': 'Copy',
      'af': 'Naby',
      'es': 'Cerca',
      'fr': 'Fermer',
    },
  },
  // CreatePlugin
  {
    'zqeyv4j3': {
      'en': 'Plugin name is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'yt3y6j24': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    '359eu2gz': {
      'en': 'Plugin description is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'jpxwi9lk': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // ModalPayment
  {
    'pe9cjigo': {
      'en': 'It seems you cancel the payment link.',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // FundBillAccount
  {
    'ign2k49w': {
      'en': 'Amount is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'vlbcgmke': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // Footer-Lagos
  {
    'kbjbe3uh': {
      'en': 'So why wait?',
      'af': 'Begin dit is gratis',
      'es': 'Comience es gratis',
      'fr': 'Commencez c\'est gratuit',
    },
    'rlhafpux': {
      'en':
          'Join our community of satisfied customers and experience the convenience of purchasing airtime, data bundles, cable TV services, electricity, and more, with just a few clicks. Your everyday essentials are just a click away!\"',
      'af':
          'Begin nou en begin \'n naatlose en lonende handelsavontuur saam met ons. Ons is hier om die handelsproses te vereenvoudig.',
      'es':
          'Comience ahora y embárquese en una aventura comercial fluida y gratificante con nosotros. Estamos aquí para simplificar el proceso de negociación.',
      'fr':
          'Commencez dès maintenant et lancez-vous avec nous dans une aventure commerciale transparente et enrichissante. Nous sommes ici pour simplifier le processus de trading.',
    },
    '2g8bla65': {
      'en':
          'Office 09, Aderemi Memorial Shopping Complex, Apata 200262, Ibadan',
      'af': 'Gereelde vrae',
      'es': 'Preguntas más frecuentes',
      'fr': 'FAQ',
    },
    'sgjyvqt6': {
      'en': 'Products',
      'af': 'Wettig',
      'es': 'Legal',
      'fr': 'Légal',
    },
    '445y5vpm': {
      'en': 'Airtime',
      'af': 'Gebruiksvoorwaardes',
      'es': 'Condiciones de uso',
      'fr': 'Conditions d\'utilisation',
    },
    'su5tsowj': {
      'en': 'Data Bundle',
      'af': 'Privaatheidsbeleid',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    'onbedt1t': {
      'en': 'Cable TV',
      'af': 'Privaatheidsbeleid',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    'gjzrng6n': {
      'en': 'Internet/Wifi',
      'af': 'Privaatheidsbeleid',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    'b556z2bu': {
      'en': 'Eletricity',
      'af': 'Privaatheidsbeleid',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    'emp4ckus': {
      'en': 'Education ',
      'af': 'Privaatheidsbeleid',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    '5ggc5hlg': {
      'en': 'Contact Us',
      'af': 'Kontak Ons',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
    },
    'iczey0j3': {
      'en': 'support@reqra.com',
      'af': 'hallo@teckaa.com',
      'es': 'hola@teckaa.com',
      'fr': 'hello@teckaa.com',
    },
    'besfu9nn': {
      'en': '+1234567890',
      'af': '+1234567890',
      'es': '+1234567890',
      'fr': '+1234567890',
    },
    'cn4tjm98': {
      'en': '+0987654321',
      'af': '+0987654321',
      'es': '+0987654321',
      'fr': '+0987654321',
    },
    'hjer5jhi': {
      'en': 'Download our app',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // Header-Lagos
  {
    'v2xcf9xa': {
      'en': 'Preview mode',
      'af': '',
      'es': '',
      'fr': '',
    },
    '57rm228g': {
      'en':
          'With our new app, Paying your bill is now simple. More information click here',
      'af': '',
      'es': '',
      'fr': '',
    },
    'humnbt3i': {
      'en': 'Dashboard',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // Header-Enugu
  {
    '61c13pqe': {
      'en':
          'With our new app, trading is now simple. More information can be found by',
      'af':
          'Met ons nuwe toepassing is handel nou eenvoudig. Meer inligting kan gevind word by',
      'es':
          'Con nuestra nueva aplicación, el comercio ahora es simple. Se puede encontrar más información por',
      'fr':
          'Avec notre nouvelle application, le trading est désormais simple. Plus d\'informations peuvent être trouvées par',
    },
    'n0zss1eh': {
      'en': ' clicking here.',
      'af': 'hier te klik.',
      'es': 'haciendo clic aquí.',
      'fr': 'en cliquant ici.',
    },
  },
  // Footer-Enugu
  {
    '1vo077ll': {
      'en': 'Get Started it\'s Free ',
      'af': 'Begin dit is gratis',
      'es': 'Comience es gratis',
      'fr': 'Commencez c\'est gratuit',
    },
    'elaby631': {
      'en':
          'Get started now and embark on a seamless and rewarding trading adventure with us. We are here to simplify the trading process.',
      'af':
          'Begin nou en begin \'n naatlose en lonende handelsavontuur saam met ons. Ons is hier om die handelsproses te vereenvoudig.',
      'es':
          'Comience ahora y embárquese en una aventura comercial fluida y gratificante con nosotros. Estamos aquí para simplificar el proceso de negociación.',
      'fr':
          'Commencez dès maintenant et lancez-vous avec nous dans une aventure commerciale transparente et enrichissante. Nous sommes ici pour simplifier le processus de trading.',
    },
    '48x7twuf': {
      'en': 'Initiatives',
      'af': 'Inisiatiewe',
      'es': 'Iniciativas',
      'fr': 'Initiatives',
    },
    'd0sctmit': {
      'en': 'About us',
      'af': 'Oor ons',
      'es': 'Sobre nosotros',
      'fr': 'À propos de nous',
    },
    'ehx7mvjh': {
      'en': 'Blog',
      'af': 'Blog',
      'es': 'Blog',
      'fr': 'Blog',
    },
    'o1ut04gv': {
      'en': 'Faq',
      'af': 'Gereelde vrae',
      'es': 'Preguntas más frecuentes',
      'fr': 'FAQ',
    },
    'kar7jpm3': {
      'en': 'Products',
      'af': 'Wettig',
      'es': 'Legal',
      'fr': 'Légal',
    },
    'db68rb2h': {
      'en': 'Airtime',
      'af': 'Gebruiksvoorwaardes',
      'es': 'Condiciones de uso',
      'fr': 'Conditions d\'utilisation',
    },
    '9eev3fmu': {
      'en': 'Data Bundle',
      'af': 'Privaatheidsbeleid',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    '4w490290': {
      'en': 'Cable TV',
      'af': 'Privaatheidsbeleid',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    'r9b7upig': {
      'en': 'Internet/Wifi',
      'af': 'Privaatheidsbeleid',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    'ri4cno3u': {
      'en': 'Eletricity',
      'af': 'Privaatheidsbeleid',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    '3lr9hc5c': {
      'en': 'Education ',
      'af': 'Privaatheidsbeleid',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    'zjd3cdp6': {
      'en': 'Follow us',
      'af': 'Volg ons',
      'es': 'Síganos',
      'fr': 'Suivez-nous',
    },
    '143x50x9': {
      'en': 'Facebook',
      'af': 'Facebook',
      'es': 'Facebook',
      'fr': 'Facebook',
    },
    'hkunjtze': {
      'en': 'Twitter',
      'af': 'Twitter',
      'es': 'Gorjeo',
      'fr': 'Twitter',
    },
    '8gfq49bf': {
      'en': 'Instagram',
      'af': 'Instagram',
      'es': 'Instagram',
      'fr': 'Instagram',
    },
    '84u12mf4': {
      'en': 'Tiktok',
      'af': 'Tiktok',
      'es': 'Tik Tok',
      'fr': 'TIC Tac',
    },
  },
  // ProductsDropdown-Lagos
  {
    '0qwe8iyy': {
      'en': 'Airtime',
      'af': 'Lugtyd',
      'es': 'Tiempo en antena',
      'fr': 'Temps d\'antenne',
    },
    'tvbv30g7': {
      'en': 'Top up your airtime',
      'af': 'Vul jou lugtyd aan',
      'es': 'Recarga tu tiempo aire',
      'fr': 'Rechargez votre temps d\'antenne',
    },
    '10g7j5nv': {
      'en': 'Data Bundle',
      'af': 'Databundel',
      'es': 'Paquete de datos',
      'fr': 'Ensemble de données',
    },
    'pssxkh1i': {
      'en': 'Purchase data on the go',
      'af': 'Koop data onderweg',
      'es': 'Compra de datos sobre la marcha',
      'fr': 'Achetez des données en déplacement',
    },
    'p5kun0gf': {
      'en': 'Cable TV',
      'af': 'Kabel TV',
      'es': 'Televisión por cable',
      'fr': 'Télévision par câble',
    },
    '8mogn98k': {
      'en': 'Subscribe to your TV show',
      'af': 'Teken in op jou TV-program',
      'es': 'Suscríbete a tu programa de televisión',
      'fr': 'Abonnez-vous à votre émission de télévision',
    },
    'p5jix3uq': {
      'en': 'Internet/Wifi',
      'af': 'Internet/Wifi',
      'es': 'Internet/Wifi',
      'fr': 'Internet/Wi-Fi',
    },
    'peozz9du': {
      'en': 'Purchase internet access',
      'af': 'Koop internettoegang',
      'es': 'Comprar acceso a internet',
      'fr': 'Acheter un accès Internet',
    },
    'ybedmxjd': {
      'en': 'Electricity',
      'af': 'Elektrisiteit',
      'es': 'Electricidad',
      'fr': 'Électricité',
    },
    '6fqzxlss': {
      'en': 'Pay up your electricity bill',
      'af': 'Betaal jou elektrisiteitsrekening',
      'es': 'Paga tu factura de luz',
      'fr': 'Payez votre facture d\'électricité',
    },
    'e5rroxat': {
      'en': 'Education',
      'af': 'Onderwys',
      'es': 'Educación',
      'fr': 'Éducation',
    },
    '5x0z7qc5': {
      'en': 'Purchase WAEC,NECO pin and more',
      'af': 'Koop WAEC, NECO pen en meer',
      'es': 'Compre pin WAEC, NECO y más',
      'fr': 'Achetez une broche WAEC, NECO et plus encore',
    },
  },
  // MobileDropdown-Lagos
  {
    'qkj2b70w': {
      'en': 'Home',
      'af': 'Tuis',
      'es': 'Hogar',
      'fr': 'Maison',
    },
    '0aeam89u': {
      'en': 'About Us',
      'af': 'Oor ons',
      'es': 'Sobre nosotros',
      'fr': 'À propos de nous',
    },
    'wnn73yqs': {
      'en': 'Products',
      'af': 'Produkte',
      'es': 'Productos',
      'fr': 'Des produits',
    },
    '02xl4g1j': {
      'en': 'Blog',
      'af': 'Blog',
      'es': 'Blog',
      'fr': 'Blog',
    },
  },
  // AccountBalance
  {
    'ur39ol7o': {
      'en': 'Total Balance',
      'af': 'Totale balans',
      'es': 'Balance total',
      'fr': 'Solde total',
    },
    'y2o6rs5v': {
      'en': '******',
      'af': '*****',
      'es': '******',
      'fr': '******',
    },
  },
  // Pin4TextField
  {
    '58glxefb': {
      'en': 'Pin',
      'af': 'Speld',
      'es': 'Alfiler',
      'fr': 'Épingle',
    },
  },
  // Pin6TextField
  {
    '29dnyhz1': {
      'en': 'Pin',
      'af': 'Speld',
      'es': 'Alfiler',
      'fr': 'Épingle',
    },
  },
  // FundCard
  {
    'ygfghyjp': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '1cc3oz8a': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'i1hrnxoh': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'es2kgqqz': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // FilterCryptoOrder
  {
    'xmben7cd': {
      'en': 'Network type',
      'af': 'Netwerk tipe',
      'es': 'Tipo de red',
      'fr': 'Type de réseau',
    },
    '8e3fy7d8': {
      'en': 'All',
      'af': 'Almal',
      'es': 'Todo',
      'fr': 'Tous',
    },
    't2bwoh4n': {
      'en': 'MTN',
      'af': 'MTN',
      'es': 'mtn',
      'fr': 'MTN',
    },
    'avnh1sbm': {
      'en': 'Airtel',
      'af': 'Airtel',
      'es': 'Airtel',
      'fr': 'Airtel',
    },
    '0hlzp65g': {
      'en': 'Glo',
      'af': 'Glo',
      'es': 'glo',
      'fr': 'Glo',
    },
    'if3x5s44': {
      'en': '9Mobile',
      'af': '9 selfoon',
      'es': '9Móvil',
      'fr': '9Mobile',
    },
    'sgthpbtt': {
      'en': 'Status',
      'af': 'Status',
      'es': 'Estado',
      'fr': 'Statut',
    },
    'wopmkq4s': {
      'en': 'All',
      'af': 'Almal',
      'es': 'Todo',
      'fr': 'Tous',
    },
    '78lk0bhf': {
      'en': 'Active',
      'af': 'Aktief',
      'es': 'Activo',
      'fr': 'Actif',
    },
    'fnrx6nh3': {
      'en': 'Suspended',
      'af': 'Geskors',
      'es': 'Suspendido',
      'fr': 'Suspendu',
    },
    'gqzak4y5': {
      'en': 'Date purchased',
      'af': 'Datum gekoop',
      'es': 'Fecha de compra',
      'fr': 'Date d\'achat',
    },
  },
  // CreateRecipienComp
  {
    '5ejz7m1s': {
      'en': 'Type of Recipient',
      'af': 'Tipe Ontvanger',
      'es': 'Tipo de destinatario',
      'fr': 'Type de destinataire',
    },
    'tuvg2ebw': {
      'en': 'Bank Account',
      'af': 'Bankrekening',
      'es': 'Cuenta bancaria',
      'fr': 'Compte bancaire',
    },
    'htidlvxy': {
      'en': 'Username Tag',
      'af': 'Gebruikersnaam Tag',
      'es': 'Etiqueta de nombre de usuario',
      'fr': 'Balise de nom d\'utilisateur',
    },
    'x1pkmldx': {
      'en': 'Phone Number',
      'af': 'Telefoon nommer',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
    },
    'kcm3y8du': {
      'en': 'Smart Card Number',
      'af': 'Slimkaartnommer',
      'es': 'Número de tarjeta inteligente',
      'fr': 'Numéro de carte à puce',
    },
    'pq7qickw': {
      'en': 'Meter Number',
      'af': 'Meter nommer',
      'es': 'Número de medidor',
      'fr': 'Numéro de compteur',
    },
    '1g3jiy46': {
      'en': 'Wifi Number',
      'af': 'Wifi nommer',
      'es': 'Número Wifi',
      'fr': 'Numéro Wi-Fi',
    },
    '2thyf9n0': {
      'en': 'Toll Number',
      'af': 'Tolnommer',
      'es': 'Número de peaje',
      'fr': 'Numéro payant',
    },
    'c1r0fusg': {
      'en': 'Type of number...',
      'af': 'Tipe nommer...',
      'es': 'Tipo de número...',
      'fr': 'Type de numéro...',
    },
    '8ygv1as6': {
      'en': 'Search for an item...',
      'af': 'Soek vir \'n item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    '4ggzprap': {
      'en': 'Bank Name',
      'af': 'Bank Naam',
      'es': 'Nombre del banco',
      'fr': 'Nom de banque',
    },
    'hxdojtr4': {
      'en': 'Bank Name',
      'af': 'Bank Naam',
      'es': 'Nombre del banco',
      'fr': 'Nom de banque',
    },
    'f76e651w': {
      'en': 'Enter Account Number',
      'af': 'Voer rekeningnommer in',
      'es': 'Ingrese el número de cuenta',
      'fr': 'Entrez le numéro de compte',
    },
    'tbowi40w': {
      'en': '0123456789',
      'af': '0123456789',
      'es': '0123456789',
      'fr': '0123456789',
    },
    'whpg12wj': {
      'en': 'Your account number or bank is invalid.',
      'af': 'Jou rekeningnommer of bank is ongeldig.',
      'es': 'Su número de cuenta o banco no es válido.',
      'fr': 'Votre numéro de compte ou votre banque n\'est pas valide.',
    },
    '0mx02sbn': {
      'en': 'Name on Account',
      'af': 'Naam op rekening',
      'es': 'Nombre en la cuenta',
      'fr': 'Le nom sur le compte',
    },
    'y683obu4': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'zppt8fw2': {
      'en': 'Bank name is required',
      'af': 'Banknaam word vereis',
      'es': 'Se requiere el nombre del banco',
      'fr': 'Le nom de la banque est requis',
    },
    '3jqx721r': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'hjyvm0js': {
      'en': 'Enter 10 digit Account number',
      'af': 'Voer 10-syfer rekeningnommer in',
      'es': 'Ingrese el número de cuenta de 10 dígitos',
      'fr': 'Entrez le numéro de compte à 10 chiffres',
    },
    'sqdndchj': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '7me6dyzu': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    't8marzve': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '677hdfpb': {
      'en': 'Select Bank',
      'af': 'Kies Bank',
      'es': 'Seleccionar banco',
      'fr': 'Sélectionnez la banque',
    },
    'xmenrgew': {
      'en': 'Enter Account Number',
      'af': 'Voer rekeningnommer in',
      'es': 'Ingrese el número de cuenta',
      'fr': 'Entrez le numéro de compte',
    },
    'up9m5a01': {
      'en': '0123456789',
      'af': '0123456789',
      'es': '0123456789',
      'fr': '0123456789',
    },
    'om5q6xl1': {
      'en': 'Enter Account Number',
      'af': 'Voer rekeningnommer in',
      'es': 'Ingrese el número de cuenta',
      'fr': 'Entrez le numéro de compte',
    },
    '3erpo0zb': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'r923wcb4': {
      'en': 'Your account number or bank is invalid.',
      'af': 'Jou rekeningnommer of bank is ongeldig.',
      'es': 'Su número de cuenta o banco no es válido.',
      'fr': 'Votre numéro de compte ou votre banque n\'est pas valide.',
    },
    'k6ccfo43': {
      'en': ' Bank name is required',
      'af': 'Banknaam word vereis',
      'es': 'Se requiere el nombre del banco',
      'fr': 'Le nom de la banque est requis',
    },
    'ahxoae3m': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '4qg67blv': {
      'en': 'Account Number is required',
      'af': 'Rekeningnommer word vereis',
      'es': 'Se requiere el número de cuenta',
      'fr': 'Le numéro de compte est requis',
    },
    '5wv5rcyc': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'j1mmkbkw': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'rei1gpmw': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'z8cmkb9z': {
      'en': 'Phone number is required',
      'af': 'Telefoonnommer word vereis',
      'es': 'Se requiere número de teléfono',
      'fr': 'Le numéro de téléphone est requis',
    },
    'a2l3ripn': {
      'en': 'Phone number must be 11 digits long.',
      'af': 'Telefoonnommer moet 11 syfers lank wees.',
      'es': 'El número de teléfono debe tener 11 dígitos.',
      'fr': 'Le numéro de téléphone doit comporter 11 chiffres.',
    },
    '67a1vpri': {
      'en': 'Phone number must be 11 digits long.',
      'af': 'Telefoonnommer moet 11 syfers lank wees.',
      'es': 'El número de teléfono debe tener 11 dígitos.',
      'fr': 'Le numéro de téléphone doit comporter 11 chiffres.',
    },
    'h2luh3cw': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'rjkl4u9c': {
      'en': 'Name is required',
      'af': 'Naam word vereis',
      'es': 'Se requiere el nombre',
      'fr': 'Le nom est requis',
    },
    'hkyk1p4r': {
      'en': 'Name cannot be empty',
      'af': 'Naam kan nie leeg wees nie',
      'es': 'El nombre no puede estar vacío',
      'fr': 'Le nom ne peut pas être vide',
    },
    'nq3jjnfc': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '6lb79mo1': {
      'en': 'Hello World',
      'af': 'Hello Wêreld',
      'es': 'Hola Mundo',
      'fr': 'Bonjour le monde',
    },
    '39dfqta2': {
      'en': 'Hello World',
      'af': 'Hello Wêreld',
      'es': 'Hola Mundo',
      'fr': 'Bonjour le monde',
    },
    'rx1g4ycn': {
      'en': 'Phone Number',
      'af': 'Telefoon nommer',
      'es': 'Número de teléfono',
      'fr': 'Numéro de téléphone',
    },
    'sipu8dun': {
      'en': 'Wifi Number',
      'af': 'Wifi nommer',
      'es': 'Número Wifi',
      'fr': 'Numéro Wi-Fi',
    },
  },
  // UpdateContact
  {
    '57vltj52': {
      'en': 'Phone number is required',
      'af': 'Telefoonnommer word vereis',
      'es': 'Se requiere número de teléfono',
      'fr': 'Le numéro de téléphone est requis',
    },
    'aqt9lwfr': {
      'en': 'The phone number must be 11 digits long.',
      'af': 'Die telefoonnommer moet 11 syfers lank wees.',
      'es': 'El número de teléfono debe tener 11 dígitos.',
      'fr': 'Le numéro de téléphone doit comporter 11 chiffres.',
    },
    'hes4wu6j': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'jyt65rpd': {
      'en': 'Name is required',
      'af': 'Naam word vereis',
      'es': 'Se requiere el nombre',
      'fr': 'Le nom est requis',
    },
    'cvuz55q3': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // DashboardForAdmin
  {
    'clxj8d68': {
      'en': 'Overview',
      'af': 'Oorsig',
      'es': 'Descripción general',
      'fr': 'Aperçu',
    },
    'afrf6e95': {
      'en': 'Below is your company overview',
      'af': 'Hieronder is jou maatskappyoorsig',
      'es': 'A continuación se muestra la descripción general de su empresa.',
      'fr': 'Ci-dessous un aperçu de votre entreprise',
    },
    'xbqlgc1r': {
      'en': 'Income this Month',
      'af': 'Inkomste hierdie maand',
      'es': 'Ingresos este mes',
      'fr': 'Revenu ce mois-ci',
    },
    '44q0qkko': {
      'en': '0.00',
      'af': '0.00',
      'es': '0.00',
      'fr': '0,00',
    },
    '3yjwpjk4': {
      'en': 'Users',
      'af': 'Gebruikers',
      'es': 'Usuarios',
      'fr': 'Utilisateurs',
    },
    'oxa8cdf8': {
      'en': 'Total Orders',
      'af': 'Totale bestellings',
      'es': 'Órdenes totales',
      'fr': 'Total des commandes',
    },
    'b75fwcn8': {
      'en': 'Total Commission/Profits',
      'af': 'Totale kommissie/winste',
      'es': 'Comisión total/beneficios',
      'fr': 'Commissions/bénéfices totaux',
    },
    'i7n33e20': {
      'en': 'NGN 0.00',
      'af': 'NGN 0,00',
      'es': 'NGN 0,00',
      'fr': '0,00 NGN',
    },
    'itt5kx58': {
      'en': 'Account Overview',
      'af': 'Rekeningoorsig',
      'es': 'Descripción de cuenta',
      'fr': 'Aperçu du compte',
    },
    'hpykbkcb': {
      'en': 'Balance',
      'af': 'Balans',
      'es': 'Balance',
      'fr': 'Équilibre',
    },
    'trx56c6m': {
      'en': 'Users',
      'af': 'Gebruikers',
      'es': 'Usuarios',
      'fr': 'Utilisateurs',
    },
    '7x7qemdh': {
      'en': 'Outstanding Balance',
      'af': 'Uitstaande balans',
      'es': 'Saldo pendiente',
      'fr': 'Solde impayé',
    },
    '2bk9j7gv': {
      'en': 'NGN 0.00',
      'af': 'NGN 0,00',
      'es': 'NGN 0,00',
      'fr': '0,00 NGN',
    },
    'kyj68a36': {
      'en': '50%',
      'af': '50%',
      'es': '50%',
      'fr': '50%',
    },
    'h100szbv': {
      'en': 'Outstanding Balance',
      'af': 'Uitstaande balans',
      'es': 'Saldo pendiente',
      'fr': 'Solde impayé',
    },
    'ge4uswip': {
      'en': 'NGN 0.00',
      'af': 'NGN 0,00',
      'es': 'NGN 0,00',
      'fr': '0,00 NGN',
    },
    'r1oy2mhn': {
      'en': '50%',
      'af': '50%',
      'es': '50%',
      'fr': '50%',
    },
    '0upa6ckf': {
      'en': 'All Bills Orders',
      'af': 'Alle rekeningbestellings',
      'es': 'Todos los pedidos de facturas',
      'fr': 'Toutes les commandes de factures',
    },
    'zclgxesl': {
      'en': 'Below are some of the orders of your users.',
      'af': 'Hieronder is \'n paar van die bestellings van jou gebruikers.',
      'es':
          'A continuación se muestran algunos de los pedidos de sus usuarios.',
      'fr':
          'Vous trouverez ci-dessous quelques-unes des commandes de vos utilisateurs.',
    },
    'jv4b3ix6': {
      'en': 'Transactions',
      'af': 'Transaksies',
      'es': 'Actas',
      'fr': 'Transactions',
    },
    'y5b5jxqf': {
      'en': 'Customer',
      'af': 'Kliënt',
      'es': 'Cliente',
      'fr': 'Client',
    },
    '4pi4zeci': {
      'en': 'Date',
      'af': 'Datum',
      'es': 'Fecha',
      'fr': 'Date',
    },
    't7fe7737': {
      'en': 'Type',
      'af': 'Tik',
      'es': 'Tipo',
      'fr': 'Taper',
    },
    'nmg2x81x': {
      'en': 'Amount',
      'af': 'Bedrag',
      'es': 'Cantidad',
      'fr': 'Montant',
    },
  },
  // SidebarComp
  {
    'pcyeycqv': {
      'en': 'Main Menu',
      'af': 'Hoof spyskaart',
      'es': 'Menú principal',
      'fr': 'Menu principal',
    },
    '05a9vklv': {
      'en': 'Profile',
      'af': 'Profiel',
      'es': 'Perfil',
      'fr': 'Profil',
    },
    'dqu0v9a7': {
      'en': 'Main Menu',
      'af': 'Hoof spyskaart',
      'es': 'Menú principal',
      'fr': 'Menu principal',
    },
    '33cxslc9': {
      'en': 'Settings',
      'af': 'Instellings',
      'es': 'Ajustes',
      'fr': 'Paramètres',
    },
    'bgpwgho2': {
      'en': 'Main Menu',
      'af': 'Hoof spyskaart',
      'es': 'Menú principal',
      'fr': 'Menu principal',
    },
    '4t9rlkq6': {
      'en': 'Security',
      'af': 'Sekuriteit',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    'toh25mlj': {
      'en': 'Main Menu',
      'af': 'Hoof spyskaart',
      'es': 'Menú principal',
      'fr': 'Menu principal',
    },
    'd48em0bm': {
      'en': 'App Information',
      'af': 'Toepassing inligting',
      'es': 'Información de la aplicación',
      'fr': 'Informations sur l\'application',
    },
    '855ep1m2': {
      'en': 'Administrator',
      'af': 'Administrateur',
      'es': 'Administrador',
      'fr': 'Administrateur',
    },
    'm8vavksi': {
      'en': 'Content Manager',
      'af': 'Inhoudbestuurder',
      'es': 'Gestor de contenidos',
      'fr': 'Gestionnaire de contenu',
    },
  },
  // FundUser
  {
    'd38i40gq': {
      'en': 'Amount is required',
      'af': 'Bedrag word vereis',
      'es': 'Se requiere cantidad',
      'fr': 'Le montant est requis',
    },
    '9h97j3ex': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // ListOfFundingsComp
  {
    'b2nc6q51': {
      'en': 'Amount',
      'af': 'Bedrag',
      'es': 'Cantidad',
      'fr': 'Montant',
    },
    't3ok5xtw': {
      'en': 'Merchants',
      'af': 'Handelaars',
      'es': 'Comerciantes',
      'fr': 'Marchands',
    },
    '8zcy5k4k': {
      'en': 'Date',
      'af': 'Datum',
      'es': 'Fecha',
      'fr': 'Date',
    },
    'd6ulc447': {
      'en': 'Status',
      'af': 'Status',
      'es': 'Estado',
      'fr': 'Statut',
    },
  },
  // CreateEmailTemplates
  {
    '5r7hvsh9': {
      'en': 'Desktop',
      'af': 'Desktop',
      'es': 'Escritorio',
      'fr': 'Bureau',
    },
    '05np48si': {
      'en': 'Mobile',
      'af': 'Selfoon',
      'es': 'Móvil',
      'fr': 'Mobile',
    },
    'apr4bax2': {
      'en': 'Desktop',
      'af': 'Desktop',
      'es': 'Escritorio',
      'fr': 'Bureau',
    },
    '8ibzbir6': {
      'en': 'Email Templates Settings',
      'af': 'E-pos sjablone instellings',
      'es': 'Configuración de plantillas de correo electrónico',
      'fr': 'Paramètres des modèles d\'e-mails',
    },
    '6mcbt4t1': {
      'en': 'Sender Options',
      'af': 'Sender opsies',
      'es': 'Opciones de remitente',
      'fr': 'Options de l\'expéditeur',
    },
    '2l5jmvd9': {
      'en': 'Email logo (120 by 40)',
      'af': 'E-pos-logo (120 by 40)',
      'es': 'Logotipo de correo electrónico (120 por 40)',
      'fr': 'Logo email (120 par 40)',
    },
    '6r996214': {
      'en': 'Additional email templates',
      'af': 'Bykomende e-possjablone',
      'es': 'Plantillas de correo electrónico adicionales',
      'fr': 'Modèles d\'e-mails supplémentaires',
    },
    'e6qfejs9': {
      'en': 'Sender name is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'jg1n6ewc': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'bh4udkum': {
      'en': 'Sender Email is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    '699u3t4m': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'bvh8fj3l': {
      'en': 'Field is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'lfasjixg': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ifc54efh': {
      'en': 'Field is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'niz0i1yd': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    '89og8hf8': {
      'en': 'Field is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'k119ltex': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'imza44xp': {
      'en': 'Field is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'dwdmxnor': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'bqzeoudj': {
      'en': 'Field is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'spfnzalw': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'l4sitiig': {
      'en': 'Field is required',
      'af': '',
      'es': '',
      'fr': '',
    },
    'bzf8p43j': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'es': '',
      'fr': '',
    },
    'g6aosb6f': {
      'en': 'From:',
      'af': 'Van:',
      'es': 'De:',
      'fr': 'Depuis:',
    },
    'vl72lb4t': {
      'en': '  <',
      'af': '<',
      'es': '<',
      'fr': '<',
    },
    'wz1eq3z3': {
      'en': '>',
      'af': '>',
      'es': '>',
      'fr': '>',
    },
    'swmhzwtk': {
      'en': 'To:',
      'af': 'Aan:',
      'es': 'A:',
      'fr': 'À:',
    },
    'ir7znwxw': {
      'en': ' ',
      'af': '',
      'es': '',
      'fr': '',
    },
    'pzxmurft': {
      'en': 'Date:',
      'af': 'Datum:',
      'es': 'Fecha:',
      'fr': 'Date:',
    },
    '4gcfbiup': {
      'en': 'Subject:',
      'af': 'Onderwerp:',
      'es': 'Sujeto:',
      'fr': 'Sujet:',
    },
    'n6fa0nx7': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'r9ssh94o': {
      'en': 'Start writing',
      'af': 'Begin skryf',
      'es': 'Empieza a escribir',
      'fr': 'Commencez à écrire',
    },
    'om7kh3gv': {
      'en': 'Name your template',
      'af': 'Noem jou sjabloon',
      'es': 'Nombra tu plantilla',
      'fr': 'Nommez votre modèle',
    },
    'ldygdigk': {
      'en': 'Type',
      'af': 'Tik',
      'es': 'Tipo',
      'fr': 'Taper',
    },
    '95v16b0v': {
      'en': 'Authentication',
      'af': 'Stawing',
      'es': 'Autenticación',
      'fr': 'Authentification',
    },
    'hduvoe9p': {
      'en': 'Security',
      'af': 'Sekuriteit',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    '3dy0b47g': {
      'en': 'Account',
      'af': 'Rekening',
      'es': 'Cuenta',
      'fr': 'Compte',
    },
    'a28b3843': {
      'en': 'Transaction',
      'af': 'Transaksie',
      'es': 'Transacción',
      'fr': 'Transaction',
    },
    'pm0rajax': {
      'en': 'Ecommerce',
      'af': 'E-handel',
      'es': 'Comercio electrónico',
      'fr': 'Commerce électronique',
    },
    '4j60atdm': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'es': 'Por favor seleccione...',
      'fr': 'Veuillez sélectionner...',
    },
    'e3ye257y': {
      'en': 'Search for an item...',
      'af': 'Soek vir \'n item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    '81tx04ke': {
      'en': 'Recipients',
      'af': 'Ontvangers',
      'es': 'Destinatarios',
      'fr': 'Destinataires',
    },
    'q2gca5fi': {
      'en': 'Customers',
      'af': 'Kliënte',
      'es': 'Clientes',
      'fr': 'Clients',
    },
    'wwmxu4ay': {
      'en': 'Admin',
      'af': 'admin',
      'es': 'Administración',
      'fr': 'Administrateur',
    },
    'nkr4co1e': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'es': 'Por favor seleccione...',
      'fr': 'Veuillez sélectionner...',
    },
    'iy0k6t1w': {
      'en': 'Search for an item...',
      'af': 'Soek vir \'n item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'grjm4xf0': {
      'en': 'Template name is required',
      'af': 'Sjabloonnaam word vereis',
      'es': 'El nombre de la plantilla es obligatorio',
      'fr': 'Le nom du modèle est obligatoire',
    },
    'zj3i1y5f': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'vjy5jlkl': {
      'en': 'Subject link is required',
      'af': 'Vakskakel word vereis',
      'es': 'Se requiere enlace de asunto',
      'fr': 'Le lien vers l\'objet est requis',
    },
    's4io9g4s': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '1uh27saj': {
      'en': 'Preview text is required',
      'af': 'Voorskouteks word vereis',
      'es': 'Se requiere vista previa del texto',
      'fr': 'Le texte d\'aperçu est requis',
    },
    'hgni7okn': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // ColorTextField
  {
    'todsve9v': {
      'en': '#fffff',
      'af': '#ffff',
      'es': '#ffff',
      'fr': '#fffff',
    },
  },
  // CreatePermission
  {
    'yzywpkcx': {
      'en': 'Create Permission',
      'af': 'Skep toestemming',
      'es': 'Crear permiso',
      'fr': 'Créer une autorisation',
    },
    'pi4eluur': {
      'en': 'Please enter the name of the role',
      'af': 'Voer asseblief die naam van die rol in',
      'es': 'Por favor ingrese el nombre del rol',
      'fr': 'Veuillez saisir le nom du rôle',
    },
    'p12s3zrd': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '96fhwbr8': {
      'en': 'Please enter the description of the role',
      'af': 'Voer asseblief die beskrywing van die rol in',
      'es': 'Por favor ingrese la descripción del rol',
      'fr': 'Veuillez saisir la description du rôle',
    },
    '0fnlgnda': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // UpdatePermission
  {
    'snbzjyu7': {
      'en': 'Create Permission',
      'af': 'Skep toestemming',
      'es': 'Crear permiso',
      'fr': 'Créer une autorisation',
    },
    '6bupn4nn': {
      'en': 'Please enter the name of the role',
      'af': 'Voer asseblief die naam van die rol in',
      'es': 'Por favor ingrese el nombre del rol',
      'fr': 'Veuillez saisir le nom du rôle',
    },
    'rvuqr1xw': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'gvbubnaz': {
      'en': 'Please enter the description of the role',
      'af': 'Voer asseblief die beskrywing van die rol in',
      'es': 'Por favor ingrese la descripción del rol',
      'fr': 'Veuillez saisir la description du rôle',
    },
    'qai9km17': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // CreateService
  {
    'x31cz1qa': {
      'en': 'Provider',
      'af': 'Verskaffer',
      'es': 'Proveedor',
      'fr': 'Fournisseur',
    },
    'ycn7re4x': {
      'en': 'Name is required',
      'af': 'Naam word vereis',
      'es': 'Se requiere el nombre',
      'fr': 'Le nom est requis',
    },
    'v2zzitma': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '5eroug7y': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'g31iko00': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'hhrf16zr': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    '9brzu35d': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // UpdateService
  {
    '0h0kti5m': {
      'en': 'Action',
      'af': 'Aksie',
      'es': 'Acción',
      'fr': 'Action',
    },
    'wbyc6sq8': {
      'en': 'Providers',
      'af': 'Verskaffers',
      'es': 'Proveedores',
      'fr': 'Fournisseurs',
    },
    '4i1zlwtz': {
      'en': 'Cash Back',
      'af': 'Boodskap',
      'es': 'Mensaje',
      'fr': 'Message',
    },
    'xe7rq8zw': {
      'en': 'Service Cash Back',
      'af': 'Geld terug',
      'es': 'Devolución de dinero',
      'fr': 'Remise en argent',
    },
    'lwqdvhbf': {
      'en': 'Enable or Disable Cash Back',
      'af': '',
      'es': '',
      'fr': '',
    },
    'xn3dulaa': {
      'en': 'Cash Bank (Min-0.1=10%) / (Max-1=100%)',
      'af': '',
      'es': '',
      'fr': '',
    },
    'sd6cla6k': {
      'en': '0.1',
      'af': '',
      'es': '',
      'fr': '',
    },
    '278p9rfo': {
      'en': 'Amount Picker',
      'af': '',
      'es': '',
      'fr': '',
    },
    '29sbzl15': {
      'en': 'Service Amount Picker',
      'af': 'Bedragkieser',
      'es': 'Selector de cantidad',
      'fr': 'Sélecteur de montant',
    },
    'cco0suem': {
      'en': 'Enable or Disable Amount Picker',
      'af': '',
      'es': '',
      'fr': '',
    },
    'wcyr0hl4': {
      'en': 'Message',
      'af': '',
      'es': '',
      'fr': '',
    },
    '62kbf0k5': {
      'en': 'Notify your users about the reasons for suspending the service.',
      'af':
          'Stel jou gebruikers in kennis van die redes vir die opskorting van die diens.',
      'es':
          'Notifica a tus usuarios sobre los motivos de la suspensión del servicio.',
      'fr':
          'Informez vos utilisateurs des raisons de la suspension du service.',
    },
    'x69ikvzt': {
      'en': 'Suspension title is required',
      'af': 'Opskortingstitel word vereis',
      'es': 'Se requiere título de suspensión',
      'fr': 'Le titre de la suspension est requis',
    },
    '505axcqw': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'vqcfwswm': {
      'en': 'Suspension description is required',
      'af': 'Skorsingbeskrywing word vereis',
      'es': 'Se requiere descripción de la suspensión',
      'fr': 'Une description de la suspension est requise',
    },
    'tinzcwrq': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // PostComposer
  {
    'py99xmcl': {
      'en': 'Desktop',
      'af': 'Desktop',
      'es': 'Escritorio',
      'fr': 'Bureau',
    },
    '5ljkaopz': {
      'en': 'Mobile',
      'af': 'Selfoon',
      'es': 'Móvil',
      'fr': 'Mobile',
    },
    'imjkj6sn': {
      'en': 'Desktop',
      'af': 'Desktop',
      'es': 'Escritorio',
      'fr': 'Bureau',
    },
    'cq5xzg9p': {
      'en': 'Write your content here',
      'af': 'Skryf jou inhoud hier',
      'es': 'Escribe tu contenido aquí',
      'fr': 'Écrivez votre contenu ici',
    },
    '0vqw9f75': {
      'en': 'Categories',
      'af': 'Kategorieë',
      'es': 'Categorías',
      'fr': 'Catégories',
    },
    'ngn9vca6': {
      'en': 'Option 1',
      'af': 'Opsie 1',
      'es': 'Opción 1',
      'fr': 'Option 1',
    },
    '8xpka38t': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'tibno1tz': {
      'en': 'Post content',
      'af': 'Plaas inhoud',
      'es': 'Publicar Contenido',
      'fr': 'Publier un contenu',
    },
    '9xmd6g0a': {
      'en': 'Advance Settings',
      'af': 'Gevorderde instellings',
      'es': 'Configuraciones avanzadas',
      'fr': 'Paramètres avancés',
    },
  },
  // CreateLink
  {
    '544tkl53': {
      'en': 'Enable or Disable this Store app link',
      'af': 'Aktiveer of deaktiveer hierdie winkelprogramskakel',
      'es':
          'Habilitar o deshabilitar el enlace de esta aplicación de la Tienda',
      'fr': 'Activer ou désactiver le lien de cette application Store',
    },
    'yhyxsfcx': {
      'en': 'App Store Image Size (420 by 150)',
      'af': 'App Store-prentgrootte (420 by 150)',
      'es': 'Tamaño de imagen de la App Store (420 por 150)',
      'fr': 'Taille de l’image de l’App Store (420 par 150)',
    },
  },
  // UpdateLink
  {
    'v30vj606': {
      'en': 'App Store Image Size (420 by 150)',
      'af': 'App Store-prentgrootte (420 by 150)',
      'es': 'Tamaño de imagen de la App Store (420 por 150)',
      'fr': 'Taille de l’image de l’App Store (420 par 150)',
    },
  },
  // LunchUrlIcon
  {
    'k3j2x7xd': {
      'en': 'Open link',
      'af': 'Maak skakel oop',
      'es': 'Enlace abierto',
      'fr': 'Ouvrir le lien',
    },
  },
  // BlogComp
  {
    '7ay3wec2': {
      'en': 'Edit this Section',
      'af': 'Wysig hierdie afdeling',
      'es': 'Editar esta sección',
      'fr': 'Modifier cette section',
    },
    'pm963fgr': {
      'en': 'Write a new Post',
      'af': 'Skryf \'n nuwe plasing',
      'es': 'Escribe una nueva publicación',
      'fr': 'Écrire un nouveau message',
    },
  },
  // PostSettings
  {
    'zwzp34r3': {
      'en': 'Blog Settings',
      'af': 'Bloginstellings',
      'es': 'Configuración del blog',
      'fr': 'Paramètres du blog',
    },
    'z0hdsxwl': {
      'en': 'Desktop',
      'af': 'Desktop',
      'es': 'Escritorio',
      'fr': 'Bureau',
    },
    'qfhb8xh3': {
      'en': 'Mobile',
      'af': 'Selfoon',
      'es': 'Móvil',
      'fr': 'Mobile',
    },
    'udv8zgho': {
      'en': 'Desktop',
      'af': 'Desktop',
      'es': 'Escritorio',
      'fr': 'Bureau',
    },
    'md4seb6m': {
      'en': 'Your blog page information here',
      'af': 'Jou blog bladsy inligting hier',
      'es': 'Información de la página de tu blog aquí',
      'fr': 'Informations sur votre page de blog ici',
    },
    '5p3tqka8': {
      'en':
          'Please provide a name for the blog page and a brief description of what the Blog page will contain.',
      'af':
          'Verskaf asseblief \'n naam vir die blogbladsy en \'n kort beskrywing van wat die blogbladsy sal bevat.',
      'es':
          'Proporcione un nombre para la página del blog y una breve descripción de lo que contendrá la página del blog.',
      'fr':
          'Veuillez fournir un nom pour la page du blog et une brève description de ce que la page du blog contiendra.',
    },
    'm9430mwy': {
      'en': 'Page Name/Title',
      'af': 'Bladsy Naam/Titel',
      'es': 'Nombre/título de la página',
      'fr': 'Nom/titre de la page',
    },
    'zjwuwdf9': {
      'en': 'Blog description',
      'af': 'Blog beskrywing',
      'es': 'Descripción del blog',
      'fr': 'Descriptif du blog',
    },
  },
  // Header
  {
    '2su788ub': {
      'en': 'Header',
      'af': 'Opskrif',
      'es': 'Encabezamiento',
      'fr': 'Entête',
    },
  },
  // Footer
  {
    'fm1qdjws': {
      'en': 'Footer',
      'af': 'Voetskrif',
      'es': 'Pie de página',
      'fr': 'Bas de page',
    },
  },
  // HomeAbuja
  {
    'iak2u3g8': {
      'en': 'Your financial passport',
      'af': 'Jou finansiële paspoort',
      'es': 'Tu pasaporte financiero',
      'fr': 'Votre passeport financier',
    },
    'jjcbp89g': {
      'en':
          'We accept various types of currency, including Bitcoin, Ethereum, Doge, and USDT, and you may also use your favorite platform.',
      'af':
          'Ons aanvaar verskeie soorte geldeenhede, insluitend Bitcoin, Ethereum, Doge en USDT, en jy kan ook jou gunsteling platform gebruik.',
      'es':
          'Aceptamos varios tipos de moneda, incluidos Bitcoin, Ethereum, Doge y USDT, y también puede utilizar su plataforma favorita.',
      'fr':
          'Nous acceptons différents types de devises, notamment Bitcoin, Ethereum, Doge et USDT, et vous pouvez également utiliser votre plateforme préférée.',
    },
    'wcetpbvb': {
      'en': 'BACK BY',
      'af': 'TERUG BY',
      'es': 'VOLVER POR',
      'fr': 'RETOUR PAR',
    },
    'eksx9f4b': {
      'en': 'FEATURES',
      'af': 'KENMERKE',
      'es': 'CARACTERÍSTICAS',
      'fr': 'CARACTÉRISTIQUES',
    },
    'z1rf7qv6': {
      'en': 'The Super Financial App',
      'af': 'Die Super Finansiële App',
      'es': 'La aplicación súper financiera',
      'fr': 'L\'application super financière',
    },
    'xlrkcjn4': {
      'en':
          'A multi currency e-wallet that allows you to exchange, spend and send money at the best possible rates',
      'af':
          '\'n Multi-geldeenheid e-beursie wat jou toelaat om geld te ruil, te spandeer en te stuur teen die beste moontlike tariewe',
      'es':
          'Una billetera electrónica multidivisa que le permite cambiar, gastar y enviar dinero a las mejores tarifas posibles.',
      'fr':
          'Un portefeuille électronique multidevises qui vous permet d\'échanger, de dépenser et d\'envoyer de l\'argent aux meilleurs taux possibles.',
    },
    'qo99dxzw': {
      'en': 'Fast Payments',
      'af': 'Vinnige betalings',
      'es': 'Pagos Rápidos',
      'fr': 'Paiements rapides',
    },
    'mkoqpuxk': {
      'en':
          'Move money across town, across Africa or across continents hassle-free.',
      'af':
          'Beweeg moeiteloos geld oor die dorp, oor Afrika of oor kontinente heen.',
      'es':
          'Mueva dinero por la ciudad, por África o por continentes sin problemas.',
      'fr':
          'Déplacez de l\'argent à travers la ville, à travers l\'Afrique ou à travers les continents sans tracas.',
    },
    '2s917lxn': {
      'en': 'Multi Wallets',
      'af': 'Multi beursies',
      'es': 'Carteras múltiples',
      'fr': 'Multi-portefeuilles',
    },
    '48ommzmt': {
      'en':
          'Receive, hold, and exchange money in more than 20 currencies for free.',
      'af': 'Ontvang, hou en ruil geld gratis in meer as 20 geldeenhede.',
      'es':
          'Reciba, mantenga e intercambie dinero en más de 20 monedas de forma gratuita.',
      'fr':
          'Recevez, conservez et échangez gratuitement de l’argent dans plus de 20 devises.',
    },
    'jcaovgwq': {
      'en': 'Multi Wallets',
      'af': 'Multi beursies',
      'es': 'Carteras múltiples',
      'fr': 'Multi-portefeuilles',
    },
    'fmdl8ap7': {
      'en':
          'Receive, hold, and exchange money in more than 20 currencies for free.',
      'af': 'Ontvang, hou en ruil geld gratis in meer as 20 geldeenhede.',
      'es':
          'Reciba, mantenga e intercambie dinero en más de 20 monedas de forma gratuita.',
      'fr':
          'Recevez, conservez et échangez gratuitement de l’argent dans plus de 20 devises.',
    },
    'q02a6jsa': {
      'en': 'Get a card that matches your style',
      'af': 'Kry \'n kaart wat by jou styl pas',
      'es': 'Consigue una tarjeta que combine con tu estilo',
      'fr': 'Obtenez une carte qui correspond à votre style',
    },
    '0oj10b55': {
      'en': 'Select your style and enjoy a card you can brag about.',
      'af': 'Kies jou styl en geniet \'n kaart waarmee jy kan spog.',
      'es':
          'Selecciona tu estilo y disfruta de una tarjeta de la que podrás presumir.',
      'fr':
          'Sélectionnez votre style et profitez d\'une carte dont vous pourrez vous vanter.',
    },
    'nz3jzr2h': {
      'en': 'Get Started for Free',
      'af': 'Begin gratis',
      'es': 'Comience gratis',
      'fr': 'Commencez gratuitement',
    },
    'ra5uyx6n': {
      'en':
          'With our user-friendly and attractive interface, buying and selling your crypto assets is straightforward.',
      'af':
          'Met ons gebruikersvriendelike en aantreklike koppelvlak is die koop en verkoop van u kripto-bates eenvoudig.',
      'es':
          'Con nuestra interfaz atractiva y fácil de usar, comprar y vender sus criptoactivos es sencillo.',
      'fr':
          'Grâce à notre interface conviviale et attrayante, acheter et vendre vos actifs cryptographiques est simple.',
    },
    'j8o2bjxp': {
      'en': 'Learn more about how our app works with these resources.',
      'af':
          'Kom meer te wete oor hoe ons toepassing met hierdie hulpbronne werk.',
      'es':
          'Obtenga más información sobre cómo funciona nuestra aplicación con estos recursos.',
      'fr':
          'Apprenez-en davantage sur la manière dont notre application fonctionne avec ces ressources.',
    },
    'lp18hnwf': {
      'en':
          'Articles crafted by experts to help you understand how our app works.',
      'af':
          'Artikels wat deur kundiges gemaak is om jou te help verstaan ​​hoe ons toepassing werk.',
      'es':
          'Artículos elaborados por expertos para ayudarle a comprender cómo funciona nuestra aplicación.',
      'fr':
          'Articles rédigés par des experts pour vous aider à comprendre le fonctionnement de notre application.',
    },
    'w6a3vvto': {
      'en': 'Say Hello to Invoicing on Grey',
      'af': 'Sê hallo vir Invoicing op Grey',
      'es': 'Saluda a la facturación en gris',
      'fr': 'Dites bonjour à la facturation sur Gray',
    },
    'q09rjz4b': {
      'en':
          'Receive, hold, and exchange money in more than 20 currencies for free.',
      'af': 'Ontvang, hou en ruil geld gratis in meer as 20 geldeenhede.',
      'es':
          'Reciba, mantenga e intercambie dinero en más de 20 monedas de forma gratuita.',
      'fr':
          'Recevez, conservez et échangez gratuitement de l’argent dans plus de 20 devises.',
    },
  },
  // HomeLagos
  {
    '89918hsz': {
      'en': 'Your financial passport',
      'af': 'Jou finansiële paspoort',
      'es': 'Tu pasaporte financiero',
      'fr': 'Votre passeport financier',
    },
    'ploviz9w': {
      'en':
          'Purchase Airtime, Data bundles, Cable TV services, Electricity, and more, all in one convenient platform',
      'af':
          'Koop lugtyd, databundels, kabel-TV-dienste, elektrisiteit en meer, alles in een gerieflike platform',
      'es':
          'Compre tiempo aire, paquetes de datos, servicios de televisión por cable, electricidad y más, todo en una cómoda plataforma',
      'fr':
          'Achetez du temps d\'antenne, des forfaits de données, des services de télévision par câble, de l\'électricité et bien plus encore, le tout sur une seule plateforme pratique',
    },
    'qs2t7csb': {
      'en': 'Or',
      'af': 'Of',
      'es': 'O',
      'fr': 'Ou',
    },
    'xe85n2x7': {
      'en': 'Ask Us a Question',
      'af': 'Vra ons \'n vraag',
      'es': 'Haznos una pregunta',
      'fr': 'Posez-nous une question',
    },
    'zfnkealo': {
      'en': 'The All in one App',
      'af': 'Die Alles in een App',
      'es': 'La aplicación todo en uno',
      'fr': 'L\'application tout-en-un',
    },
    'r5cm35gw': {
      'en':
          'Explore the convenience of our one-stop platform where you can effortlessly purchase a wide range of essential services.',
      'af':
          'Verken die gerief van ons eenstopplatform waar jy moeiteloos \'n wye reeks noodsaaklike dienste kan koop.',
      'es':
          'Explore la conveniencia de nuestra plataforma integral donde puede comprar sin esfuerzo una amplia gama de servicios esenciales.',
      'fr':
          'Découvrez la commodité de notre plateforme unique où vous pouvez acheter sans effort une large gamme de services essentiels.',
    },
    'zhwebevu': {
      'en': 'Simplified Bill Management',
      'af': 'Vereenvoudigde rekeningbestuur',
      'es': 'Gestión de facturas simplificada',
      'fr': 'Gestion simplifiée des factures',
    },
    '6nqnq6bt': {
      'en':
          'Say goodbye to the hassle of managing paper bills and long queues. With bill payment apps, effortlessly organize and pay all your bills from one convenient location. Simplify your life and stay stress-free.',
      'af':
          'Sê totsiens vir die gesukkel om papierrekeninge en lang toue te bestuur. Met rekeningbetalingsprogramme, organiseer en betaal moeiteloos al jou rekeninge vanaf een gerieflike plek. Vereenvoudig jou lewe en bly stresvry.',
      'es':
          'Diga adiós a la molestia de gestionar facturas en papel y a las largas colas. Con las aplicaciones de pago de facturas, organice y pague fácilmente todas sus facturas desde una ubicación conveniente. Simplifica tu vida y mantente libre de estrés.',
      'fr':
          'Dites adieu aux tracas liés à la gestion des factures papier et aux longues files d\'attente. Avec les applications de paiement de factures, organisez et payez sans effort toutes vos factures à partir d\'un seul endroit pratique. Simplifiez-vous la vie et restez sans stress.',
    },
    'h615kc79': {
      'en': 'Timely Payments, Zero Delays',
      'af': 'Tydige betalings, geen vertragings nie',
      'es': 'Pagos oportunos, cero retrasos',
      'fr': 'Paiements ponctuels, zéro retard',
    },
    'd9mecy3e': {
      'en':
          'Never again be late for anything! Apps for paying bills ensure that you always pay your bills on time by providing timely reminders and auto-pay capabilities. Keep your financial integrity while taking pleasure in peace of mind.',
      'af':
          'Moet nooit weer laat wees vir enigiets nie! Programme om rekeninge te betaal verseker dat jy altyd jou rekeninge betyds betaal deur tydige aanmanings en outomatiese betaalvermoëns te verskaf. Behou jou finansiële integriteit terwyl jy plesier in gemoedsrus geniet.',
      'es':
          '¡Nunca más llegues tarde a nada! Las aplicaciones para pagar facturas garantizan que siempre pague sus facturas a tiempo al brindarle recordatorios oportunos y capacidades de pago automático. Mantenga su integridad financiera mientras disfruta de la tranquilidad.',
      'fr':
          'Ne soyez plus jamais en retard pour quoi que ce soit ! Les applications de paiement des factures garantissent que vous payez toujours vos factures à temps en fournissant des rappels en temps opportun et des capacités de paiement automatique. Gardez votre intégrité financière tout en profitant en toute sérénité.',
    },
    '1hh20wru': {
      'en': 'We\'ve got you covered.',
      'af': 'Ons het jou gedek.',
      'es': 'Te tenemos cubierto.',
      'fr': 'Nous avons ce qu\'il vous faut.',
    },
    '06jhfpwe': {
      'en':
          'Whether it\'s topping up your mobile phone with airtime, ensuring you stay connected with data bundles, enjoying uninterrupted entertainment with cable TV services, or even taking care of your monthly electricity bills',
      'af':
          'Of dit nou is om jou selfoon aan te vul met lugtyd, om te verseker dat jy verbind bly met databundels, om ononderbroke vermaak met kabel-TV-dienste te geniet, of selfs om te sorg vir jou maandelikse elektrisiteitsrekeninge',
      'es':
          'Ya sea recargando tu teléfono móvil con tiempo aire, asegurándote de mantenerte conectado con paquetes de datos, disfrutando de entretenimiento ininterrumpido con servicios de televisión por cable o incluso ocupándote de tus facturas mensuales de electricidad.',
      'fr':
          'Qu\'il s\'agisse de recharger votre téléphone mobile avec du temps d\'antenne, de vous assurer de rester connecté avec des forfaits de données, de profiter de divertissements ininterrompus avec les services de télévision par câble ou même de prendre en charge vos factures d\'électricité mensuelles.',
    },
    '0of12qlb': {
      'en': 'Learn more about how our app works with these resources.',
      'af':
          'Kom meer te wete oor hoe ons toepassing met hierdie hulpbronne werk.',
      'es':
          'Obtenga más información sobre cómo funciona nuestra aplicación con estos recursos.',
      'fr':
          'Apprenez-en davantage sur la façon dont notre application fonctionne avec ces ressources.',
    },
    'wpq8yif0': {
      'en':
          'Articles crafted by experts to help you understand how our app works.',
      'af':
          'Artikels wat deur kundiges gemaak is om jou te help verstaan ​​hoe ons toepassing werk.',
      'es':
          'Artículos elaborados por expertos para ayudarle a comprender cómo funciona nuestra aplicación.',
      'fr':
          'Articles rédigés par des experts pour vous aider à comprendre le fonctionnement de notre application.',
    },
    'yl0rvgci': {
      'en': 'Say Hello to Invoicing on Grey',
      'af': 'Sê hallo vir Invoicing op Grey',
      'es': 'Saluda a la facturación en gris',
      'fr': 'Dites bonjour à la facturation sur Gray',
    },
    '26vu7xwe': {
      'en':
          'Receive, hold, and exchange money in more than 20 currencies for free.',
      'af': 'Ontvang, hou en ruil geld gratis in meer as 20 geldeenhede.',
      'es':
          'Reciba, mantenga e intercambie dinero en más de 20 monedas de forma gratuita.',
      'fr':
          'Recevez, conservez et échangez gratuitement de l’argent dans plus de 20 devises.',
    },
    'xhl3gw7m': {
      'en': 'Say Hello to Invoicing on Grey',
      'af': 'Sê hallo vir Invoicing op Grey',
      'es': 'Saluda a la facturación en gris',
      'fr': 'Dites bonjour à la facturation sur Gray',
    },
    '24deh7e6': {
      'en':
          'Receive, hold, and exchange money in more than 20 currencies for free.',
      'af': 'Ontvang, hou en ruil geld gratis in meer as 20 geldeenhede.',
      'es':
          'Reciba, mantenga e intercambie dinero en más de 20 monedas de forma gratuita.',
      'fr':
          'Recevez, conservez et échangez gratuitement de l’argent dans plus de 20 devises.',
    },
    '8zvwxno6': {
      'en': 'Say Hello to Invoicing on Grey',
      'af': 'Sê hallo vir Invoicing op Grey',
      'es': 'Saluda a la facturación en gris',
      'fr': 'Dites bonjour à la facturation sur Gray',
    },
    'olqzq4rt': {
      'en':
          'Receive, hold, and exchange money in more than 20 currencies for free.',
      'af': 'Ontvang, hou en ruil geld gratis in meer as 20 geldeenhede.',
      'es':
          'Reciba, mantenga e intercambie dinero en más de 20 monedas de forma gratuita.',
      'fr':
          'Recevez, conservez et échangez gratuitement de l’argent dans plus de 20 devises.',
    },
  },
  // HomeEnugu
  {
    'rqqs2k6t': {
      'en': 'Get your\n',
      'af': 'Kry jou',
      'es': 'Conseguir su',
      'fr': 'Obtenir votre',
    },
    '9dm8cfwb': {
      'en': 'Garri delivered\n',
      'af': 'Garri afgelewer',
      'es': 'Garri entregado',
      'fr': 'Garri livré',
    },
    'ckykldpc': {
      'en': 'within minutes.',
      'af': 'binne minute.',
      'es': 'en minutos.',
      'fr': 'dans quelques minutes.',
    },
    '92bngoum': {
      'en': 'We delivered nationwide, if you are based in the city of Ibadan',
      'af': 'Ons het landwyd afgelewer, as u in die stad Ibadan gebaseer is',
      'es':
          'Realizamos entregas a todo el país, si reside en la ciudad de Ibadan.',
      'fr':
          'Nous livrons dans tout le pays, si vous êtes basé dans la ville d\'Ibadan',
    },
    'v6mp5wih': {
      'en': 'FEATURES',
      'af': 'KENMERKE',
      'es': 'CARACTERÍSTICAS',
      'fr': 'CARACTÉRISTIQUES',
    },
    'qxn5mffq': {
      'en': 'The Super Financial App',
      'af': 'Die Super Finansiële App',
      'es': 'La aplicación súper financiera',
      'fr': 'L\'application super financière',
    },
    'mttk3jnv': {
      'en':
          'A multi currency e-wallet that allows you to exchange, spend and send money at the best possible rates',
      'af':
          '\'n Multi-geldeenheid e-beursie wat jou toelaat om geld te ruil, te spandeer en te stuur teen die beste moontlike tariewe',
      'es':
          'Una billetera electrónica multidivisa que le permite cambiar, gastar y enviar dinero a las mejores tarifas posibles.',
      'fr':
          'Un portefeuille électronique multidevises qui vous permet d\'échanger, de dépenser et d\'envoyer de l\'argent aux meilleurs taux possibles.',
    },
    'xnq5tcgy': {
      'en': 'Fast Payments',
      'af': 'Vinnige betalings',
      'es': 'Pagos Rápidos',
      'fr': 'Paiements rapides',
    },
    'jxu05r0u': {
      'en':
          'Move money across town, across Africa or across continents hassle-free.',
      'af':
          'Beweeg moeiteloos geld oor die dorp, oor Afrika of oor kontinente heen.',
      'es':
          'Mueva dinero por la ciudad, por África o por continentes sin problemas.',
      'fr':
          'Déplacez de l\'argent à travers la ville, à travers l\'Afrique ou à travers les continents sans tracas.',
    },
    'mkw0mxqg': {
      'en': 'Multi Wallets',
      'af': 'Multi beursies',
      'es': 'Carteras múltiples',
      'fr': 'Multi-portefeuilles',
    },
    'p9atdxny': {
      'en':
          'Receive, hold, and exchange money in more than 20 currencies for free.',
      'af': 'Ontvang, hou en ruil geld gratis in meer as 20 geldeenhede.',
      'es':
          'Reciba, mantenga e intercambie dinero en más de 20 monedas de forma gratuita.',
      'fr':
          'Recevez, conservez et échangez gratuitement de l’argent dans plus de 20 devises.',
    },
    'mw17q5j1': {
      'en': 'Multi Wallets',
      'af': 'Multi beursies',
      'es': 'Carteras múltiples',
      'fr': 'Multi-portefeuilles',
    },
    'lknsbbln': {
      'en':
          'Receive, hold, and exchange money in more than 20 currencies for free.',
      'af': 'Ontvang, hou en ruil geld gratis in meer as 20 geldeenhede.',
      'es':
          'Reciba, mantenga e intercambie dinero en más de 20 monedas de forma gratuita.',
      'fr':
          'Recevez, conservez et échangez gratuitement de l’argent dans plus de 20 devises.',
    },
    'ni52eyq9': {
      'en': 'Get a card that matches your style',
      'af': 'Kry \'n kaart wat by jou styl pas',
      'es': 'Consigue una tarjeta que combine con tu estilo',
      'fr': 'Obtenez une carte qui correspond à votre style',
    },
    'oik35jj4': {
      'en': 'Select your style and enjoy a card you can brag about.',
      'af': 'Kies jou styl en geniet \'n kaart waarmee jy kan spog.',
      'es':
          'Selecciona tu estilo y disfruta de una tarjeta de la que podrás presumir.',
      'fr':
          'Sélectionnez votre style et profitez d\'une carte dont vous pourrez vous vanter.',
    },
    'za06rlyi': {
      'en': 'Get started for free',
      'af': 'Begin gratis',
      'es': 'Comience gratis',
      'fr': 'Commencez gratuitement',
    },
    'zjtgsn2l': {
      'en':
          'With our user-friendly and attractive interface, buying and selling your crypto assets is straightforward.',
      'af':
          'Met ons gebruikersvriendelike en aantreklike koppelvlak is die koop en verkoop van u kripto-bates eenvoudig.',
      'es':
          'Con nuestra interfaz atractiva y fácil de usar, comprar y vender sus criptoactivos es sencillo.',
      'fr':
          'Grâce à notre interface conviviale et attrayante, acheter et vendre vos actifs cryptographiques est simple.',
    },
    '0sgl7jwg': {
      'en': 'Learn more about how our app works with these resources.',
      'af':
          'Kom meer te wete oor hoe ons toepassing met hierdie hulpbronne werk.',
      'es':
          'Obtenga más información sobre cómo funciona nuestra aplicación con estos recursos.',
      'fr':
          'Apprenez-en davantage sur la façon dont notre application fonctionne avec ces ressources.',
    },
    's9j2qylg': {
      'en':
          'Articles crafted by experts to help you understand how our app works.',
      'af':
          'Artikels wat deur kundiges gemaak is om jou te help verstaan ​​hoe ons toepassing werk.',
      'es':
          'Artículos elaborados por expertos para ayudarle a comprender cómo funciona nuestra aplicación.',
      'fr':
          'Articles rédigés par des experts pour vous aider à comprendre le fonctionnement de notre application.',
    },
    'vg1sqbjz': {
      'en': 'Say Hello to Invoicing on Grey',
      'af': 'Sê hallo vir Invoicing op Grey',
      'es': 'Saluda a la facturación en gris',
      'fr': 'Dites bonjour à la facturation sur Gray',
    },
    'koqolewp': {
      'en':
          'Receive, hold, and exchange money in more than 20 currencies for free.',
      'af': 'Ontvang, hou en ruil geld gratis in meer as 20 geldeenhede.',
      'es':
          'Reciba, mantenga e intercambie dinero en más de 20 monedas de forma gratuita.',
      'fr':
          'Recevez, conservez et échangez gratuitement de l’argent dans plus de 20 devises.',
    },
    'feuz5muj': {
      'en': 'Say Hello to Invoicing on Grey',
      'af': 'Sê hallo vir Invoicing op Grey',
      'es': 'Saluda a la facturación en gris',
      'fr': 'Dites bonjour à la facturation sur Gray',
    },
    'aaa0zpku': {
      'en':
          'Receive, hold, and exchange money in more than 20 currencies for free.',
      'af': 'Ontvang, hou en ruil geld gratis in meer as 20 geldeenhede.',
      'es':
          'Reciba, mantenga e intercambie dinero en más de 20 monedas de forma gratuita.',
      'fr':
          'Recevez, conservez et échangez gratuitement de l’argent dans plus de 20 devises.',
    },
    'acxth2hz': {
      'en': 'Say Hello to Invoicing on Grey',
      'af': 'Sê hallo vir Invoicing op Grey',
      'es': 'Saluda a la facturación en gris',
      'fr': 'Dites bonjour à la facturation sur Gray',
    },
    'fo41ff1n': {
      'en':
          'Receive, hold, and exchange money in more than 20 currencies for free.',
      'af': 'Ontvang, hou en ruil geld gratis in meer as 20 geldeenhede.',
      'es':
          'Reciba, mantenga e intercambie dinero en más de 20 monedas de forma gratuita.',
      'fr':
          'Recevez, conservez et échangez gratuitement de l’argent dans plus de 20 devises.',
    },
  },
  // CreateTheme
  {
    'kw9g5vqr': {
      'en': 'Theme Image Size (420 by 150)',
      'af': 'Temaprentgrootte (420 by 150)',
      'es': 'Tamaño de la imagen del tema (420 por 150)',
      'fr': 'Taille de l\'image du thème (420 par 150)',
    },
  },
  // ConfirmTransaction
  {
    '8cuiu4ke': {
      'en': 'Amount',
      'af': 'Bedrag',
      'es': 'Cantidad',
      'fr': 'Montant',
    },
    'q7q28ivz': {
      'en': 'Customer Number',
      'af': 'Kliënt nommer',
      'es': 'Número de cliente',
      'fr': 'Numéro de client',
    },
    'k1vy67qb': {
      'en': 'Product Name',
      'af': 'Produk Naam',
      'es': 'nombre del producto',
      'fr': 'Nom du produit',
    },
    'ijrg9grr': {
      'en': 'Service Type',
      'af': 'Tipe diens',
      'es': 'Tipo de servicio',
      'fr': 'type de service',
    },
    'pqtc2w72': {
      'en': 'Provider',
      'af': 'Verskaffer',
      'es': 'Proveedor',
      'fr': 'Fournisseur',
    },
    'xto9hzje': {
      'en': 'Provider Fee',
      'af': 'Verskaffersfooi',
      'es': 'Tarifa del proveedor',
      'fr': 'Frais du fournisseur',
    },
    'f8kfhs7j': {
      'en': 'Tap to enter your Transaction Pin',
      'af': 'Tik om jou transaksiepen in te voer',
      'es': 'Toque para ingresar su PIN de transacción',
      'fr': 'Appuyez pour saisir votre code PIN de transaction',
    },
  },
  // CreateProvider
  {
    '7wnzie73': {
      'en': 'Provider Logo',
      'af': 'Verskaffer Logo',
      'es': 'Logotipo del proveedor',
      'fr': 'Logo du fournisseur',
    },
    'm4ropw1g': {
      'en': 'Upload square image and should be around 150x150',
      'af': 'Laai vierkantige prent op en moet ongeveer 150x150 wees',
      'es': 'Sube una imagen cuadrada y debe tener alrededor de 150x150.',
      'fr':
          'Téléchargez une image carrée et devrait mesurer environ 150 x 150.',
    },
    'uxszpwj0': {
      'en': 'Country',
      'af': 'Land',
      'es': 'País',
      'fr': 'Pays',
    },
    'w7dbq6nl': {
      'en': 'NG',
      'af': 'NG',
      'es': 'NG',
      'fr': 'NG',
    },
    't1giq3wf': {
      'en': 'Nigeria',
      'af': 'Nigerië',
      'es': 'Nigeria',
      'fr': 'Nigeria',
    },
    '4ex4matb': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'es': 'Por favor seleccione...',
      'fr': 'Veuillez sélectionner...',
    },
    'b4m00wkz': {
      'en': 'Search for an item...',
      'af': 'Soek vir \'n item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'vmc6wl22': {
      'en': 'Currency',
      'af': 'Geldeenheid',
      'es': 'Divisa',
      'fr': 'Devise',
    },
    'bwlgldpi': {
      'en': 'NGN',
      'af': 'NGN',
      'es': 'NGN',
      'fr': 'NGN',
    },
    'fak4gk89': {
      'en': 'NGN',
      'af': 'NGN',
      'es': 'NGN',
      'fr': 'NGN',
    },
    'c5w46uwe': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'es': 'Por favor seleccione...',
      'fr': 'Veuillez sélectionner...',
    },
    'i61t461u': {
      'en': 'Search for an item...',
      'af': 'Soek vir \'n item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    '7a9dv187': {
      'en': 'Service',
      'af': 'Diens',
      'es': 'Servicio',
      'fr': 'Service',
    },
    'i13d3tmm': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'es': 'Por favor seleccione...',
      'fr': 'Veuillez sélectionner...',
    },
    'm1ge3f2a': {
      'en': 'Search for an item...',
      'af': 'Soek vir \'n item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'mfbhgkfb': {
      'en': 'Enable or disable this service',
      'af': 'Aktiveer of deaktiveer hierdie diens',
      'es': 'Activar o desactivar este servicio',
      'fr': 'Activer ou désactiver ce service',
    },
  },
  // ListOfProvidersComp
  {
    'fxqmc5b3': {
      'en': 'Filter by Services',
      'af': 'Filtreer volgens dienste',
      'es': 'Filtrar por Servicios',
      'fr': 'Filtrer par services',
    },
    'yymlh0mv': {
      'en': 'Airtime',
      'af': 'Lugtyd',
      'es': 'Tiempo en antena',
      'fr': 'Temps d\'antenne',
    },
    'clcpgvam': {
      'en': 'Option 1',
      'af': 'Opsie 1',
      'es': 'Opción 1',
      'fr': 'Option 1',
    },
    'f10x0xpq': {
      'en': 'Select Service',
      'af': 'Kies Diens',
      'es': 'Seleccionar Servicio',
      'fr': 'Sélectionnez un service',
    },
    '0orp8idz': {
      'en': 'Search for a Service',
      'af': 'Soek vir \'n diens',
      'es': 'Buscar un servicio',
      'fr': 'Rechercher un service',
    },
    'rfkarr2p': {
      'en': 'Provider Name',
      'af': 'Verskaffer Naam',
      'es': 'Nombre del proveedor',
      'fr': 'Nom du fournisseur',
    },
    '4sxa9263': {
      'en': 'Action',
      'af': 'Aksie',
      'es': 'Acción',
      'fr': 'Action',
    },
    'ga4fou5o': {
      'en': 'Duplicate',
      'af': 'Dupliseer',
      'es': 'Duplicar',
      'fr': 'Dupliquer',
    },
    'nry5o2ns': {
      'en': 'Update',
      'af': 'Opdateer',
      'es': 'Actualizar',
      'fr': 'Mise à jour',
    },
    'ffhu976z': {
      'en': 'Delete',
      'af': 'Vee uit',
      'es': 'Borrar',
      'fr': 'Supprimer',
    },
  },
  // UpdateProvider
  {
    'nfzfnq6y': {
      'en': 'Update',
      'af': 'Hello Wêreld',
      'es': 'Hola Mundo',
      'fr': 'Bonjour le monde',
    },
    'wm1zppoo': {
      'en': 'Provider Logo',
      'af': 'Verskaffer Logo',
      'es': 'Logotipo del proveedor',
      'fr': 'Logo du fournisseur',
    },
    '1afp2nie': {
      'en': 'Upload square image and should be around 150x150',
      'af': 'Laai vierkantige prent op en moet ongeveer 150x150 wees',
      'es': 'Sube una imagen cuadrada y debe tener alrededor de 150x150.',
      'fr':
          'Téléchargez une image carrée et devrait mesurer environ 150 x 150.',
    },
    'e6kk8mr1': {
      'en': 'Services',
      'af': 'Dienste',
      'es': 'Servicios',
      'fr': 'Prestations de service',
    },
    'dvhexr8i': {
      'en': 'Enable or Disable Provider',
      'af': '',
      'es': '',
      'fr': '',
    },
    'oopkryvd': {
      'en': 'Country',
      'af': 'Land',
      'es': 'País',
      'fr': 'Pays',
    },
    'l173n6ft': {
      'en': 'NG',
      'af': 'NG',
      'es': 'NG',
      'fr': 'NG',
    },
    'whudosbt': {
      'en': 'Nigeria',
      'af': 'Nigerië',
      'es': 'Nigeria',
      'fr': 'Nigeria',
    },
    '2ua2h1tx': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'es': 'Por favor seleccione...',
      'fr': 'Veuillez sélectionner...',
    },
    'bry9iwge': {
      'en': 'Search for an item...',
      'af': 'Soek vir \'n item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'pssfgcj4': {
      'en': 'Currency',
      'af': 'Geldeenheid',
      'es': 'Divisa',
      'fr': 'Devise',
    },
    '1xj7xrzp': {
      'en': 'NGN',
      'af': 'NGN',
      'es': 'NGN',
      'fr': 'NGN',
    },
    '12hjk1e9': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'es': 'Por favor seleccione...',
      'fr': 'Veuillez sélectionner...',
    },
    'capuoff0': {
      'en': 'Search for an item...',
      'af': 'Soek vir \'n item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    '05al54tv': {
      'en': 'Service',
      'af': 'Diens',
      'es': 'Servicio',
      'fr': 'Service',
    },
    '35aewoc0': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'es': 'Por favor seleccione...',
      'fr': 'Veuillez sélectionner...',
    },
    'sdh60hnh': {
      'en': 'Search for an item...',
      'af': 'Soek vir \'n item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    '1marf09n': {
      'en': 'Provider',
      'af': 'Verskaffer',
      'es': 'Proveedor',
      'fr': 'Fournisseur',
    },
    'fean7odp': {
      'en': 'Provider Cash Back',
      'af': 'Geld terug',
      'es': 'Devolución de dinero',
      'fr': 'Remise en argent',
    },
    'qpqa0p3d': {
      'en': 'Enable or Disable Cash Back',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ad5fz3b6': {
      'en': 'Cash Bank (Min-0.1=10%) / (Max-1=100%)',
      'af': '',
      'es': '',
      'fr': '',
    },
    'xt7e0mls': {
      'en': '0.1',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // CreateRecipientType
  {
    '6io8r42h': {
      'en': 'Enable or Disable this Recipient',
      'af': 'Aktiveer of deaktiveer hierdie ontvanger',
      'es': 'Activar o desactivar este destinatario',
      'fr': 'Activer ou désactiver ce destinataire',
    },
    'iztcg6t3': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'snyw8tlg': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // SetUpApplicationComp
  {
    'zvnd831y': {
      'en': 'Set Up Onboarding',
      'af': 'Stel Onboarding op',
      'es': 'Configurar la incorporación',
      'fr': 'Configurer l\'intégration',
    },
    'vd75swzs': {
      'en': 'Application Details',
      'af': 'Aansoekbesonderhede',
      'es': 'Detalles de la aplicación',
      'fr': 'Détails de la demande',
    },
    'z58luus3': {
      'en': 'Please fill in the application details below.',
      'af': 'Vul asseblief die aansoekbesonderhede hieronder in.',
      'es': 'Complete los detalles de la solicitud a continuación.',
      'fr': 'Veuillez remplir les détails de la candidature ci-dessous.',
    },
    '14necxvc': {
      'en': 'Restart',
      'af': 'Begin oor',
      'es': 'Reanudar',
      'fr': 'Redémarrage',
    },
    'aotvaoe7': {
      'en': 'Your Name is required',
      'af': 'Jou naam word vereis',
      'es': 'Su nombre es requerido',
      'fr': 'Votre nom est requis',
    },
    'xr9h3plj': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '23scu6d1': {
      'en': 'Email is required',
      'af': 'E-pos word vereis',
      'es': 'correo electronico es requerido',
      'fr': 'L\'e-mail est requis',
    },
    'os6sv79y': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '0sgeyryu': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'n8hcsl6w': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'jjscp7b7': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'i2gb5vqs': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '4koovxg5': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
    },
    'grsibhvi': {
      'en': 'Please choose an option from the dropdown',
      'af': 'Kies asseblief \'n opsie uit die aftreklys',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '46lqxoc7': {
      'en': 'Configure Your App',
      'af': 'Stel jou toepassing op',
      'es': 'Configura tu aplicación',
      'fr': 'Configurez votre application',
    },
    'avvo9696': {
      'en': 'You\'re just moments away from building your app.',
      'af': 'Jy is net \'n paar oomblikke weg van die bou van jou toepassing.',
      'es': 'Estás a solo unos minutos de crear tu aplicación.',
      'fr':
          'Vous n\'êtes qu\'à quelques instants de la création de votre application.',
    },
    'igkebnfq': {
      'en': 'Back',
      'af': 'Terug',
      'es': 'Atrás',
      'fr': 'Dos',
    },
    'yfs57tcm': {
      'en': 'Setup Successfully Completed',
      'af': 'Opstelling suksesvol voltooi',
      'es': 'Configuración completada exitosamente',
      'fr': 'Configuration terminée avec succès',
    },
    '0wq8sazf': {
      'en':
          'Your app is now ready. Click the button below to access your dashboard and start exploring the powerful features of your new application.',
      'af':
          'Jou toepassing is nou gereed. Klik op die knoppie hieronder om toegang tot jou kontroleskerm te kry en die kragtige kenmerke van jou nuwe toepassing te begin verken.',
      'es':
          'Tu aplicación ya está lista. Haga clic en el botón a continuación para acceder a su panel y comenzar a explorar las potentes funciones de su nueva aplicación.',
      'fr':
          'Votre application est maintenant prête. Cliquez sur le bouton ci-dessous pour accéder à votre tableau de bord et commencer à explorer les puissantes fonctionnalités de votre nouvelle application.',
    },
    'fslkvsyt': {
      'en': 'Seamless Installation',
      'af': 'Naatlose installasie',
      'es': 'Instalación perfecta',
      'fr': 'Installation transparente',
    },
    'x7591rib': {
      'en':
          'Effortlessly set up our user-friendly bill payment system. Enjoy quick integration, secure transactions, and a hassle-free experience for both you and your users. Get started today!',
      'af':
          'Stel ons gebruikersvriendelike rekeningbetalingstelsel moeiteloos op. Geniet vinnige integrasie, veilige transaksies en \'n moeitevrye ervaring vir beide jou en jou gebruikers. Begin vandag!',
      'es':
          'Configure sin esfuerzo nuestro sistema de pago de facturas fácil de usar. Disfrute de una integración rápida, transacciones seguras y una experiencia sin complicaciones tanto para usted como para sus usuarios. ¡Empiece hoy!',
      'fr':
          'Configurez sans effort notre système de paiement de factures convivial. Profitez d\'une intégration rapide, de transactions sécurisées et d\'une expérience sans tracas pour vous et vos utilisateurs. Commencer aujourd\'hui!',
    },
  },
  // CreateMedia
  {
    'v0zb0w58': {
      'en': 'Upload Image',
      'af': 'Laai prent op',
      'es': 'Cargar imagen',
      'fr': 'Télécharger une image',
    },
    'swvm7tiu': {
      'en': 'Self',
      'af': 'Self',
      'es': 'Ser',
      'fr': 'Soi',
    },
    'l5aigs05': {
      'en': 'Back to Upload photos',
      'af': 'Terug na Laai foto\'s op',
      'es': 'Volver a subir fotos',
      'fr': 'Retour à Télécharger des photos',
    },
    'ylpxvhvx': {
      'en': 'Start uploading',
      'af': 'Begin oplaai',
      'es': 'Empezar a subir',
      'fr': 'Commencer le téléchargement',
    },
    'ud0u7y48': {
      'en': 'You can upload your image with PNG, JPEG, JPG anf GIF',
      'af': 'Jy kan jou prent oplaai met PNG, JPEG, JPG en GIF',
      'es': 'Puedes subir tu imagen con PNG, JPEG, JPG y GIF',
      'fr':
          'Vous pouvez télécharger votre image au format PNG, JPEG, JPG et GIF',
    },
    'gi1oqv79': {
      'en': 'Pexels',
      'af': 'Pexels',
      'es': 'Pexels',
      'fr': 'Pixels',
    },
    '2r2ygdd8': {
      'en': 'Back to Pexels photos',
      'af': 'Terug na Pexels-foto\'s',
      'es': 'Volver a las fotos de Pexels',
      'fr': 'Retour aux photos Pexels',
    },
    'cnejcvcd': {
      'en': 'Search photos via ',
      'af': 'Soek foto\'s via',
      'es': 'Buscar fotos a través de',
      'fr': 'Rechercher des photos via',
    },
    'ldto6mtt': {
      'en': 'Pexels',
      'af': 'Pexels',
      'es': 'Pexels',
      'fr': 'Pixels',
    },
    'p6oyjv7y': {
      'en':
          'Browse stock images, tap to select, and choose preferred resolution effortlessly.\n\nNote: All images are landscape-oriented to enhance the visual appeal of your articles or blogs.',
      'af':
          'Blaai deur voorraadbeelde, tik om te kies en kies moeiteloos voorkeurresolusie.\n\nLet wel: Alle beelde is landskap-georiënteerd om die visuele aantrekkingskrag van jou artikels of blogs te verbeter.',
      'es':
          'Explore imágenes de archivo, toque para seleccionar y elija la resolución preferida sin esfuerzo.\n\nNota: Todas las imágenes están orientadas al paisaje para mejorar el atractivo visual de sus artículos o blogs.',
      'fr':
          'Parcourez les images d\'archives, appuyez pour sélectionner et choisissez facilement la résolution préférée.\n\nRemarque : toutes les images sont orientées paysage pour améliorer l\'attrait visuel de vos articles ou blogs.',
    },
    'qpipyb1f': {
      'en': 'By - ',
      'af': 'Deur -',
      'es': 'Por -',
      'fr': 'Par -',
    },
  },
  // CreateAds
  {
    '5428zu4c': {
      'en': 'Ads',
      'af': '',
      'es': '',
      'fr': '',
    },
    'qkpf93u9': {
      'en': 'Enable and Disable Ads',
      'af': '',
      'es': '',
      'fr': '',
    },
    '5dkm2ldm': {
      'en':
          'You have the flexibility to add multiple sliders within a single ad. Simply click the \'Add More\' button below to enhance your content.',
      'af': '',
      'es': '',
      'fr': '',
    },
    'a5npogl3': {
      'en': 'Text Base Ads',
      'af': '',
      'es': '',
      'fr': '',
    },
    '8izqzzht': {
      'en': 'Text Properties',
      'af': '',
      'es': '',
      'fr': '',
    },
    'xcc19tvb': {
      'en': 'Text color',
      'af': '',
      'es': '',
      'fr': '',
    },
    '36300njz': {
      'en': 'Text size',
      'af': '',
      'es': '',
      'fr': '',
    },
    'mynhav4o': {
      'en': 'Background Properties',
      'af': '',
      'es': '',
      'fr': '',
    },
    '13dlad7t': {
      'en': 'Background color',
      'af': '',
      'es': '',
      'fr': '',
    },
    '9zj4j8vh': {
      'en': 'Backgroud height size',
      'af': '',
      'es': '',
      'fr': '',
    },
    '7g493stj': {
      'en': 'Ads/Banner Design',
      'af': 'App Store-prentgrootte (420 by 150)',
      'es': 'Tamaño de imagen de la App Store (420 por 150)',
      'fr': 'Taille de l’image de l’App Store (420 par 150)',
    },
    'u3uyh5ag': {
      'en': 'Type your ads here',
      'af': '',
      'es': '',
      'fr': '',
    },
    'f02xvwm0': {
      'en': 'Text Base Ads',
      'af': '',
      'es': '',
      'fr': '',
    },
    '22fcev9r': {
      'en': 'Type of Ads',
      'af': '',
      'es': '',
      'fr': '',
    },
    'ny7u15fd': {
      'en': 'Preview',
      'af': '',
      'es': '',
      'fr': '',
    },
    '3moij59y': {
      'en': 'Enable auto play',
      'af': '',
      'es': '',
      'fr': '',
    },
    '0ba1hcp6': {
      'en': 'Enable auto play',
      'af': '',
      'es': '',
      'fr': '',
    },
    'hesuqv82': {
      'en': 'Closing of Ads',
      'af': '',
      'es': '',
      'fr': '',
    },
    'b5vgfwpt': {
      'en': 'Enable closure',
      'af': '',
      'es': '',
      'fr': '',
    },
    'tlc69v3t': {
      'en': 'Where to redirect to?',
      'af': '',
      'es': '',
      'fr': '',
    },
    'pbtni14k': {
      'en': 'External Link/Page',
      'af': '',
      'es': '',
      'fr': '',
    },
    'c46kv8ze': {
      'en': 'Internal Page',
      'af': '',
      'es': '',
      'fr': '',
    },
    'zj4p1o6b': {
      'en': 'Please select...',
      'af': '',
      'es': '',
      'fr': '',
    },
    '1jn39tmq': {
      'en': 'Search for an item...',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // ReadAds
  {
    '655c85nm': {
      'en': 'External Link: ',
      'af': '',
      'es': '',
      'fr': '',
    },
    'c5efaac5': {
      'en': 'Number of Slider: ',
      'af': '',
      'es': '',
      'fr': '',
    },
    'bre6eujs': {
      'en': 'Auto Play: ',
      'af': '',
      'es': '',
      'fr': '',
    },
    'sff3w1gb': {
      'en': 'Delay(Sec): ',
      'af': '',
      'es': '',
      'fr': '',
    },
    '4bym10y1': {
      'en': 'Closable: ',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'v6wwi7qj': {
      'en': 'Search...',
      'af': 'Soek...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'ertygkf2': {
      'en': 'Button',
      'af': 'Beweeg na rommel',
      'es': 'Mover a la papelera',
      'fr': 'Mettre à la corbeille',
    },
    'zvlafgi1': {
      'en': 'Button',
      'af': 'Laai kwitansie op',
      'es': 'Subir recibo',
      'fr': 'Télécharger le reçu',
    },
    'sf942a3k': {
      'en': 'Button',
      'af': 'Knoppie',
      'es': 'Botón',
      'fr': 'Bouton',
    },
    'fhtqfliq': {
      'en': 'Button',
      'af': 'Kanselleer',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    '5zuogwm5': {
      'en': 'Select...',
      'af': 'Kies...',
      'es': 'Seleccionar...',
      'fr': 'Sélectionner...',
    },
    'pjlt7u3y': {
      'en': 'Search for an item...',
      'af': 'Soek vir \'n item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'rwxmvq4m': {
      'en':
          'In order to take a picture or video, this app requires permission to access the camera.',
      'af':
          'Om \'n foto of video te neem, benodig hierdie toepassing toestemming om toegang tot die kamera te verkry.',
      'es':
          'Para tomar una foto o grabar un video, esta aplicación requiere permiso para acceder a la cámara.',
      'fr':
          'Afin de prendre une photo ou une vidéo, cette application nécessite une autorisation pour accéder à la caméra.',
    },
    'nb6ii2lo': {
      'en':
          'In order to upload data, this app requires permission to access the photo library.',
      'af':
          'Om data op te laai, benodig hierdie toepassing toestemming om toegang tot die fotobiblioteek te verkry.',
      'es':
          'Para cargar datos, esta aplicación requiere permiso para acceder a la biblioteca de fotos.',
      'fr':
          'Afin de télécharger des données, cette application nécessite l\'autorisation d\'accéder à la photothèque.',
    },
    '8dsqjns4': {
      'en':
          'In order to choose a phone number, this app requires permission to access your contacts.',
      'af':
          'Om \'n telefoonnommer te kies, benodig hierdie toepassing toestemming om toegang tot jou kontakte te verkry.',
      'es':
          'Para elegir un número de teléfono, esta aplicación requiere permiso para acceder a sus contactos.',
      'fr':
          'Afin de choisir un numéro de téléphone, cette application nécessite l\'autorisation d\'accéder à vos contacts.',
    },
    'mzx0ojti': {
      'en':
          'In order to use biometrics, this app requires permission to access your faceid or biometrics.',
      'af':
          'Om biometrie te gebruik, benodig hierdie toepassing toestemming om toegang tot jou faceid of biometrie te verkry.',
      'es':
          'Para utilizar datos biométricos, esta aplicación requiere permiso para acceder a su faceid o datos biométricos.',
      'fr':
          'Afin d\'utiliser la biométrie, cette application nécessite l\'autorisation d\'accéder à votre identifiant facial ou à vos données biométriques.',
    },
    'w25zc789': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'n46urc7i': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    '981td78g': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    '4tuhg30m': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'p4x5fbf4': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    '79um7koa': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    '1rnqjcvg': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'krleo39y': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'e5fyiqhe': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'cb4miwu2': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    '8183ui6h': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'hu0ajr8j': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'x9pt65qs': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    '3cqghiz5': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'k5nfdg3b': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'b95y29uq': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'jf7fdqyh': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'rp4364nv': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'dggwet7u': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    '1j00gpx6': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    '3yxyqkqx': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'e6jyw6fe': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
    'fuxsnr0g': {
      'en': '',
      'af': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
