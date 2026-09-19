// LAB 3 — HÀM, COLLECTION VÀ XỬ LÝ NGOẠI LỆ

// ===============================
// BƯỚC 1: HÀM VỚI CÁC LOẠI THAM SỐ
// ===============================

// Tham số vị trí bắt buộc + tùy chọn
String gioiThieu(String ten, [String? biDanh]) {
  if (biDanh == null) {
    return 'Toi la $ten';
  }

  return 'Toi la $ten, biet danh $biDanh';
}

// Tham số đặt tên
double tinhDiemTB({
  required double giuaKy,
  required double cuoiKy,
  double heSoCK = 0.6,
}) {
  return giuaKy * (1 - heSoCK) + cuoiKy * heSoCK;
}


// ===============================
// BƯỚC 2: DANH SÁCH SINH VIÊN
// ===============================

final List<Map<String, dynamic>> sinhVien = [
  {'ten': 'An', 'diem': 8.5},
  {'ten': 'Binh', 'diem': 6.0},
  {'ten': 'Chi', 'diem': 9.2},
];


// ===============================
// BƯỚC 3: MAP ĐẾM TẦN SUẤT
// ===============================

void demTanSuatChu(String cauVan) {
  final Map<String, int> tanSuat = {};

  for (final ky in cauVan.toLowerCase().split('')) {
    if (ky == ' ') {
      continue;
    }

    tanSuat[ky] = (tanSuat[ky] ?? 0) + 1;
  }

  tanSuat.forEach(
    (k, v) => print("'$k' xuat hien $v lan"),
  );
}


// ===============================
// BƯỚC 4: XỬ LÝ NGOẠI LỆ
// ===============================

class DiemKhongHopLeException implements Exception {
  final String message;

  DiemKhongHopLeException(this.message);
}

String xepLoaiAnToan(double diem) {
  try {
    if (diem < 0 || diem > 10) {
      throw DiemKhongHopLeException(
        'Diem $diem nam ngoai [0, 10]',
      );
    }

    return diem >= 5 ? 'Dat' : 'Khong dat';
  } on DiemKhongHopLeException catch (e) {
    return 'Loi: ${e.message}';
  } finally {
    print('Da kiem tra xong diem $diem');
  }
}


// ===============================
// BÀI TẬP CUỐI LAB 1:
// TÍNH TỔNG LIST
// ===============================

num tinhTongList(List<num> ds) {
  num tong = 0;

  for (final so in ds) {
    tong += so;
  }

  return tong;
}


// ===============================
// HÀM XẾP LOẠI
// Dựa trên hàm xepLoai ở Lab 2
// ===============================

String xepLoai(double diem) {
  if (diem >= 9.0) {
    return 'Xuat sac';
  } else if (diem >= 8.0) {
    return 'Gioi';
  } else if (diem >= 6.5) {
    return 'Kha';
  } else if (diem >= 5.0) {
    return 'Trung binh';
  } else {
    return 'Yeu';
  }
}


// ===============================
// BÀI TẬP CUỐI LAB 2:
// SET LẤY CÁC MỨC XẾP LOẠI
// ===============================

Set<String> layMucXepLoai(
  List<Map<String, dynamic>> danhSach,
) {
  final Set<String> ketQua = {};

  for (final sv in danhSach) {
    final double diem = sv['diem'] as double;
    ketQua.add(xepLoai(diem));
  }

  return ketQua;
}


// ===============================
// BÀI TẬP CUỐI LAB 3:
// LỖI DANH SÁCH RỖNG
// ===============================

class DanhSachRongException implements Exception {
  final String message;

  DanhSachRongException(this.message);
}

double timDiemCaoNhat(List<Map<String, dynamic>> danhSach) {
  if (danhSach.isEmpty) {
    throw DanhSachRongException(
      'Danh sach sinh vien dang rong',
    );
  }

  double diemCaoNhat = danhSach[0]['diem'] as double;

  for (final sv in danhSach) {
    final double diem = sv['diem'] as double;

    if (diem > diemCaoNhat) {
      diemCaoNhat = diem;
    }
  }

  return diemCaoNhat;
}


// ===============================
// MAIN
// ===============================

void main() {
  // --------------------------------
  // 1. Gọi hàm gioiThieu()
  // --------------------------------

  print('=== BUOC 1 ===');

  print(gioiThieu('An'));
  print(gioiThieu('Binh', 'Bin'));

  // --------------------------------
  // 2. Gọi hàm tinhDiemTB()
  // --------------------------------

  print('\n=== TINH DIEM TRUNG BINH ===');

  print(
    'Diem TB 1: ${tinhDiemTB(giuaKy: 8, cuoiKy: 9)}',
  );

  print(
    'Diem TB 2: ${tinhDiemTB(
      giuaKy: 7,
      cuoiKy: 8,
      heSoCK: 0.7,
    )}',
  );

  // --------------------------------
  // 3. List sinh viên
  // --------------------------------

  print('\n=== DANH SACH SINH VIEN ===');

  for (final sv in sinhVien) {
    print('${sv['ten']}: ${sv['diem']}');
  }

  // map() + reduce()
  final diemCaoNhat = sinhVien
      .map((sv) => sv['diem'] as double)
      .reduce((a, b) => a > b ? a : b);

  print('Diem cao nhat: $diemCaoNhat');

  // where()
  final sinhVienGioi =
      sinhVien.where((sv) => sv['diem'] >= 8.0);

  print('Sinh vien co diem >= 8:');

  for (final sv in sinhVienGioi) {
    print('${sv['ten']}: ${sv['diem']}');
  }

  // --------------------------------
  // 4. Đếm tần suất ký tự
  // --------------------------------

  print('\n=== DEM TAN SUAT KY TU ===');

  demTanSuatChu('lap trinh dart va flutter');

  // --------------------------------
  // 5. Xử lý ngoại lệ điểm
  // --------------------------------

  print('\n=== XU LY NGOAI LE ===');

  print('Diem 8: ${xepLoaiAnToan(8)}');
  print('Diem -2: ${xepLoaiAnToan(-2)}');
  print('Diem 15: ${xepLoaiAnToan(15)}');

  // --------------------------------
  // 6. Tính tổng List
  // --------------------------------

  print('\n=== TINH TONG LIST ===');

  final List<num> dsSo = [1, 2, 3, 4, 5];

  final tongFor = tinhTongList(dsSo);

  final tongFold = dsSo.fold<num>(
    0,
    (a, b) => a + b,
  );

  print('Tong bang for: $tongFor');
  print('Tong bang fold: $tongFold');

  // --------------------------------
  // 7. Set các mức xếp loại
  // --------------------------------

  print('\n=== CAC MUC XEP LOAI ===');

  final Set<String> mucXepLoai =
      layMucXepLoai(sinhVien);

  print(mucXepLoai);

  // --------------------------------
  // 8. Danh sách rỗng
  // --------------------------------

  print('\n=== KIEM TRA DANH SACH RONG ===');

  try {
    final danhSachRong =
        <Map<String, dynamic>>[];

    final diem = timDiemCaoNhat(danhSachRong);

    print('Diem cao nhat: $diem');
  } on DanhSachRongException catch (e) {
    print('Loi: ${e.message}');
  }
}