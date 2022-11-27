abstract class User {
  // String fullname;
  // User(this.fullname);
  login(String username, String password) {
    ///
    /// defition
  }
  logout();
}

class Adminuser extends User {
  // Adminuser(super.fullname);
  // Adminuser(String fullbname) : super(fullbname);

  @override
  login(String username, String password) {
    super.login(username, password);
  }

  @override
  logout() {}
}

class MemeberUser extends User {
  @override
  logout() {}

  @override
  login(String username, String password) {
    super.login(username, password);
  }
}

void main() {
  final user1 = MemeberUser();
  user1.login("username", "password");
}
