import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/widgets/app_back_button.dart';
import 'package:stacked/stacked.dart';

import 'about_viewmodel.dart';

class AboutView extends StackedView<AboutViewModel> {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const Center(child: AppBackButton()),
        leadingWidth: 60.r,
        title: const Text('About Plansteria'),
        scrolledUnderElevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kGlobalPadding).r,
        child: DefaultTextStyle(
          style: textTheme.bodyLarge!,
          child: Column(
            children: [
              const Text(
                "Welcome to Plansteria, the ultimate event planning app designed to help you plan and execute your events with ease. Whether you're planning a small gathering or a large event, our app has everything you need to make it a success. With our intuitive interface and powerful features, you can easily plan, organize, and manage all aspects of your event in one place.",
              ),
              10.verticalSpace,
              const Text(
                "One of the most exciting features of Plansteria is our integration with ChatGPT, a state-of-the-art language model that can answer any question you have about event planning. Whether you're looking for advice on venue selection, catering options, or decor ideas, ChatGPT is always available to help. Simply ask your question, and the AI-powered assistant will provide you with personalized recommendations and tips to help you plan and execute your event successfully.",
              ),
              10.verticalSpace,
              const Text(
                "To ensure the security and privacy of our users, Plansteria uses Firebase Auth, a secure and easy-to-use authentication system that allows you to sign in using your existing Google or Facebook account. We also use Firebase CloudStore to securely store your event data and provide real-time synchronization across all your devices. This means you can access your event information from anywhere, at any time, and never have to worry about losing your data.",
              ),
              10.verticalSpace,
              const Text(
                "At Plansteria, we believe that event planning should be stress-free and enjoyable, and our app is designed to help you achieve just that. With our powerful features, easy-to-use interface, and AI-powered assistant, you can plan and execute your events like a pro, without any hassle. So why wait? Download Plansteria today and start planning your next event with confidence!",
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  AboutViewModel viewModelBuilder(BuildContext context) => AboutViewModel();
}
