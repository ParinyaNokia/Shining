import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:excel/excel.dart';

Future<String> excelToJson() async {
  try {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String excelPath = path.join(appDocDir.path, 'dataa.xlsx');

    print('กำลังอ่านไฟล์: $excelPath');

    if (!File(excelPath).existsSync()) {
      print('ไม่พบไฟล์ที่ $excelPath');
      return 'ไม่พบไฟล์';
    }

    var bytes = File(excelPath).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);

    var sheet = excel.tables.keys.first;
    var table = excel.tables[sheet];

    if (table != null && table.rows.isNotEmpty) {
      print('พบข้อมูลในแผ่นงาน');
      List<Map<String, dynamic>> jsonData = [];
      var headers = table.rows[0];
      for (var row in table.rows.skip(1)) {
        var rowData = <String, dynamic>{};
        for (var i = 0; i < headers.length; i++) {
          var key = headers[i]?.toString() ?? 'Unknown';
          var value = row[i]?.toString() ?? '';
          rowData[key] = value;
        }
        jsonData.add(rowData);
      }
      String jsonString = jsonEncode(jsonData);
      return jsonString;
    } else {
      print('ไม่มีข้อมูล');
      return 'ไม่มีข้อมูล';
    }
  } catch (e) {
    print('เกิดข้อผิดพลาด: $e');
    return 'เกิดข้อผิดพลาด: $e';
  }
}
