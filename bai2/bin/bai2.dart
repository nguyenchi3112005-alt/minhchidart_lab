void main() {
  final ten = 'Sinh vien';
  final int tuoi = 20;

  print('Xin chao, $ten! Day la chuong trinh Dart dau tien.');
  print('Nam sau ban se ${tuoi + 1} tuoi');

  for (var i = 1; i <= 5; i++) {
    print('Dem: $i');
  }

  int i = 1;
  while (i <= 10) {
    print('5 x $i = ${5 * i}');
    i++;
  }
}