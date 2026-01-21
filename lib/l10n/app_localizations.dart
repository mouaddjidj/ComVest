import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'ComVest'**
  String get appTitle;

  /// No description provided for @appSubtitle.
  ///
  /// In en, this message translates to:
  /// **'COMMUNICATION + INVESTMENT'**
  String get appSubtitle;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your professional email'**
  String get emailHint;

  /// No description provided for @emailOrUsername.
  ///
  /// In en, this message translates to:
  /// **'Email or Username'**
  String get emailOrUsername;

  /// No description provided for @emailOrUsernameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter email or username'**
  String get emailOrUsernameHint;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get passwordHint;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @companyLogin.
  ///
  /// In en, this message translates to:
  /// **'Company Login'**
  String get companyLogin;

  /// No description provided for @investorLogin.
  ///
  /// In en, this message translates to:
  /// **'Investor Login'**
  String get investorLogin;

  /// No description provided for @connectInvestorAccount.
  ///
  /// In en, this message translates to:
  /// **'Connect to your investor account'**
  String get connectInvestorAccount;

  /// No description provided for @connectCompanyAccount.
  ///
  /// In en, this message translates to:
  /// **'Connect to your company account'**
  String get connectCompanyAccount;

  /// No description provided for @noAccountQuestion.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get noAccountQuestion;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get submit;

  /// No description provided for @enterEmailResetPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your email to reset your password.'**
  String get enterEmailResetPassword;

  /// No description provided for @enterValidEmailForReset.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address for password reset'**
  String get enterValidEmailForReset;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @instructionsSent.
  ///
  /// In en, this message translates to:
  /// **'Instructions have been sent to your email'**
  String get instructionsSent;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @companyName.
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get companyName;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @french.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get french;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @discoverComvest.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get discoverComvest;

  /// No description provided for @discoverDescription.
  ///
  /// In en, this message translates to:
  /// **'The platform connecting startups, founders and investors'**
  String get discoverDescription;

  /// No description provided for @needVisibility.
  ///
  /// In en, this message translates to:
  /// **'Need visibility?'**
  String get needVisibility;

  /// No description provided for @visibilityDescription.
  ///
  /// In en, this message translates to:
  /// **'Our marketing service will increase your visibility'**
  String get visibilityDescription;

  /// No description provided for @buildRelationships.
  ///
  /// In en, this message translates to:
  /// **'How to successfully launch your project on the market?'**
  String get buildRelationships;

  /// No description provided for @relationshipsDescription.
  ///
  /// In en, this message translates to:
  /// **'We support you from BMC structuring to pitching, for successful market entry and obtaining the label'**
  String get relationshipsDescription;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @welcomeToApp.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the ComVest App'**
  String get welcomeToApp;

  /// No description provided for @allServicesHere.
  ///
  /// In en, this message translates to:
  /// **'All your service needs are here'**
  String get allServicesHere;

  /// No description provided for @companyCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Startup/SME'**
  String get companyCardTitle;

  /// No description provided for @companyCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'If you are looking for a Startup or SME, register here'**
  String get companyCardSubtitle;

  /// No description provided for @investorCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Investor'**
  String get investorCardTitle;

  /// No description provided for @investorCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'If you want to invest in a project, click here'**
  String get investorCardSubtitle;

  /// No description provided for @fillAllFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill in all fields'**
  String get fillAllFields;

  /// No description provided for @invalidEmailOrUsername.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email or username'**
  String get invalidEmailOrUsername;

  /// No description provided for @invite.
  ///
  /// In en, this message translates to:
  /// **'Invite'**
  String get invite;

  /// No description provided for @continueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as guest'**
  String get continueAsGuest;

  /// No description provided for @createAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccountTitle;

  /// No description provided for @stepInfo.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get stepInfo;

  /// No description provided for @stepContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get stepContact;

  /// No description provided for @stepProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get stepProfile;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @createProfile.
  ///
  /// In en, this message translates to:
  /// **'Create Profile'**
  String get createProfile;

  /// No description provided for @companyNameQuestion.
  ///
  /// In en, this message translates to:
  /// **'What is your company name?'**
  String get companyNameQuestion;

  /// No description provided for @companyNameDescription.
  ///
  /// In en, this message translates to:
  /// **'Select an entity, or create a new one, to register it on Sortlist'**
  String get companyNameDescription;

  /// No description provided for @usernameLabel.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get usernameLabel;

  /// No description provided for @usernameDescription.
  ///
  /// In en, this message translates to:
  /// **'This username will be used to log in to your account'**
  String get usernameDescription;

  /// No description provided for @businessSector.
  ///
  /// In en, this message translates to:
  /// **'Business Sector'**
  String get businessSector;

  /// No description provided for @activityLabel.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activityLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordLabel;

  /// No description provided for @locationLabel.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get locationLabel;

  /// No description provided for @locationDescription.
  ///
  /// In en, this message translates to:
  /// **'Select the location where your company is based'**
  String get locationDescription;

  /// No description provided for @addressLabel.
  ///
  /// In en, this message translates to:
  /// **'Company Address'**
  String get addressLabel;

  /// No description provided for @addressDescription.
  ///
  /// In en, this message translates to:
  /// **'This address will be used to give you online visibility in your area and suggest nearby opportunities. You can edit it and add others later.'**
  String get addressDescription;

  /// No description provided for @phoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Company Phone Number'**
  String get phoneLabel;

  /// No description provided for @phoneDescription.
  ///
  /// In en, this message translates to:
  /// **'This phone number will not be publicly visible on your profile. We will only share it with people looking for a provider like yours.'**
  String get phoneDescription;

  /// No description provided for @websiteLabel.
  ///
  /// In en, this message translates to:
  /// **'Company Website (optional)'**
  String get websiteLabel;

  /// No description provided for @websiteDescription.
  ///
  /// In en, this message translates to:
  /// **'Add a link to your website if you have one'**
  String get websiteDescription;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Company Email Address'**
  String get emailLabel;

  /// No description provided for @emailDescription.
  ///
  /// In en, this message translates to:
  /// **'This email will be used for incoming project communications. You can log in with your email or username.'**
  String get emailDescription;

  /// No description provided for @welcomeProfileSetup.
  ///
  /// In en, this message translates to:
  /// **'Welcome! Let\'s set up your profile'**
  String get welcomeProfileSetup;

  /// No description provided for @profileSetupDescription.
  ///
  /// In en, this message translates to:
  /// **'Define the information that will appear on your Sortlist profile.'**
  String get profileSetupDescription;

  /// No description provided for @companyDescriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Company Description'**
  String get companyDescriptionLabel;

  /// No description provided for @teamSizeLabel.
  ///
  /// In en, this message translates to:
  /// **'Team Size'**
  String get teamSizeLabel;

  /// No description provided for @languagesLabel.
  ///
  /// In en, this message translates to:
  /// **'Spoken Languages (optional)'**
  String get languagesLabel;

  /// No description provided for @enterCompanyName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your company name'**
  String get enterCompanyName;

  /// No description provided for @chooseUsername.
  ///
  /// In en, this message translates to:
  /// **'Please choose a username'**
  String get chooseUsername;

  /// No description provided for @usernameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Username must be at least 3 characters'**
  String get usernameMinLength;

  /// No description provided for @selectBusinessSector.
  ///
  /// In en, this message translates to:
  /// **'Please select a business sector'**
  String get selectBusinessSector;

  /// No description provided for @enterActivity.
  ///
  /// In en, this message translates to:
  /// **'Please enter your activity'**
  String get enterActivity;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password'**
  String get enterPassword;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMinLength;

  /// No description provided for @passwordsNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsNotMatch;

  /// No description provided for @selectLocation.
  ///
  /// In en, this message translates to:
  /// **'Please select a location'**
  String get selectLocation;

  /// No description provided for @enterAddress.
  ///
  /// In en, this message translates to:
  /// **'Please enter your address'**
  String get enterAddress;

  /// No description provided for @enterPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get enterPhone;

  /// No description provided for @enterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get enterValidEmail;

  /// No description provided for @enterCompanyDescription.
  ///
  /// In en, this message translates to:
  /// **'Please enter a company description'**
  String get enterCompanyDescription;

  /// No description provided for @selectTeamSize.
  ///
  /// In en, this message translates to:
  /// **'Please select your team size'**
  String get selectTeamSize;

  /// No description provided for @checkPassword.
  ///
  /// In en, this message translates to:
  /// **'Please check your password'**
  String get checkPassword;

  /// No description provided for @teamSize1_10.
  ///
  /// In en, this message translates to:
  /// **'1-10 employees'**
  String get teamSize1_10;

  /// No description provided for @teamSize11_50.
  ///
  /// In en, this message translates to:
  /// **'11-50 employees'**
  String get teamSize11_50;

  /// No description provided for @teamSize51_200.
  ///
  /// In en, this message translates to:
  /// **'51-200 employees'**
  String get teamSize51_200;

  /// No description provided for @teamSize201_500.
  ///
  /// In en, this message translates to:
  /// **'201-500 employees'**
  String get teamSize201_500;

  /// No description provided for @teamSize500plus.
  ///
  /// In en, this message translates to:
  /// **'More than 500 employees'**
  String get teamSize500plus;

  /// No description provided for @spanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get spanish;

  /// No description provided for @german.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get german;

  /// No description provided for @italian.
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get italian;

  /// No description provided for @companyNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your company name...'**
  String get companyNameHint;

  /// No description provided for @usernameHint.
  ///
  /// In en, this message translates to:
  /// **'Choose a username...'**
  String get usernameHint;

  /// No description provided for @selectBusinessSectorHint.
  ///
  /// In en, this message translates to:
  /// **'Select your business sector'**
  String get selectBusinessSectorHint;

  /// No description provided for @selectActivityHint.
  ///
  /// In en, this message translates to:
  /// **'Select your activity'**
  String get selectActivityHint;

  /// No description provided for @confirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm your password...'**
  String get confirmPasswordHint;

  /// No description provided for @contactInformation.
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contactInformation;

  /// No description provided for @selectLocationHint.
  ///
  /// In en, this message translates to:
  /// **'Select your location'**
  String get selectLocationHint;

  /// No description provided for @addressHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your address...'**
  String get addressHint;

  /// No description provided for @phoneHint.
  ///
  /// In en, this message translates to:
  /// **'eg (+213) Algeria | 7712 34 56 78'**
  String get phoneHint;

  /// No description provided for @websiteHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your website... (ex: https://your-company.com)'**
  String get websiteHint;

  /// No description provided for @emailHint2.
  ///
  /// In en, this message translates to:
  /// **'Enter company contact email...'**
  String get emailHint2;

  /// No description provided for @companyDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Describe your company (max 500 characters)...'**
  String get companyDescriptionHint;

  /// No description provided for @selectTeamSizeHint.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get selectTeamSizeHint;

  /// No description provided for @selectLanguagesHint.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get selectLanguagesHint;

  /// No description provided for @characters.
  ///
  /// In en, this message translates to:
  /// **'characters'**
  String get characters;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address'**
  String get enterEmail;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
