class FormatHelper {
  static String formatTimerMinutes(int duration) =>
      ((duration / 60) % 60).floor().toString().padLeft(2, "0");

  static String formatTimerSeconds(int duration) =>
      (duration % 60).floor().toString().padLeft(2, "0");
}
