
class OnboardingModel {
   final String svgAsset;
  final String eyebrow;
  final String titlePlain;
  final String titleHighlight; 
  final bool highlightFirst; 
  final String subtitle;
  final bool showSimStamp;
  final bool showGateNote;
  OnboardingModel({
  required this.svgAsset,
    required this.eyebrow,
    required this.titlePlain,
    required this.titleHighlight,
    this.highlightFirst = false,
    required this.subtitle,
    this.showSimStamp = false,
    this.showGateNote = false,
  });
}
