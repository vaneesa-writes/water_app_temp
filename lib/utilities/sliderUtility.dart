class SliderUtility {
  double sliderMinValue, sliderMaxValue, sliderInitialValue, value = 0;
  String diaplyText;
  SliderUtility(
      {required this.sliderMinValue,
      required this.sliderMaxValue,
      required this.sliderInitialValue,
      required this.diaplyText});
  void modifyInitialValue(double new_value) {
    sliderInitialValue = new_value;
  }
}
