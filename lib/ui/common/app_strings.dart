const String kLoadingAsset = 'assets/loading.json';
const String kOnboardingAsset1 = 'assets/onboarding-1.png';
const String kOnboardingAsset2 = 'assets/onboarding-2.png';
const String kOnboardingAsset3 = 'assets/onboarding-3.png';

const String kDBName = '__plansteria__';

const String emailRegex =
    r"""^[\w!#$%&\'*+/=?^_`{|}~-]+(?:\.[\w!#$%&\'*+/=?^_`{|}~-]+)*@(?:[\w-]+\.)+[\w]{2,}$""";
const String passwordRegex =
    r"""^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=?!])(?=.{8,})""";

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

const String kLocationPermissionPermanentlyDenied =
    'Location permissions are permanently denied, we cannot request permissions.';
const kLocationPermissionDenied = 'Location permissions are denied';

const kAboutApp =
    "Welcome to Plansteria, your go-to platform for creating and managing extraordinary events! Whether you're planning a small gathering, a corporate conference, or a grand wedding, we've got you covered.\n"
    "At Plansteria, we understand that organizing events can be a daunting task. That's why we've developed a comprehensive and user-friendly application to simplify the event planning process. With our innovative features and intuitive interface, you can bring your vision to life with ease and precision.\n"
    "Creating an event with Plansteria is as simple as a few clicks. Our powerful event creation tool allows you to define all the essential details, from the event type and location to the date and time. Customize your event with descriptions, themes, and even ticketing options. You have complete control to tailor every aspect to suit your unique requirements.\n"
    "With Plansteria, event promotion becomes a breeze. Our built-in marketing features allow you to create personalized event websites, share updates through social media integration, and reach your target audience effectively. Maximize your event's exposure and boost attendance with our powerful promotional tools.\n"
    "At Plansteria, we value security and privacy. Rest assured that your event data is protected with robust encryption and strict privacy protocols. We prioritize the confidentiality of your information and adhere to industry best practices to maintain the utmost security.\n"
    "Our mission is to empower event organizers like you to create unforgettable experiences. Whether you're a seasoned professional or a first-time planner, Plansteria provides you with the tools and resources you need to execute flawless events.\n"
    "Join us today and discover the future of event creation and management. Let Plansteria be your trusted companion on your event planning journey. Start creating exceptional experiences with ease and efficiency.";

const kTimeout = 'Oops! The connection timed out. Try again.';
