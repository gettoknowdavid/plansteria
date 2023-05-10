// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:phosphor_flutter/phosphor_flutter.dart';
// import 'package:plansteria/ui/widgets/app_back_button.dart';
// import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';

// import 'profile_stats_sheet_model.dart';

// class ProfileStatsSheet extends StackedView<ProfileStatsSheetModel> {
//   final Function(SheetResponse response)? completer;
//   final SheetRequest request;
//   const ProfileStatsSheet({
//     Key? key,
//     required this.completer,
//     required this.request,
//   }) : super(key: key);

//   @override
//   Widget builder(context, viewModel, child) {
//     return SizedBox(
//       height: 1.sh,
//       child: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(kToolbarHeight + 22),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 22).r,
//             child: AppBar(
//               scrolledUnderElevation: 0.0,
//               title: Text(viewModel.appBarTitle),
//               bottom: !viewModel.isBusy ? null : _buildLoadingIndicator(),
//               leading: Center(child: AppBackButton(onTap: viewModel.close)),
//             ),
//           ),
//         ),
//         body: !viewModel.dataReady ? null : _buildList(viewModel, context),
//       ),
//     );
//   }

//   @override
//   void onViewModelReady(ProfileStatsSheetModel viewModel) {
//     viewModel.init(
//       initType: request.data!.type,
//       initEvent: request.data?.event,
//     );
//     super.onViewModelReady(viewModel);
//   }

//   @override
//   ProfileStatsSheetModel viewModelBuilder(context) => ProfileStatsSheetModel();

//   Widget _buildList(ProfileStatsSheetModel viewModel, BuildContext context) {
//     if (viewModel.data!.isEmpty) {
//       return _buildEmptyState(context);
//     }

//     return ListView.separated(
//       separatorBuilder: (context, index) => _buildSeparator(context),
//       itemCount: viewModel.data!.length,
//       itemBuilder: (context, index) {
//         final theme = Theme.of(context);
//         final user = viewModel.data![index]!;
//         final hasAvatar = user.avatar != null;

//         return ListTile(
//           onTap: () => viewModel.navigateToUserProfile(user.uid),
//           title: Text(user.name),
//           leading: CircleAvatar(
//             backgroundColor: theme.primaryColor,
//             radius: 16.r,
//             child: CircleAvatar(
//               foregroundImage: hasAvatar ? NetworkImage(user.avatar!) : null,
//               radius: 15.r,
//               child: !hasAvatar ? const Icon(PhosphorIcons.user) : null,
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Container _buildEmptyState(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Container(
//       alignment: Alignment.topCenter,
//       padding: const EdgeInsets.fromLTRB(16, 40, 16, 0).r,
//       child: Text('Nothing to see here', style: textTheme.titleMedium),
//     );
//   }

//   Divider _buildSeparator(BuildContext context) {
//     return Divider(
//       color: Theme.of(context).dividerColor.withOpacity(0.3),
//       endIndent: 14,
//       indent: 14,
//     );
//   }

//   PreferredSize _buildLoadingIndicator() {
//     return PreferredSize(
//       child: const LinearProgressIndicator(),
//       preferredSize: Size.fromHeight(1.r),
//     );
//   }
// }
