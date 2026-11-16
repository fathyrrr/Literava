import 'package:flutter/material.dart';
import '../models/book.dart';
import '../models/genre_lane.dart';

class LibraryService {
  static final List<GenreLane> lanes = [
    const GenreLane(
      id: 'lane_1',
      roman: 'I',
      name: 'Fiksi Klasik & Epik',
      bookCount: 3420,
      icon: Icons.auto_stories,
      moodTags: ['all', 'nostalgia', 'philosophy'],
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
    // TIER 1 - Stoikisme & Etika Romawi (Lorong II)
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
          'Penyelidikan mendalam tentang kebajikan moral, kebahagiaan sejati (eudaimonia), dan karakter ideal manusia.',
      curatorNotes:
          'Naskah etika pertama dalam sejarah peradaban barat yang meletakkan dasar pemikiran moral praktis.',
      excerptBook: 'Buku I — Prinsip Kebaikan Tertinggi',
      excerptTitle: 'Tentang Tujuan Akhir Tindakan Manusia',
      excerptText:
          'Setiap seni dan setiap penyelidikan, dan begitu pula setiap tindakan dan pilihan, dianggap bertujuan pada suatu kebaikan; dan karena itu kebaikan telah didefinisikan dengan tepat sebagai apa yang dituju oleh segala sesuatu.',
      spineWidth: 46,
      spineHeight: 198,
      spineColor1: 0xFF2B3A2F,
      spineColor2: 0xFF1C261F,
      ribbonColor: 0xFFD4AF37,
      coverImageUrl:
          'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?auto=format&fit=crop&w=400&q=80',
    ),
    const Book(
      id: 'book_republik',
      title: 'Republik (Politeia)',
      subtitle: 'Keadilan & Negara Ideal',
      author: 'Plato (375 SM)',
      year: '375 SM',
      callNumber: 'B-375.PL-204',
      deweyCode: '184.2',
      pages: 448,
      rating: 4.9,
      category: 'Filsafat Politik',
      laneId: 'lane_2',
      laneName: 'Lorong II: Filsafat & Kebijaksanaan',
      shelfTier: 1,
      description:
          'Diskusi dialektis Sokrates tentang definisi keadilan, tata negara ideal, dan alegori gua yang termasyhur.',
      curatorNotes:
          'Mahakarya dialektika Platonik yang menguji hubungan antara jiwa individu dan keadilan polis.',
      excerptBook: 'Buku VII — Alegori Manusia Gua',
      excerptTitle: 'Cahaya Kebenaran di Luar Bayangan',
      excerptText:
          'Bayangkan manusia hidup di gua bawah tanah, yang memiliki pintu masuk terbuka ke arah cahaya. Sejak masa kanak-kanak mereka terbelenggu kaki dan lehernya, sehingga mereka terpaku menatap dinding gua semata.',
      spineWidth: 58,
      spineHeight: 218,
      spineColor1: 0xFF5C2C2C,
      spineColor2: 0xFF3D1B1B,
      ribbonColor: 0xFFF59E0B,
      coverImageUrl:
          'https://images.unsplash.com/photo-1532012164546-f432f2e3777a?auto=format&fit=crop&w=400&q=80',
    ),
    const Book(
      id: 'book_meditations',
      title: 'Meditations (Renungan Jiwa)',
      subtitle: 'Catatan Harian Kaisar Stoik',
      author: 'Marcus Aurelius (180 M)',
      year: '180 M',
      callNumber: 'B-180.MA-884',
      deweyCode: '188.8',
      pages: 184,
      rating: 4.9,
      category: 'Stoikisme Romawi',
      laneId: 'lane_2',
      laneName: 'Lorong II: Filsafat & Kebijaksanaan',
      shelfTier: 1,
      description:
          'Catatan pribadi sang kaisar Stoik tentang disiplin diri, kerendahan hati menghadapi fana, dan kedamaian batin.',
      curatorNotes:
          'Catatan harian pribadi sang kaisar Romawi tentang stoikisme, disiplin batin, dan keheningan jiwa di tengah gejolak kekaisaran. Dilengkapi pengantar kurasi mendalam dan catatan kaki orisinal naskah Yunani Kuno Koine.',
      excerptBook: 'Buku I — Catatan Utang Budi',
      excerptTitle: 'Dari Kakekku Verus',
      excerptText:
          'Mengenal budi pekerti luhur dan pengendalian amarah yang tenang. Dari ingatan tentang ayah kandungku, martabat diri dan keberanian pria sejati.\n\nDari ibuku: ketaatan pada nilai-nilai suci, kemurahan hati yang tulus, pantang bukan hanya dari berbuat jahat, melainkan menjauhkan pikiran sekalipun dari niat buruk; dan cara hidup bersahaja yang jauh dari kemewahan orang-orang berkuasa.',
      spineWidth: 52,
      spineHeight: 212,
      spineColor1: 0xFFA34E1C,
      spineColor2: 0xFF6E2E0B,
      ribbonColor: 0xFFD47070,
      coverImageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuARVypq87A-n16NKO2SgREsRNa5bQL77iuvpNpGjY65HLcXgLYZSWe5hrN0SJlS8XuDnRlTco6LkiWt6XmjoI2ksXLgk4rZMHzBS-fP7d7ecC6Quab-FiD5gYKQ_zi3HWESs3ENXqn_qwesChN1v5CaWHwHERJTeeHxhtyfl-CW3qHJKO72z3ssRUYfhVal_goh9FHmmtiWtmK7mkCVLqMqU98FEFPOPjQxIkOYUhk',
    ),
    const Book(
      id: 'book_ketenangan_jiwa',
      title: 'Tentang Ketenangan Jiwa',
      subtitle: 'De Tranquillitate Animi',
      author: 'Lucius Annaeus Seneca (63 M)',
      year: '63 M',
      callNumber: 'B-063.SE-312',
      deweyCode: '188.5',
      pages: 160,
      rating: 4.7,
      category: 'Stoikisme Romawi',
      laneId: 'lane_2',
      laneName: 'Lorong II: Filsafat & Kebijaksanaan',
      shelfTier: 1,
      description:
          'Surat nasihat praktis mengenai cara mengatasi kepanikan hidup dan menemukan harmoni pikiran di tengah badai kehidupan.',
      curatorNotes:
          'Dialog mendalam Seneca kepada sahabatnya Serenus mengenai cara menstabilkan jiwa yang gundah.',
      excerptBook: 'Bab II — Sumber Kegelisahan Batin',
      excerptTitle: 'Melepaskan Beban yang Tak Perlu',
      excerptText:
          'Ketenangan bukanlah ketiadaan gerakan, melainkan ketetapan hati yang teguh di tengah gejolak. Manusia yang gelisah lari dari satu tempat ke tempat lain, mengira tempat baru akan menyembuhkan jiwanya yang sakit.',
      spineWidth: 44,
      spineHeight: 190,
      spineColor1: 0xFF3D342D,
      spineColor2: 0xFF221C17,
      ribbonColor: 0xFFC5A059,
      coverImageUrl:
          'https://images.unsplash.com/photo-1497633762265-9d179a990aa6?auto=format&fit=crop&w=400&q=80',
    ),
    const Book(
      id: 'book_enchiridion',
      title: 'Enchiridion (Buku Pedoman)',
      subtitle: 'Seni Memilah Kendali Jiwa',
      author: 'Epiktetos (125 M)',
      year: '125 M',
      callNumber: 'B-125.EP-405',
      deweyCode: '188.2',
      pages: 142,
      rating: 4.8,
      category: 'Filsafat Stoa',
      laneId: 'lane_2',
      laneName: 'Lorong II: Filsafat & Kebijaksanaan',
      shelfTier: 1,
      description:
          'Panduan ringkas membedakan apa yang berada dalam kendali kita dan apa yang berada di luar kendali kita.',
      curatorNotes:
          'Diktat singkat yang dicatat oleh muridnya, Arrianos, menjadi salah satu pegangan hidup paling berpengaruh.',
      excerptBook: 'Bab I — Dikotomi Kendali',
      excerptTitle: 'Apa yang Milik Kita dan Bukan Milik Kita',
      excerptText:
          'Beberapa hal berada di bawah kendali kita dan yang lainnya tidak. Yang berada di bawah kendali kita adalah opini, dorongan, hasrat, keengganan, dan secara singkat segala hal yang merupakan tindakan kita sendiri.',
      spineWidth: 48,
      spineHeight: 202,
      spineColor1: 0xFF1B2838,
      spineColor2: 0xFF0D1622,
      ribbonColor: 0xFF38BDF8,
      coverImageUrl:
          'https://images.unsplash.com/photo-1476275466078-4007374efbbe?auto=format&fit=crop&w=400&q=80',
    ),
    const Book(
      id: 'book_de_officiis',
      title: 'De Officiis (Kewajiban Moral)',
      subtitle: 'Antara Martabat dan Kemanfaatan',
      author: 'Marcus Tullius Cicero (44 SM)',
      year: '44 SM',
      callNumber: 'B-044.CI-518',
      deweyCode: '186.4',
      pages: 210,
      rating: 4.6,
      category: 'Etika Klasik',
      laneId: 'lane_2',
      laneName: 'Lorong II: Filsafat & Kebijaksanaan',
      shelfTier: 1,
      description:
          'Eksplorasi mendalam antara apa yang benar secara moral dan apa yang berguna secara praktis dalam pergaulan sosial.',
      curatorNotes:
          'Surat wasiat etis Cicero kepada putranya yang sedang belajar di Athena, ditulis sesaat sebelum kejatuhan Republik Romawi.',
      excerptBook: 'Buku I — Empat Kebajikan Utama',
      excerptTitle: 'Kearifan, Keadilan, Keteguhan, dan Kesederhanaan',
      excerptText:
          'Tidak ada kewajiban yang lebih mengikat daripada membalas budi; sebab jika kebajikan adalah mahkota jiwa, maka rasa syukur adalah akar penopangnya.',
      spineWidth: 42,
      spineHeight: 186,
      spineColor1: 0xFF443226,
      spineColor2: 0xFF2B1D14,
      ribbonColor: 0xFFA8A29E,
      coverImageUrl:
          'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?auto=format&fit=crop&w=400&q=80',
    ),

    // TIER 2 - Diskursus Eksistensialisme (Lorong II)
    const Book(
      id: 'book_dunia_sophie',
      title: 'Dunia Sophie',
      subtitle: 'Sebuah Novel Filsafat Abadi',
      author: 'Jostein Gaarder (1991)',
      year: '1991',
      callNumber: 'B-199.JG-901',
      deweyCode: '109.1',
      pages: 560,
      rating: 4.9,
      category: 'Pengantar Filsafat',
      laneId: 'lane_2',
      laneName: 'Lorong II: Filsafat & Kebijaksanaan',
      shelfTier: 2,
      description:
          'Perjalanan naratif menyusuri sejarah pemikiran barat melalui surat-surat misterius untuk Sophie Amundsen.',
      curatorNotes:
          'Jembatan literatur modern paling memikat yang merangkum 3000 tahun sejarah filsafat menjadi kisah detektif batin.',
      excerptBook: 'Bab I — Taman Firdaus',
      excerptTitle: 'Siapakah Dirimu Sebenarnya?',
      excerptText:
          'Sophie Amundsen sedang dalam perjalanan pulang dari sekolah. Dia berjalan bersama Jorunn untuk sebagian jalan. Mereka membicarakan robot, dan apakah kecerdasan buatan benar-benar dapat berpikir seperti manusia.',
      spineWidth: 62,
      spineHeight: 215,
      spineColor1: 0xFF1F3A38,
      spineColor2: 0xFF112423,
      ribbonColor: 0xFF34D399,
      coverImageUrl:
          'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&w=400&q=80',
    ),
    const Book(
      id: 'book_mitos_sisifus',
      title: 'Mitos Sisifus',
      subtitle: 'Esai Absurdisme & Keberanian Hidup',
      author: 'Albert Camus (1942)',
      year: '1942',
      callNumber: 'B-194.AC-620',
      deweyCode: '194.8',
      pages: 192,
      rating: 4.8,
      category: 'Eksistensialisme Absurdis',
      laneId: 'lane_2',
      laneName: 'Lorong II: Filsafat & Kebijaksanaan',
      shelfTier: 2,
      description:
          'Pemberontakan melawan absurditas kehidupan dan pencarian makna tanpa ilusi transendental.',
      curatorNotes:
          'Esai filsafat abad ke-20 yang paling berani, menyimpulkan bahwa Sisifus harus kita bayangkan bahagia.',
      excerptBook: 'Bab IV — Mitos Sisifus',
      excerptTitle: 'Pemberontakan Melawan Batu yang Bergulir',
      excerptText:
          'Para dewa telah mengutuk Sisifus untuk tanpa henti menggelindingkan sebuah batu karang ke puncak gunung, dari mana batu itu akan jatuh kembali oleh beratnya sendiri. Mereka berpikir tidak ada hukuman yang lebih mengerikan daripada kerja yang sia-sia dan tanpa harapan.',
      spineWidth: 46,
      spineHeight: 195,
      spineColor1: 0xFF593122,
      spineColor2: 0xFF381C12,
      ribbonColor: 0xFFF97316,
      coverImageUrl:
          'https://images.unsplash.com/photo-1506880018603-83d5b814b5a6?auto=format&fit=crop&w=400&q=80',
    ),
    const Book(
      id: 'book_humanisme_sartre',
      title: 'Eksistensialisme Adalah Humanisme',
      subtitle: 'Kebebasan Mutlak dan Tanggung Jawab',
      author: 'Jean-Paul Sartre (1946)',
      year: '1946',
      callNumber: 'B-194.JS-710',
      deweyCode: '194.5',
      pages: 112,
      rating: 4.7,
      category: 'Eksistensialisme',
      laneId: 'lane_2',
      laneName: 'Lorong II: Filsafat & Kebijaksanaan',
      shelfTier: 2,
      description:
          'Penegasan bahwa eksistensi mendahului esensi, membebaskan manusia sekaligus mengutuknya untuk bertanggung jawab penuh.',
      curatorNotes:
          'Transkrip kuliah umum terkenal Sartre di Paris yang menjadi manifesto eksistensialisme pascaperang.',
      excerptBook: 'Bagian I — Eksistensi Mendahului Esensi',
      excerptTitle: 'Manusia Menciptakan Dirinya Sendiri',
      excerptText:
          'Manusia pertama-tama ada, bertemu dengan dirinya sendiri di dunia, dan baru setelah itu mendefinisikan dirinya. Jika manusia tidak dapat didefinisikan, itu karena pada awalnya ia bukan apa-apa.',
      spineWidth: 40,
      spineHeight: 182,
      spineColor1: 0xFF473A2B,
      spineColor2: 0xFF292118,
      ribbonColor: 0xFFEAB308,
      coverImageUrl:
          'https://images.unsplash.com/photo-1491841573634-28140fc7ced7?auto=format&fit=crop&w=400&q=80',
    ),
    const Book(
      id: 'book_zarathustra',
      title: 'Maka Berbicaralah Zarathustra',
      subtitle: 'Karya Filosofis Puitis Sang Pengguncang',
      author: 'Friedrich Nietzsche (1883)',
      year: '1883',
      callNumber: 'B-188.FN-802',
      deweyCode: '193.9',
      pages: 384,
      rating: 4.9,
      category: 'Filsafat Vitalisme',
      laneId: 'lane_2',
      laneName: 'Lorong II: Filsafat & Kebijaksanaan',
      shelfTier: 2,
      description:
          'Karya filosofis puitis mengenai Übermensch, kehendak untuk berkuasa, dan konsep pengulangan abadi (amor fati).',
      curatorNotes:
          'Sebuah simfoni prosa liris yang menuntut ketajaman akal untuk memahami metafora pembebasan roh manusia.',
      excerptBook: 'Prakata Zarathustra — Bagian 3',
      excerptTitle: 'Tiga Perubahan Roh',
      excerptText:
          'Aku mengajarkan kepadamu tentang Sang Adimanusia. Manusia adalah sesuatu yang harus dilampaui. Apakah yang telah kamu lakukan untuk melampauinya? Segala makhluk sejauh ini telah menciptakan sesuatu yang melampaui diri mereka sendiri.',
      spineWidth: 54,
      spineHeight: 210,
      spineColor1: 0xFF612121,
      spineColor2: 0xFF3D1414,
      ribbonColor: 0xFFEF4444,
      coverImageUrl:
          'https://images.unsplash.com/photo-1463320726281-696a485928c7?auto=format&fit=crop&w=400&q=80',
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
