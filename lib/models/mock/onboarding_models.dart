
class OnBoarding {
  String imgPath;
  String title;
  String description;
  double? right;

  OnBoarding(this.imgPath, this.title, this.description, {this.right});
}

List<OnBoarding> getOnBoardingItems() {
  return <OnBoarding>[
    OnBoarding(
      "assets/img/onboarding/onBoarding1.svg",
      "Let us take care of you",
      "We are here to take care of you \nwith pleasure. besides that we will \nmonitor your condition 24/Day",
    ),
    OnBoarding(
      "assets/img/onboarding/onBoarding2.svg",
      "Always use a mask",
      "always use a mask when you want \nto travel and keep your \nbody immunity",
    ),
    OnBoarding(
      "assets/img/onboarding/onBoarding3.svg",
      "Work from home",
      "to avoid the spread of covid 19. \nyou can do office work from home and \nalways be close to your family",
      right: -30
    ),
  ];
}
