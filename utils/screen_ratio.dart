//Just import and use. Ready to use

class ScreenRatio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double ratio =
        MediaQuery.of(context).size.height / MediaQuery.of(context).size.width;
    String fraction;
    String orientation = ratio < 1 ? "Landscape" : "Portrate";
    switch (ratio.toStringAsFixed(2)) {
      case "2.00":
      case "0.50":
        fraction = "~ 18:9";
        break;
      case "1.77":
      case "0.56":
        fraction = "~ 16:9";
        break;
      case "1.33":
      case "0.75":
        fraction = "~ 4:3";
        break;
      case "1.00":
        fraction = "1:1";
        orientation = "Squared";
        break;
      default:
        fraction = ratio.toStringAsFixed(2);
    }
    return Text("$orientation $fraction",
        style: Theme.of(context).textTheme.headline4);
  }
}
