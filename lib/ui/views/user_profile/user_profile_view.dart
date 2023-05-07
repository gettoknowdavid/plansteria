import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/widgets/app_back_button.dart';
import 'package:plansteria/ui/widgets/event_card.dart';
import 'package:plansteria/ui/widgets/profile/profile_stat_item.dart';
import 'package:plansteria/ui/widgets/user_profile/follow_button.dart';
import 'package:stacked/stacked.dart';

import 'user_profile_viewmodel.dart';

class UserProfileView extends StackedView<UserProfileViewModel> {
  final String userId;
  final Event event;
  const UserProfileView({super.key, required this.userId, required this.event});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final dividerColor = theme.dividerColor.withOpacity(0.3);
    final iconButtonStyle = IconButton.styleFrom(
      shape: CircleBorder(
        side: BorderSide(color: theme.colorScheme.onBackground.withOpacity(.7)),
      ),
    );

    if (viewModel.isBusy) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70.w,
        leading: Center(child: AppBackButton(onTap: viewModel.navigateBack)),
      ),
      body: SingleChildScrollView(
        padding: kGlobalHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _Avatar(),
            20.verticalSpace,
            const _Name(),
            const _Location(),
            30.verticalSpace,
            const _Stats(),
            30.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FollowButton(),
                if (viewModel.data?.phone != null) ...[
                  10.horizontalSpace,
                  IconButton(
                    onPressed: viewModel.call,
                    style: iconButtonStyle,
                    tooltip: 'Call',
                    icon: const Icon(PhosphorIcons.phone),
                  ),
                ],
                10.horizontalSpace,
                IconButton(
                  onPressed: viewModel.sendMail,
                  style: iconButtonStyle,
                  tooltip: 'Send mail',
                  icon: const Icon(PhosphorIcons.envelope),
                )
              ],
            ),
            20.verticalSpace,
            Divider(color: dividerColor),
            20.verticalSpace,
            const _EventList(),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(UserProfileViewModel viewModel) async {
    await viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  UserProfileViewModel viewModelBuilder(context) => UserProfileViewModel();
}

class _EventList extends ViewModelWidget<UserProfileViewModel> {
  const _EventList();

  @override
  Widget build(BuildContext context, UserProfileViewModel viewModel) {
    return StreamBuilder<List<Event?>>(
      stream: viewModel.myEvents,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.separated(
          shrinkWrap: true,
          primary: false,
          separatorBuilder: (context, index) => 16.verticalSpace,
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final event = snapshot.data![index]!;
            return EventCard(event: event, onTap: () {});
          },
        );
      },
    );
  }
}

class _Location extends StatelessWidget {
  const _Location();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      'Lagos, NG',
      textAlign: TextAlign.center,
      style: textTheme.bodyMedium?.copyWith(
        color: textTheme.bodyLarge?.color?.withOpacity(0.5),
      ),
    );
  }
}

class _Name extends SelectorViewModelWidget<UserProfileViewModel, String> {
  const _Name();

  @override
  Widget build(BuildContext context, String value) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      value,
      style: textTheme.titleLarge,
      maxLines: 1,
      textAlign: TextAlign.center,
    );
  }

  @override
  String selector(UserProfileViewModel viewModel) => viewModel.data!.name;
}

class _Stats extends ViewModelWidget<UserProfileViewModel> {
  const _Stats();

  @override
  Widget build(BuildContext context, UserProfileViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StreamBuilder<int>(
          stream: viewModel.numberOfCreatedEvents,
          builder: (context, snapshot) => ProfileStatItem(
            count: snapshot.data,
            label: 'Events',
            loading: snapshot.connectionState == ConnectionState.waiting,
          ),
        ),
        StreamBuilder<int>(
          stream: viewModel.followers,
          builder: (context, snapshot) => ProfileStatItem(
            count: snapshot.data,
            label: 'Followers',
            loading: snapshot.connectionState == ConnectionState.waiting,
          ),
        ),
        StreamBuilder<int>(
          stream: viewModel.following,
          builder: (context, snapshot) => ProfileStatItem(
            count: snapshot.data,
            label: 'Following',
            loading: snapshot.connectionState == ConnectionState.waiting,
          ),
        ),
      ],
    );
  }
}

class _Avatar extends ViewModelWidget<UserProfileViewModel> {
  const _Avatar();

  @override
  Widget build(BuildContext context, UserProfileViewModel viewModel) {
    final theme = Theme.of(context);
    final outerRadius = 0.15.sw;
    final innerRadius = 0.145.sw;
    final iconSize = innerRadius * 0.6;

    final iconColor = theme.colorScheme.onPrimary;

    return CircleAvatar(
      radius: outerRadius,
      backgroundColor: theme.colorScheme.onBackground,
      child: CircleAvatar(
        radius: innerRadius,
        foregroundImage: viewModel.data?.avatar != null
            ? NetworkImage(viewModel.data!.avatar!)
            : null,
        child: viewModel.data?.avatar == null
            ? Icon(PhosphorIcons.user, size: iconSize, color: iconColor)
            : null,
      ),
    );
  }
}
