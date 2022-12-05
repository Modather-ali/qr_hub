import 'dart:developer';

import 'package:qr_hub/packages.dart';

class QRController extends GetxController {
  List<QRModel> qrModelsDataList = [];
  final SqlDatabase _sqlDatabase = SqlDatabase();
  final DateUtil _dateUtil = DateUtil();

  Future readData() async {
    List<Map<String, Object?>> data;
    QRModel qrModel;
    data = await _sqlDatabase.readData('SELECT * FROM QrCodes');
    for (var element in data) {
      qrModel = QRModel(
        element['id'].toString(),
        element['url'].toString(),
        element['date'].toString(),
        element['urlType'].toString(),
      );
      qrModelsDataList.add(qrModel);
    }
    log(qrModelsDataList.length.toString());
    update();
  }

  Future insertQRDate({
    required String url,
    required String urlType,
  }) async {
    await _sqlDatabase.insertData(
        "INSERT INTO 'QrCodes' ('url', 'date', 'urlType') VALUES('$url', '${_dateUtil.currantDate}', '$urlType')");

    int id = 1;
    if (qrModelsDataList.isNotEmpty) {
      id = int.parse(qrModelsDataList.last.id) + 1;
    }
    QRModel qrModel =
        QRModel(id.toString(), url, _dateUtil.currantDate, urlType);
    qrModelsDataList.add(qrModel);
    update();
  }

  Future deleteData(String id, int index) async {
    int qrID =
        await _sqlDatabase.deleteData('DELETE FROM QrCodes WHERE id = $id');
    qrModelsDataList.removeAt(index);
    log(qrID.toString());
    update();
  }
}
