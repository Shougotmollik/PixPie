class AppUrl {
  static String getImageUrl(int index) {
    return 'https://picsum.photos/500/800?random=img_$index';
  }

  static String getSliderImageUrl(int index) {
    return 'https://picsum.photos/500/800?random=slider_$index';
  }
}
