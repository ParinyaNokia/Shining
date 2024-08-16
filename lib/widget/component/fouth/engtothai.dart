String thainumber = '';

String engToThai(String input) {
  Map<String, String> numberMap = {
    'Zero': 'ศูนย์',
    'One': 'หนึ่ง',
    'Two': 'สอง',
    'Three': 'สาม',
    'Four': 'สี่',
    'Five': 'ห้า',
    'Six': 'หก',
    'Seven': 'เจ็ด',
    'Eight': 'แปด',
    'Nine': 'เก้า',
    'Ten': 'สิบ',
    'Eleven': 'สิบเอ็ด',
    'Twelve': 'สิบสอง',
    'Thirteen': 'สิบสาม',
    'Fourteen': 'สิบสี่',
    'Fifteen': 'สิบห้า',
    'Sixteen': 'สิบหก',
    'Seventeen': 'สิบเจ็ด',
    'Eighteen': 'สิบแปด',
    'Nineteen': 'สิบเก้า',
    'Twenty': 'ยี่สิบ',
    'Thirty': 'สามสิบ',
    'Forty': 'สี่สิบ',
    'Fifty': 'ห้าสิบ',
    'Sixty': 'หกสิบ',
    'Seventy': 'เจ็ดสิบ',
    'Eighty': 'แปดสิบ',
    'Ninety': 'เก้าสิบ',
    'Hundred': 'ร้อย',
    'Thousand': 'พัน',
    'TenThousand': 'หมื่น',
    'Million': 'ล้าน',
    'Billion': 'พันล้าน',
    'Trillion': 'ล้านล้าน'
  };

  String output = input;

  output = output.replaceAll('Bath', 'บาท');
  output = output.replaceAll('bath', 'บาท');
  output = output.replaceAll('Only', 'ถ้วน');
  output = output.replaceAll('only', 'ถ้วน');

  numberMap.forEach((key, value) {
    output = output.replaceAll(
        RegExp(r'\b' + key + r'\b', caseSensitive: false), value);
  });

  return output;
}

void testeng(String input) {
  // String numeng = "TenThousand Bath Only";
  String numthai = engToThai(input);

  thainumber = numthai;
  print(thainumber);
}
