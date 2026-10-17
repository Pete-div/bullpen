import 'package:bullpen/_lib.dart';

class NormalAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const NormalAppBar({super.key, this.actionWidget, this.title, this.leading});
  final Widget? actionWidget;
  final Widget? title;
  final Widget? leading;

  @override
  Widget build(BuildContext context, ref) {
    final appTheme = ref.watch(appThemeProvider);
    return AppBar(
      backgroundColor: appTheme.scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      leading:
          leading ??
          GestureDetector(
            onTap: () {
              Future.microtask(() {
                if (context.mounted) Navigator.pop(context);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  'assets/svg/arrow-left.svg',

                  colorFilter: ColorFilter.mode(
                    appTheme.isDark ? white : Color(0xFF181818),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
      title: title,
      centerTitle: true,
      actions: [actionWidget ?? const SizedBox.shrink()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class AppBarWidget extends ConsumerWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.actionWidget,
    this.title,
    this.centerTitle,
  });
  final Widget? actionWidget;
  final Widget? title;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context, ref) {
    final appTheme = ref.watch(appThemeProvider);
    return AppBar(
      backgroundColor: appTheme.scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      title: title,
      centerTitle: centerTitle ?? true,
      actions: [actionWidget ?? const SizedBox.shrink()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
