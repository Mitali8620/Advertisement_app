/// for PersonalInformationScreen arguments
class PersonalInformationScreenArgs {
  final String fullName;
  final String profileImageUrl;
  final bool? isFromEditProfile;
  final bool? isFromInitialSplash;

  PersonalInformationScreenArgs({
    required this.fullName,
    required this.profileImageUrl,
    this.isFromEditProfile,
    this.isFromInitialSplash = false,
  });
}


class ImagePreviewScreenArgs {
  final List<String> imagesList;

  ImagePreviewScreenArgs({
    required this.imagesList,
  });
}
