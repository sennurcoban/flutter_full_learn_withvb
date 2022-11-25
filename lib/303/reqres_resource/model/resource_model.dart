class ASYDatas {
  List<Data>? data;

  ASYDatas({this.data});

  ASYDatas.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? musteriId;
  String? musteriSirketUnvani;
  String? musteriSirketFotografi;
  int? kanalSirketId;
  String? kanalSirketUnvani;
  String? kanalSirketAdi;
  String? kanalSirketFotografi;
  String? rakipSirketUnvani;
  int? rakipTeklifi;
  int? rakipFaturaTutari;
  String? potansiyelFirsatAdi;
  int? tahminiBeklenenCiro;
  String? guncellenmeTarihi;
  String? taahhutBitisTarihi;
  String? randevuTipi;
  String? randevuDurumu;
  String? randevuBaslangicTarihi;
  String? randevuBitisTarihi;
  String? randevuAciklamasi;
  bool? iletisimBilgiIzniVerildiMi;
  int? satisPersonelId;
  String? satisPersonelAdi;
  String? satisPersonelProfilFotografi;
  int? ekleyenKullaniciID;
  String? ekleyenKullaniciAdi;
  String? ekleyenKullaniciFotografi;
  String? eklenmeTarihi;
  Null? sirketUnvani;
  String? potansiyelFirsatAsamaAdi;
  String? renk;
  String? onemDerecesi;
  String? onemDerecesiSinifAdi;
  int? oncelikDerecesiDegeri;
  String? randevuDurumuSinifAdi;
  String? randevuTipiSinifAdi;
  String? urunAdi;
  String? musteriAdi;
  int? urunAdet;
  int? toplamKayitSayisi;
  String? kapanmaYuzdesi;
  List<Urunler>? urunler;
  int? potansiyelFirsatCirosu;
  String? paraBirimSembolu;
  String? urunParaBirim;
  Null? aciklama;

  Data(
      {this.id,
      this.musteriId,
      this.musteriSirketUnvani,
      this.musteriSirketFotografi,
      this.kanalSirketId,
      this.kanalSirketUnvani,
      this.kanalSirketAdi,
      this.kanalSirketFotografi,
      this.rakipSirketUnvani,
      this.rakipTeklifi,
      this.rakipFaturaTutari,
      this.potansiyelFirsatAdi,
      this.tahminiBeklenenCiro,
      this.guncellenmeTarihi,
      this.taahhutBitisTarihi,
      this.randevuTipi,
      this.randevuDurumu,
      this.randevuBaslangicTarihi,
      this.randevuBitisTarihi,
      this.randevuAciklamasi,
      this.iletisimBilgiIzniVerildiMi,
      this.satisPersonelId,
      this.satisPersonelAdi,
      this.satisPersonelProfilFotografi,
      this.ekleyenKullaniciID,
      this.ekleyenKullaniciAdi,
      this.ekleyenKullaniciFotografi,
      this.eklenmeTarihi,
      this.sirketUnvani,
      this.potansiyelFirsatAsamaAdi,
      this.renk,
      this.onemDerecesi,
      this.onemDerecesiSinifAdi,
      this.oncelikDerecesiDegeri,
      this.randevuDurumuSinifAdi,
      this.randevuTipiSinifAdi,
      this.urunAdi,
      this.musteriAdi,
      this.urunAdet,
      this.toplamKayitSayisi,
      this.kapanmaYuzdesi,
      this.urunler,
      this.potansiyelFirsatCirosu,
      this.paraBirimSembolu,
      this.urunParaBirim,
      this.aciklama});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    musteriId = json['musteriId'];
    musteriSirketUnvani = json['musteriSirketUnvani'];
    musteriSirketFotografi = json['musteriSirketFotografi'];
    kanalSirketId = json['kanalSirketId'];
    kanalSirketUnvani = json['kanalSirketUnvani'];
    kanalSirketAdi = json['kanalSirketAdi'];
    kanalSirketFotografi = json['kanalSirketFotografi'];
    rakipSirketUnvani = json['rakipSirketUnvani'];
    rakipTeklifi = json['rakipTeklifi'];
    rakipFaturaTutari = json['rakipFaturaTutari'];
    potansiyelFirsatAdi = json['potansiyelFirsatAdi'];
    tahminiBeklenenCiro = json['tahminiBeklenenCiro'];
    guncellenmeTarihi = json['guncellenmeTarihi'];
    taahhutBitisTarihi = json['taahhutBitisTarihi'];
    randevuTipi = json['randevuTipi'];
    randevuDurumu = json['randevuDurumu'];
    randevuBaslangicTarihi = json['randevuBaslangicTarihi'];
    randevuBitisTarihi = json['randevuBitisTarihi'];
    randevuAciklamasi = json['randevuAciklamasi'];
    iletisimBilgiIzniVerildiMi = json['iletisimBilgiIzniVerildiMi'];
    satisPersonelId = json['satisPersonelId'];
    satisPersonelAdi = json['satisPersonelAdi'];
    satisPersonelProfilFotografi = json['satisPersonelProfilFotografi'];
    ekleyenKullaniciID = json['ekleyenKullaniciID'];
    ekleyenKullaniciAdi = json['ekleyenKullaniciAdi'];
    ekleyenKullaniciFotografi = json['ekleyenKullaniciFotografi'];
    eklenmeTarihi = json['eklenmeTarihi'];
    sirketUnvani = json['sirketUnvani'];
    potansiyelFirsatAsamaAdi = json['potansiyelFirsatAsamaAdi'];
    renk = json['renk'];
    onemDerecesi = json['onemDerecesi'];
    onemDerecesiSinifAdi = json['onemDerecesiSinifAdi'];
    oncelikDerecesiDegeri = json['oncelikDerecesiDegeri'];
    randevuDurumuSinifAdi = json['randevuDurumuSinifAdi'];
    randevuTipiSinifAdi = json['randevuTipiSinifAdi'];
    urunAdi = json['urunAdi'];
    musteriAdi = json['musteriAdi'];
    urunAdet = json['urunAdet'];
    toplamKayitSayisi = json['toplamKayitSayisi'];
    kapanmaYuzdesi = json['kapanmaYuzdesi'];
    if (json['urunler'] != null) {
      urunler = <Urunler>[];
      json['urunler'].forEach((v) {
        urunler!.add(new Urunler.fromJson(v));
      });
    }
    potansiyelFirsatCirosu = json['potansiyelFirsatCirosu'];
    paraBirimSembolu = json['paraBirimSembolu'];
    urunParaBirim = json['urunParaBirim'];
    aciklama = json['aciklama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['musteriId'] = this.musteriId;
    data['musteriSirketUnvani'] = this.musteriSirketUnvani;
    data['musteriSirketFotografi'] = this.musteriSirketFotografi;
    data['kanalSirketId'] = this.kanalSirketId;
    data['kanalSirketUnvani'] = this.kanalSirketUnvani;
    data['kanalSirketAdi'] = this.kanalSirketAdi;
    data['kanalSirketFotografi'] = this.kanalSirketFotografi;
    data['rakipSirketUnvani'] = this.rakipSirketUnvani;
    data['rakipTeklifi'] = this.rakipTeklifi;
    data['rakipFaturaTutari'] = this.rakipFaturaTutari;
    data['potansiyelFirsatAdi'] = this.potansiyelFirsatAdi;
    data['tahminiBeklenenCiro'] = this.tahminiBeklenenCiro;
    data['guncellenmeTarihi'] = this.guncellenmeTarihi;
    data['taahhutBitisTarihi'] = this.taahhutBitisTarihi;
    data['randevuTipi'] = this.randevuTipi;
    data['randevuDurumu'] = this.randevuDurumu;
    data['randevuBaslangicTarihi'] = this.randevuBaslangicTarihi;
    data['randevuBitisTarihi'] = this.randevuBitisTarihi;
    data['randevuAciklamasi'] = this.randevuAciklamasi;
    data['iletisimBilgiIzniVerildiMi'] = this.iletisimBilgiIzniVerildiMi;
    data['satisPersonelId'] = this.satisPersonelId;
    data['satisPersonelAdi'] = this.satisPersonelAdi;
    data['satisPersonelProfilFotografi'] = this.satisPersonelProfilFotografi;
    data['ekleyenKullaniciID'] = this.ekleyenKullaniciID;
    data['ekleyenKullaniciAdi'] = this.ekleyenKullaniciAdi;
    data['ekleyenKullaniciFotografi'] = this.ekleyenKullaniciFotografi;
    data['eklenmeTarihi'] = this.eklenmeTarihi;
    data['sirketUnvani'] = this.sirketUnvani;
    data['potansiyelFirsatAsamaAdi'] = this.potansiyelFirsatAsamaAdi;
    data['renk'] = this.renk;
    data['onemDerecesi'] = this.onemDerecesi;
    data['onemDerecesiSinifAdi'] = this.onemDerecesiSinifAdi;
    data['oncelikDerecesiDegeri'] = this.oncelikDerecesiDegeri;
    data['randevuDurumuSinifAdi'] = this.randevuDurumuSinifAdi;
    data['randevuTipiSinifAdi'] = this.randevuTipiSinifAdi;
    data['urunAdi'] = this.urunAdi;
    data['musteriAdi'] = this.musteriAdi;
    data['urunAdet'] = this.urunAdet;
    data['toplamKayitSayisi'] = this.toplamKayitSayisi;
    data['kapanmaYuzdesi'] = this.kapanmaYuzdesi;
    if (this.urunler != null) {
      data['urunler'] = this.urunler!.map((v) => v.toJson()).toList();
    }
    data['potansiyelFirsatCirosu'] = this.potansiyelFirsatCirosu;
    data['paraBirimSembolu'] = this.paraBirimSembolu;
    data['urunParaBirim'] = this.urunParaBirim;
    data['aciklama'] = this.aciklama;
    return data;
  }
}

class Urunler {
  int? urunId;
  int? urunAdet;
  String? urunFotografi;
  String? urunAdi;
  int? fiyat;

  Urunler({this.urunId, this.urunAdet, this.urunFotografi, this.urunAdi, this.fiyat});

  Urunler.fromJson(Map<String, dynamic> json) {
    urunId = json['urunId'];
    urunAdet = json['urunAdet'];
    urunFotografi = json['urunFotografi'];
    urunAdi = json['urunAdi'];
    fiyat = json['fiyat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['urunId'] = this.urunId;
    data['urunAdet'] = this.urunAdet;
    data['urunFotografi'] = this.urunFotografi;
    data['urunAdi'] = this.urunAdi;
    data['fiyat'] = this.fiyat;
    return data;
  }
}
