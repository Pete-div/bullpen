import 'dart:ui';

Color textColor = "#6E768A".toColor();
Color darkGrey ='#181818'.toColor();
Color darkButton='#424243'.toColor();
Color darkDeepRed='#523300'.toColor();
Color darkGrey02 ='#212124'.toColor();
Color blueColor = "#017AFF".toColor();
Color lightBlue='#EDF6FF'.toColor();
Color intro1 = "#ECF4FF".toColor();
Color intro2 = "#FFF4EC".toColor();
Color grey600 = "#F7F9FC".toColor();
Color intro3 = "#F7ECFF".toColor();
Color grey400 = "#777D86".toColor();
Color grey650 = "#475367".toColor();
Color grey800 = "#1D2739".toColor();
Color successLightColor = "#EFFEF0".toColor();
Color successColor = blueColor.withOpacity(0.10);
Color switchColor = "#18CF2D".toColor();
Color shadowColor = blueColor.withOpacity(0.10);
Color skipColor = "#6E768A".toColor();
Color errorColor = "#DD524D".toColor();
Color borderColor = "#F5B546".toColor();
Color yellowColorBg = "#FEF6E7".toColor();
Color greenColor = "#0E871D".toColor();
Color beneficiaryBocColor ='#131e57'.toColor();
Color yellowColor = "#F3A218".toColor();
Color colorBg = "#F4F4F4".toColor();
Color containerShadow = "#E0E9F5".toColor();
Color grey00 = "#8C8C8C".toColor();
Color yellowBg = "#F7D394".toColor();
Color deepYellowBg ='#F3A218'.toColor();
Color lightYellowBg ='#FEF6E7'.toColor();
Color h6 = "#1D2739".toColor();
Color textFieldActiveColor = "#41E755".toColor();
Color lightGreen ='#EFFEF0'.toColor();
Color greyColor300 = "##F6F6FF".toColor();
Color greyColor200 ='#EBEBFD'.toColor();
Color grey05 ='#59595B'.toColor();
Color successGreen = "#0F973D".toColor();
Color grey100 = "#D5D5D5".toColor();
Color error50 = "#FBEAE9".toColor();
Color redColor2 = "#D42620".toColor();
Color grey900Color = "#101928".toColor();
Color grey400Color = "##D3D3D3".toColor();
Color arrowDown='#898989'.toColor();
Color blue = "#141D57".toColor();
Color teal = "#DCDCDC".toColor();
Color subtextColor = "#6E768A".toColor();
Color redColor = "#DD3333".toColor();
Color boxColor='#F1F1FF'.toColor();
Color grayColor = "#F2F2F2".toColor();
Color containerGray = "#F9FAFB".toColor();
Color greyColor = "#777D86".toColor();
Color success2Color = "#099137".toColor();
Color greenSuccessColor = "#015B20".toColor();
Color orangeColor = "#F56D40".toColor();
Color mildGrey = "#3B3B3B".toColor();
Color buttonColor = '#F0F5FF'.toColor();
Color paymentBg = "#F2F3F8".toColor();
Color primaryColorsuccess = "#009C49".toColor();
Color grey200='#D5D5D5'.toColor();
Color error = "#DD3333".toColor();
Color priceColor = "#F1F5FF".toColor();
Color bgColor = "#E3F3FF".toColor();
Color errorbg = "#F9E7E7".toColor();
Color successBg = '#E7F9EF'.toColor();
Color  white ='#FFFFFF'.toColor();
Color offWhite ='#E5E5FF'.toColor();
Color textFieldColor='#EEEEEE'.toColor();
Color dark ='#000000'.toColor();
 Color ink = "#12183B".toColor();

 Color cream = "#FBF3E7".toColor();

 Color green = "#14B87F".toColor();

 Color greenDeep = "#0C8F62".toColor();

 Color coral = "#FF6B4A".toColor();

 Color gold = "#F2B705".toColor();

 Color text = "#1C1F33".toColor();

 Color textSoft = "#5B5F79".toColor();

 Color gateAmberBg = "#24F2B705".toColor();

 Color gateAmberBorder = "#66F2B705".toColor();

 Color gateAmberText = "#7A5A00".toColor();
Color dark02='#212121'.toColor();
 Color backgroundColor = "#FBF3E7".toColor();
const Color primaryColor = Color(0xFF2405DA);
const Color primaryLight = Color(0xff010137);
const Color bottomSheetColor =Color(0xFF303035);
 Color tutorialBoxColor='#3C3C42'.toColor();
 Color dark06='#4F4F50'.toColor();
 Color dark005 ='#636262'.toColor();
 Color darkBoxColor='#3A3A3F'.toColor();
 Color ligthBoxColor='#FAFAFA'.toColor();
extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

