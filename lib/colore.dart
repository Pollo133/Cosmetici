class Colore{
  String? _coloreExa;
  String? _nomeColore;

  Colore(this._coloreExa, this._nomeColore);

  Colore.name(this._coloreExa, this._nomeColore);

  String get nomeColore => _nomeColore!;

  set nomeColore(String value) {
    _nomeColore = value;
  }

  String get coloreExa => _coloreExa!;

  set coloreExa(String value) {
    _coloreExa = value;
  }

  @override
  String toString() {
    return 'Colore{_coloreExa: $_coloreExa, _nomeColore: $_nomeColore}';
  }

}