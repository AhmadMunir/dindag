class CurrentResponse<T>{
  bool? status;
  String? message;
  T? data;

  CurrentResponse(this.status, {this.message, this.data});
}