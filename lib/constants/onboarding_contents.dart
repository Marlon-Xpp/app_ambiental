class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    this.title,
    this.image,
    this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "",
    image: "assets/images/onboarding1.png",
    desc: "Cada día, una persona promedio genera alrededor de 2 kg de basura."
  ),
  OnboardingContents(
    title: "",
    image: "assets/images/onboarding2.png",
    desc: "La identificación de residuos es un paso importante para gestionar los desechos de manera efectiva."
  ),
  OnboardingContents(
    title: "",
    image: "assets/images/onboarding3.png",
    desc: "Aumentar la conciencia sobre el tratamiento adecuado de residuos y hacer que reciclar sea fácil y divertido.",
  ),
];
