import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FasacFirebaseUser {
  FasacFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

FasacFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<FasacFirebaseUser> fasacFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<FasacFirebaseUser>((user) => currentUser = FasacFirebaseUser(user));
