class Utils {
  static String addHyphenInString(String temp) {
    String formattedString = temp.replaceAll(' ', '_');
    return formattedString;
  }

  static String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
  
}
