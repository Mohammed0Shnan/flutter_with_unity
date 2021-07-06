
import 'package:tut/module_upload/repository/upload_repository/upload_repository.dart';
import 'package:tut/module_upload/response/imgbb/imgbb_response.dart';

class UploadManager {
  final UploadRepository _repository =  UploadRepository();


  Future<ImgBBResponse> upload(String filePath) {
    return _repository.upload(filePath);
  }
}
