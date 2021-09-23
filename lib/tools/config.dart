export 'current_request.dart';
export 'current_response.dart';
export 'sharedpreferences_manager.dart';
export 'color.dart';
export 'navigate.dart';

String url = 'https://dindag.mascitra.id/api';

String dummyImage = "https://images.unsplash.com/photo-1631945389248-8532b592fe05?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80";

String removeException(String error) {
  return error.replaceAll('Exception:', '');
}