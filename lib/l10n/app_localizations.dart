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
  /// **'Days Remaining'**
  String get daysRemaining;

  /// No description provided for @globalProgress.
  ///
  /// In en, this message translates to:
  /// **'Global Progress'**
  String get globalProgress;

  /// No description provided for @servicesCompleted.
  ///
  /// In en, this message translates to:
  /// **'Services Completed'**
  String get servicesCompleted;

  /// No description provided for @inProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
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
  /// **'Service Dashboard'**
  String get dashboardTitle;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// No description provided for @endDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
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
  /// **'Ready-to-use Templates'**
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
  /// **'Days'**
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

  /// No description provided for @packStartMonthlyPrice.
  ///
  /// In en, this message translates to:
  /// **'4,500 DA'**
  String get packStartMonthlyPrice;

  /// No description provided for @packStartAnnualPrice.
  ///
  /// In en, this message translates to:
  /// **'48,000 DA'**
  String get packStartAnnualPrice;

  /// No description provided for @packPremiumMonthlyPrice.
  ///
  /// In en, this message translates to:
  /// **'8,500 DA'**
  String get packPremiumMonthlyPrice;

  /// No description provided for @packPremiumAnnualPrice.
  ///
  /// In en, this message translates to:
  /// **'91,800 DA'**
  String get packPremiumAnnualPrice;

  /// No description provided for @customServiceMonthlyPrice.
  ///
  /// In en, this message translates to:
  /// **'On Quote'**
  String get customServiceMonthlyPrice;

  /// No description provided for @customServiceAnnualPrice.
  ///
  /// In en, this message translates to:
  /// **'On Quote'**
  String get customServiceAnnualPrice;

  /// No description provided for @feature1.
  ///
  /// In en, this message translates to:
  /// **'Creation of 3 social accounts'**
  String get feature1;

  /// No description provided for @feature2.
  ///
  /// In en, this message translates to:
  /// **'Custom visual identity'**
  String get feature2;

  /// No description provided for @feature3.
  ///
  /// In en, this message translates to:
  /// **'5 initial publications'**
  String get feature3;

  /// No description provided for @feature4.
  ///
  /// In en, this message translates to:
  /// **'Simple showcase website'**
  String get feature4;

  /// No description provided for @feature5.
  ///
  /// In en, this message translates to:
  /// **'Dashboard access'**
  String get feature5;

  /// No description provided for @feature6.
  ///
  /// In en, this message translates to:
  /// **'24/7 email support'**
  String get feature6;

  /// No description provided for @info1.
  ///
  /// In en, this message translates to:
  /// **'30-day money back guarantee'**
  String get info1;

  /// No description provided for @info2.
  ///
  /// In en, this message translates to:
  /// **'Email assistance within 24 hours'**
  String get info2;

  /// No description provided for @info3.
  ///
  /// In en, this message translates to:
  /// **'Free installation assistance'**
  String get info3;

  /// No description provided for @info4.
  ///
  /// In en, this message translates to:
  /// **'Cancel anytime'**
  String get info4;

  /// No description provided for @info5.
  ///
  /// In en, this message translates to:
  /// **'Regular updates included'**
  String get info5;

  /// No description provided for @info6.
  ///
  /// In en, this message translates to:
  /// **'Community access'**
  String get info6;

  /// No description provided for @packStartDetails.
  ///
  /// In en, this message translates to:
  /// **'Ideal for young companies wanting to develop their online presence. This pack includes everything needed to start in digital marketing.'**
  String get packStartDetails;

  /// No description provided for @serviceFeature1Title.
  ///
  /// In en, this message translates to:
  /// **'Account Creation'**
  String get serviceFeature1Title;

  /// No description provided for @serviceFeature1Desc.
  ///
  /// In en, this message translates to:
  /// **'Social media setup'**
  String get serviceFeature1Desc;

  /// No description provided for @serviceFeature2Title.
  ///
  /// In en, this message translates to:
  /// **'Visual Identity'**
  String get serviceFeature2Title;

  /// No description provided for @serviceFeature2Desc.
  ///
  /// In en, this message translates to:
  /// **'Logo and visual identity design'**
  String get serviceFeature2Desc;

  /// No description provided for @serviceFeature3Title.
  ///
  /// In en, this message translates to:
  /// **'Initial Content'**
  String get serviceFeature3Title;

  /// No description provided for @serviceFeature3Desc.
  ///
  /// In en, this message translates to:
  /// **'Creation of first publications'**
  String get serviceFeature3Desc;

  /// No description provided for @serviceFeature4Title.
  ///
  /// In en, this message translates to:
  /// **'Showcase Website'**
  String get serviceFeature4Title;

  /// No description provided for @serviceFeature4Desc.
  ///
  /// In en, this message translates to:
  /// **'Simple web development'**
  String get serviceFeature4Desc;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @configure.
  ///
  /// In en, this message translates to:
  /// **'Configure'**
  String get configure;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @optimize.
  ///
  /// In en, this message translates to:
  /// **'Optimize'**
  String get optimize;

  /// No description provided for @viewReport.
  ///
  /// In en, this message translates to:
  /// **'View Report'**
  String get viewReport;

  /// No description provided for @viewAnalysis.
  ///
  /// In en, this message translates to:
  /// **'View Analysis'**
  String get viewAnalysis;

  /// No description provided for @step1.
  ///
  /// In en, this message translates to:
  /// **'Analysis'**
  String get step1;

  /// No description provided for @step2.
  ///
  /// In en, this message translates to:
  /// **'Configuration'**
  String get step2;

  /// No description provided for @step3.
  ///
  /// In en, this message translates to:
  /// **'Validation'**
  String get step3;

  /// No description provided for @step4.
  ///
  /// In en, this message translates to:
  /// **'Finalization'**
  String get step4;

  /// No description provided for @wireframe.
  ///
  /// In en, this message translates to:
  /// **'Wireframe'**
  String get wireframe;

  /// No description provided for @development.
  ///
  /// In en, this message translates to:
  /// **'Development'**
  String get development;

  /// No description provided for @test.
  ///
  /// In en, this message translates to:
  /// **'Test'**
  String get test;

  /// No description provided for @launch.
  ///
  /// In en, this message translates to:
  /// **'Launch'**
  String get launch;

  /// No description provided for @strategy.
  ///
  /// In en, this message translates to:
  /// **'Strategy'**
  String get strategy;

  /// No description provided for @creation.
  ///
  /// In en, this message translates to:
  /// **'Creation'**
  String get creation;

  /// No description provided for @approval.
  ///
  /// In en, this message translates to:
  /// **'Approval'**
  String get approval;

  /// No description provided for @publication.
  ///
  /// In en, this message translates to:
  /// **'Publication'**
  String get publication;

  /// No description provided for @audit.
  ///
  /// In en, this message translates to:
  /// **'Audit'**
  String get audit;

  /// No description provided for @execution.
  ///
  /// In en, this message translates to:
  /// **'Execution'**
  String get execution;

  /// No description provided for @optimization.
  ///
  /// In en, this message translates to:
  /// **'Optimization'**
  String get optimization;

  /// No description provided for @planning.
  ///
  /// In en, this message translates to:
  /// **'Planning'**
  String get planning;

  /// No description provided for @validation.
  ///
  /// In en, this message translates to:
  /// **'Validation'**
  String get validation;

  /// No description provided for @briefing.
  ///
  /// In en, this message translates to:
  /// **'Briefing'**
  String get briefing;

  /// No description provided for @revision.
  ///
  /// In en, this message translates to:
  /// **'Revision'**
  String get revision;

  /// No description provided for @setup.
  ///
  /// In en, this message translates to:
  /// **'Setup'**
  String get setup;

  /// No description provided for @collection.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get collection;

  /// No description provided for @analysis.
  ///
  /// In en, this message translates to:
  /// **'Analysis'**
  String get analysis;

  /// No description provided for @reporting.
  ///
  /// In en, this message translates to:
  /// **'Reporting'**
  String get reporting;

  /// No description provided for @script.
  ///
  /// In en, this message translates to:
  /// **'Script'**
  String get script;

  /// No description provided for @shooting.
  ///
  /// In en, this message translates to:
  /// **'Shooting'**
  String get shooting;

  /// No description provided for @editing.
  ///
  /// In en, this message translates to:
  /// **'Editing'**
  String get editing;

  /// No description provided for @diagnosis.
  ///
  /// In en, this message translates to:
  /// **'Diagnosis'**
  String get diagnosis;

  /// No description provided for @recommendations.
  ///
  /// In en, this message translates to:
  /// **'Recommendations'**
  String get recommendations;

  /// No description provided for @actionPlan.
  ///
  /// In en, this message translates to:
  /// **'Action plan'**
  String get actionPlan;

  /// No description provided for @technicalAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Technical analysis'**
  String get technicalAnalysis;

  /// No description provided for @contentAudit.
  ///
  /// In en, this message translates to:
  /// **'Content audit'**
  String get contentAudit;

  /// No description provided for @competitiveAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Competitive analysis'**
  String get competitiveAnalysis;

  /// No description provided for @premiumFeature1.
  ///
  /// In en, this message translates to:
  /// **'Management of 2 social networks'**
  String get premiumFeature1;

  /// No description provided for @premiumFeature2.
  ///
  /// In en, this message translates to:
  /// **'Editorial calendar'**
  String get premiumFeature2;

  /// No description provided for @premiumFeature3.
  ///
  /// In en, this message translates to:
  /// **'12 publications/month'**
  String get premiumFeature3;

  /// No description provided for @premiumFeature4.
  ///
  /// In en, this message translates to:
  /// **'Light reporting'**
  String get premiumFeature4;

  /// No description provided for @premiumFeature5.
  ///
  /// In en, this message translates to:
  /// **'Advanced analytics'**
  String get premiumFeature5;

  /// No description provided for @premiumFeature6.
  ///
  /// In en, this message translates to:
  /// **'Priority support'**
  String get premiumFeature6;

  /// No description provided for @premiumInfo1.
  ///
  /// In en, this message translates to:
  /// **'Priority assistance within 12 hours'**
  String get premiumInfo1;

  /// No description provided for @premiumInfo2.
  ///
  /// In en, this message translates to:
  /// **'Monthly strategic review'**
  String get premiumInfo2;

  /// No description provided for @premiumInfo3.
  ///
  /// In en, this message translates to:
  /// **'Editorial calendar planning'**
  String get premiumInfo3;

  /// No description provided for @premiumInfo4.
  ///
  /// In en, this message translates to:
  /// **'Performance analytics dashboard'**
  String get premiumInfo4;

  /// No description provided for @premiumInfo5.
  ///
  /// In en, this message translates to:
  /// **'Access to exclusive webinars'**
  String get premiumInfo5;

  /// No description provided for @premiumInfo6.
  ///
  /// In en, this message translates to:
  /// **'Monthly mentoring'**
  String get premiumInfo6;

  /// No description provided for @packPremiumDetails.
  ///
  /// In en, this message translates to:
  /// **'Ideal for young businesses and micro-enterprises in full growth. This monthly subscription includes ongoing social media management and content planning.'**
  String get packPremiumDetails;

  /// No description provided for @premiumService1Title.
  ///
  /// In en, this message translates to:
  /// **'Social Media Management'**
  String get premiumService1Title;

  /// No description provided for @premiumService1Desc.
  ///
  /// In en, this message translates to:
  /// **'Daily account management'**
  String get premiumService1Desc;

  /// No description provided for @premiumService2Title.
  ///
  /// In en, this message translates to:
  /// **'Editorial Calendar'**
  String get premiumService2Title;

  /// No description provided for @premiumService2Desc.
  ///
  /// In en, this message translates to:
  /// **'Monthly content planning'**
  String get premiumService2Desc;

  /// No description provided for @premiumService3Title.
  ///
  /// In en, this message translates to:
  /// **'Content Creation'**
  String get premiumService3Title;

  /// No description provided for @premiumService3Desc.
  ///
  /// In en, this message translates to:
  /// **'12 publications per month'**
  String get premiumService3Desc;

  /// No description provided for @premiumService4Title.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get premiumService4Title;

  /// No description provided for @premiumService4Desc.
  ///
  /// In en, this message translates to:
  /// **'Performance reports'**
  String get premiumService4Desc;

  /// No description provided for @customFeature1.
  ///
  /// In en, this message translates to:
  /// **'Complete SEO audit'**
  String get customFeature1;

  /// No description provided for @customFeature2.
  ///
  /// In en, this message translates to:
  /// **'Advertising campaigns (Ads)'**
  String get customFeature2;

  /// No description provided for @customFeature3.
  ///
  /// In en, this message translates to:
  /// **'Advanced video content creation'**
  String get customFeature3;

  /// No description provided for @customFeature4.
  ///
  /// In en, this message translates to:
  /// **'Business analysis'**
  String get customFeature4;

  /// No description provided for @customFeature5.
  ///
  /// In en, this message translates to:
  /// **'Strategic consultation'**
  String get customFeature5;

  /// No description provided for @customFeature6.
  ///
  /// In en, this message translates to:
  /// **'24/7 VIP support'**
  String get customFeature6;

  /// No description provided for @customInfo1.
  ///
  /// In en, this message translates to:
  /// **'Dedicated account manager'**
  String get customInfo1;

  /// No description provided for @customInfo2.
  ///
  /// In en, this message translates to:
  /// **'24/7 phone support'**
  String get customInfo2;

  /// No description provided for @customInfo3.
  ///
  /// In en, this message translates to:
  /// **'Custom reports'**
  String get customInfo3;

  /// No description provided for @customInfo4.
  ///
  /// In en, this message translates to:
  /// **'Strategic consultation sessions'**
  String get customInfo4;

  /// No description provided for @customInfo5.
  ///
  /// In en, this message translates to:
  /// **'Unlimited resource access'**
  String get customInfo5;

  /// No description provided for @customInfo6.
  ///
  /// In en, this message translates to:
  /// **'Personalized training'**
  String get customInfo6;

  /// No description provided for @customServiceDetails.
  ///
  /// In en, this message translates to:
  /// **'Premium à la carte services for established businesses. Choose from advanced marketing services tailored to your specific needs. Contact us for a personalized quote.'**
  String get customServiceDetails;

  /// No description provided for @customService1Title.
  ///
  /// In en, this message translates to:
  /// **'SEO Audit'**
  String get customService1Title;

  /// No description provided for @customService1Desc.
  ///
  /// In en, this message translates to:
  /// **'Complete SEO analysis'**
  String get customService1Desc;

  /// No description provided for @customService2Title.
  ///
  /// In en, this message translates to:
  /// **'Advertising Campaigns'**
  String get customService2Title;

  /// No description provided for @customService2Desc.
  ///
  /// In en, this message translates to:
  /// **'Digital ad management'**
  String get customService2Desc;

  /// No description provided for @customService3Title.
  ///
  /// In en, this message translates to:
  /// **'Video Marketing'**
  String get customService3Title;

  /// No description provided for @customService3Desc.
  ///
  /// In en, this message translates to:
  /// **'Video content creation'**
  String get customService3Desc;

  /// No description provided for @customService4Title.
  ///
  /// In en, this message translates to:
  /// **'Strategic Analysis'**
  String get customService4Title;

  /// No description provided for @customService4Desc.
  ///
  /// In en, this message translates to:
  /// **'Business consultation'**
  String get customService4Desc;

  /// No description provided for @packStartFeatures.
  ///
  /// In en, this message translates to:
  /// **'Creation of 3 social accounts, Custom visual identity, 5 initial publications, Simple showcase website, Dashboard access, 24/7 email support'**
  String get packStartFeatures;

  /// No description provided for @packStartAdditionalInfo.
  ///
  /// In en, this message translates to:
  /// **'30-day money back guarantee • Email assistance within 24 hours • Free installation assistance • Cancel anytime • Regular updates included • Community access'**
  String get packStartAdditionalInfo;

  /// No description provided for @accountCreation.
  ///
  /// In en, this message translates to:
  /// **'Account Creation'**
  String get accountCreation;

  /// No description provided for @accountCreationDesc.
  ///
  /// In en, this message translates to:
  /// **'Social media setup'**
  String get accountCreationDesc;

  /// No description provided for @accountCreationAction.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get accountCreationAction;

  /// No description provided for @branding.
  ///
  /// In en, this message translates to:
  /// **'Branding'**
  String get branding;

  /// No description provided for @brandingDesc.
  ///
  /// In en, this message translates to:
  /// **'Logo and visual identity design'**
  String get brandingDesc;

  /// No description provided for @brandingAction.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get brandingAction;

  /// No description provided for @initialContent.
  ///
  /// In en, this message translates to:
  /// **'Initial Content'**
  String get initialContent;

  /// No description provided for @initialContentDesc.
  ///
  /// In en, this message translates to:
  /// **'Creation of first publications'**
  String get initialContentDesc;

  /// No description provided for @initialContentAction.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get initialContentAction;

  /// No description provided for @showcaseWebsite.
  ///
  /// In en, this message translates to:
  /// **'Showcase Website'**
  String get showcaseWebsite;

  /// No description provided for @showcaseWebsiteDesc.
  ///
  /// In en, this message translates to:
  /// **'Simple web development'**
  String get showcaseWebsiteDesc;

  /// No description provided for @showcaseWebsiteAction.
  ///
  /// In en, this message translates to:
  /// **'Configure'**
  String get showcaseWebsiteAction;

  /// No description provided for @design.
  ///
  /// In en, this message translates to:
  /// **'Design'**
  String get design;

  /// No description provided for @finalization.
  ///
  /// In en, this message translates to:
  /// **'Finalization'**
  String get finalization;

  /// No description provided for @investorDashboard.
  ///
  /// In en, this message translates to:
  /// **'Investor Dashboard'**
  String get investorDashboard;

  /// No description provided for @followCompaniesAndDiscoverOpportunities.
  ///
  /// In en, this message translates to:
  /// **'Follow your favorite companies and discover new opportunities'**
  String get followCompaniesAndDiscoverOpportunities;

  /// No description provided for @exploreCompanies.
  ///
  /// In en, this message translates to:
  /// **'Explore companies'**
  String get exploreCompanies;

  /// No description provided for @marketAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Market analysis'**
  String get marketAnalysis;

  /// No description provided for @followedCompanies.
  ///
  /// In en, this message translates to:
  /// **'Followed companies'**
  String get followedCompanies;

  /// No description provided for @news.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get news;

  /// No description provided for @companies.
  ///
  /// In en, this message translates to:
  /// **'Companies'**
  String get companies;

  /// No description provided for @marketCap.
  ///
  /// In en, this message translates to:
  /// **'Market Cap'**
  String get marketCap;

  /// No description provided for @sectors.
  ///
  /// In en, this message translates to:
  /// **'Sectors'**
  String get sectors;

  /// No description provided for @growth.
  ///
  /// In en, this message translates to:
  /// **'Growth'**
  String get growth;

  /// No description provided for @topCompanies.
  ///
  /// In en, this message translates to:
  /// **'Top companies'**
  String get topCompanies;

  /// No description provided for @searchCompanyHint.
  ///
  /// In en, this message translates to:
  /// **'Search for a company...'**
  String get searchCompanyHint;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @filterCompanies.
  ///
  /// In en, this message translates to:
  /// **'Filter companies'**
  String get filterCompanies;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// No description provided for @filtersApplied.
  ///
  /// In en, this message translates to:
  /// **'Filters applied'**
  String get filtersApplied;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View details'**
  String get viewDetails;

  /// No description provided for @removeFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get removeFromFavorites;

  /// No description provided for @addToFavorites.
  ///
  /// In en, this message translates to:
  /// **'Add to favorites'**
  String get addToFavorites;

  /// No description provided for @financialAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Financial analysis'**
  String get financialAnalysis;

  /// No description provided for @recentNews.
  ///
  /// In en, this message translates to:
  /// **'Recent news'**
  String get recentNews;

  /// No description provided for @youNowFollow.
  ///
  /// In en, this message translates to:
  /// **'You now follow'**
  String get youNowFollow;

  /// No description provided for @youNoLongerFollow.
  ///
  /// In en, this message translates to:
  /// **'You no longer follow'**
  String get youNoLongerFollow;

  /// No description provided for @financialPerformance.
  ///
  /// In en, this message translates to:
  /// **'Financial performance'**
  String get financialPerformance;

  /// No description provided for @annualGrowth.
  ///
  /// In en, this message translates to:
  /// **'Annual growth'**
  String get annualGrowth;

  /// No description provided for @profitMargin.
  ///
  /// In en, this message translates to:
  /// **'Profit margin'**
  String get profitMargin;

  /// No description provided for @expectedROI.
  ///
  /// In en, this message translates to:
  /// **'Expected ROI'**
  String get expectedROI;

  /// No description provided for @recommendation.
  ///
  /// In en, this message translates to:
  /// **'Recommendation'**
  String get recommendation;

  /// No description provided for @analystConsensus.
  ///
  /// In en, this message translates to:
  /// **'Analyst consensus'**
  String get analystConsensus;

  /// No description provided for @strongBuy.
  ///
  /// In en, this message translates to:
  /// **'STRONG BUY'**
  String get strongBuy;

  /// No description provided for @buy.
  ///
  /// In en, this message translates to:
  /// **'BUY'**
  String get buy;

  /// No description provided for @targetPrice.
  ///
  /// In en, this message translates to:
  /// **'Target price'**
  String get targetPrice;

  /// No description provided for @announcesNewFunding.
  ///
  /// In en, this message translates to:
  /// **'announces new funding'**
  String get announcesNewFunding;

  /// No description provided for @algerianStartupConfirmsRegionalExpansion.
  ///
  /// In en, this message translates to:
  /// **'Algerian startup confirms regional expansion'**
  String get algerianStartupConfirmsRegionalExpansion;

  /// No description provided for @strategicPartnershipFor.
  ///
  /// In en, this message translates to:
  /// **'Strategic partnership for'**
  String get strategicPartnershipFor;

  /// No description provided for @collaborationWithMajorSectorPlayers.
  ///
  /// In en, this message translates to:
  /// **'Collaboration with major sector players'**
  String get collaborationWithMajorSectorPlayers;

  /// No description provided for @launchesNewFeatures.
  ///
  /// In en, this message translates to:
  /// **'launches new features'**
  String get launchesNewFeatures;

  /// No description provided for @technologicalInnovationToImproveUserExperience.
  ///
  /// In en, this message translates to:
  /// **'Technological innovation to improve user experience'**
  String get technologicalInnovationToImproveUserExperience;

  /// No description provided for @shareLinkFor.
  ///
  /// In en, this message translates to:
  /// **'Share link for'**
  String get shareLinkFor;

  /// No description provided for @copied.
  ///
  /// In en, this message translates to:
  /// **'copied'**
  String get copied;

  /// No description provided for @founded.
  ///
  /// In en, this message translates to:
  /// **'Founded'**
  String get founded;

  /// No description provided for @employees.
  ///
  /// In en, this message translates to:
  /// **'Employees'**
  String get employees;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @applications.
  ///
  /// In en, this message translates to:
  /// **'Applications'**
  String get applications;

  /// No description provided for @coverage.
  ///
  /// In en, this message translates to:
  /// **'Coverage'**
  String get coverage;

  /// No description provided for @businessModel.
  ///
  /// In en, this message translates to:
  /// **'Business model'**
  String get businessModel;

  /// No description provided for @productsServices.
  ///
  /// In en, this message translates to:
  /// **'Products & Services'**
  String get productsServices;

  /// No description provided for @valuation.
  ///
  /// In en, this message translates to:
  /// **'Valuation'**
  String get valuation;

  /// No description provided for @revenue.
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get revenue;

  /// No description provided for @sector.
  ///
  /// In en, this message translates to:
  /// **'Sector'**
  String get sector;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @followed.
  ///
  /// In en, this message translates to:
  /// **'Followed'**
  String get followed;

  /// No description provided for @follow.
  ///
  /// In en, this message translates to:
  /// **'Follow'**
  String get follow;

  /// No description provided for @noNewNotifications.
  ///
  /// In en, this message translates to:
  /// **'No new notifications'**
  String get noNewNotifications;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get hours;

  /// No description provided for @basedOnYourInterests.
  ///
  /// In en, this message translates to:
  /// **'Based on your interests'**
  String get basedOnYourInterests;

  /// No description provided for @recommendedForYou.
  ///
  /// In en, this message translates to:
  /// **'Recommended for you'**
  String get recommendedForYou;

  /// No description provided for @android.
  ///
  /// In en, this message translates to:
  /// **'Android'**
  String get android;

  /// No description provided for @ios.
  ///
  /// In en, this message translates to:
  /// **'iOS'**
  String get ios;

  /// No description provided for @notSpecified.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get notSpecified;

  /// No description provided for @companyTalabaStoreName.
  ///
  /// In en, this message translates to:
  /// **'TalabaStore'**
  String get companyTalabaStoreName;

  /// No description provided for @companyTalabaStoreDescription.
  ///
  /// In en, this message translates to:
  /// **'E-commerce platform for students, offering discounts on various products (electronics, clothing, accessories, leisure) and facilitating access to educational services.'**
  String get companyTalabaStoreDescription;

  /// No description provided for @companyTalabaStoreIndustry.
  ///
  /// In en, this message translates to:
  /// **'E-commerce'**
  String get companyTalabaStoreIndustry;

  /// No description provided for @companyTalabaStoreSector.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get companyTalabaStoreSector;

  /// No description provided for @companyTalabaStoreType.
  ///
  /// In en, this message translates to:
  /// **'LLC / Digital Startup'**
  String get companyTalabaStoreType;

  /// No description provided for @companyTalabaStoreLocation.
  ///
  /// In en, this message translates to:
  /// **'Algiers, Algeria'**
  String get companyTalabaStoreLocation;

  /// No description provided for @companyTalabaStoreFounded.
  ///
  /// In en, this message translates to:
  /// **'June 2017'**
  String get companyTalabaStoreFounded;

  /// No description provided for @companyTalabaStoreCEO.
  ///
  /// In en, this message translates to:
  /// **'Sami Aliouche'**
  String get companyTalabaStoreCEO;

  /// No description provided for @companyTalabaStoreProduct1.
  ///
  /// In en, this message translates to:
  /// **'Electronics'**
  String get companyTalabaStoreProduct1;

  /// No description provided for @companyTalabaStoreProduct2.
  ///
  /// In en, this message translates to:
  /// **'Clothing'**
  String get companyTalabaStoreProduct2;

  /// No description provided for @companyTalabaStoreProduct3.
  ///
  /// In en, this message translates to:
  /// **'Accessories'**
  String get companyTalabaStoreProduct3;

  /// No description provided for @companyTalabaStoreProduct4.
  ///
  /// In en, this message translates to:
  /// **'Leisure'**
  String get companyTalabaStoreProduct4;

  /// No description provided for @companyTalabaStoreProduct5.
  ///
  /// In en, this message translates to:
  /// **'Educational services'**
  String get companyTalabaStoreProduct5;

  /// No description provided for @companyTalabaStoreUsers.
  ///
  /// In en, this message translates to:
  /// **'Over 50,000 active students'**
  String get companyTalabaStoreUsers;

  /// No description provided for @companyTalabaStoreCoverage.
  ///
  /// In en, this message translates to:
  /// **'Delivery in 48 wilayas in Algeria'**
  String get companyTalabaStoreCoverage;

  /// No description provided for @companyTalabaStoreBusinessModel.
  ///
  /// In en, this message translates to:
  /// **'Sales commission + partnerships with local companies'**
  String get companyTalabaStoreBusinessModel;

  /// No description provided for @companyTemTemName.
  ///
  /// In en, this message translates to:
  /// **'TemTem'**
  String get companyTemTemName;

  /// No description provided for @companyTemTemDescription.
  ///
  /// In en, this message translates to:
  /// **'Urban mobility application offering taxi/VTC services, product delivery and digital urban services (booking and payments).'**
  String get companyTemTemDescription;

  /// No description provided for @companyTemTemIndustry.
  ///
  /// In en, this message translates to:
  /// **'Mobility'**
  String get companyTemTemIndustry;

  /// No description provided for @companyTemTemSector.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get companyTemTemSector;

  /// No description provided for @companyTemTemType.
  ///
  /// In en, this message translates to:
  /// **'Mobility Startup'**
  String get companyTemTemType;

  /// No description provided for @companyTemTemLocation.
  ///
  /// In en, this message translates to:
  /// **'Algiers, Algeria'**
  String get companyTemTemLocation;

  /// No description provided for @companyTemTemFounded.
  ///
  /// In en, this message translates to:
  /// **'2018'**
  String get companyTemTemFounded;

  /// No description provided for @companyTemTemCEO.
  ///
  /// In en, this message translates to:
  /// **'Young Algerians'**
  String get companyTemTemCEO;

  /// No description provided for @companyTemTemProduct1.
  ///
  /// In en, this message translates to:
  /// **'Taxi / VTC'**
  String get companyTemTemProduct1;

  /// No description provided for @companyTemTemProduct2.
  ///
  /// In en, this message translates to:
  /// **'Product delivery'**
  String get companyTemTemProduct2;

  /// No description provided for @companyTemTemProduct3.
  ///
  /// In en, this message translates to:
  /// **'Digital urban services'**
  String get companyTemTemProduct3;

  /// No description provided for @companyTemTemUsers.
  ///
  /// In en, this message translates to:
  /// **'Several thousand active users'**
  String get companyTemTemUsers;

  /// No description provided for @companyTemTemCoverage.
  ///
  /// In en, this message translates to:
  /// **'Algiers, Oran, Constantine'**
  String get companyTemTemCoverage;

  /// No description provided for @companyTemTemBusinessModel.
  ///
  /// In en, this message translates to:
  /// **'Trip commissions + partnerships with local businesses'**
  String get companyTemTemBusinessModel;

  /// No description provided for @companyALPAYName.
  ///
  /// In en, this message translates to:
  /// **'ALPAY'**
  String get companyALPAYName;

  /// No description provided for @companyALPAYDescription.
  ///
  /// In en, this message translates to:
  /// **'Digital payment solution and e-wallet for individuals and merchants, offering secure payments and digital account management.'**
  String get companyALPAYDescription;

  /// No description provided for @companyALPAYIndustry.
  ///
  /// In en, this message translates to:
  /// **'Fintech'**
  String get companyALPAYIndustry;

  /// No description provided for @companyALPAYSector.
  ///
  /// In en, this message translates to:
  /// **'Finance'**
  String get companyALPAYSector;

  /// No description provided for @companyALPAYType.
  ///
  /// In en, this message translates to:
  /// **'Fintech'**
  String get companyALPAYType;

  /// No description provided for @companyALPAYLocation.
  ///
  /// In en, this message translates to:
  /// **'Algiers, Algeria'**
  String get companyALPAYLocation;

  /// No description provided for @companyALPAYFounded.
  ///
  /// In en, this message translates to:
  /// **'2019'**
  String get companyALPAYFounded;

  /// No description provided for @companyALPAYCEO.
  ///
  /// In en, this message translates to:
  /// **'Young Algerians'**
  String get companyALPAYCEO;

  /// No description provided for @companyALPAYProduct1.
  ///
  /// In en, this message translates to:
  /// **'Secure payments'**
  String get companyALPAYProduct1;

  /// No description provided for @companyALPAYProduct2.
  ///
  /// In en, this message translates to:
  /// **'Digital account management'**
  String get companyALPAYProduct2;

  /// No description provided for @companyALPAYProduct3.
  ///
  /// In en, this message translates to:
  /// **'Online and mobile payment'**
  String get companyALPAYProduct3;

  /// No description provided for @companyALPAYUsers.
  ///
  /// In en, this message translates to:
  /// **'Several thousand users'**
  String get companyALPAYUsers;

  /// No description provided for @companyALPAYCoverage.
  ///
  /// In en, this message translates to:
  /// **'Online services nationwide'**
  String get companyALPAYCoverage;

  /// No description provided for @companyALPAYBusinessModel.
  ///
  /// In en, this message translates to:
  /// **'Transaction commissions + business subscriptions'**
  String get companyALPAYBusinessModel;

  /// No description provided for @companyOkadooName.
  ///
  /// In en, this message translates to:
  /// **'Okadoo'**
  String get companyOkadooName;

  /// No description provided for @companyOkadooDescription.
  ///
  /// In en, this message translates to:
  /// **'Digital marketplace connecting businesses, suppliers and buyers, allowing companies to buy or sell online with digital transaction tracking.'**
  String get companyOkadooDescription;

  /// No description provided for @companyOkadooIndustry.
  ///
  /// In en, this message translates to:
  /// **'B2B Marketplace'**
  String get companyOkadooIndustry;

  /// No description provided for @companyOkadooSector.
  ///
  /// In en, this message translates to:
  /// **'E-commerce'**
  String get companyOkadooSector;

  /// No description provided for @companyOkadooType.
  ///
  /// In en, this message translates to:
  /// **'B2B Marketplace'**
  String get companyOkadooType;

  /// No description provided for @companyOkadooLocation.
  ///
  /// In en, this message translates to:
  /// **'Algeria'**
  String get companyOkadooLocation;

  /// No description provided for @companyOkadooFounded.
  ///
  /// In en, this message translates to:
  /// **'2019'**
  String get companyOkadooFounded;

  /// No description provided for @companyOkadooCEO.
  ///
  /// In en, this message translates to:
  /// **'Young'**
  String get companyOkadooCEO;

  /// No description provided for @companyOkadooProduct1.
  ///
  /// In en, this message translates to:
  /// **'B2B Marketplace'**
  String get companyOkadooProduct1;

  /// No description provided for @companyOkadooProduct2.
  ///
  /// In en, this message translates to:
  /// **'Digital transaction tracking'**
  String get companyOkadooProduct2;

  /// No description provided for @companyOkadooProduct3.
  ///
  /// In en, this message translates to:
  /// **'Supplier-buyer connection'**
  String get companyOkadooProduct3;

  /// No description provided for @companyOkadooUsers.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get companyOkadooUsers;

  /// No description provided for @companyOkadooCoverage.
  ///
  /// In en, this message translates to:
  /// **'Algeria'**
  String get companyOkadooCoverage;

  /// No description provided for @companyOkadooBusinessModel.
  ///
  /// In en, this message translates to:
  /// **'Transaction commission + business subscriptions'**
  String get companyOkadooBusinessModel;

  /// No description provided for @keyInformation.
  ///
  /// In en, this message translates to:
  /// **'Key Information'**
  String get keyInformation;

  /// No description provided for @businessType.
  ///
  /// In en, this message translates to:
  /// **'Business Type'**
  String get businessType;

  /// No description provided for @foundationDate.
  ///
  /// In en, this message translates to:
  /// **'Foundation Date'**
  String get foundationDate;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @employeeCount.
  ///
  /// In en, this message translates to:
  /// **'Number of Employees'**
  String get employeeCount;

  /// No description provided for @annualRevenue.
  ///
  /// In en, this message translates to:
  /// **'Annual Revenue'**
  String get annualRevenue;

  /// No description provided for @additionalInformation.
  ///
  /// In en, this message translates to:
  /// **'Additional Information'**
  String get additionalInformation;

  /// No description provided for @usersCount.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get usersCount;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @companyContactInfo.
  ///
  /// In en, this message translates to:
  /// **'Contact Information for'**
  String get companyContactInfo;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @numberCopied.
  ///
  /// In en, this message translates to:
  /// **'Phone number copied'**
  String get numberCopied;

  /// No description provided for @addressCopied.
  ///
  /// In en, this message translates to:
  /// **'Address copied'**
  String get addressCopied;

  /// No description provided for @noContactInfoAvailable.
  ///
  /// In en, this message translates to:
  /// **'No contact information available'**
  String get noContactInfoAvailable;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;
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
