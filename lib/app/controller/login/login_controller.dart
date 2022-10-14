// import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final _isLoading = RxnBool(false);
  bool _isJoin = false;

  // get auth => _auth;
  get isJoin => _isJoin;

  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  void joinToggle() {
    _isJoin = !_isJoin;
    update();
  }
  // Future<void> signInWithGoogle() async {
  //   _isLoading(true);
  //   try {
  //     // Trigger the authentication flow
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //
  //     if (googleAuth != null) {
  //       // Create a new credential
  //       final credential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth.accessToken,
  //         idToken: googleAuth.idToken,
  //       );
  //
  //       // Once signed in, return the UserCredential
  //       await _auth.signInWithCredential(credential);
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     // setState(() {
  //     //   error = '${e.message}';
  //     // });
  //   } finally {
  //     _isLoading(false);
  //   }
  // }
  //
  // Future<void> signOut() async {
  //   await FirebaseAuth.instance.signOut();
  //   await GoogleSignIn().signOut();
  // }
// final _postsList = List<MyModel>().obs;
// get postList => this._postsList.value;
// set postList(value) => this._postsList.value = value;
//
//
// final _post = MyModel().obs;
// get post => this._post.value;
// set post(value) => this._post.value = value;
//
// getAll(){
//   repository.getAll().then( (data){ this.postList = data; } );
// }
//
// adicionar(post){
//
// }
// //dismissible
// excluir(id){
//
// }
// //dismissible
// editar(){
//
// }
// details(post){
//   this.post = post;
//   Get.toNamed(Routes.DETAILS);
// }
}