class ApiResponse<T> {
  late bool ok;
  String? msg;
  T? result;

  ApiResponse.ok(this.result) {
    ok = true;
  }

  ApiResponse.error(this.msg) {
    ok = false;
  }
}
