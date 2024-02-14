class Session {
  Session._();

  static String userid = '';
  static String usernmae = '';

  static preferaceData(String userid, String usernmae) async {
    Session.userid = userid;
    Session.usernmae = usernmae;
  }
}
