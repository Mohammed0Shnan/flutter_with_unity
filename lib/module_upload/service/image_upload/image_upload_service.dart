
import 'package:tut/module_upload/manager/upload_manager/upload_manager.dart';
import 'package:tut/module_upload/response/imgbb/imgbb_response.dart';


class ImageUploadService {
  final UploadManager _manager = UploadManager();


  Future<String> uploadImage(String filePath) async {
    ImgBBResponse response = await _manager.upload(filePath);
    if (response == null) {
      return null;
    } else {
      return response.url;
    }
  }
}
