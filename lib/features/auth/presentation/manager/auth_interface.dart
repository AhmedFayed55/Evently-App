abstract class AuthInterface {
  void showMyLoading(String message);

  void hideMyLoading();

  void showMyMessage({
    String message,
    String title,
    String buttonText,
    Function onPressed,
  });
}
