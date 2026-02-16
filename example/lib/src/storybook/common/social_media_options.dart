const yoloUrl = 'https://www.yolo.com';

enum SocialMedia {
  medium,
  linkedIn,
  gitHub,
  figma,
  license;

  String get name {
    final String rawName = toString().split('.').last;

    return rawName[0].toUpperCase() + rawName.substring(1);
  }

  String get url => switch (this) {
        medium => 'https://medium.com/',
        linkedIn => 'https://www.linkedin.com/',
        gitHub => 'https://github.com/cedricWassenaar/selenic_flutter',
        figma => 'https://www.figma.com/',
        license =>
          'https://github.com/cedricWassenaar/selenic_flutter/blob/main/LICENSE',
      };

  String get buttonIconPath => switch (this) {
        gitHub => 'assets/svg/github_logo.svg',
        figma => 'assets/svg/figma_logo.svg',
        _ => '',
      };
}
