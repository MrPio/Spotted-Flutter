enum RemoteImages {
  // Misc
  topSprite001("top_sprite_001.png"),
  anonymous("anonymous.png"),
  avatar,
  crosshair("crosshair.png"),
  avatar1,
  avatar2,
  avatar3,
  avatar4,
  avatar5,
  avatar6,
  avatar7,
  avatar8,
  avatar9,
  avatar10,
  avatar11,
  avatar12,
  avatar13,
  avatar14,
  avatar15,
  avatar16,
  avatar17,
  avatar18,
  avatar19,
  avatar20,
  avatar21,
  avatar22,
  avatar23,
  avatar24,
  avatar25,
  avatar26,
  avatar27,
  avatar28,
  avatar29,
  avatar30,
  avatar31,
  mapMarker("map_marker.png"),
  circleWhite("circle_white.png"),

  // Locations
  qt140,
  qt150,
  qt155,
  qt160,
  scienze1,
  scienze2,
  scienze3,
  portineria,
  segreteria,
  clab,
  dipartimentoMatematica,
  biblioteca,
  mensaIngegneria,
  mensaEconomia,
  medicinaMurri,
  auleSud,
  auleSudAtrio,
  agrariaAtrio,
  agrariaZonaStudenti,
  agraria,
  torre,
  economia,
  economiaAulaA,
  economiaAulaC,
  economiaAulaT27,
  economiaAulaTPiccola,
  economiaAuleDottorato,
  economiaBiblioteca,
  economiaChiostro,
  economiaSalaLettura,
  economiaSbt,
  economiaSegreteriaStudenti,
  ancona,
  anconaCavour,
  anconaCittadella,
  anconaMole,
  anconaPassetto,
  anconaPiazzaDelPapa,
  anconaSanCiriaco,
  anconaStazione,
  anconaUgoBassi,
  medicinaEustacchio,
  medicinaEustacchioAtelier,
  medicinaEustacchioAulaD,
  medicinaEustacchioAuleStudio,
  medicinaEustacchioBiblioteca,
  medicinaEustacchioLaureTriennali,
  medicinaEustacchioPiano1,
  medicinaEustacchioPiano2,
  medicinaEustacchioPianoTerra,
  medicinaEustacchioSegreteria,
  medicinaMurriAulaP1,
  medicinaMurriAulaR,
  medicinaMurriPiano1,
  medicinaMurriPiano2,
  medicinaMurriPiano3,
  medicinaMurriPiano4,
  medicinaMurriPianoTerra;

  String get url =>
      "https://firebasestorage.googleapis.com/v0/b/spotted-f3589.appspot.com/o/src%2F"
      "${_url ?? name.toLowerCase()}${name.contains("avatar") ? ".png" : ".jpg"}?alt=media";

  final String? _url;

  const RemoteImages([this._url]);
}
