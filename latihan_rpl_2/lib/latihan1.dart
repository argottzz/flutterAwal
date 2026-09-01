void main() {
  var namaToko = 'Toko Buah';
  var pelanggan = 'Budi Santoso';
  var namaBarang = 'Apel';
  int hargaBarang = 15000;
  int jumlahBarang = 2;

  int totalHarga = hargaBarang * jumlahBarang;
  double diskon = hargaBarang * 0.1;
  double potonganHarga = diskon * jumlahBarang;
  double totalBayar = totalHarga - potonganHarga;

  bool statusMember = true;

  int sisaStok = 8;

  print('===== STRUK PEMBELIAN =====');
  print('Nama toko      : $namaToko');
  print('Pelanggan      : $pelanggan');
  print('Barang         : $namaBarang');
  print('Harga barang   : $hargaBarang');
  print('Jumlah barang  : $jumlahBarang');
  print('Total harga    : Rp$totalHarga');
  print('Diskon         : $diskon');
  print('Potongan harga : Rp$potonganHarga');
  print('Total bayar    : Rp$totalBayar');
  print('Status member  : $statusMember');
  print('Sisa stok      : $sisaStok');
  print('===========================');
}
