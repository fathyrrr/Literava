import 'package:flutter/material.dart';
import '../models/book.dart';
import '../models/book_chapter.dart';
import '../models/genre_lane.dart';

class LibraryService {
  static final List<GenreLane> lanes = [
    const GenreLane(
      id: 'lane_1',
      roman: 'I',
      name: 'Fiksi Klasik & Epik',
      bookCount: 3420,
      icon: Icons.auto_stories,
      moodTags: ['all', 'nostalgia', 'reflective'],
      wingLocation: 'Lantai 1 Sayap Timur',
      shelfNumber: 'Rak Oak No. 01',
      deweyRange: 'Dewey 800-899',
    ),
    const GenreLane(
      id: 'lane_2',
      roman: 'II',
      name: 'Filsafat & Kebijaksanaan',
      bookCount: 1890,
      icon: Icons.hourglass_empty,
      moodTags: ['all', 'reflective', 'philosophy'],
      wingLocation: 'Lantai 2 Sayap Barat',
      shelfNumber: 'Rak Mahoni No. 04',
      deweyRange: 'Dewey 100-199',
    ),
    const GenreLane(
      id: 'lane_3',
      roman: 'III',
      name: 'Arsitektur, Seni & Tipografi',
      bookCount: 940,
      icon: Icons.architecture,
      moodTags: ['all', 'reflective'],
      wingLocation: 'Lantai 2 Mezzanine',
      shelfNumber: 'Rak Walnut No. 08',
      deweyRange: 'Dewey 700-799',
    ),
    const GenreLane(
      id: 'lane_4',
      roman: 'IV',
      name: 'Sejarah & Manuskrip Kuno',
      bookCount: 2110,
      icon: Icons.history_edu,
      moodTags: ['all', 'nostalgia'],
      wingLocation: 'Lantai Bawah Tanah (Arsip Kuno)',
      shelfNumber: 'Rak Besi Tempa No. 12',
      deweyRange: 'Dewey 900-999',
    ),
    const GenreLane(
      id: 'lane_5',
      roman: 'V',
      name: 'Puisi & Surat Cinta Klasik',
      bookCount: 680,
      icon: Icons.edit_note,
      moodTags: ['all', 'reflective', 'nostalgia'],
      wingLocation: 'Lantai 3 Loteng Timur',
      shelfNumber: 'Rak Cedar No. 03',
      deweyRange: 'Dewey 811-821',
    ),
    const GenreLane(
      id: 'lane_6',
      roman: 'VI',
      name: 'Sains Purba & Astronomi',
      bookCount: 1240,
      icon: Icons.travel_explore,
      moodTags: ['all', 'science'],
      wingLocation: 'Lantai 4 Observatorium',
      shelfNumber: 'Rak Kuningan No. 02',
      deweyRange: 'Dewey 500-599',
    ),
  ];

  static final List<Book> books = [
    // ==========================================
    // LORONG I: FIKSI KLASIK & EPIK
    // ==========================================
    const Book(
      id: 'book_bumi_manusia',
      title: 'Bumi Manusia',
      subtitle: 'Tetralogi Buru — Bagian Pertama',
      author: 'Pramoedya Ananta Toer (1980)',
      year: '1980',
      callNumber: 'B-899.PT-001',
      deweyCode: '899.2',
      pages: 535,
      rating: 5.0,
      category: 'Sastra Nusantara',
      laneId: 'lane_1',
      laneName: 'Lorong I: Fiksi Klasik & Epik',
      shelfTier: 1,
      description:
          'Kisah Minke, seorang pribumi cerdas di pergantian abad ke-20 yang bergulat dengan feodalisme, kolonialisme, dan cintanya kepada Annelies Mellema.',
      curatorNotes:
          'Mahakarya sastra Indonesia modern yang lahir di balik jeruji pengasingan Pulau Buru. Ditulis dengan kekuatan bahasa yang memukau dan keteguhan martabat manusia.',
      excerptBook: 'Bab 1 — Suatu Hari di Wonokromo',
      excerptTitle: 'Manusia Bebas Menentukan Nasib',
      excerptText:
          'Suatu hari yang cerah di Surabaya, saat kereta kuda membawaku melintasi jalanan berdebu. Dunia modern sedang bangkit, dan ilmu pengetahuan Eropa memikat setiap saraf mudaku. Namun di balik kegemilangan teknologi itu, ada jiwa-jiwa bangsaku yang terlelap dalam kepatuhan berabad-abad.\n\nAku bersumpah dengan mata hatiku: manusia dilahirkan merdeka, dan pena ini akan mencatat setiap hembusan kebangkitan itu.',
      spineWidth: 58,
      spineHeight: 220,
      spineColor1: 0xFF8A3324,
      spineColor2: 0xFF521C13,
      ribbonColor: 0xFFF59E0B,
      coverImageUrl:
          'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?auto=format&fit=crop&w=400&q=80',
      chapters: [
        BookChapter(
          id: 'bm_ch1',
          chapterNumber: 'Bab I',
          title: 'Fajar Abad Baru & Impian Muda',
          subtitle: 'Kekaguman atas Ilmu Pengetahuan',
          content:
              'Dunia bergerak demikian cepatnya di awal abad kedua puluh ini. Kereta api menderu, kabel telegrafi merajut benua, dan kapal-kapal baja membelah samudera tanpa perlu menunggu angin musim. Sebagai pemuda pribumi yang beruntung mengenyam pendidikan H.B.S., dadaku bergetar menyaksikan zaman baru ini.\n\nNamun guruku, Meneer Magda Peters, selalu mengingatkan: “Minke, ilmu pengetahuan tanpa cinta kasih pada kemanusiaan hanyalah alat baru bagi penindas untuk membelenggu orang lain dengan lebih efisien.” Kata-kata itu menancap dalam benakku, menjadi kompas yang membedakan antara kecerdasan akal dan keluhuran pekerti.',
          estimatedMinutes: 12,
        ),
        BookChapter(
          id: 'bm_ch2',
          chapterNumber: 'Bab II',
          title: 'Gerbang Rumah Kayu Wonokromo',
          subtitle: 'Pertemuan Pertama dengan Nyai Ontosoroh',
          content:
              'Rumah itu berdiri megah namun berselimut misteri. Kayu jatinya pekat, wangi rempah dan kotoran ternak berbaur di udara pelataran. Di sanalah aku melihat Nyai Ontosoroh—seorang perempuan pribumi yang di mata hukum Hindia Belanda tidak memiliki hak apapun, namun di hadapannya siapa pun akan tunduk karena wibawa batinnya yang tak tertandingi.\n\nDia berbicara dalam bahasa Belanda yang demikian fasih dan tajam, mengatur perusahaan pertanian raksasa dengan tangan dingin dan ketelitian seorang sarjana. Dari Nyai, aku belajar bahwa martabat tidak ditentukan oleh asal-usul darah, melainkan oleh karya nyata dan keberanian bersikap.',
          estimatedMinutes: 15,
        ),
        BookChapter(
          id: 'bm_ch3',
          chapterNumber: 'Bab III',
          title: 'Bunga Penutup Abad',
          subtitle: 'Perlawanan Terakhir di Hadapan Hukum Asing',
          content:
              'Ketika putusan pengadilan kolonial jatuh dan mereka hendak merenggut Annelies dari pelukan kami, seluruh udara seolah membeku. Hukum kolonial yang dibanggakan beradab itu memperlihatkan taringnya yang paling buas dan dingin.\n\n“Kita telah melawan, Minke,” bisik Nyai Ontosoroh dengan mata berkaca-kaca namun dagu yang tetap terangkat tegak. “Kita telah melawan dengan segala cara yang terhormat. Sebaik-baiknya, sehormat-hormatnya!” Kata-kata itu bukan ratapan kekalahan, melainkan deklarasi perang moral yang abadi.',
          estimatedMinutes: 14,
        ),
      ],
    ),

    const Book(
      id: 'book_max_havelaar',
      title: 'Max Havelaar',
      subtitle: 'Lelang Kopi Maskapai Dagang Belanda',
      author: 'Multatuli (1860)',
      year: '1860',
      callNumber: 'B-839.ML-186',
      deweyCode: '839.3',
      pages: 412,
      rating: 4.8,
      category: 'Sastra Protes Sosial',
      laneId: 'lane_1',
      laneName: 'Lorong I: Fiksi Klasik & Epik',
      shelfTier: 1,
      description:
          'Karya satir dan protes nurani tajam Eduard Douwes Dekker atas penindasan sistem tanam paksa di Lebak, Banten.',
      curatorNotes:
          'Buku yang mengguncang parlemen Belanda dan membuka mata Eropa terhadap penderitaan rakyat Nusantara. Diterbitkan dengan gaya narasi polifonik yang berani.',
      excerptBook: 'Bab XVIII — Kisah Saidjah dan Adinda',
      excerptTitle: 'Kerbau Saidjah yang Dirampas',
      excerptText:
          'Saidjah masih kanak-kanak ketika kerbaunya dirampas oleh Demang. Kerbau itu bukan sekadar hewan penarik bajak; ia adalah sahabat yang menjilati tangan Saidjah di petang hari dan memahami rasa lapar keluarganya.\n\nKetika hewan itu diambil paksa demi memuaskan upeti pembesar, air mata Saidjah menetes di tanah gersang Lebak yang air susunya telah diperas habis oleh kekuasaan asing.',
      spineWidth: 50,
      spineHeight: 215,
      spineColor1: 0xFF7A4A28,
      spineColor2: 0xFF4A2A14,
      ribbonColor: 0xFFFBBF24,
      coverImageUrl:
          'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&w=400&q=80',
      chapters: [
        BookChapter(
          id: 'mh_ch1',
          chapterNumber: 'Bab I',
          title: 'Batavus Droogstoppel Sang Pedagang Kopi',
          subtitle: 'Perspektif Borjuis Amsterdam',
          content:
              'Aku seorang pedagang kopi, dan aku tinggal di Lauriergracht No. 37. Aku tidak suka sandiwara, tidak suka puisi, dan tidak suka dongeng yang membikin orang lupa pada angka-angka pembukuan. Bagiku, dunia ini sederhana: yang jujur akan makmur, yang rajin akan beruntung, dan Hindia Belanda adalah kebun penghasil kopi terbaik yang Tuhan anugerahkan kepada bangsa Belanda.',
          estimatedMinutes: 10,
        ),
        BookChapter(
          id: 'mh_ch2',
          chapterNumber: 'Bab II',
          title: 'Surat Havelaar kepada Rakyat Lebak',
          subtitle: 'Sumpah Pelindung Kaum Tertindas',
          content:
              '“Aku datang kemari bukan untuk memeras keringatmu, melainkan untuk melindungimu dari pemerasan sesamamu dan bangsa asing!” Suara Havelaar bergema di bawah naungan pohon beringin alun-alun Rangkasbitung. Matanya menatap para bupati dan tetua adat dengan ketegasan seorang ksatria yang tidak sudi berkompromi dengan kelaliman.',
          estimatedMinutes: 12,
        ),
        BookChapter(
          id: 'mh_ch3',
          chapterNumber: 'Bab III',
          title: 'Seruan Pamungkas kepada Sang Raja',
          subtitle: 'Penutup Multatuli yang Mengguncang Kerajaan',
          content:
              '“Kepadamu aku tujukan buku ini, Raja Willem III! Di atas takhtamu yang berkilauan intan permata, ketahuilah bahwa lebih dari tiga puluh juta kawulamu di kepulauan zamrud khatulistiwa sedang diperas dan diinjak-injak atas namamu!” Tulisan pena Multatuli menari dengan api amarah nurani yang abadi.',
          estimatedMinutes: 11,
        ),
      ],
    ),

    const Book(
      id: 'book_crime_punishment',
      title: 'Crime and Punishment',
      subtitle: 'Kejahatan dan Hukuman Nurani',
      author: 'Fyodor Dostoevsky (1866)',
      year: '1866',
      callNumber: 'B-891.FD-186',
      deweyCode: '891.7',
      pages: 671,
      rating: 4.9,
      category: 'Sastra Eksistensial Rusia',
      laneId: 'lane_1',
      laneName: 'Lorong I: Fiksi Klasik & Epik',
      shelfTier: 2,
      description:
          'Kisah psikologis Raskolnikov, seorang mantan mahasiswa miskin di Saint Petersburg yang terobsesi dengan gagasan manusia luar biasa di luar batas moralitas.',
      curatorNotes:
          'Eksplorasi terdalam tentang rasa bersalah, penyucian batin, dan penebusan kasih di sepanjang sejarah kesusastraan dunia.',
      excerptBook: 'Bagian I — Bab 1',
      excerptTitle: 'Langkah Panas di Trotoar Saint Petersburg',
      excerptText:
          'Di awal bulan Juli yang luar biasa panas, menjelang petang, seorang pemuda melangkah keluar dari bilik kecil yang disewanya di Gang S. dan melangkah pelan, seolah bimbang, menuju Jembatan K.\n\nDi dalam kepalanya, gagasan itu telah berakar bagai racun yang menyala: apakah seseorang berhak melangkahi hukum demi tujuan agung yang diyakininya?',
      spineWidth: 62,
      spineHeight: 224,
      spineColor1: 0xFF4A1E24,
      spineColor2: 0xFF2A0D11,
      ribbonColor: 0xFFE11D48,
      coverImageUrl:
          'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&w=400&q=80',
      chapters: [
        BookChapter(
          id: 'cp_ch1',
          chapterNumber: 'Bab I',
          title: 'Kamar Sempit di Bawah Atap Seng',
          subtitle: 'Kelahiran Teori Manusia Istimewa',
          content:
              'Kamarnya lebih mirip lemari daripada tempat tinggal manusia: panjang enam langkah, dengan kertas dinding kuning kusam berdebu. Di ranjang sempit itulah Raskolnikov menghabiskan hari-harinya bermimpi tanpa makan, menyusun teori bahwa manusia terbagi dua: mereka yang tunduk patuh pada aturan, dan mereka seperti Napoleon yang berhak melangkahi darah demi menata tatanan baru.',
          estimatedMinutes: 15,
        ),
        BookChapter(
          id: 'cp_ch2',
          chapterNumber: 'Bab II',
          title: 'Pertemuan dengan Sonia Marmeladov',
          subtitle: 'Cahaya di Sudut Paling Gelap',
          content:
              'Sonia menatapnya bukan dengan penghakiman, melainkan dengan cucuran air mata yang tak terhingga dalamnya. “Apakah yang telah kau perbuat terhadap dirimu sendiri?” bisiknya gemetar. Di hadapan kesucian gadis sederhana yang mengorbankan diri demi keluarganya itu, benteng keangkuhan rasional Raskolnikov mulai retak seribu.',
          estimatedMinutes: 16,
        ),
        BookChapter(
          id: 'cp_ch3',
          chapterNumber: 'Bab III',
          title: 'Penebusan di Padang Sabana Siberia',
          subtitle: 'Kelahiran Kembali Jiwa yang Hancur',
          content:
              'Tujuh tahun kerja paksa di Siberia terbentang di hadapannya. Namun kini, di bawah langit musim semi yang membentang luas di tepi Sungai Irtysh, air matanya menetes bukan karena keputusasaan, melainkan karena cinta yang tak terbatas. Jiwanya telah dibangkitkan dari kematian nurani.',
          estimatedMinutes: 13,
        ),
      ],
    ),

    const Book(
      id: 'book_great_gatsby',
      title: 'The Great Gatsby',
      subtitle: 'Tragedi Ilusi Kemilau Abad Jazz',
      author: 'F. Scott Fitzgerald (1925)',
      year: '1925',
      callNumber: 'B-813.FS-192',
      deweyCode: '813.5',
      pages: 180,
      rating: 4.7,
      category: 'Sastra Modernis Amerika',
      laneId: 'lane_1',
      laneName: 'Lorong I: Fiksi Klasik & Epik',
      shelfTier: 2,
      description:
          'Potret kepedihan dan obsesi asmara Jay Gatsby di tengah riuhnya pesta pora Long Island pada dekade 1920-an.',
      curatorNotes:
          'Prosa bahasa Inggris paling puitis abad ke-20 yang meredefinisikan makna impian masa lalu yang tak pernah bisa diulang.',
      excerptBook: 'Bab IX — Lampu Hijau di Ujung Dermaga',
      excerptTitle: 'Perahu yang Melawan Arus Waktu',
      excerptText:
          'Gatsby percaya pada cahaya hijau itu, masa depan memikat yang dari tahun ke tahun surut di depan mata kita. Waktu itu luput dari genggaman kita, tetapi itu tidak mengapa—besok kita akan berlari lebih kencang, membentangkan tangan kita lebih jauh...\n\nMaka kita mendayung terus, perahu-perahu yang melawan arus, tanpa henti dihanyutkan kembali ke masa lalu.',
      spineWidth: 42,
      spineHeight: 195,
      spineColor1: 0xFF1E2D4A,
      spineColor2: 0xFF0E1726,
      ribbonColor: 0xFF38BDF8,
      coverImageUrl:
          'https://images.unsplash.com/photo-1516979187457-637abb4f9353?auto=format&fit=crop&w=400&q=80',
      chapters: [
        BookChapter(
          id: 'gg_ch1',
          chapterNumber: 'Bab I',
          title: 'Nasihat Ayah & Tetangga Baru di West Egg',
          subtitle: 'Kacamata Netral Nick Carraway',
          content:
              '“Kapan pun engkau merasa ingin mengkritik seseorang,” kata ayahku kepadaku saat usiaku masih muda dan rapuh, “ingatlah bahwa semua orang di dunia ini tidak memiliki semua kemudahan yang pernah engkau miliki.” Prinsip itulah yang menjadikanku pendengar setia bagi banyak orang di Long Island.',
          estimatedMinutes: 10,
        ),
        BookChapter(
          id: 'gg_ch2',
          chapterNumber: 'Bab V',
          title: 'Pertemuan Kembali Bersama Daisy',
          subtitle: 'Runtuhnya Ilusi Lima Tahun Penantian',
          content:
              'Hujan turun rintik-rintik di pondokku ketika Gatsby berdiri basah kuyup di ambang pintu. Lima tahun ia menata kekayaan dongengnya hanya demi saat ini: saat Daisy melangkah masuk dan aroma teh melayang di udara. Wajah Gatsby bersinar dengan kebahagiaan yang hampir menyakitkan untuk disaksikan.',
          estimatedMinutes: 12,
        ),
        BookChapter(
          id: 'gg_ch3',
          chapterNumber: 'Bab IX',
          title: 'Kesunyian Kolam Renang Marmer',
          subtitle: 'Akhir dari Pesta Terbesar Abad Jazz',
          content:
              'Tak ada seorang pun yang datang ke pemakamannya—dari ratusan orang yang setiap malam minggu minum sampanye di tamannya dan berdansa diiringi sangkakala jazz. Yang tersisa hanyalah hembusan angin musim gugur yang merontokkan daun-daun kuning ke dalam air kolam yang dingin membisu.',
          estimatedMinutes: 11,
        ),
      ],
    ),

    // ==========================================
    // LORONG II: FILSAFAT & KEBIJAKSANAAN
    // ==========================================
    const Book(
      id: 'book_meditations',
      title: 'Meditations (Renungan Jiwa)',
      subtitle: 'Catatan Batin Kaisar Stoik Romawi',
      author: 'Marcus Aurelius (180 M)',
      year: '180 M',
      callNumber: 'B-180.MA-884',
      deweyCode: '188.8',
      pages: 208,
      rating: 4.9,
      category: 'Stoikisme Romawi',
      laneId: 'lane_2',
      laneName: 'Lorong II: Filsafat & Kebijaksanaan',
      shelfTier: 1,
      description:
          'Catatan harian pribadi sang kaisar Stoik tentang disiplin diri, kerendahan hati menghadapi fana, dan kedamaian batin di tengah kemelut kekaisaran.',
      curatorNotes:
          'Naskah meditasi pribadi yang tidak pernah diniatkan untuk dipublikasikan. Menjadi lentera batin paling murni bagi jiwa-jiwa yang mendambakan ketenangan sejati.',
      excerptBook: 'Buku I — Catatan Utang Budi',
      excerptTitle: 'Dari Kakekku Verus',
      excerptText:
          'Mengenal budi pekerti luhur dan pengendalian amarah yang tenang. Dari ingatan tentang ayah kandungku: martabat diri dan keberanian pria sejati.\n\nDari ibuku: ketaatan pada nilai-nilai suci, kemurahan hati yang tulus, pantang bukan hanya dari berbuat jahat, melainkan menjauhkan pikiran sekalipun dari niat buruk; dan cara hidup bersahaja yang jauh dari kemewahan orang-orang berkuasa.',
      spineWidth: 52,
      spineHeight: 212,
      spineColor1: 0xFF2B3A2F,
      spineColor2: 0xFF1A261D,
      ribbonColor: 0xFFD4AF37,
      coverImageUrl:
          'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?auto=format&fit=crop&w=400&q=80',
      chapters: [
        BookChapter(
          id: 'med_ch1',
          chapterNumber: 'Buku II',
          title: 'Di Tepi Sungai Hran (Pagi Hari)',
          subtitle: 'Sikap Menghadapi Manusia yang Mengesalkan',
          content:
              'Ketika engkau terbangun di pagi hari, katakanlah pada dirimu sendiri: orang-orang yang kujumpai hari ini mungkin suka mencampuri urusan orang lain, tidak tahu berterima kasih, sombong, curang, iri hati, dan tidak bersahabat.\n\nMereka berlaku demikian karena mereka tidak dapat membedakan antara yang baik dan yang jahat. Tetapi aku telah melihat hakikat kebaikan, bahwa ia indah; dan hakikat kejahatan, bahwa ia buruk. Tak seorang pun dapat melukaiku, sebab tak seorang pun dapat menjerumuskanku ke dalam kenistaan tanpa seizin akal budiku sendiri.',
          estimatedMinutes: 8,
        ),
        BookChapter(
          id: 'med_ch2',
          chapterNumber: 'Buku IV',
          title: 'Kekuatan Benteng Batin',
          subtitle: 'Tempat Peristirahatan Terbaik adalah Jiwamu Sendiri',
          content:
              'Manusia mencari tempat peristirahatan bagi diri mereka: di desa, di pantai, atau di pegunungan; dan engkau pun sangat mendambakan hal-hal semacam itu. Namun ini semua adalah tanda pikiran yang bersahaja, sebab kapan pun engkau menghendakinya, engkau dapat beristirahat ke dalam jiwamu sendiri.\n\nSebab tidak ada tempat yang lebih tenang, lebih bebas dari segala keributan selain jiwa seseorang itu sendiri, terlebih jika ia memiliki ketenangan batin yang sejati. Maka sering-seringlah memberikan peristirahatan ini kepada dirimu sendiri dan pulihkanlah jiwamu.',
          estimatedMinutes: 9,
        ),
        BookChapter(
          id: 'med_ch3',
          chapterNumber: 'Buku XII',
          title: 'Perpisahan dengan Panggung Sandiwara Fana',
          subtitle: 'Melangkah Pergi dengan Kerelaan yang Manis',
          content:
              'Wahai manusia, engkau telah menjadi warga kota agung semesta ini. Apakah bedanya bagimu apakah engkau tinggal lima tahun atau seratus tahun di dalamnya? Sebab apa yang adil bagi hukum berlaku sama bagi semua.\n\nApakah yang begitu menakutkan jika engkau dipulangkan dari kota ini, bukan oleh tiran yang sewenang-wenang atau hakim yang korup, melainkan oleh Kodrat Alam yang dahulu membawamu masuk ke dalamnya? Seperti seorang aktor yang dibebastugaskan dari panggung oleh sutradara yang sama. “Tetapi aku baru memainkan tiga babak, belum genap lima babak!” Benar, tetapi dalam sandiwara hidup, tiga babak sudah merupakan lakon yang utuh. Maka melangkahlah pergi dengan senyum ikhlas, sebab Ia yang melepaskanmu pun melakukannya dengan penuh kasih.',
          estimatedMinutes: 10,
        ),
      ],
    ),

    const Book(
      id: 'book_etika_nikomakea',
      title: 'Etika Nikomakea',
      subtitle: 'Kajian Luhur Kebajikan & Eudaimonia',
      author: 'Aristoteles (350 SM)',
      year: '350 SM',
      callNumber: 'B-350.AR-101',
      deweyCode: '185.1',
      pages: 264,
      rating: 4.8,
      category: 'Filsafat Etika',
      laneId: 'lane_2',
      laneName: 'Lorong II: Filsafat & Kebijaksanaan',
      shelfTier: 1,
      description:
          'Penyelidikan mendalam tentang kebajikan moral, jalan tengah keemasan (golden mean), dan kebahagiaan sejati.',
      curatorNotes:
          'Karya etika tertua yang meletakkan dasar pemikiran moral praktis melalui pembiasaan kebajikan sehari-hari.',
      excerptBook: 'Buku I — Prinsip Kebaikan Tertinggi',
      excerptTitle: 'Tentang Tujuan Akhir Tindakan Manusia',
      excerptText:
          'Setiap seni dan setiap penyelidikan, dan begitu pula setiap tindakan dan pilihan, dianggap bertujuan pada suatu kebaikan; dan karena itu kebaikan telah didefinisikan dengan tepat sebagai apa yang dituju oleh segala sesuatu.\n\nKebahagiaan sejati bukanlah kenikmatan sesaat, melainkan aktivitas jiwa yang selaras dengan kebajikan paripurna sepanjang hayat.',
      spineWidth: 46,
      spineHeight: 198,
      spineColor1: 0xFF1C3A27,
      spineColor2: 0xFF0E2115,
      ribbonColor: 0xFF22C55E,
      coverImageUrl:
          'https://images.unsplash.com/photo-1457369804613-52c61a468e7d?auto=format&fit=crop&w=400&q=80',
      chapters: [
        BookChapter(
          id: 'en_ch1',
          chapterNumber: 'Buku I',
          title: 'Definisi Eudaimonia (Kebahagiaan Sejati)',
          subtitle: 'Kebaikan yang Diinginkan Demi Dirinya Sendiri',
          content:
              'Jika ada tujuan dalam tindakan kita yang kita inginkan demi dirinya sendiri, dan bukan sebagai sarana untuk mencapai hal yang lain, jelaslah bahwa tujuan ini adalah kebaikan tertinggi. Bagi mayoritas orang, tujuan itu disebut kebahagiaan (eudaimonia). Namun apa sesungguhnya kebahagiaan itu? Bagi seorang penjahit, kebaikan adalah menjahit pakaian yang rapi; bagi seorang kapten, mengemudikan kapal dengan selamat. Maka bagi manusia, kebaikan adalah menjalankan fungsi khas manusia—yaitu hidup berakal budi—dengan keutamaan dan keunggulan.',
          estimatedMinutes: 11,
        ),
        BookChapter(
          id: 'en_ch2',
          chapterNumber: 'Buku II',
          title: 'Doktrin Jalan Tengah Keemasan',
          subtitle: 'Kebajikan Moral di Antara Dua Ekstrem',
          content:
              'Kebajikan moral adalah watak yang berkaitan dengan pilihan, terletak pada jalan tengah relatif terhadap diri kita. Keberanian, misalnya, adalah jalan tengah antara kepengecutan (kekurangan rasa percaya diri) dan kenekatan buta (kelebihan rasa percaya diri yang ceroboh). Begitu pula kedermawanan adalah jalan tengah antara kekikiran dan pemborosan yang sia-sia.',
          estimatedMinutes: 12,
        ),
        BookChapter(
          id: 'en_ch3',
          chapterNumber: 'Buku VIII',
          title: 'Tentang Persahabatan Sejati (Philia)',
          subtitle: 'Cermin Jiwa di Antara Dua Pribadi Bajik',
          content:
              'Persahabatan sejati hanya terwujud di antara orang-orang yang bajik dan serupa dalam kebajikan. Sebab mereka saling menghendaki kebaikan bagi satu sama lain semata-mata karena pribadi sahabatnya itu, bukan karena manfaat materiil atau kesenangan sesaat yang dapat diperoleh darinya.',
          estimatedMinutes: 10,
        ),
      ],
    ),

    const Book(
      id: 'book_surat_seneca',
      title: 'Surat-Surat Moral kepada Lucilius',
      subtitle: 'Nasihat Kebijaksanaan Praktis Sehari-Hari',
      author: 'Lucius Annaeus Seneca (65 M)',
      year: '65 M',
      callNumber: 'B-065.LS-412',
      deweyCode: '188.7',
      pages: 310,
      rating: 4.8,
      category: 'Stoikisme Romawi',
      laneId: 'lane_2',
      laneName: 'Lorong II: Filsafat & Kebijaksanaan',
      shelfTier: 2,
      description:
          'Kumpulan 124 surat bimbingan Seneca kepada sahabat mudanya mengenai manajemen waktu, kesederhanaan, dan ketabahan batin.',
      curatorNotes:
          'Gaya bahasa surat yang begitu akrab, hangat, dan menusuk tajam ke dalam kebiasaan hidup manusia modern.',
      excerptBook: 'Surat I — Tentang Nilai Waktu',
      excerptTitle: 'Rebutlah Kembali Dirimu Sendiri',
      excerptText:
          'Lakukanlah demikian, saudaraku Lucilius: rebutlah kembali dirimu bagi dirimu sendiri. Kumpulkan dan peliharalah waktumu yang selama ini dirampas, dicuri, atau lolos begitu saja dari jari-jarimu.\n\nTidak ada kerugian yang lebih memalukan daripada kehilangan waktu akibat kelalaian kita sendiri.',
      spineWidth: 48,
      spineHeight: 205,
      spineColor1: 0xFF6E432A,
      spineColor2: 0xFF3D2314,
      ribbonColor: 0xFFF97316,
      coverImageUrl:
          'https://images.unsplash.com/photo-1497633762265-9d179a990aa6?auto=format&fit=crop&w=400&q=80',
      chapters: [
        BookChapter(
          id: 'sen_ch1',
          chapterNumber: 'Surat I',
          title: 'Kekayaan Terbesar adalah Waktu',
          subtitle: 'Menghargai Jam demi Jam Hidupmu',
          content:
              'Semua orang menghemat uang mereka, tetapi tidak ada yang pelit terhadap waktu mereka—padahal waktu adalah satu-satunya hal di mana bersikap pelit adalah suatu kebajikan mulia. Siapakah yang dapat engkau tunjukkan kepadaku yang menghargai hari-harinya, yang menyadari bahwa setiap saat ia sedang mati sedikit demi sedikit?',
          estimatedMinutes: 9,
        ),
        BookChapter(
          id: 'sen_ch2',
          chapterNumber: 'Surat II',
          title: 'Bahaya Membaca Tanpa Arah',
          subtitle: 'Membaca Mendalam vs Membaca Banyak',
          content:
              'Berhati-hatilah agar kebiasaanmu membaca banyak pengarang dan beragam buku tidak membuat jiwamu limbung dan tidak menentu. Engkau harus berdiam lama di samping pikiran-pikiran para pemikir agung dan menyerapnya ke dalam darahmu jika engkau ingin meninggalkan sesuatu yang membekas dalam ingatanmu.',
          estimatedMinutes: 8,
        ),
        BookChapter(
          id: 'sen_ch3',
          chapterNumber: 'Surat IX',
          title: 'Tentang Kesunyian dan Kemandirian Jiwa',
          subtitle: 'Orang Bijak Mencukupi Dirinya Sendiri',
          content:
              'Orang bijak mencukupi dirinya sendiri untuk berbahagia, namun ia tetap menginginkan sahabat karib. Bukan sahabat untuk menemaninya saat sakit atau membelanya saat miskin, melainkan sahabat yang kepadanya ia dapat melimpahkan kesetiaan dan rela berkorban demi keselamatannya.',
          estimatedMinutes: 10,
        ),
      ],
    ),

    const Book(
      id: 'book_art_of_war',
      title: 'Seni Berperang (Sun Tzu)',
      subtitle: 'Falsafah Strategi & Kemenangan Tanpa Bertarung',
      author: 'Sun Tzu (500 SM)',
      year: '500 SM',
      callNumber: 'B-355.ST-005',
      deweyCode: '355.0',
      pages: 140,
      rating: 4.9,
      category: 'Filsafat Timur Klasik',
      laneId: 'lane_2',
      laneName: 'Lorong II: Filsafat & Kebijaksanaan',
      shelfTier: 2,
      description:
          'Tiga belas bab traktat militer kuno Tiongkok yang membedah psikologi konflik, disiplin, dan strategi tertinggi.',
      curatorNotes:
          'Puncak kebijaksanaan strategi Timur: menaklukkan musuh tanpa harus menghunuskan pedang di medan pertempuran.',
      excerptBook: 'Bab III — Strategi Menyerang',
      excerptTitle: 'Puncak Tertinggi Seni Berperang',
      excerptText:
          'Maka kemenangan tertinggi dalam seni berperang adalah mematahkan rencana musuh selagi masih dalam benak mereka; yang terbaik berikutnya adalah memutuskan aliansi mereka; yang berikutnya lagi menyerang pasukannya di lapangan; dan yang paling buruk adalah mengepung benteng yang bertembok kokoh.',
      spineWidth: 38,
      spineHeight: 190,
      spineColor1: 0xFF831843,
      spineColor2: 0xFF500724,
      ribbonColor: 0xFFF43F5E,
      coverImageUrl:
          'https://images.unsplash.com/photo-1506880018603-83d5b814b5a6?auto=format&fit=crop&w=400&q=80',
      chapters: [
        BookChapter(
          id: 'aow_ch1',
          chapterNumber: 'Bab I',
          title: 'Perhitungan Dasar (Laying Plans)',
          subtitle: 'Lima Faktor Fundamental Kemenangan',
          content:
              'Seni perang adalah masalah vital bagi suatu negeri; jalan menuju kelangsungan hidup atau kebinasaan. Karena itu ia harus diteliti berdasarkan lima faktor dasar: Hukum Moral, Langit (Iklim/Waktu), Bumi (Medan), Kepemimpinan, dan Disiplin Doktrin.',
          estimatedMinutes: 8,
        ),
        BookChapter(
          id: 'aow_ch2',
          chapterNumber: 'Bab III',
          title: 'Mengenal Diri dan Mengenal Lawan',
          subtitle: 'Kunci Tak Terkalahkan dalam Seratus Laga',
          content:
              'Jika engkau mengenal musuhmu dan mengenal dirimu sendiri, engkau tidak perlu takut pada hasil dari seratus pertempuran. Jika engkau mengenal dirimu sendiri tetapi tidak mengenal musuhmu, untuk setiap kemenangan engkau akan menderita satu kekalahan. Jika engkau tidak mengenal keduanya, engkau akan binasa di setiap laga.',
          estimatedMinutes: 7,
        ),
      ],
    ),

    // ==========================================
    // LORONG III: ARSITEKTUR, SENI & TIPOGRAFI
    // ==========================================
    const Book(
      id: 'book_de_architectura',
      title: 'De Architectura (Sepuluh Buku Arsitektur)',
      subtitle: 'Risalah Monumental Desain Klasik Roma',
      author: 'Marcus Vitruvius Pollio (15 SM)',
      year: '15 SM',
      callNumber: 'B-720.MV-010',
      deweyCode: '720.1',
      pages: 352,
      rating: 4.8,
      category: 'Teori Arsitektur',
      laneId: 'lane_3',
      laneName: 'Lorong III: Arsitektur, Seni & Tipografi',
      shelfTier: 1,
      description:
          'Prinsip agung Vitruvius: Firmitas (Kekokohan), Utilitas (Kegunaan), dan Venustas (Keindahan).',
      curatorNotes:
          'Satu-satunya risalah arsitektur era klasik Yunani-Romawi yang bertahan utuh hingga masa Renaisans.',
      excerptBook: 'Buku I — Bab III',
      excerptTitle: 'Tiga Pilar Abadi Sebuah Bangunan',
      excerptText:
          'Semua bangunan harus dirancang dengan memperhatikan tiga aspek mendasar: Kekuatan (Firmitas), Kegunaan (Utilitas), dan Keindahan (Venustas).\n\nKekuatan dijamin oleh fondasi yang digali hingga ke tanah cadas padat; kegunaan oleh penataan ruang yang leluasa tanpa rintangan; dan keindahan oleh perbandingan proporsi yang anggun di hadapan mata.',
      spineWidth: 54,
      spineHeight: 216,
      spineColor1: 0xFF4338CA,
      spineColor2: 0xFF1E1B4B,
      ribbonColor: 0xFF818CF8,
      coverImageUrl:
          'https://images.unsplash.com/photo-1513694203232-719a280e022f?auto=format&fit=crop&w=400&q=80',
      chapters: [
        BookChapter(
          id: 'da_ch1',
          chapterNumber: 'Buku I',
          title: 'Pendidikan Sang Arsitek Sejati',
          subtitle: 'Perpaduan Teori Filosofis dan Praktik Pertukangan',
          content:
              'Seorang arsitek harus dibekali pengetahuan yang luas: ia harus mahir menggambar, paham geometri, mengerti sejarah, menyimak filsafat, dan memahami hukum serta astronomi. Sebab arsitektur bukanlah sekadar menyusun batu, melainkan memberi wadah bagi peradaban manusia.',
          estimatedMinutes: 10,
        ),
        BookChapter(
          id: 'da_ch2',
          chapterNumber: 'Buku III',
          title: 'Proporsi Simetri Tubuh Manusia',
          subtitle: 'Asal-Usul Ukuran Tiang Kuil Klasik',
          content:
              'Tanpa simetri dan proporsi yang tepat, tidak ada kuil yang dapat memiliki tatanan yang benar. Ukuran-ukuran dasar arsitektur diturunkan dari keselarasan tubuh manusia yang sempurna: jari, telapak, jengkal, dan depa.',
          estimatedMinutes: 9,
        ),
      ],
    ),

    const Book(
      id: 'book_seven_lamps',
      title: 'The Seven Lamps of Architecture',
      subtitle: 'Tujuh Lentera Moralitas Ruang',
      author: 'John Ruskin (1849)',
      year: '1849',
      callNumber: 'B-720.JR-184',
      deweyCode: '720.9',
      pages: 236,
      rating: 4.7,
      category: 'Estetika & Seni Kriya',
      laneId: 'lane_3',
      laneName: 'Lorong III: Arsitektur, Seni & Tipografi',
      shelfTier: 2,
      description:
          'Tujuh lentera moral dalam seni bangun: Pengorbanan, Kebenaran, Kekuatan, Keindahan, Kehidupan, Kenangan, dan Ketaatan.',
      curatorNotes:
          'Esai pembelaan terhadap arsitektur Gothic dan penolakan terhadap material palsu yang menipu mata.',
      excerptBook: 'Lentera Kedua — Lentera Kebenaran',
      excerptTitle: 'Kejujuran Material dalam Arsitektur',
      excerptText:
          'Jangan pernah membiarkan sepotong kayu dicat menyerupai marmer, atau plesteran semen disulap menyerupai pahatan batu cadas.\n\nDalam seni arsitektur sebagaimana dalam kehidupan manusia, kepalsuan adalah kelemahan nurani yang merusak keagungan karya.',
      spineWidth: 44,
      spineHeight: 202,
      spineColor1: 0xFF065F46,
      spineColor2: 0xFF022C22,
      ribbonColor: 0xFF34D399,
      coverImageUrl:
          'https://images.unsplash.com/photo-1507842229450-798485295175?auto=format&fit=crop&w=400&q=80',
      chapters: [
        BookChapter(
          id: 'sl_ch1',
          chapterNumber: 'Lentera VI',
          title: 'Lentera Kenangan (The Lamp of Memory)',
          subtitle: 'Arsitektur sebagai Penjaga Ingatan Sejarah',
          content:
              'Kita dapat hidup tanpa arsitektur, dan kita dapat beribadah tanpa arsitektur; tetapi kita tidak dapat mengingat tanpa arsitektur. Dua kewajiban besar kita terhadap arsitektur masa lalu adalah: merawatnya dengan kasih sayang dan tidak menghancurkannya atas nama renovasi modern yang sembrono.',
          estimatedMinutes: 11,
        ),
      ],
    ),

    // ==========================================
    // LORONG IV: SEJARAH & MANUSKRIP KUNO
    // ==========================================
    const Book(
      id: 'book_sejarah_herodotus',
      title: 'The Histories (Sejarah)',
      subtitle: 'Catatan Awal Peradaban Barat & Timur',
      author: 'Herodotus (440 SM)',
      year: '440 SM',
      callNumber: 'B-938.HR-044',
      deweyCode: '938.0',
      pages: 720,
      rating: 4.8,
      category: 'Sejarah Klasik Yunani',
      laneId: 'lane_4',
      laneName: 'Lorong IV: Sejarah & Manuskrip Kuno',
      shelfTier: 1,
      description:
          'Catatan ekspedisi dan perang agung Yunani-Persia dari Sang Bapak Sejarah Dunia.',
      curatorNotes:
          'Kombinasi etnografi kuno, mitologi bangsa-bangsa Mediterania, dan investigasi faktual pertama di dunia.',
      excerptBook: 'Buku VII — Pertempuran Thermopylae',
      excerptTitle: 'Tiga Ratus Ksatria Sparta di Celah Sempit',
      excerptText:
          'Ketika pasukan Persia yang tak terhitung jumlahnya menembakkan panah hingga menutupi matahari, ksatria Sparta tersenyum dan menjawab: “Baguslah, maka kita akan bertempur di bawah naungan teduh!”',
      spineWidth: 64,
      spineHeight: 226,
      spineColor1: 0xFF92400E,
      spineColor2: 0xFF451A03,
      ribbonColor: 0xFFFBBF24,
      coverImageUrl:
          'https://images.unsplash.com/photo-1461360370896-922624d12aa1?auto=format&fit=crop&w=400&q=80',
      chapters: [
        BookChapter(
          id: 'hist_ch1',
          chapterNumber: 'Buku I',
          title: 'Pertemuan Croesus dan Solon Sang Bijak',
          subtitle: 'Jangan Menilai Hidup Seseorang Berbahagia Sebelum Ajalnya',
          content:
              'Raja Croesus dari Lydia yang berlimpah emas bertanya kepada Solon dari Athena: “Siapakah manusia paling bahagia yang pernah kau jumpai?” Solon tidak menyebut raja-raja berkuasa, melainkan warga bersahaja yang hidup terhormat dan mati dalam damai di tengah keluarganya.',
          estimatedMinutes: 13,
        ),
      ],
    ),

    const Book(
      id: 'book_serat_centhini',
      title: 'Serat Centhini (Suluk Tembangraras)',
      subtitle: 'Ensiklopedia Rohani & Budaya Jawa Klasik',
      author: 'K.G.P.A.A. Amangkunagara III / Pakubuwana V (1814)',
      year: '1814',
      callNumber: 'B-899.SC-181',
      deweyCode: '899.22',
      pages: 740,
      rating: 5.0,
      category: 'Manuskrip Kuno Nusantara',
      laneId: 'lane_4',
      laneName: 'Lorong IV: Sejarah & Manuskrip Kuno',
      shelfTier: 2,
      description:
          'Pengembaraan mistik putra-putri Sunan Giri melintasi tanah Jawa, merangkum ilmu tasawuf, arsitektur joglo, seni tembang, hingga pengobatan tradisional.',
      curatorNotes:
          'Mahakarya sastra tembang macapat terbesar di Nusantara yang ditulis selama bertahun-tahun oleh para pujangga Keraton Surakarta.',
      excerptBook: 'Pupuh I — Dhandhanggula',
      excerptTitle: 'Awal Mula Pengembaraan Spiritual',
      excerptText:
          'Sinom raras amrih ruming ati, mangka pitedah marganing utama. Melangkah menembus kabut hutan dan pegunungan, mencari hakikat sejati di balik tirai alam wadag manusia.',
      spineWidth: 60,
      spineHeight: 222,
      spineColor1: 0xFF3F2314,
      spineColor2: 0xFF1F1008,
      ribbonColor: 0xFFEAB308,
      coverImageUrl:
          'https://images.unsplash.com/photo-1532012164546-f432f2e3777a?auto=format&fit=crop&w=400&q=80',
      chapters: [
        BookChapter(
          id: 'sc_ch1',
          chapterNumber: 'Pupuh Kinanthi',
          title: 'Petuah Batin Syekh Amongraga',
          subtitle: 'Penyucian Kalbu Menuju Sang Maha Asal',
          content:
              'Jalan keheningan menuntut kebersihan jiwa dari hawa nafsu duniawi. Bagaikan air telaga yang bening di lereng gunung, hanya saat ombak batin tenanglah bayang-bayang rembulan dapat terpantul sempurna tanpa cacat.',
          estimatedMinutes: 14,
        ),
      ],
    ),

    // ==========================================
    // LORONG V: PUISI & SURAT CINTA KLASIK
    // ==========================================
    const Book(
      id: 'book_divine_comedy',
      title: 'The Divine Comedy (Inferno)',
      subtitle: 'Pengembaraan Alegoris Melintasi Kegelapan',
      author: 'Dante Alighieri (1320)',
      year: '1320',
      callNumber: 'B-851.DA-132',
      deweyCode: '851.1',
      pages: 432,
      rating: 4.9,
      category: 'Puisi Epik Italia',
      laneId: 'lane_5',
      laneName: 'Lorong V: Puisi & Surat Cinta Klasik',
      shelfTier: 1,
      description:
          'Perjalanan Dante dibimbing penyair Romawi Virgil melintasi sembilan lingkaran neraka menuju pemurnian purgatorium dan cahaya paradiso.',
      curatorNotes:
          'Struktur sajak terza rima termegah yang menjadi mahkota kesusastraan Eropa Abad Pertengahan.',
      excerptBook: 'Canto I — Di Tengah Rimba Gelap',
      excerptTitle: 'Jalan Benar yang Telah Hilang',
      excerptText:
          'Di tengah perjalanan hidup kita, aku mendapati diriku tersesat di dalam sebuah rimba yang gelap gulita, di mana jalan yang lurus telah sirna dari pandangan.\n\nBetapa sukarnya menceritakan kengerian rimba liar yang lebat dan ganas itu!',
      spineWidth: 52,
      spineHeight: 214,
      spineColor1: 0xFF7F1D1D,
      spineColor2: 0xFF450A0A,
      ribbonColor: 0xFFEF4444,
      coverImageUrl:
          'https://images.unsplash.com/photo-1516979187457-637abb4f9353?auto=format&fit=crop&w=400&q=80',
      chapters: [
        BookChapter(
          id: 'dc_ch1',
          chapterNumber: 'Canto III',
          title: 'Gerbang Neraka & Sungai Acheron',
          subtitle: 'Tinggalkan Segala Harapan, Wahai yang Melangkah Masuk',
          content:
              '“Melaluiku engkau melangkah ke kota penderitaan abadi; melaluiku engkau melangkah ke duka yang tak berkesudahan; melaluiku engkau melangkah di tengah orang-orang terkutuk. Tinggalkan segala harapan, wahai engkau yang melangkah masuk!” Tulisan itu terukir di atas batu ambang gerbang dengan tinta hitam abadi.',
          estimatedMinutes: 12,
        ),
      ],
    ),

    const Book(
      id: 'book_rubaiyat',
      title: 'The Rubaiyat',
      subtitle: 'Kuartet Mistis Persi tentang Anggur & Waktu',
      author: 'Omar Khayyam (1120 M)',
      year: '1120 M',
      callNumber: 'B-891.OK-112',
      deweyCode: '891.5',
      pages: 160,
      rating: 4.9,
      category: 'Puisi Sufistik Persia',
      laneId: 'lane_5',
      laneName: 'Lorong V: Puisi & Surat Cinta Klasik',
      shelfTier: 2,
      description:
          'Bait-bait puitis empat baris (rubaiyat) tentang fana waktu, aroma mawar padang pasir, dan keberserahan mistik sang astronom-penyair Khayyam.',
      curatorNotes:
          'Diterjemahkan secara abadi ke dalam sajak Inggris oleh Edward FitzGerald, menjadi salah satu buku puisi paling dicintai sepanjang masa.',
      excerptBook: 'Bait XIX — Sang Penjual Tembikar',
      excerptTitle: 'Debu yang Pernah Bernyawa',
      excerptText:
          'Kupikir tak ada mawar yang mekar begitu merahnya kecuali dari darah kaisar yang gugur di masa silam; dan setiap hyacinth yang mekar di tepi taman berasal dari helai rambut indah yang pernah dicintai.',
      spineWidth: 40,
      spineHeight: 190,
      spineColor1: 0xFF0F766E,
      spineColor2: 0xFF134E4A,
      ribbonColor: 0xFF2DD4BF,
      coverImageUrl:
          'https://images.unsplash.com/photo-1491841573634-28140fc7ced7?auto=format&fit=crop&w=400&q=80',
      chapters: [
        BookChapter(
          id: 'rub_ch1',
          chapterNumber: 'Bait VII',
          title: 'Burung Waktu yang Mengepakkan Sayap',
          subtitle: 'Nikmatilah Momen Hadir yang Suci',
          content:
              'Isilah cangkirmu, dan di dalam api musim semi buanglah jubah penyesalan masa lalumu yang kusam. Burung waktu memiliki sayap yang teramat singkat untuk terbang, dan lihatlah—ia telah berada di ambang pelarian.',
          estimatedMinutes: 7,
        ),
      ],
    ),

    // ==========================================
    // LORONG VI: SAINS PURBA & ASTRONOMI
    // ==========================================
    const Book(
      id: 'book_principia',
      title: 'Philosophiae Naturalis Principia Mathematica',
      subtitle: 'Prinsip Matematika Filsafat Alam & Gravitasi',
      author: 'Sir Isaac Newton (1687)',
      year: '1687',
      callNumber: 'B-531.IN-168',
      deweyCode: '531.1',
      pages: 510,
      rating: 5.0,
      category: 'Mekanika Klasik',
      laneId: 'lane_6',
      laneName: 'Lorong VI: Sains Purba & Astronomi',
      shelfTier: 1,
      description:
          'Hukum gerak tiga serangkai Newton, kalkulus matematika, dan hukum gravitasi universal yang menguasai planet-planet.',
      curatorNotes:
          'Karya ilmiah paling berpengaruh sepanjang sejarah yang menyatukan fisika bumi dan keteraturan gerak kosmos.',
      excerptBook: 'Prakata Edisi Pertama',
      excerptTitle: 'Hukum Gravitasi Semesta yang Mengatur Bintang',
      excerptText:
          'Setiap benda di alam semesta saling menarik setiap benda lainnya dengan gaya yang berbanding lurus dengan hasil kali massa kedua benda itu dan berbanding terbalik dengan kuadrat jarak di antara keduanya.\n\nKeteraturan kosmos yang agung ini hanya mungkin bersumber dari rancangan dan kedaulatan Sang Penguasa Cerdas yang Mahakuasa.',
      spineWidth: 60,
      spineHeight: 220,
      spineColor1: 0xFF1E3A8A,
      spineColor2: 0xFF172554,
      ribbonColor: 0xFF60A5FA,
      coverImageUrl:
          'https://images.unsplash.com/photo-1451187580459-43490279c0fa?auto=format&fit=crop&w=400&q=80',
      chapters: [
        BookChapter(
          id: 'prin_ch1',
          chapterNumber: 'Aksioma Hukum Gerak',
          title: 'Tiga Hukum Gerak Newton',
          subtitle: 'Inersia, Gaya, dan Aksi-Reaksi',
          content:
              'Hukum I: Setiap benda akan tetap diam atau bergerak lurus beraturan, kecuali jika dipaksa mengubah keadaannya itu oleh gaya luar yang bekerja padanya.\nHukum II: Perubahan gerak sebanding dengan gaya dorong yang bekerja padanya dan terjadi sepanjang garis lurus di mana gaya tersebut diarahkan.\nHukum III: Untuk setiap aksi selalu ada reaksi yang sama besar dan berlawanan arah.',
          estimatedMinutes: 12,
        ),
      ],
    ),

    const Book(
      id: 'book_origin_species',
      title: 'The Origin of Species',
      subtitle: 'Asal-Usul Spesies Melalui Seleksi Alam',
      author: 'Charles Darwin (1859)',
      year: '1859',
      callNumber: 'B-576.CD-185',
      deweyCode: '576.8',
      pages: 502,
      rating: 4.9,
      category: 'Biologi Evolusioner',
      laneId: 'lane_6',
      laneName: 'Lorong VI: Sains Purba & Astronomi',
      shelfTier: 2,
      description:
          'Teori revolusioner biologi modern mengenai seleksi alam dan pohon kehidupan seluruh makhluk hayati di bumi.',
      curatorNotes:
          'Buku yang mengubah cara manusia memandang posisinya di dalam jejaring ekologi alam semesta.',
      excerptBook: 'Bab XIV — Kesimpulan Akhir',
      excerptTitle: 'Keagungan dalam Pandangan Hidup Ini',
      excerptText:
          'Sungguh ada keagungan dalam pandangan hidup ini: dari awal yang begitu sederhana, bentuk-bentuk yang tak terhitung jumlahnya, yang paling indah dan paling menakjubkan, telah dan sedang terus berevolusi.',
      spineWidth: 56,
      spineHeight: 210,
      spineColor1: 0xFF14532D,
      spineColor2: 0xFF052E16,
      ribbonColor: 0xFF4ADE80,
      coverImageUrl:
          'https://images.unsplash.com/photo-1507842229450-798485295175?auto=format&fit=crop&w=400&q=80',
      chapters: [
        BookChapter(
          id: 'oos_ch1',
          chapterNumber: 'Bab III',
          title: 'Perjuangan demi Kelangsungan Hidup',
          subtitle: 'Jejaring Keterikatan Seluruh Makhluk Hayati',
          content:
              'Pertarungan untuk bertahan hidup terjadi di setiap sudut rimba. Seekor burung penyanyi di dahan pohon tidak hanya bernyanyi demi keindahan; ia bersaing mencari benih dan menghidupi anak-anaknya di tengah dinginnya musim salju.',
          estimatedMinutes: 11,
        ),
      ],
    ),
  ];

  static Book get defaultBook => books.firstWhere(
        (b) => b.id == 'book_meditations',
        orElse: () => books.first,
      );

  static List<Book> getBooksByLane(String laneId) {
    return books.where((b) => b.laneId == laneId).toList();
  }

  static List<Book> getBooksByTier(int tier) {
    return books.where((b) => b.shelfTier == tier).toList();
  }
}
