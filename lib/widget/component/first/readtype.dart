// import 'dart:typed_data';
// import 'package:excel/excel.dart';
// import 'package:flutter/services.dart' show rootBundle;

// Future<void> loadExcelFromAssets() async {
//   // โหลด byte data จาก assets
//   ByteData data = await rootBundle.load('assets/files/dataa.xlsx');
//   var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

//   // ถอดรหัส byte data
//   var excel = Excel.decodeBytes(bytes);

//   // อ่านข้อมูลในไฟล์ Excel
//   for (var table in excel.tables.keys) {
//     print('Sheet: $table');
//     print('Max Columns: ${excel.tables[table]!.maxColumns}');
//     print('Max Rows: ${excel.tables[table]!.maxRows}');
//     for (var row in excel.tables[table]!.rows) {
//       print("${row.map((e) => e?.value)}");
//     }
//   }
// }

import 'dart:convert';
// import 'dart:io';
import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadExcelFromAssets() async {
  ByteData data = await rootBundle.load('assets/files/dataa.xlsx');
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

  var excel = Excel.decodeBytes(bytes);

  List<Map<String, dynamic>> jsonData = [];

  for (var table in excel.tables.keys) {
    var sheet = excel.tables[table];
    if (sheet == null) continue;

    List<String> headers = [];
    List<Map<String, dynamic>> rows = [];

    for (var header in sheet.rows.first) {
      headers.add(header?.value.toString() ?? '');
    }

    for (var row in sheet.rows.skip(1)) {
      Map<String, dynamic> rowData = {};
      for (int i = 0; i < row.length; i++) {
        rowData[headers[i]] = _convertCellValue(row[i]);
      }
      rows.add(rowData);
    }

    jsonData.add({
      'sheetName': table,
      'data': rows,
    });
  }

  String jsonString = jsonEncode(jsonData);

  print(jsonString);
  return jsonString;
}

dynamic _convertCellValue(Data? cell) {
  if (cell == null) return null;

  if (cell.value is TextCellValue) {
    return (cell.value as TextCellValue).value;
  } else if (cell.value is IntCellValue) {
    return (cell.value as IntCellValue).value;
  } else if (cell.value is DoubleCellValue) {
    return (cell.value as DoubleCellValue).value;
  } else if (cell.value is DateCellValue) {
    var date = (cell.value as DateCellValue);
    return '${date.year}-${date.month}-${date.day}';
  } else if (cell.value is DateTimeCellValue) {
    var dateTime =
        (cell.value as DateTimeCellValue).toString(); // แปลงเป็น String
    return dateTime;
  } else if (cell.value is BoolCellValue) {
    return (cell.value as BoolCellValue).value;
  } else {
    return cell.value.toString();
  }
}
