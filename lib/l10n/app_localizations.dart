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

  /// No description provided for @createInvestorAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Investor Account'**
  String get createInvestorAccountTitle;

  /// No description provided for @profileStep.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileStep;

  /// No description provided for @investmentStep.
  ///
  /// In en, this message translates to:
  /// **'Investment'**
  String get investmentStep;

  /// No description provided for @securityStep.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get securityStep;

  /// No description provided for @backButton.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backButton;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @createAccountButton.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccountButton;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// No description provided for @createInvestorProfile.
  ///
  /// In en, this message translates to:
  /// **'Create your investor profile'**
  String get createInvestorProfile;

  /// No description provided for @usernameHintInvestor.
  ///
  /// In en, this message translates to:
  /// **'Choose a unique username'**
  String get usernameHintInvestor;

  /// No description provided for @firstNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your first name'**
  String get firstNameHint;

  /// No description provided for @lastNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your last name'**
  String get lastNameHint;

  /// No description provided for @emailHintInvestor.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get emailHintInvestor;

  /// No description provided for @phoneHintInvestor.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get phoneHintInvestor;

  /// No description provided for @countryOfResidence.
  ///
  /// In en, this message translates to:
  /// **'Country of Residence'**
  String get countryOfResidence;

  /// No description provided for @selectCountryHint.
  ///
  /// In en, this message translates to:
  /// **'Select your country'**
  String get selectCountryHint;

  /// No description provided for @investmentProfile.
  ///
  /// In en, this message translates to:
  /// **'Investment Profile'**
  String get investmentProfile;

  /// No description provided for @defineInvestmentPreferences.
  ///
  /// In en, this message translates to:
  /// **'Define your investment preferences'**
  String get defineInvestmentPreferences;

  /// No description provided for @investorType.
  ///
  /// In en, this message translates to:
  /// **'Investor Type'**
  String get investorType;

  /// No description provided for @selectInvestorTypeHint.
  ///
  /// In en, this message translates to:
  /// **'Select your investor type'**
  String get selectInvestorTypeHint;

  /// No description provided for @investmentExperience.
  ///
  /// In en, this message translates to:
  /// **'Investment Experience'**
  String get investmentExperience;

  /// No description provided for @selectExperienceHint.
  ///
  /// In en, this message translates to:
  /// **'Select your experience level'**
  String get selectExperienceHint;

  /// No description provided for @investmentAmount.
  ///
  /// In en, this message translates to:
  /// **'Investment Amount'**
  String get investmentAmount;

  /// No description provided for @investmentAmountHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., 10,000 - 50,000 USD'**
  String get investmentAmountHint;

  /// No description provided for @interestedSectors.
  ///
  /// In en, this message translates to:
  /// **'Preferred Industries'**
  String get interestedSectors;

  /// No description provided for @selectSectorsHint.
  ///
  /// In en, this message translates to:
  /// **'Select sectors you\'re interested in'**
  String get selectSectorsHint;

  /// No description provided for @accountSecurity.
  ///
  /// In en, this message translates to:
  /// **'Account Security'**
  String get accountSecurity;

  /// No description provided for @createLoginCredentials.
  ///
  /// In en, this message translates to:
  /// **'Create your login credentials'**
  String get createLoginCredentials;

  /// No description provided for @passwordHintInvestor.
  ///
  /// In en, this message translates to:
  /// **'Create a strong password'**
  String get passwordHintInvestor;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @confirmPasswordHintInvestor.
  ///
  /// In en, this message translates to:
  /// **'Re-enter your password'**
  String get confirmPasswordHintInvestor;

  /// No description provided for @professionalBackground.
  ///
  /// In en, this message translates to:
  /// **'Professional Background'**
  String get professionalBackground;

  /// No description provided for @professionalBackgroundHint.
  ///
  /// In en, this message translates to:
  /// **'Briefly describe your professional experience...'**
  String get professionalBackgroundHint;

  /// No description provided for @acceptTerms.
  ///
  /// In en, this message translates to:
  /// **'I accept the '**
  String get acceptTerms;

  /// No description provided for @termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsOfUse;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get and;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @fillRequiredFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill all required fields'**
  String get fillRequiredFields;

  /// No description provided for @passwordsDontMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDontMatch;

  /// No description provided for @usernameMinCharacters.
  ///
  /// In en, this message translates to:
  /// **'Username must be at least 3 characters'**
  String get usernameMinCharacters;

  /// No description provided for @usernameAllowedCharacters.
  ///
  /// In en, this message translates to:
  /// **'Username can only contain letters, numbers, and underscores'**
  String get usernameAllowedCharacters;

  /// No description provided for @validationError.
  ///
  /// In en, this message translates to:
  /// **'Validation Error'**
  String get validationError;

  /// No description provided for @privateInvestor.
  ///
  /// In en, this message translates to:
  /// **'Private Investor'**
  String get privateInvestor;

  /// No description provided for @businessAngel.
  ///
  /// In en, this message translates to:
  /// **'Business Angel'**
  String get businessAngel;

  /// No description provided for @investmentFund.
  ///
  /// In en, this message translates to:
  /// **'Investment Fund'**
  String get investmentFund;

  /// No description provided for @familyOffice.
  ///
  /// In en, this message translates to:
  /// **'Family Office'**
  String get familyOffice;

  /// No description provided for @institutionalInvestor.
  ///
  /// In en, this message translates to:
  /// **'Institutional Investor'**
  String get institutionalInvestor;

  /// No description provided for @corporateVenture.
  ///
  /// In en, this message translates to:
  /// **'Corporate Venture'**
  String get corporateVenture;

  /// No description provided for @beginnerExperience.
  ///
  /// In en, this message translates to:
  /// **'Beginner (0-2 years)'**
  String get beginnerExperience;

  /// No description provided for @intermediateExperience.
  ///
  /// In en, this message translates to:
  /// **'Intermediate (2-5 years)'**
  String get intermediateExperience;

  /// No description provided for @experiencedExperience.
  ///
  /// In en, this message translates to:
  /// **'Experienced (5-10 years)'**
  String get experiencedExperience;

  /// No description provided for @expertExperience.
  ///
  /// In en, this message translates to:
  /// **'Expert (10+ years)'**
  String get expertExperience;

  /// No description provided for @technologySector.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get technologySector;

  /// No description provided for @healthBiotechSector.
  ///
  /// In en, this message translates to:
  /// **'Health & Biotech'**
  String get healthBiotechSector;

  /// No description provided for @energyEnvironmentSector.
  ///
  /// In en, this message translates to:
  /// **'Energy & Environment'**
  String get energyEnvironmentSector;

  /// No description provided for @financeFintechSector.
  ///
  /// In en, this message translates to:
  /// **'Finance & Fintech'**
  String get financeFintechSector;

  /// No description provided for @realEstateSector.
  ///
  /// In en, this message translates to:
  /// **'Real Estate'**
  String get realEstateSector;

  /// No description provided for @retailSector.
  ///
  /// In en, this message translates to:
  /// **'Retail & Consumer'**
  String get retailSector;

  /// No description provided for @industrySector.
  ///
  /// In en, this message translates to:
  /// **'Industry & Manufacturing'**
  String get industrySector;

  /// No description provided for @professionalServicesSector.
  ///
  /// In en, this message translates to:
  /// **'Professional Services'**
  String get professionalServicesSector;

  /// No description provided for @mediaCommunicationSector.
  ///
  /// In en, this message translates to:
  /// **'Media & Communication'**
  String get mediaCommunicationSector;

  /// No description provided for @tourismSector.
  ///
  /// In en, this message translates to:
  /// **'Tourism & Hospitality'**
  String get tourismSector;

  /// No description provided for @pricingTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Plan'**
  String get pricingTitle;

  /// No description provided for @pricingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select the perfect plan for your needs'**
  String get pricingSubtitle;

  /// No description provided for @packStart.
  ///
  /// In en, this message translates to:
  /// **'PACK START'**
  String get packStart;

  /// No description provided for @packStartDesc.
  ///
  /// In en, this message translates to:
  /// **'Ideal for beginners'**
  String get packStartDesc;

  /// No description provided for @packPremium.
  ///
  /// In en, this message translates to:
  /// **'PACK PREMIUM'**
  String get packPremium;

  /// No description provided for @packPremiumDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete solution'**
  String get packPremiumDesc;

  /// No description provided for @customService.
  ///
  /// In en, this message translates to:
  /// **'CUSTOM SERVICE'**
  String get customService;

  /// No description provided for @customServiceDesc.
  ///
  /// In en, this message translates to:
  /// **'Personalized solution'**
  String get customServiceDesc;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @annually.
  ///
  /// In en, this message translates to:
  /// **'Annually'**
  String get annually;

  /// No description provided for @viewFullDetails.
  ///
  /// In en, this message translates to:
  /// **'VIEW FULL DETAILS'**
  String get viewFullDetails;

  /// No description provided for @buyNow.
  ///
  /// In en, this message translates to:
  /// **'BUY NOW'**
  String get buyNow;

  /// No description provided for @contactForQuote.
  ///
  /// In en, this message translates to:
  /// **'CONTACT FOR QUOTE'**
  String get contactForQuote;

  /// No description provided for @choosePaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Choose your payment method'**
  String get choosePaymentMethod;

  /// No description provided for @mobilePayment.
  ///
  /// In en, this message translates to:
  /// **'Mobile payment'**
  String get mobilePayment;

  /// No description provided for @algerianCard.
  ///
  /// In en, this message translates to:
  /// **'Algerian bank card'**
  String get algerianCard;

  /// No description provided for @customServiceTitle.
  ///
  /// In en, this message translates to:
  /// **'Custom Service'**
  String get customServiceTitle;

  /// No description provided for @contactForCustomQuote.
  ///
  /// In en, this message translates to:
  /// **'Contact us for a personalized quote'**
  String get contactForCustomQuote;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @describeYourNeeds.
  ///
  /// In en, this message translates to:
  /// **'Describe your needs'**
  String get describeYourNeeds;

  /// No description provided for @sendRequest.
  ///
  /// In en, this message translates to:
  /// **'SEND REQUEST'**
  String get sendRequest;

  /// No description provided for @paymentSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Payment Successful!'**
  String get paymentSuccessful;

  /// No description provided for @subscriptionActivated.
  ///
  /// In en, this message translates to:
  /// **'Your subscription has been successfully activated'**
  String get subscriptionActivated;

  /// No description provided for @plan.
  ///
  /// In en, this message translates to:
  /// **'Plan'**
  String get plan;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @period.
  ///
  /// In en, this message translates to:
  /// **'Period'**
  String get period;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @invoiceNumber.
  ///
  /// In en, this message translates to:
  /// **'Invoice No.'**
  String get invoiceNumber;

  /// No description provided for @transactionId.
  ///
  /// In en, this message translates to:
  /// **'Transaction ID'**
  String get transactionId;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @returnHome.
  ///
  /// In en, this message translates to:
  /// **'RETURN HOME'**
  String get returnHome;

  /// No description provided for @accessDashboard.
  ///
  /// In en, this message translates to:
  /// **'ACCESS MY DASHBOARD'**
  String get accessDashboard;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @resources.
  ///
  /// In en, this message translates to:
  /// **'Resources'**
  String get resources;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @activeService.
  ///
  /// In en, this message translates to:
  /// **'Active Service'**
  String get activeService;

  /// No description provided for @daysRemaining.
  ///
  /// In en, this message translates to:
  /// **'days remaining'**
  String get daysRemaining;

  /// No description provided for @globalProgress.
  ///
  /// In en, this message translates to:
  /// **'Global Progress'**
  String get globalProgress;

  /// No description provided for @servicesCompleted.
  ///
  /// In en, this message translates to:
  /// **'Services completed'**
  String get servicesCompleted;

  /// No description provided for @inProgress.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get inProgress;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @recentActivities.
  ///
  /// In en, this message translates to:
  /// **'Recent Activities'**
  String get recentActivities;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @noRecentActivity.
  ///
  /// In en, this message translates to:
  /// **'No recent activity'**
  String get noRecentActivity;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActions;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @print.
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get print;

  /// No description provided for @renew.
  ///
  /// In en, this message translates to:
  /// **'Renew'**
  String get renew;

  /// No description provided for @upgrade.
  ///
  /// In en, this message translates to:
  /// **'Upgrade'**
  String get upgrade;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @serviceDetails.
  ///
  /// In en, this message translates to:
  /// **'Service Details'**
  String get serviceDetails;

  /// No description provided for @nextBilling.
  ///
  /// In en, this message translates to:
  /// **'Next billing'**
  String get nextBilling;

  /// No description provided for @billingCycle.
  ///
  /// In en, this message translates to:
  /// **'Billing cycle'**
  String get billingCycle;

  /// No description provided for @serviceHistory.
  ///
  /// In en, this message translates to:
  /// **'Service History'**
  String get serviceHistory;

  /// No description provided for @noHistory.
  ///
  /// In en, this message translates to:
  /// **'No history'**
  String get noHistory;

  /// No description provided for @communityLearning.
  ///
  /// In en, this message translates to:
  /// **'Community and Learning'**
  String get communityLearning;

  /// No description provided for @communityForum.
  ///
  /// In en, this message translates to:
  /// **'Community Forum'**
  String get communityForum;

  /// No description provided for @technicalBlog.
  ///
  /// In en, this message translates to:
  /// **'Technical Blog'**
  String get technicalBlog;

  /// No description provided for @webinars.
  ///
  /// In en, this message translates to:
  /// **'Webinars'**
  String get webinars;

  /// No description provided for @learningCenter.
  ///
  /// In en, this message translates to:
  /// **'Learning Center'**
  String get learningCenter;

  /// No description provided for @quickSettings.
  ///
  /// In en, this message translates to:
  /// **'Quick Settings'**
  String get quickSettings;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @payments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get payments;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @downloads.
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get downloads;

  /// No description provided for @helpCenter.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get helpCenter;

  /// No description provided for @feedback.
  ///
  /// In en, this message translates to:
  /// **'Give feedback'**
  String get feedback;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @confirmLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get confirmLogout;

  /// No description provided for @logoutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutConfirm;

  /// No description provided for @downloadReport.
  ///
  /// In en, this message translates to:
  /// **'Downloading report...'**
  String get downloadReport;

  /// No description provided for @renewService.
  ///
  /// In en, this message translates to:
  /// **'Renew service'**
  String get renewService;

  /// No description provided for @renewConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Do you want to renew your subscription for an additional month?'**
  String get renewConfirmation;

  /// No description provided for @later.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get later;

  /// No description provided for @renewedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Service successfully renewed!'**
  String get renewedSuccess;

  /// No description provided for @upgradePlan.
  ///
  /// In en, this message translates to:
  /// **'Upgrade your plan'**
  String get upgradePlan;

  /// No description provided for @premiumPlan.
  ///
  /// In en, this message translates to:
  /// **'Premium Plan'**
  String get premiumPlan;

  /// No description provided for @upgradeOptions.
  ///
  /// In en, this message translates to:
  /// **'VIEW OPTIONS'**
  String get upgradeOptions;

  /// No description provided for @contactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact support'**
  String get contactSupport;

  /// No description provided for @howToContact.
  ///
  /// In en, this message translates to:
  /// **'How would you like to contact our support team?'**
  String get howToContact;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @serviceHistoryFull.
  ///
  /// In en, this message translates to:
  /// **'Complete history'**
  String get serviceHistoryFull;

  /// No description provided for @howToChoose.
  ///
  /// In en, this message translates to:
  /// **'How to choose?'**
  String get howToChoose;

  /// No description provided for @advice.
  ///
  /// In en, this message translates to:
  /// **'Advice: Start with the Start pack and upgrade as needed!'**
  String get advice;

  /// No description provided for @gotIt.
  ///
  /// In en, this message translates to:
  /// **'GOT IT'**
  String get gotIt;

  /// No description provided for @dashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboardTitle;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get startDate;

  /// No description provided for @endDate.
  ///
  /// In en, this message translates to:
  /// **'End date'**
  String get endDate;

  /// No description provided for @performance.
  ///
  /// In en, this message translates to:
  /// **'Performance'**
  String get performance;

  /// No description provided for @users.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get users;

  /// No description provided for @storage.
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get storage;

  /// No description provided for @includedServices.
  ///
  /// In en, this message translates to:
  /// **'included services'**
  String get includedServices;

  /// No description provided for @keyFeatures.
  ///
  /// In en, this message translates to:
  /// **'Key Features:'**
  String get keyFeatures;

  /// No description provided for @additionalInfo.
  ///
  /// In en, this message translates to:
  /// **'Additional information:'**
  String get additionalInfo;

  /// No description provided for @paymentInstructions.
  ///
  /// In en, this message translates to:
  /// **'Payment instructions:'**
  String get paymentInstructions;

  /// No description provided for @securePayment.
  ///
  /// In en, this message translates to:
  /// **'Secure payment'**
  String get securePayment;

  /// No description provided for @cardNumber.
  ///
  /// In en, this message translates to:
  /// **'Card number'**
  String get cardNumber;

  /// No description provided for @expirationDate.
  ///
  /// In en, this message translates to:
  /// **'Expiration date'**
  String get expirationDate;

  /// No description provided for @cvv.
  ///
  /// In en, this message translates to:
  /// **'CVV'**
  String get cvv;

  /// No description provided for @payMonthly.
  ///
  /// In en, this message translates to:
  /// **'PAY MONTHLY'**
  String get payMonthly;

  /// No description provided for @payAnnually.
  ///
  /// In en, this message translates to:
  /// **'PAY ANNUALLY'**
  String get payAnnually;

  /// No description provided for @userGuide.
  ///
  /// In en, this message translates to:
  /// **'User Guide'**
  String get userGuide;

  /// No description provided for @completeDocumentation.
  ///
  /// In en, this message translates to:
  /// **'Complete Documentation'**
  String get completeDocumentation;

  /// No description provided for @videoTutorials.
  ///
  /// In en, this message translates to:
  /// **'Video Tutorials'**
  String get videoTutorials;

  /// No description provided for @videoTraining.
  ///
  /// In en, this message translates to:
  /// **'Video Training'**
  String get videoTraining;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @frequentQuestions.
  ///
  /// In en, this message translates to:
  /// **'Frequent Questions'**
  String get frequentQuestions;

  /// No description provided for @templates.
  ///
  /// In en, this message translates to:
  /// **'Templates'**
  String get templates;

  /// No description provided for @readyToUseTemplates.
  ///
  /// In en, this message translates to:
  /// **'Ready to Use Templates'**
  String get readyToUseTemplates;

  /// No description provided for @community.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get community;

  /// No description provided for @forumAndDiscussions.
  ///
  /// In en, this message translates to:
  /// **'Forum and Discussions'**
  String get forumAndDiscussions;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get days;

  /// No description provided for @na.
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get na;

  /// No description provided for @discussWithOtherUsers.
  ///
  /// In en, this message translates to:
  /// **'Discuss with other users'**
  String get discussWithOtherUsers;

  /// No description provided for @advancedArticlesAndTutorials.
  ///
  /// In en, this message translates to:
  /// **'Advanced Articles and Tutorials'**
  String get advancedArticlesAndTutorials;

  /// No description provided for @onlineTrainingSessions.
  ///
  /// In en, this message translates to:
  /// **'Online Training Sessions'**
  String get onlineTrainingSessions;

  /// No description provided for @coursesAndCertifications.
  ///
  /// In en, this message translates to:
  /// **'Courses and Certifications'**
  String get coursesAndCertifications;

  /// No description provided for @access.
  ///
  /// In en, this message translates to:
  /// **'Access'**
  String get access;

  /// No description provided for @creditCard.
  ///
  /// In en, this message translates to:
  /// **'Credit Card'**
  String get creditCard;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @newMessage.
  ///
  /// In en, this message translates to:
  /// **'New Message'**
  String get newMessage;

  /// No description provided for @receivedNewMessageFromSupport.
  ///
  /// In en, this message translates to:
  /// **'Received new message from support'**
  String get receivedNewMessageFromSupport;

  /// No description provided for @invoiceAvailable.
  ///
  /// In en, this message translates to:
  /// **'Invoice Available'**
  String get invoiceAvailable;

  /// No description provided for @yourJuneInvoiceIsAvailable.
  ///
  /// In en, this message translates to:
  /// **'Your June invoice is available'**
  String get yourJuneInvoiceIsAvailable;

  /// No description provided for @systemUpdate.
  ///
  /// In en, this message translates to:
  /// **'System Update'**
  String get systemUpdate;

  /// No description provided for @newUpdateAvailable.
  ///
  /// In en, this message translates to:
  /// **'New Update Available'**
  String get newUpdateAvailable;

  /// No description provided for @paymentReminder.
  ///
  /// In en, this message translates to:
  /// **'Payment Reminder'**
  String get paymentReminder;

  /// No description provided for @yourPaymentIsDueIn3Days.
  ///
  /// In en, this message translates to:
  /// **'Your payment is due in 3 days'**
  String get yourPaymentIsDueIn3Days;

  /// No description provided for @serviceCompleted.
  ///
  /// In en, this message translates to:
  /// **'Service Completed'**
  String get serviceCompleted;

  /// No description provided for @yourSeoAuditIsCompleted.
  ///
  /// In en, this message translates to:
  /// **'Your SEO audit is completed'**
  String get yourSeoAuditIsCompleted;

  /// No description provided for @markAllAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark All as Read'**
  String get markAllAsRead;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// No description provided for @newReport.
  ///
  /// In en, this message translates to:
  /// **'New Report'**
  String get newReport;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedule;

  /// No description provided for @export.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get export;

  /// No description provided for @backup.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get backup;

  /// No description provided for @allActivities.
  ///
  /// In en, this message translates to:
  /// **'All Activities'**
  String get allActivities;

  /// No description provided for @downloadingReport.
  ///
  /// In en, this message translates to:
  /// **'Downloading report...'**
  String get downloadingReport;

  /// No description provided for @shareService.
  ///
  /// In en, this message translates to:
  /// **'Share Service'**
  String get shareService;

  /// No description provided for @choosePlatformToShare.
  ///
  /// In en, this message translates to:
  /// **'Choose platform to share'**
  String get choosePlatformToShare;

  /// No description provided for @printInvoice.
  ///
  /// In en, this message translates to:
  /// **'Print Invoice'**
  String get printInvoice;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'completed'**
  String get completed;

  /// No description provided for @notificationManagement.
  ///
  /// In en, this message translates to:
  /// **'Notification Management'**
  String get notificationManagement;

  /// No description provided for @notificationManagementPage.
  ///
  /// In en, this message translates to:
  /// **'Notification Management Page'**
  String get notificationManagementPage;

  /// No description provided for @securitySettings.
  ///
  /// In en, this message translates to:
  /// **'Security Settings'**
  String get securitySettings;

  /// No description provided for @securitySettingsPage.
  ///
  /// In en, this message translates to:
  /// **'Security Settings Page'**
  String get securitySettingsPage;

  /// No description provided for @paymentSettings.
  ///
  /// In en, this message translates to:
  /// **'Payment Settings'**
  String get paymentSettings;

  /// No description provided for @paymentSettingsPage.
  ///
  /// In en, this message translates to:
  /// **'Payment Settings Page'**
  String get paymentSettingsPage;

  /// No description provided for @privacySettingsPage.
  ///
  /// In en, this message translates to:
  /// **'Privacy Settings Page'**
  String get privacySettingsPage;

  /// No description provided for @downloadSettingsPage.
  ///
  /// In en, this message translates to:
  /// **'Download Settings Page'**
  String get downloadSettingsPage;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @userProfilePage.
  ///
  /// In en, this message translates to:
  /// **'User Profile Page'**
  String get userProfilePage;

  /// No description provided for @generalSettingsPage.
  ///
  /// In en, this message translates to:
  /// **'General Settings Page'**
  String get generalSettingsPage;

  /// No description provided for @helpCenterPage.
  ///
  /// In en, this message translates to:
  /// **'Help Center Page'**
  String get helpCenterPage;

  /// No description provided for @giveFeedback.
  ///
  /// In en, this message translates to:
  /// **'Give Feedback'**
  String get giveFeedback;

  /// No description provided for @writeYourFeedbackHere.
  ///
  /// In en, this message translates to:
  /// **'Write your feedback here'**
  String get writeYourFeedbackHere;

  /// No description provided for @thanksForYourFeedback.
  ///
  /// In en, this message translates to:
  /// **'Thanks for your feedback'**
  String get thanksForYourFeedback;

  /// No description provided for @serviceDashboard.
  ///
  /// In en, this message translates to:
  /// **'Service Dashboard'**
  String get serviceDashboard;

  /// No description provided for @secureMobilePayment.
  ///
  /// In en, this message translates to:
  /// **'Secure Mobile Payment'**
  String get secureMobilePayment;

  /// No description provided for @dialCodeOnYourMobile.
  ///
  /// In en, this message translates to:
  /// **'Dial code on your mobile'**
  String get dialCodeOnYourMobile;

  /// No description provided for @selectBillPayment.
  ///
  /// In en, this message translates to:
  /// **'Select Bill Payment'**
  String get selectBillPayment;

  /// No description provided for @enterCodeBARIDI12345.
  ///
  /// In en, this message translates to:
  /// **'Enter code BARIDI12345'**
  String get enterCodeBARIDI12345;

  /// No description provided for @monthlyPrice.
  ///
  /// In en, this message translates to:
  /// **'Monthly Price'**
  String get monthlyPrice;

  /// No description provided for @annualPrice.
  ///
  /// In en, this message translates to:
  /// **'Annual Price'**
  String get annualPrice;

  /// No description provided for @secureCardPayment.
  ///
  /// In en, this message translates to:
  /// **'Secure Card Payment'**
  String get secureCardPayment;

  /// No description provided for @idealForNewBusinesses.
  ///
  /// In en, this message translates to:
  /// **'Ideal for new businesses'**
  String get idealForNewBusinesses;

  /// No description provided for @perfectForGrowingBusinesses.
  ///
  /// In en, this message translates to:
  /// **'Perfect for growing businesses'**
  String get perfectForGrowingBusinesses;

  /// No description provided for @forEstablishedBusinesses.
  ///
  /// In en, this message translates to:
  /// **'For established businesses'**
  String get forEstablishedBusinesses;

  /// No description provided for @serviceActivated.
  ///
  /// In en, this message translates to:
  /// **'Service Activated'**
  String get serviceActivated;

  /// No description provided for @yourPlan.
  ///
  /// In en, this message translates to:
  /// **'Your Plan'**
  String get yourPlan;

  /// No description provided for @hasBeenActivated.
  ///
  /// In en, this message translates to:
  /// **'has been activated'**
  String get hasBeenActivated;

  /// No description provided for @paymentConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Payment Confirmed'**
  String get paymentConfirmed;

  /// No description provided for @paymentConfirmedDesc.
  ///
  /// In en, this message translates to:
  /// **'payment confirmed successfully'**
  String get paymentConfirmedDesc;

  /// No description provided for @initialSetup.
  ///
  /// In en, this message translates to:
  /// **'Initial Setup'**
  String get initialSetup;

  /// No description provided for @settingUpYourDashboard.
  ///
  /// In en, this message translates to:
  /// **'Setting up your dashboard'**
  String get settingUpYourDashboard;

  /// No description provided for @welcomeAboard.
  ///
  /// In en, this message translates to:
  /// **'Welcome Aboard'**
  String get welcomeAboard;

  /// No description provided for @yourAccountCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Your account created successfully'**
  String get yourAccountCreatedSuccessfully;

  /// No description provided for @requestSentWeWillContactYou.
  ///
  /// In en, this message translates to:
  /// **'Request sent, we will contact you'**
  String get requestSentWeWillContactYou;

  /// No description provided for @yourCompany.
  ///
  /// In en, this message translates to:
  /// **'Your Company'**
  String get yourCompany;

  /// No description provided for @allRightsReserved.
  ///
  /// In en, this message translates to:
  /// **'All Rights Reserved'**
  String get allRightsReserved;

  /// No description provided for @thisAppHelpsManageServices.
  ///
  /// In en, this message translates to:
  /// **'This app helps manage services'**
  String get thisAppHelpsManageServices;

  /// No description provided for @otherServices.
  ///
  /// In en, this message translates to:
  /// **'other services'**
  String get otherServices;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'payment'**
  String get payment;
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
