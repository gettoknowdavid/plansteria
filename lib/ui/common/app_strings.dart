const String kLoadingAsset = 'assets/loading.json';
const String kOnboardingAsset1 = 'assets/onboarding-1.png';
const String kOnboardingAsset2 = 'assets/onboarding-2.png';
const String kOnboardingAsset3 = 'assets/onboarding-3.png';

const String kDBName = '__plansteria__';

const String emailRegex =
    r"""^[\w!#$%&\'*+/=?^_`{|}~-]+(?:\.[\w!#$%&\'*+/=?^_`{|}~-]+)*@(?:[\w-]+\.)+[\w]{2,}$""";
const String passwordRegex =
    r"""^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!])(?=.{8,})""";

const String kAuthUser = '_authenticated_user__';

const String kInvalidEmail = 'Invalid email.';
const String kServerErrorMessage = 'There seems to be an error, try again.';
const String kNoGoogleAccount = 'No Google account found.';
const String kInvalidEmailPassword = 'Invalid email or password.';
const String kEmailAlreadyInUseErrorMessage = 'Email already in use.';
const String kNoUserFoundErrorMessage = 'No user found with this email.';
const String kNoNetworkConnectionError =
    'Please check your internet connection or try again later.';
const String kRequiresRecentLoginErrorMessage =
    'This operation is sensitive and requires recent authentication. Log in again before retrying this request.';

const String kMailAppTitle = 'Your mail apps';
const String kMailAppDescription =
    'Please select your preferred mail application.';

const String kNoMailAppTitle = 'Oops!';
const String kNoMailAppDescription = 'No mail apps found.';

const String kVerificationEmailSentSuccess = 'Verification email sent';
