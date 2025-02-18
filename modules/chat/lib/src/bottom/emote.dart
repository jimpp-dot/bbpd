class EmoteItem {
  final String? emoteType;
  final String key;
  final String source;
  final int width;
  final int height;
  final String name;
  final String? remote;

  EmoteItem({
    required this.key,
    required this.source,
    required this.width,
    required this.height,
    this.remote,
    this.name = '',
    this.emoteType,
  });
}

class MagicItem extends EmoteItem {
  final String? audio;

  MagicItem({
    required super.key,
    super.name = '',
    required super.source,
    required super.width,
    required super.height,
    super.remote,
    this.audio,
  });
}

List<EmoteItem> emotes = [
  EmoteItem(key: 'emoji.a1.png', width: 36, height: 36, source: 'assets/images/emote/emoji/a1.png'),
  EmoteItem(key: 'emoji.a2.png', width: 36, height: 36, source: 'assets/images/emote/emoji/a2.png'),
  EmoteItem(key: 'emoji.a3.png', width: 36, height: 36, source: 'assets/images/emote/emoji/a3.png'),
  EmoteItem(key: 'emoji.a4.png', width: 36, height: 36, source: 'assets/images/emote/emoji/a4.png'),
  EmoteItem(key: 'emoji.a5.png', width: 36, height: 36, source: 'assets/images/emote/emoji/a5.png'),
  EmoteItem(key: 'emoji.a6.png', width: 36, height: 36, source: 'assets/images/emote/emoji/a6.png'),
  EmoteItem(key: 'emoji.a7.png', width: 36, height: 36, source: 'assets/images/emote/emoji/a7.png'),
  EmoteItem(key: 'emoji.a8.png', width: 36, height: 36, source: 'assets/images/emote/emoji/a8.png'),
  EmoteItem(key: 'emoji.a9.png', width: 36, height: 36, source: 'assets/images/emote/emoji/a9.png'),
  EmoteItem(key: 'emoji.a10.png', width: 36, height: 36, source: 'assets/images/emote/emoji/a10.png'),
  EmoteItem(key: 'emoji.b1.png', width: 36, height: 36, source: 'assets/images/emote/emoji/b1.png'),
  EmoteItem(key: 'emoji.b2.png', width: 36, height: 36, source: 'assets/images/emote/emoji/b2.png'),
  EmoteItem(key: 'emoji.b3.png', width: 36, height: 36, source: 'assets/images/emote/emoji/b3.png'),
  EmoteItem(key: 'emoji.b4.png', width: 36, height: 36, source: 'assets/images/emote/emoji/b4.png'),
  EmoteItem(key: 'emoji.b5.png', width: 36, height: 36, source: 'assets/images/emote/emoji/b5.png'),
  EmoteItem(key: 'emoji.b6.png', width: 36, height: 36, source: 'assets/images/emote/emoji/b6.png'),
  EmoteItem(key: 'emoji.b7.png', width: 36, height: 36, source: 'assets/images/emote/emoji/b7.png'),
  EmoteItem(key: 'emoji.b8.png', width: 36, height: 36, source: 'assets/images/emote/emoji/b8.png'),
  EmoteItem(key: 'emoji.b9.png', width: 36, height: 36, source: 'assets/images/emote/emoji/b9.png'),
  EmoteItem(key: 'emoji.c1.png', width: 36, height: 36, source: 'assets/images/emote/emoji/c1.png'),
  EmoteItem(key: 'emoji.c2.png', width: 36, height: 36, source: 'assets/images/emote/emoji/c2.png'),
  EmoteItem(key: 'emoji.c3.png', width: 36, height: 36, source: 'assets/images/emote/emoji/c3.png'),
  EmoteItem(key: 'emoji.c4.png', width: 36, height: 36, source: 'assets/images/emote/emoji/c4.png'),
  EmoteItem(key: 'emoji.c5.png', width: 36, height: 36, source: 'assets/images/emote/emoji/c5.png'),
  EmoteItem(key: 'emoji.c6.png', width: 36, height: 36, source: 'assets/images/emote/emoji/c6.png'),
  EmoteItem(key: 'emoji.c7.png', width: 36, height: 36, source: 'assets/images/emote/emoji/c7.png'),
  EmoteItem(key: 'emoji.c8.png', width: 36, height: 36, source: 'assets/images/emote/emoji/c8.png'),
  EmoteItem(key: 'emoji.c9.png', width: 36, height: 36, source: 'assets/images/emote/emoji/c9.png'),
  EmoteItem(key: 'emoji.c10.png', width: 36, height: 36, source: 'assets/images/emote/emoji/c10.png'),
  EmoteItem(key: 'emoji.c11.png', width: 36, height: 36, source: 'assets/images/emote/emoji/c11.png'),
  EmoteItem(key: 'emoji.d1.png', width: 36, height: 36, source: 'assets/images/emote/emoji/d1.png'),
  EmoteItem(key: 'emoji.d2.png', width: 36, height: 36, source: 'assets/images/emote/emoji/d2.png'),
  EmoteItem(key: 'emoji.d3.png', width: 36, height: 36, source: 'assets/images/emote/emoji/d3.png'),
  EmoteItem(key: 'emoji.d4.png', width: 36, height: 36, source: 'assets/images/emote/emoji/d4.png'),
  EmoteItem(key: 'emoji.d5.png', width: 36, height: 36, source: 'assets/images/emote/emoji/d5.png'),
  EmoteItem(key: 'emoji.d6.png', width: 36, height: 36, source: 'assets/images/emote/emoji/d6.png'),
  EmoteItem(key: 'emoji.e1.png', width: 36, height: 36, source: 'assets/images/emote/emoji/e1.png'),
  EmoteItem(key: 'emoji.e2.png', width: 36, height: 36, source: 'assets/images/emote/emoji/e2.png'),
  EmoteItem(key: 'emoji.e3.png', width: 36, height: 36, source: 'assets/images/emote/emoji/e3.png'),
  EmoteItem(key: 'emoji.f1.png', width: 36, height: 36, source: 'assets/images/emote/emoji/f1.png'),
  EmoteItem(key: 'emoji.f2.png', width: 36, height: 36, source: 'assets/images/emote/emoji/f2.png'),
  EmoteItem(key: 'emoji.f3.png', width: 36, height: 36, source: 'assets/images/emote/emoji/f3.png'),
  EmoteItem(key: 'emoji.f4.png', width: 36, height: 36, source: 'assets/images/emote/emoji/f4.png'),
  EmoteItem(key: 'emoji.f5.png', width: 36, height: 36, source: 'assets/images/emote/emoji/f5.png'),
  EmoteItem(key: 'emoji.f6.png', width: 36, height: 36, source: 'assets/images/emote/emoji/f6.png'),
  EmoteItem(key: 'emoji.g1.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g1.png'),
  EmoteItem(key: 'emoji.g2.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g2.png'),
  EmoteItem(key: 'emoji.g3.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g3.png'),
  EmoteItem(key: 'emoji.g4.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g4.png'),
  EmoteItem(key: 'emoji.g5.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g5.png'),
  EmoteItem(key: 'emoji.g6.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g6.png'),
  EmoteItem(key: 'emoji.g7.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g7.png'),
  EmoteItem(key: 'emoji.g8.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g8.png'),
  EmoteItem(key: 'emoji.g9.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g9.png'),
  EmoteItem(key: 'emoji.g10.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g10.png'),
  EmoteItem(key: 'emoji.g11.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g11.png'),
  EmoteItem(key: 'emoji.g12.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g12.png'),
  EmoteItem(key: 'emoji.g13.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g13.png'),
  EmoteItem(key: 'emoji.g14.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g14.png'),
  EmoteItem(key: 'emoji.g15.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g15.png'),
  EmoteItem(key: 'emoji.g16.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g16.png'),
  EmoteItem(key: 'emoji.g17.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g17.png'),
  EmoteItem(key: 'emoji.g18.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g18.png'),
  EmoteItem(key: 'emoji.g19.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g19.png'),
  EmoteItem(key: 'emoji.g20.png', width: 36, height: 36, source: 'assets/images/emote/emoji/g20.png'),
  EmoteItem(key: 'emoji.h1.png', width: 36, height: 36, source: 'assets/images/emote/emoji/h1.png'),
  EmoteItem(key: 'emoji.h2.png', width: 36, height: 36, source: 'assets/images/emote/emoji/h2.png'),
  EmoteItem(key: 'emoji.h3.png', width: 36, height: 36, source: 'assets/images/emote/emoji/h3.png'),
  EmoteItem(key: 'emoji.h4.png', width: 36, height: 36, source: 'assets/images/emote/emoji/h4.png'),
  EmoteItem(key: 'emoji.h5.png', width: 36, height: 36, source: 'assets/images/emote/emoji/h5.png'),
  EmoteItem(key: 'emoji.h6.png', width: 36, height: 36, source: 'assets/images/emote/emoji/h6.png'),
  EmoteItem(key: 'emoji.h7.png', width: 36, height: 36, source: 'assets/images/emote/emoji/h7.png'),
  EmoteItem(key: 'emoji.h8.png', width: 36, height: 36, source: 'assets/images/emote/emoji/h8.png'),
  EmoteItem(key: 'emoji.h9.png', width: 36, height: 36, source: 'assets/images/emote/emoji/h9.png'),
  EmoteItem(key: 'emoji.h10.png', width: 36, height: 36, source: 'assets/images/emote/emoji/h10.png'),
  EmoteItem(key: 'emoji.h11.png', width: 36, height: 36, source: 'assets/images/emote/emoji/h11.png'),
  EmoteItem(key: 'emoji.h12.png', width: 36, height: 36, source: 'assets/images/emote/emoji/h12.png'),
  EmoteItem(key: 'emoji.h13.png', width: 36, height: 36, source: 'assets/images/emote/emoji/h13.png'),
  EmoteItem(key: 'emoji.h14.png', width: 36, height: 36, source: 'assets/images/emote/emoji/h14.png'),
  EmoteItem(key: 'emoji.h15.png', width: 36, height: 36, source: 'assets/images/emote/emoji/h15.png'),
  EmoteItem(key: 'emoji.h16.png', width: 36, height: 36, source: 'assets/images/emote/emoji/h16.png'),
  EmoteItem(key: 'emoji.h17.png', width: 36, height: 36, source: 'assets/images/emote/emoji/h17.png'),
  EmoteItem(key: 'emoji.i1.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i1.png'),
  EmoteItem(key: 'emoji.i2.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i2.png'),
  EmoteItem(key: 'emoji.i3.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i3.png'),
  EmoteItem(key: 'emoji.i4.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i4.png'),
  EmoteItem(key: 'emoji.i5.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i5.png'),
  EmoteItem(key: 'emoji.i6.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i6.png'),
  EmoteItem(key: 'emoji.i7.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i7.png'),
  EmoteItem(key: 'emoji.i8.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i8.png'),
  EmoteItem(key: 'emoji.i9.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i9.png'),
  EmoteItem(key: 'emoji.i10.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i10.png'),
  EmoteItem(key: 'emoji.i11.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i11.png'),
  EmoteItem(key: 'emoji.i12.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i12.png'),
  EmoteItem(key: 'emoji.i13.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i13.png'),
  EmoteItem(key: 'emoji.i14.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i14.png'),
  EmoteItem(key: 'emoji.i15.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i15.png'),
  EmoteItem(key: 'emoji.i16.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i16.png'),
  EmoteItem(key: 'emoji.i17.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i17.png'),
  EmoteItem(key: 'emoji.i18.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i18.png'),
  EmoteItem(key: 'emoji.i19.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i19.png'),
  EmoteItem(key: 'emoji.i20.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i20.png'),
  EmoteItem(key: 'emoji.i21.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i21.png'),
  EmoteItem(key: 'emoji.i22.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i22.png'),
  EmoteItem(key: 'emoji.i23.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i23.png'),
  EmoteItem(key: 'emoji.i24.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i24.png'),
  EmoteItem(key: 'emoji.i25.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i25.png'),
  EmoteItem(key: 'emoji.i26.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i26.png'),
  EmoteItem(key: 'emoji.i27.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i27.png'),
  EmoteItem(key: 'emoji.i28.png', width: 36, height: 36, source: 'assets/images/emote/emoji/i28.png'),
  EmoteItem(key: 'emoji.j1.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j1.png'),
  EmoteItem(key: 'emoji.j2.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j2.png'),
  EmoteItem(key: 'emoji.j3.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j3.png'),
  EmoteItem(key: 'emoji.j4.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j4.png'),
  EmoteItem(key: 'emoji.j5.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j5.png'),
  EmoteItem(key: 'emoji.j6.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j6.png'),
  EmoteItem(key: 'emoji.j7.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j7.png'),
  EmoteItem(key: 'emoji.j8.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j8.png'),
  EmoteItem(key: 'emoji.j9.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j9.png'),
  EmoteItem(key: 'emoji.j10.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j10.png'),
  EmoteItem(key: 'emoji.j11.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j11.png'),
  EmoteItem(key: 'emoji.j12.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j12.png'),
  EmoteItem(key: 'emoji.j13.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j13.png'),
  EmoteItem(key: 'emoji.j14.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j14.png'),
  EmoteItem(key: 'emoji.j15.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j15.png'),
  EmoteItem(key: 'emoji.j16.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j16.png'),
  EmoteItem(key: 'emoji.j17.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j17.png'),
  EmoteItem(key: 'emoji.j18.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j18.png'),
  EmoteItem(key: 'emoji.j19.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j19.png'),
  EmoteItem(key: 'emoji.j20.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j20.png'),
  EmoteItem(key: 'emoji.j21.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j21.png'),
  EmoteItem(key: 'emoji.j22.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j22.png'),
  EmoteItem(key: 'emoji.j23.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j23.png'),
  EmoteItem(key: 'emoji.j24.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j24.png'),
  EmoteItem(key: 'emoji.j25.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j25.png'),
  EmoteItem(key: 'emoji.j26.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j26.png'),
  EmoteItem(key: 'emoji.j27.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j27.png'),
  EmoteItem(key: 'emoji.j28.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j28.png'),
  EmoteItem(key: 'emoji.j29.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j29.png'),
  EmoteItem(key: 'emoji.j30.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j30.png'),
  EmoteItem(key: 'emoji.j31.png', width: 36, height: 36, source: 'assets/images/emote/emoji/j31.png'),
  EmoteItem(key: 'emoji.l1.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l1.png'),
  EmoteItem(key: 'emoji.l2.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l2.png'),
  EmoteItem(key: 'emoji.l3.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l3.png'),
  EmoteItem(key: 'emoji.l4.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l4.png'),
  EmoteItem(key: 'emoji.l5.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l5.png'),
  EmoteItem(key: 'emoji.l6.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l6.png'),
  EmoteItem(key: 'emoji.l7.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l7.png'),
  EmoteItem(key: 'emoji.l8.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l8.png'),
  EmoteItem(key: 'emoji.l9.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l9.png'),
  EmoteItem(key: 'emoji.l10.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l10.png'),
  EmoteItem(key: 'emoji.l11.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l11.png'),
  EmoteItem(key: 'emoji.l12.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l12.png'),
  EmoteItem(key: 'emoji.l13.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l13.png'),
  EmoteItem(key: 'emoji.l14.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l14.png'),
  EmoteItem(key: 'emoji.l15.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l15.png'),
  EmoteItem(key: 'emoji.l16.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l16.png'),
  EmoteItem(key: 'emoji.l17.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l17.png'),
  EmoteItem(key: 'emoji.l18.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l18.png'),
  EmoteItem(key: 'emoji.l19.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l19.png'),
  EmoteItem(key: 'emoji.l20.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l20.png'),
  EmoteItem(key: 'emoji.l21.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l21.png'),
  EmoteItem(key: 'emoji.l22.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l22.png'),
  EmoteItem(key: 'emoji.l23.png', width: 36, height: 36, source: 'assets/images/emote/emoji/l23.png'),
  EmoteItem(key: 'emoji.m1.png', width: 36, height: 36, source: 'assets/images/emote/emoji/m1.png'),
  EmoteItem(key: 'emoji.m2.png', width: 36, height: 36, source: 'assets/images/emote/emoji/m2.png'),
  EmoteItem(key: 'emoji.m3.png', width: 36, height: 36, source: 'assets/images/emote/emoji/m3.png'),
  EmoteItem(key: 'emoji.m4.png', width: 36, height: 36, source: 'assets/images/emote/emoji/m4.png'),
  EmoteItem(key: 'emoji.m5.png', width: 36, height: 36, source: 'assets/images/emote/emoji/m5.png'),
  EmoteItem(key: 'emoji.m6.png', width: 36, height: 36, source: 'assets/images/emote/emoji/m6.png'),
  EmoteItem(key: 'emoji.m7.png', width: 36, height: 36, source: 'assets/images/emote/emoji/m7.png'),
  EmoteItem(key: 'emoji.n1.png', width: 36, height: 36, source: 'assets/images/emote/emoji/n1.png'),
  EmoteItem(key: 'emoji.n2.png', width: 36, height: 36, source: 'assets/images/emote/emoji/n2.png'),
  EmoteItem(key: 'emoji.n3.png', width: 36, height: 36, source: 'assets/images/emote/emoji/n3.png'),
  EmoteItem(key: 'emoji.n4.png', width: 36, height: 36, source: 'assets/images/emote/emoji/n4.png'),
  EmoteItem(key: 'emoji.n5.png', width: 36, height: 36, source: 'assets/images/emote/emoji/n5.png'),
  EmoteItem(key: 'emoji.n6.png', width: 36, height: 36, source: 'assets/images/emote/emoji/n6.png'),
  EmoteItem(key: 'emoji.n7.png', width: 36, height: 36, source: 'assets/images/emote/emoji/n7.png'),
  EmoteItem(key: 'emoji.n8.png', width: 36, height: 36, source: 'assets/images/emote/emoji/n8.png'),
  EmoteItem(key: 'emoji.n9.png', width: 36, height: 36, source: 'assets/images/emote/emoji/n9.png'),
  EmoteItem(key: 'emoji.n10.png', width: 36, height: 36, source: 'assets/images/emote/emoji/n10.png'),
  EmoteItem(key: 'emoji.n11.png', width: 36, height: 36, source: 'assets/images/emote/emoji/n11.png'),
  EmoteItem(key: 'emoji.n12.png', width: 36, height: 36, source: 'assets/images/emote/emoji/n12.png'),
  EmoteItem(key: 'emoji.n13.png', width: 36, height: 36, source: 'assets/images/emote/emoji/n13.png'),
  EmoteItem(key: 'emoji.n14.png', width: 36, height: 36, source: 'assets/images/emote/emoji/n14.png'),
  EmoteItem(key: 'emoji.n15.png', width: 36, height: 36, source: 'assets/images/emote/emoji/n15.png'),
  EmoteItem(key: 'emoji.n16.png', width: 36, height: 36, source: 'assets/images/emote/emoji/n16.png'),
  EmoteItem(key: 'emoji.n17.png', width: 36, height: 36, source: 'assets/images/emote/emoji/n17.png'),
  EmoteItem(key: 'emoji.n18.png', width: 36, height: 36, source: 'assets/images/emote/emoji/n18.png'),
];

List<EmoteItem> yellowEmotes = [
  EmoteItem(
    key: 'yellow.1.gif',
    name: '抱抱',
    width: 100,
    height: 100,
    source: 'assets/images/emote/yellow/1.png',
  ),
  EmoteItem(
    key: 'yellow.2.gif',
    name: '大哭',
    width: 100,
    height: 100,
    source: 'assets/images/emote/yellow/2.png',
  ),
  EmoteItem(
    key: 'yellow.3.gif',
    name: '飞吻',
    width: 100,
    height: 100,
    source: 'assets/images/emote/yellow/3.png',
  ),
  EmoteItem(
    key: 'yellow.4.gif',
    name: '尴尬',
    width: 100,
    height: 100,
    source: 'assets/images/emote/yellow/4.png',
  ),
  EmoteItem(
    key: 'yellow.5.gif',
    name: '哈哈大笑',
    width: 100,
    height: 100,
    source: 'assets/images/emote/yellow/5.png',
  ),
  EmoteItem(
    key: 'yellow.6.gif',
    name: '害羞',
    width: 100,
    height: 100,
    source: 'assets/images/emote/yellow/6.png',
  ),
  EmoteItem(
    key: 'yellow.7.gif',
    name: '奸笑',
    width: 100,
    height: 100,
    source: 'assets/images/emote/yellow/7.png',
  ),
  EmoteItem(
    key: 'yellow.8.gif',
    name: '摸摸头',
    width: 100,
    height: 100,
    source: 'assets/images/emote/yellow/8.png',
  ),
  EmoteItem(
    key: 'yellow.9.gif',
    name: '色眯眯',
    width: 100,
    height: 100,
    source: 'assets/images/emote/yellow/9.png',
  ),
  EmoteItem(
    key: 'yellow.10.gif',
    name: '生气',
    width: 100,
    height: 100,
    source: 'assets/images/emote/yellow/10.png',
  ),
  EmoteItem(
    key: 'yellow.11.gif',
    name: '送花',
    width: 100,
    height: 100,
    source: 'assets/images/emote/yellow/11.png',
  ),
  EmoteItem(
    key: 'yellow.12.gif',
    name: '吐舌头',
    width: 100,
    height: 100,
    source: 'assets/images/emote/yellow/12.png',
  ),
  EmoteItem(
    key: 'yellow.13.gif',
    name: '心碎',
    width: 100,
    height: 100,
    source: 'assets/images/emote/yellow/13.png',
  ),
  EmoteItem(
    key: 'yellow.14.gif',
    name: '疑惑',
    width: 100,
    height: 100,
    source: 'assets/images/emote/yellow/14.png',
  ),
  EmoteItem(
    key: 'yellow.15.gif',
    name: '再见',
    width: 100,
    height: 100,
    source: 'assets/images/emote/yellow/15.png',
  ),
];

List<EmoteItem> customEmotes = [
  EmoteItem(
    key: 'yellow.16.gif',
    name: '摇骰子',
    width: 100,
    height: 100,
    source: 'assets/images/emote/yellow/16.png',
  ),
  EmoteItem(
    key: 'yellow.17.gif',
    name: '摇签',
    width: 100,
    height: 100,
    source: 'assets/images/emote/yellow/17.png',
  ),
  EmoteItem(
    key: 'yellow.18.gif',
    name: '剪刀石头布',
    width: 100,
    height: 100,
    source: 'assets/images/emote/yellow/18.png',
  ),
];

List<EmoteItem> gifEmotes = [
  EmoteItem(
    key: 'gif.1.gif',
    name: '挨打',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/1.png',
    remote: '/static/xs/emote/gif/1.gif',
  ),
  EmoteItem(
    key: 'gif.2.gif',
    name: '戳瞎',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/2.png',
    remote: '/static/xs/emote/gif/2.gif',
  ),
  EmoteItem(
    key: 'gif.3.gif',
    name: '奋斗',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/3.png',
    remote: '/static/xs/emote/gif/3.gif',
  ),
  EmoteItem(
    key: 'gif.4.gif',
    name: '惊悚',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/4.png',
    remote: '/static/xs/emote/gif/4.gif',
  ),
  EmoteItem(
    key: 'gif.5.gif',
    name: '囧',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/5.png',
    remote: '/static/xs/emote/gif/5.gif',
  ),
  EmoteItem(
    key: 'gif.6.gif',
    name: '看书',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/6.png',
    remote: '/static/xs/emote/gif/6.gif',
  ),
  EmoteItem(
    key: 'gif.7.gif',
    name: '哭哭',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/7.png',
    remote: '/static/xs/emote/gif/7.gif',
  ),
  EmoteItem(
    key: 'gif.8.gif',
    name: '酷炫',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/8.png',
    remote: '/static/xs/emote/gif/8.gif',
  ),
  EmoteItem(
    key: 'gif.9.gif',
    name: '困',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/9.png',
    remote: '/static/xs/emote/gif/9.gif',
  ),
  EmoteItem(
    key: 'gif.10.gif',
    name: '路过',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/10.png',
    remote: '/static/xs/emote/gif/10.gif',
  ),
  EmoteItem(
    key: 'gif.11.gif',
    name: '萌萌哒',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/11.png',
    remote: '/static/xs/emote/gif/11.gif',
  ),
  EmoteItem(
    key: 'gif.12.gif',
    name: '亲吻',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/12.png',
    remote: '/static/xs/emote/gif/12.gif',
  ),
  EmoteItem(
    key: 'gif.13.gif',
    name: '桑心',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/13.png',
    remote: '/static/xs/emote/gif/13.gif',
  ),
  EmoteItem(
    key: 'gif.14.gif',
    name: '吐',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/14.png',
    remote: '/static/xs/emote/gif/14.gif',
  ),
  EmoteItem(
    key: 'gif.15.gif',
    name: '无辜',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/15.png',
    remote: '/static/xs/emote/gif/15.gif',
  ),
  EmoteItem(
    key: 'gif.16.gif',
    name: '夏天',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/16.png',
    remote: '/static/xs/emote/gif/16.gif',
  ),
  EmoteItem(
    key: 'gif.17.gif',
    name: '摇摆',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/17.png',
    remote: '/static/xs/emote/gif/17.gif',
  ),
  EmoteItem(
    key: 'gif.18.gif',
    name: '疑问',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/18.png',
    remote: '/static/xs/emote/gif/18.gif',
  ),
  EmoteItem(
    key: 'gif.19.gif',
    name: '震惊',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/19.png',
    remote: '/static/xs/emote/gif/19.gif',
  ),
  EmoteItem(
    key: 'gif.20.gif',
    name: '中箭',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/20.png',
    remote: '/static/xs/emote/gif/20.gif',
  ),
  EmoteItem(
    key: 'gif.21.gif',
    name: '抓狂',
    width: 100,
    height: 100,
    source: 'assets/images/emote/gif/21.png',
    remote: '/static/xs/emote/gif/21.gif',
  ),
];

List<MagicItem> magicEmotes = [
  MagicItem(
    name: '卡哇伊',
    key: 'magic.1memoj_cute.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/1memoj_cute.png',
    audio: 'assets/images/emote/magic/audio/memoj_cute.mp3',
  ),
  MagicItem(
    name: '呵呵',
    key: 'magic.2memoj_smile.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/2memoj_smile.png',
    audio: 'assets/images/emote/magic/audio/memoj_smile.mp3',
  ),
  MagicItem(
    name: '哭笑不得',
    key: 'magic.3memoj_dumbfounding.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/3memoj_dumbfounding.png',
    audio: 'assets/images/emote/magic/audio/memoj_dumbfounding.mp3',
  ),
  MagicItem(
    name: '狂汗',
    key: 'magic.4memoj_perspiration.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/4memoj_perspiration.png',
    audio: 'assets/images/emote/magic/audio/memoj_perspiration.mp3',
  ),
  MagicItem(
    name: '哭泣',
    key: 'magic.5memoj_cry.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/5memoj_cry.png',
    audio: 'assets/images/emote/magic/audio/memoj_cry.mp3',
  ),
  MagicItem(
    name: '馋',
    key: 'magic.6memoj_greed.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/6memoj_greed.png',
    audio: 'assets/images/emote/magic/audio/memoj_greed.mp3',
  ),
  MagicItem(
    name: '疑问',
    key: 'magic.7memoj_question.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/7memoj_question.png',
    audio: 'assets/images/emote/magic/audio/memoj_question.mp3',
  ),
  MagicItem(
    name: '可怜',
    key: 'magic.8memoj_pity.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/8memoj_pity.png',
    audio: 'assets/images/emote/magic/audio/memoj_pity.mp3',
  ),
  MagicItem(
    name: '猖狂笑',
    key: 'magic.9memoj_laugh.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/9memoj_laugh.png',
    audio: 'assets/images/emote/magic/audio/memoj_laugh.mp3',
  ),
  MagicItem(
    name: '羞羞',
    key: 'magic.10memoj_shy.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/10memoj_shy.png',
    audio: 'assets/images/emote/magic/audio/memoj_shy.mp3',
  ),
  MagicItem(
    name: '亲吻',
    key: 'magic.11memoj_kiss.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/11memoj_kiss.png',
    audio: 'assets/images/emote/magic/audio/memoj_kiss.mp3',
  ),
  MagicItem(
    name: '乌鸦',
    key: 'magic.12memoj_wuya.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/12memoj_wuya2.png',
    audio: 'assets/images/emote/magic/audio/memoj_wuya.mp3',
  ),
  MagicItem(
    name: '呆',
    key: 'magic.13memoj_asleep.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/13memoj_asleep.png',
    audio: 'assets/images/emote/magic/audio/memoj_asleep.mp3',
  ),
  MagicItem(
    name: '愤怒',
    key: 'magic.14memoj_angry.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/14memoj_angry.png',
    audio: 'assets/images/emote/magic/audio/memoj_angry.mp3',
  ),
  MagicItem(
    name: '鄙视',
    key: 'magic.15memoj_roar.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/15memoj_roar.png',
    audio: 'assets/images/emote/magic/audio/memoj_roar.mp3',
  ),
  MagicItem(
    name: '拜拜',
    key: 'magic.16memoj_bye.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/16memoj_bye.png',
    audio: 'assets/images/emote/magic/audio/memoj_bye.mp3',
  ),
  MagicItem(
    name: '捂眼',
    key: 'magic.17memoj_covereyes.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/17memoj_covereyes.png',
    audio: 'assets/images/emote/magic/audio/memoj_covereyes.mp3',
  ),
  MagicItem(
    name: '尴尬',
    key: 'magic.18memoj_awkward.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/18memoj_awkward.png',
    audio: 'assets/images/emote/magic/audio/memoj_awkward.mp3',
  ),
  MagicItem(
    name: '大便',
    key: 'magic.19memoj_excrment.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/19memoj_excrment.png',
    audio: 'assets/images/emote/magic/audio/memoj_excrment.mp3',
  ),
  MagicItem(
    name: '加油',
    key: 'magic.20memoj_fighting.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/20memoj_fighting.png',
    audio: 'assets/images/emote/magic/audio/memoj_fighting.mp3',
  ),
  MagicItem(
    name: '早上好',
    key: 'magic.21memoj_morning.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/21memoj_morning.png',
    audio: 'assets/images/emote/magic/audio/memoj_morning.mp3',
  ),
  MagicItem(
    name: '撇嘴',
    key: 'magic.22memoj_curllips.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/22memoj_curllips.png',
    audio: 'assets/images/emote/magic/audio/memoj_curllips.mp3',
  ),
  MagicItem(
    name: '鄙视',
    key: 'magic.23memoj_contempt.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/23memoj_contempt.png',
    audio: 'assets/images/emote/magic/audio/memoj_contempt.mp3',
  ),
  MagicItem(
    name: '委屈',
    key: 'magic.24memoj_chagrin.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/24memoj_chagrin.png',
    audio: 'assets/images/emote/magic/audio/memoj_chagrin.mp3',
  ),
  MagicItem(
    name: '抠鼻',
    key: 'magic.25memoj_digNose.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/25memoj_digNose.png',
    audio: 'assets/images/emote/magic/audio/memoj_digNose.mp3',
  ),
  MagicItem(
    name: '白眼',
    key: 'magic.26memoj_rolleye.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/26memoj_rolleye.png',
    audio: 'assets/images/emote/magic/audio/memoj_rolleye.mp3',
  ),
  MagicItem(
    name: 'OMG',
    key: 'magic.27memoj_crazy.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/27memoj_crazy.png',
    audio: 'assets/images/emote/magic/audio/memoj_crazy.mp3',
  ),
  MagicItem(
    name: '晚安',
    key: 'magic.28memoj_goodnight.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/28memoj_goodnight.png',
    audio: 'assets/images/emote/magic/audio/memoj_goodnight.mp3',
  ),
  MagicItem(
    name: '心碎',
    key: 'magic.29memoj_heartBroken.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/29memoj_heartBroken.png',
    audio: 'assets/images/emote/magic/audio/memoj_heartBroken.mp3',
  ),
  MagicItem(
    name: '咒骂',
    key: 'magic.30memoj_curse.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/30memoj_curse.png',
    audio: 'assets/images/emote/magic/audio/memoj_curse.mp3',
  ),
  MagicItem(
    name: '斜眼',
    key: 'magic.31memoj_squint.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/31memoj_squint.png',
    audio: 'assets/images/emote/magic/audio/memoj_squint.mp3',
  ),
  MagicItem(
    name: '惊吓',
    key: 'magic.32memoj_frighten.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/32memoj_frighten.png',
    audio: 'assets/images/emote/magic/audio/memoj_frighten.mp3',
  ),
  MagicItem(
    name: '暴走',
    key: 'magic.33memoj_getup.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/33memoj_getup.png',
    audio: 'assets/images/emote/magic/audio/memoj_getup.mp3',
  ),
  MagicItem(
    name: '坏笑',
    key: 'magic.34memoj_hinhin.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/34memoj_hinhin.png',
    audio: 'assets/images/emote/magic/audio/memoj_hinhin.mp3',
  ),
  MagicItem(
    name: '偷笑',
    key: 'magic.35memoj_titter.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/35memoj_titter.png',
    audio: 'assets/images/emote/magic/audio/memoj_titter.mp3',
  ),
  MagicItem(
    name: '哼',
    key: 'magic.36memoj_heng.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/36memoj_heng.png',
    audio: 'assets/images/emote/magic/audio/memoj_heng.mp3',
  ),
  MagicItem(
    name: '花痴',
    key: 'magic.37memoj_love.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/37memoj_love.png',
    audio: 'assets/images/emote/magic/audio/memoj_love.mp3',
  ),
  MagicItem(
    name: '抱抱',
    key: 'magic.38memoj_hug.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/38memoj_hug.png',
    audio: 'assets/images/emote/magic/audio/memoj_hug.mp3',
  ),
  MagicItem(
    name: '抓狂',
    key: 'magic.39memoj_mad.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/39memoj_mad.png',
    audio: 'assets/images/emote/magic/audio/memoj_mad.mp3',
  ),
  MagicItem(
    name: 'OK',
    key: 'magic.40memoj_ok.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/40memoj_ok.png',
    audio: 'assets/images/emote/magic/audio/memoj_ok.mp3',
  ),
  MagicItem(
    name: '你逗我吗',
    key: 'magic.41memoj_areYouFunny.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/41memoj_areYouFunny.png',
    audio: 'assets/images/emote/magic/audio/memoj_areYouFunny.mp3',
  ),
  MagicItem(
    name: '吐血',
    key: 'magic.42memoj_penpen.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/42memoj_penpen.png',
    audio: 'assets/images/emote/magic/audio/memoj_penpen.mp3',
  ),
  MagicItem(
    name: '吐舌头',
    key: 'magic.43memoj_showTongue.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/43memoj_showTongue.png',
    audio: 'assets/images/emote/magic/audio/memoj_showTongue.mp3',
  ),
  MagicItem(
    name: '赞美',
    key: 'magic.44memoj_praise.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/44memoj_praise.png',
    audio: 'assets/images/emote/magic/audio/memoj_praise.mp3',
  ),
  MagicItem(
    name: '酷',
    key: 'magic.45memoj_smoking.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/45memoj_smoking.png',
    audio: 'assets/images/emote/magic/audio/memoj_smoking.mp3',
  ),
  MagicItem(
    name: '熟睡',
    key: 'magic.46memoj_sleep.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/46memoj_sleep.png',
    audio: 'assets/images/emote/magic/audio/memoj_sleep.mp3',
  ),
  MagicItem(
    name: '闭嘴',
    key: 'magic.47memoj_shutup.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/47memoj_shutup.png',
    audio: 'assets/images/emote/magic/audio/memoj_shutup.mp3',
  ),
  MagicItem(
    name: '衰',
    key: 'magic.48memoj_unlucky.png',
    width: 100,
    height: 100,
    source: 'assets/images/emote/magic/48memoj_unlucky.png',
    audio: 'assets/images/emote/magic/audio/memoj_unlucky.mp3',
  ),
];
