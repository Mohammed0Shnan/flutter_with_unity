
import 'package:dio/dio.dart';
import 'package:tut/consts/urls.dart';
import 'package:tut/module_upload/response/imgbb/imgbb_response.dart';
import 'package:tut/utils/logger/logger.dart';

class UploadRepository {
  Future<ImgBBResponse> upload(String filePath) async {
    var client = Dio();
    FormData data = FormData.fromMap({
      'image': await MultipartFile.fromFile(filePath),
    });

    Logger().info('UploadRepo', 'Uploading: ' + filePath);
    Response response = await client.post(
      Urls.UPLOAD_API,
      data: data,

    );
    Logger().info('Got a Response', response.toString());

    if (response == null) {
      return null;
    }
    print(response.data);
     return ImgBBResponse(url: response.data);
  }
}
