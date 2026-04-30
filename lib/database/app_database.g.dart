// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SalasTable extends Salas with TableInfo<$SalasTable, Sala> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numeroMeta = const VerificationMeta('numero');
  @override
  late final GeneratedColumn<String> numero = GeneratedColumn<String>(
    'numero',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _capacidadeMeta = const VerificationMeta(
    'capacidade',
  );
  @override
  late final GeneratedColumn<int> capacidade = GeneratedColumn<int>(
    'capacidade',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recursosMeta = const VerificationMeta(
    'recursos',
  );
  @override
  late final GeneratedColumn<String> recursos = GeneratedColumn<String>(
    'recursos',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localizacaoMeta = const VerificationMeta(
    'localizacao',
  );
  @override
  late final GeneratedColumn<String> localizacao = GeneratedColumn<String>(
    'localizacao',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _disponivelMeta = const VerificationMeta(
    'disponivel',
  );
  @override
  late final GeneratedColumn<bool> disponivel = GeneratedColumn<bool>(
    'disponivel',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("disponivel" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nome,
    numero,
    capacidade,
    recursos,
    localizacao,
    disponivel,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'salas';
  @override
  VerificationContext validateIntegrity(
    Insertable<Sala> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('numero')) {
      context.handle(
        _numeroMeta,
        numero.isAcceptableOrUnknown(data['numero']!, _numeroMeta),
      );
    } else if (isInserting) {
      context.missing(_numeroMeta);
    }
    if (data.containsKey('capacidade')) {
      context.handle(
        _capacidadeMeta,
        capacidade.isAcceptableOrUnknown(data['capacidade']!, _capacidadeMeta),
      );
    } else if (isInserting) {
      context.missing(_capacidadeMeta);
    }
    if (data.containsKey('recursos')) {
      context.handle(
        _recursosMeta,
        recursos.isAcceptableOrUnknown(data['recursos']!, _recursosMeta),
      );
    } else if (isInserting) {
      context.missing(_recursosMeta);
    }
    if (data.containsKey('localizacao')) {
      context.handle(
        _localizacaoMeta,
        localizacao.isAcceptableOrUnknown(
          data['localizacao']!,
          _localizacaoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_localizacaoMeta);
    }
    if (data.containsKey('disponivel')) {
      context.handle(
        _disponivelMeta,
        disponivel.isAcceptableOrUnknown(data['disponivel']!, _disponivelMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Sala map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Sala(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      numero: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}numero'],
      )!,
      capacidade: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}capacidade'],
      )!,
      recursos: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recursos'],
      )!,
      localizacao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}localizacao'],
      )!,
      disponivel: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}disponivel'],
      )!,
    );
  }

  @override
  $SalasTable createAlias(String alias) {
    return $SalasTable(attachedDatabase, alias);
  }
}

class Sala extends DataClass implements Insertable<Sala> {
  final int id;
  final String nome;
  final String numero;
  final int capacidade;
  final String recursos;
  final String localizacao;
  final bool disponivel;
  const Sala({
    required this.id,
    required this.nome,
    required this.numero,
    required this.capacidade,
    required this.recursos,
    required this.localizacao,
    required this.disponivel,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    map['numero'] = Variable<String>(numero);
    map['capacidade'] = Variable<int>(capacidade);
    map['recursos'] = Variable<String>(recursos);
    map['localizacao'] = Variable<String>(localizacao);
    map['disponivel'] = Variable<bool>(disponivel);
    return map;
  }

  SalasCompanion toCompanion(bool nullToAbsent) {
    return SalasCompanion(
      id: Value(id),
      nome: Value(nome),
      numero: Value(numero),
      capacidade: Value(capacidade),
      recursos: Value(recursos),
      localizacao: Value(localizacao),
      disponivel: Value(disponivel),
    );
  }

  factory Sala.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Sala(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      numero: serializer.fromJson<String>(json['numero']),
      capacidade: serializer.fromJson<int>(json['capacidade']),
      recursos: serializer.fromJson<String>(json['recursos']),
      localizacao: serializer.fromJson<String>(json['localizacao']),
      disponivel: serializer.fromJson<bool>(json['disponivel']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'numero': serializer.toJson<String>(numero),
      'capacidade': serializer.toJson<int>(capacidade),
      'recursos': serializer.toJson<String>(recursos),
      'localizacao': serializer.toJson<String>(localizacao),
      'disponivel': serializer.toJson<bool>(disponivel),
    };
  }

  Sala copyWith({
    int? id,
    String? nome,
    String? numero,
    int? capacidade,
    String? recursos,
    String? localizacao,
    bool? disponivel,
  }) => Sala(
    id: id ?? this.id,
    nome: nome ?? this.nome,
    numero: numero ?? this.numero,
    capacidade: capacidade ?? this.capacidade,
    recursos: recursos ?? this.recursos,
    localizacao: localizacao ?? this.localizacao,
    disponivel: disponivel ?? this.disponivel,
  );
  Sala copyWithCompanion(SalasCompanion data) {
    return Sala(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      numero: data.numero.present ? data.numero.value : this.numero,
      capacidade: data.capacidade.present
          ? data.capacidade.value
          : this.capacidade,
      recursos: data.recursos.present ? data.recursos.value : this.recursos,
      localizacao: data.localizacao.present
          ? data.localizacao.value
          : this.localizacao,
      disponivel: data.disponivel.present
          ? data.disponivel.value
          : this.disponivel,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Sala(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('numero: $numero, ')
          ..write('capacidade: $capacidade, ')
          ..write('recursos: $recursos, ')
          ..write('localizacao: $localizacao, ')
          ..write('disponivel: $disponivel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    nome,
    numero,
    capacidade,
    recursos,
    localizacao,
    disponivel,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Sala &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.numero == this.numero &&
          other.capacidade == this.capacidade &&
          other.recursos == this.recursos &&
          other.localizacao == this.localizacao &&
          other.disponivel == this.disponivel);
}

class SalasCompanion extends UpdateCompanion<Sala> {
  final Value<int> id;
  final Value<String> nome;
  final Value<String> numero;
  final Value<int> capacidade;
  final Value<String> recursos;
  final Value<String> localizacao;
  final Value<bool> disponivel;
  const SalasCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.numero = const Value.absent(),
    this.capacidade = const Value.absent(),
    this.recursos = const Value.absent(),
    this.localizacao = const Value.absent(),
    this.disponivel = const Value.absent(),
  });
  SalasCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required String numero,
    required int capacidade,
    required String recursos,
    required String localizacao,
    this.disponivel = const Value.absent(),
  }) : nome = Value(nome),
       numero = Value(numero),
       capacidade = Value(capacidade),
       recursos = Value(recursos),
       localizacao = Value(localizacao);
  static Insertable<Sala> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<String>? numero,
    Expression<int>? capacidade,
    Expression<String>? recursos,
    Expression<String>? localizacao,
    Expression<bool>? disponivel,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (numero != null) 'numero': numero,
      if (capacidade != null) 'capacidade': capacidade,
      if (recursos != null) 'recursos': recursos,
      if (localizacao != null) 'localizacao': localizacao,
      if (disponivel != null) 'disponivel': disponivel,
    });
  }

  SalasCompanion copyWith({
    Value<int>? id,
    Value<String>? nome,
    Value<String>? numero,
    Value<int>? capacidade,
    Value<String>? recursos,
    Value<String>? localizacao,
    Value<bool>? disponivel,
  }) {
    return SalasCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      numero: numero ?? this.numero,
      capacidade: capacidade ?? this.capacidade,
      recursos: recursos ?? this.recursos,
      localizacao: localizacao ?? this.localizacao,
      disponivel: disponivel ?? this.disponivel,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (numero.present) {
      map['numero'] = Variable<String>(numero.value);
    }
    if (capacidade.present) {
      map['capacidade'] = Variable<int>(capacidade.value);
    }
    if (recursos.present) {
      map['recursos'] = Variable<String>(recursos.value);
    }
    if (localizacao.present) {
      map['localizacao'] = Variable<String>(localizacao.value);
    }
    if (disponivel.present) {
      map['disponivel'] = Variable<bool>(disponivel.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalasCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('numero: $numero, ')
          ..write('capacidade: $capacidade, ')
          ..write('recursos: $recursos, ')
          ..write('localizacao: $localizacao, ')
          ..write('disponivel: $disponivel')
          ..write(')'))
        .toString();
  }
}

class $CursosTable extends Cursos with TableInfo<$CursosTable, Curso> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CursosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nomeCursoMeta = const VerificationMeta(
    'nomeCurso',
  );
  @override
  late final GeneratedColumn<String> nomeCurso = GeneratedColumn<String>(
    'nome_curso',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataInicioMeta = const VerificationMeta(
    'dataInicio',
  );
  @override
  late final GeneratedColumn<DateTime> dataInicio = GeneratedColumn<DateTime>(
    'data_inicio',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataFimMeta = const VerificationMeta(
    'dataFim',
  );
  @override
  late final GeneratedColumn<DateTime> dataFim = GeneratedColumn<DateTime>(
    'data_fim',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _turnoMeta = const VerificationMeta('turno');
  @override
  late final GeneratedColumn<String> turno = GeneratedColumn<String>(
    'turno',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _professorMeta = const VerificationMeta(
    'professor',
  );
  @override
  late final GeneratedColumn<String> professor = GeneratedColumn<String>(
    'professor',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codigoSIGMeta = const VerificationMeta(
    'codigoSIG',
  );
  @override
  late final GeneratedColumn<String> codigoSIG = GeneratedColumn<String>(
    'codigo_s_i_g',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nomeCurso,
    dataInicio,
    dataFim,
    turno,
    professor,
    codigoSIG,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cursos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Curso> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome_curso')) {
      context.handle(
        _nomeCursoMeta,
        nomeCurso.isAcceptableOrUnknown(data['nome_curso']!, _nomeCursoMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeCursoMeta);
    }
    if (data.containsKey('data_inicio')) {
      context.handle(
        _dataInicioMeta,
        dataInicio.isAcceptableOrUnknown(data['data_inicio']!, _dataInicioMeta),
      );
    } else if (isInserting) {
      context.missing(_dataInicioMeta);
    }
    if (data.containsKey('data_fim')) {
      context.handle(
        _dataFimMeta,
        dataFim.isAcceptableOrUnknown(data['data_fim']!, _dataFimMeta),
      );
    } else if (isInserting) {
      context.missing(_dataFimMeta);
    }
    if (data.containsKey('turno')) {
      context.handle(
        _turnoMeta,
        turno.isAcceptableOrUnknown(data['turno']!, _turnoMeta),
      );
    } else if (isInserting) {
      context.missing(_turnoMeta);
    }
    if (data.containsKey('professor')) {
      context.handle(
        _professorMeta,
        professor.isAcceptableOrUnknown(data['professor']!, _professorMeta),
      );
    } else if (isInserting) {
      context.missing(_professorMeta);
    }
    if (data.containsKey('codigo_s_i_g')) {
      context.handle(
        _codigoSIGMeta,
        codigoSIG.isAcceptableOrUnknown(data['codigo_s_i_g']!, _codigoSIGMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Curso map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Curso(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nomeCurso: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome_curso'],
      )!,
      dataInicio: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data_inicio'],
      )!,
      dataFim: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data_fim'],
      )!,
      turno: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}turno'],
      )!,
      professor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}professor'],
      )!,
      codigoSIG: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codigo_s_i_g'],
      ),
    );
  }

  @override
  $CursosTable createAlias(String alias) {
    return $CursosTable(attachedDatabase, alias);
  }
}

class Curso extends DataClass implements Insertable<Curso> {
  final int id;
  final String nomeCurso;
  final DateTime dataInicio;
  final DateTime dataFim;
  final String turno;
  final String professor;
  final String? codigoSIG;
  const Curso({
    required this.id,
    required this.nomeCurso,
    required this.dataInicio,
    required this.dataFim,
    required this.turno,
    required this.professor,
    this.codigoSIG,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome_curso'] = Variable<String>(nomeCurso);
    map['data_inicio'] = Variable<DateTime>(dataInicio);
    map['data_fim'] = Variable<DateTime>(dataFim);
    map['turno'] = Variable<String>(turno);
    map['professor'] = Variable<String>(professor);
    if (!nullToAbsent || codigoSIG != null) {
      map['codigo_s_i_g'] = Variable<String>(codigoSIG);
    }
    return map;
  }

  CursosCompanion toCompanion(bool nullToAbsent) {
    return CursosCompanion(
      id: Value(id),
      nomeCurso: Value(nomeCurso),
      dataInicio: Value(dataInicio),
      dataFim: Value(dataFim),
      turno: Value(turno),
      professor: Value(professor),
      codigoSIG: codigoSIG == null && nullToAbsent
          ? const Value.absent()
          : Value(codigoSIG),
    );
  }

  factory Curso.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Curso(
      id: serializer.fromJson<int>(json['id']),
      nomeCurso: serializer.fromJson<String>(json['nomeCurso']),
      dataInicio: serializer.fromJson<DateTime>(json['dataInicio']),
      dataFim: serializer.fromJson<DateTime>(json['dataFim']),
      turno: serializer.fromJson<String>(json['turno']),
      professor: serializer.fromJson<String>(json['professor']),
      codigoSIG: serializer.fromJson<String?>(json['codigoSIG']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nomeCurso': serializer.toJson<String>(nomeCurso),
      'dataInicio': serializer.toJson<DateTime>(dataInicio),
      'dataFim': serializer.toJson<DateTime>(dataFim),
      'turno': serializer.toJson<String>(turno),
      'professor': serializer.toJson<String>(professor),
      'codigoSIG': serializer.toJson<String?>(codigoSIG),
    };
  }

  Curso copyWith({
    int? id,
    String? nomeCurso,
    DateTime? dataInicio,
    DateTime? dataFim,
    String? turno,
    String? professor,
    Value<String?> codigoSIG = const Value.absent(),
  }) => Curso(
    id: id ?? this.id,
    nomeCurso: nomeCurso ?? this.nomeCurso,
    dataInicio: dataInicio ?? this.dataInicio,
    dataFim: dataFim ?? this.dataFim,
    turno: turno ?? this.turno,
    professor: professor ?? this.professor,
    codigoSIG: codigoSIG.present ? codigoSIG.value : this.codigoSIG,
  );
  Curso copyWithCompanion(CursosCompanion data) {
    return Curso(
      id: data.id.present ? data.id.value : this.id,
      nomeCurso: data.nomeCurso.present ? data.nomeCurso.value : this.nomeCurso,
      dataInicio: data.dataInicio.present
          ? data.dataInicio.value
          : this.dataInicio,
      dataFim: data.dataFim.present ? data.dataFim.value : this.dataFim,
      turno: data.turno.present ? data.turno.value : this.turno,
      professor: data.professor.present ? data.professor.value : this.professor,
      codigoSIG: data.codigoSIG.present ? data.codigoSIG.value : this.codigoSIG,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Curso(')
          ..write('id: $id, ')
          ..write('nomeCurso: $nomeCurso, ')
          ..write('dataInicio: $dataInicio, ')
          ..write('dataFim: $dataFim, ')
          ..write('turno: $turno, ')
          ..write('professor: $professor, ')
          ..write('codigoSIG: $codigoSIG')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    nomeCurso,
    dataInicio,
    dataFim,
    turno,
    professor,
    codigoSIG,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Curso &&
          other.id == this.id &&
          other.nomeCurso == this.nomeCurso &&
          other.dataInicio == this.dataInicio &&
          other.dataFim == this.dataFim &&
          other.turno == this.turno &&
          other.professor == this.professor &&
          other.codigoSIG == this.codigoSIG);
}

class CursosCompanion extends UpdateCompanion<Curso> {
  final Value<int> id;
  final Value<String> nomeCurso;
  final Value<DateTime> dataInicio;
  final Value<DateTime> dataFim;
  final Value<String> turno;
  final Value<String> professor;
  final Value<String?> codigoSIG;
  const CursosCompanion({
    this.id = const Value.absent(),
    this.nomeCurso = const Value.absent(),
    this.dataInicio = const Value.absent(),
    this.dataFim = const Value.absent(),
    this.turno = const Value.absent(),
    this.professor = const Value.absent(),
    this.codigoSIG = const Value.absent(),
  });
  CursosCompanion.insert({
    this.id = const Value.absent(),
    required String nomeCurso,
    required DateTime dataInicio,
    required DateTime dataFim,
    required String turno,
    required String professor,
    this.codigoSIG = const Value.absent(),
  }) : nomeCurso = Value(nomeCurso),
       dataInicio = Value(dataInicio),
       dataFim = Value(dataFim),
       turno = Value(turno),
       professor = Value(professor);
  static Insertable<Curso> custom({
    Expression<int>? id,
    Expression<String>? nomeCurso,
    Expression<DateTime>? dataInicio,
    Expression<DateTime>? dataFim,
    Expression<String>? turno,
    Expression<String>? professor,
    Expression<String>? codigoSIG,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nomeCurso != null) 'nome_curso': nomeCurso,
      if (dataInicio != null) 'data_inicio': dataInicio,
      if (dataFim != null) 'data_fim': dataFim,
      if (turno != null) 'turno': turno,
      if (professor != null) 'professor': professor,
      if (codigoSIG != null) 'codigo_s_i_g': codigoSIG,
    });
  }

  CursosCompanion copyWith({
    Value<int>? id,
    Value<String>? nomeCurso,
    Value<DateTime>? dataInicio,
    Value<DateTime>? dataFim,
    Value<String>? turno,
    Value<String>? professor,
    Value<String?>? codigoSIG,
  }) {
    return CursosCompanion(
      id: id ?? this.id,
      nomeCurso: nomeCurso ?? this.nomeCurso,
      dataInicio: dataInicio ?? this.dataInicio,
      dataFim: dataFim ?? this.dataFim,
      turno: turno ?? this.turno,
      professor: professor ?? this.professor,
      codigoSIG: codigoSIG ?? this.codigoSIG,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nomeCurso.present) {
      map['nome_curso'] = Variable<String>(nomeCurso.value);
    }
    if (dataInicio.present) {
      map['data_inicio'] = Variable<DateTime>(dataInicio.value);
    }
    if (dataFim.present) {
      map['data_fim'] = Variable<DateTime>(dataFim.value);
    }
    if (turno.present) {
      map['turno'] = Variable<String>(turno.value);
    }
    if (professor.present) {
      map['professor'] = Variable<String>(professor.value);
    }
    if (codigoSIG.present) {
      map['codigo_s_i_g'] = Variable<String>(codigoSIG.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CursosCompanion(')
          ..write('id: $id, ')
          ..write('nomeCurso: $nomeCurso, ')
          ..write('dataInicio: $dataInicio, ')
          ..write('dataFim: $dataFim, ')
          ..write('turno: $turno, ')
          ..write('professor: $professor, ')
          ..write('codigoSIG: $codigoSIG')
          ..write(')'))
        .toString();
  }
}

class $ReservasTable extends Reservas with TableInfo<$ReservasTable, Reserva> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReservasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idReservaMeta = const VerificationMeta(
    'idReserva',
  );
  @override
  late final GeneratedColumn<int> idReserva = GeneratedColumn<int>(
    'id_reserva',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idCursoMeta = const VerificationMeta(
    'idCurso',
  );
  @override
  late final GeneratedColumn<int> idCurso = GeneratedColumn<int>(
    'id_curso',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cursos (id)',
    ),
  );
  static const VerificationMeta _idSalaMeta = const VerificationMeta('idSala');
  @override
  late final GeneratedColumn<int> idSala = GeneratedColumn<int>(
    'id_sala',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES salas (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [idReserva, idCurso, idSala];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reservas';
  @override
  VerificationContext validateIntegrity(
    Insertable<Reserva> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_reserva')) {
      context.handle(
        _idReservaMeta,
        idReserva.isAcceptableOrUnknown(data['id_reserva']!, _idReservaMeta),
      );
    }
    if (data.containsKey('id_curso')) {
      context.handle(
        _idCursoMeta,
        idCurso.isAcceptableOrUnknown(data['id_curso']!, _idCursoMeta),
      );
    } else if (isInserting) {
      context.missing(_idCursoMeta);
    }
    if (data.containsKey('id_sala')) {
      context.handle(
        _idSalaMeta,
        idSala.isAcceptableOrUnknown(data['id_sala']!, _idSalaMeta),
      );
    } else if (isInserting) {
      context.missing(_idSalaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idReserva};
  @override
  Reserva map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reserva(
      idReserva: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_reserva'],
      )!,
      idCurso: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_curso'],
      )!,
      idSala: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_sala'],
      )!,
    );
  }

  @override
  $ReservasTable createAlias(String alias) {
    return $ReservasTable(attachedDatabase, alias);
  }
}

class Reserva extends DataClass implements Insertable<Reserva> {
  final int idReserva;
  final int idCurso;
  final int idSala;
  const Reserva({
    required this.idReserva,
    required this.idCurso,
    required this.idSala,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_reserva'] = Variable<int>(idReserva);
    map['id_curso'] = Variable<int>(idCurso);
    map['id_sala'] = Variable<int>(idSala);
    return map;
  }

  ReservasCompanion toCompanion(bool nullToAbsent) {
    return ReservasCompanion(
      idReserva: Value(idReserva),
      idCurso: Value(idCurso),
      idSala: Value(idSala),
    );
  }

  factory Reserva.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reserva(
      idReserva: serializer.fromJson<int>(json['idReserva']),
      idCurso: serializer.fromJson<int>(json['idCurso']),
      idSala: serializer.fromJson<int>(json['idSala']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idReserva': serializer.toJson<int>(idReserva),
      'idCurso': serializer.toJson<int>(idCurso),
      'idSala': serializer.toJson<int>(idSala),
    };
  }

  Reserva copyWith({int? idReserva, int? idCurso, int? idSala}) => Reserva(
    idReserva: idReserva ?? this.idReserva,
    idCurso: idCurso ?? this.idCurso,
    idSala: idSala ?? this.idSala,
  );
  Reserva copyWithCompanion(ReservasCompanion data) {
    return Reserva(
      idReserva: data.idReserva.present ? data.idReserva.value : this.idReserva,
      idCurso: data.idCurso.present ? data.idCurso.value : this.idCurso,
      idSala: data.idSala.present ? data.idSala.value : this.idSala,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reserva(')
          ..write('idReserva: $idReserva, ')
          ..write('idCurso: $idCurso, ')
          ..write('idSala: $idSala')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idReserva, idCurso, idSala);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reserva &&
          other.idReserva == this.idReserva &&
          other.idCurso == this.idCurso &&
          other.idSala == this.idSala);
}

class ReservasCompanion extends UpdateCompanion<Reserva> {
  final Value<int> idReserva;
  final Value<int> idCurso;
  final Value<int> idSala;
  const ReservasCompanion({
    this.idReserva = const Value.absent(),
    this.idCurso = const Value.absent(),
    this.idSala = const Value.absent(),
  });
  ReservasCompanion.insert({
    this.idReserva = const Value.absent(),
    required int idCurso,
    required int idSala,
  }) : idCurso = Value(idCurso),
       idSala = Value(idSala);
  static Insertable<Reserva> custom({
    Expression<int>? idReserva,
    Expression<int>? idCurso,
    Expression<int>? idSala,
  }) {
    return RawValuesInsertable({
      if (idReserva != null) 'id_reserva': idReserva,
      if (idCurso != null) 'id_curso': idCurso,
      if (idSala != null) 'id_sala': idSala,
    });
  }

  ReservasCompanion copyWith({
    Value<int>? idReserva,
    Value<int>? idCurso,
    Value<int>? idSala,
  }) {
    return ReservasCompanion(
      idReserva: idReserva ?? this.idReserva,
      idCurso: idCurso ?? this.idCurso,
      idSala: idSala ?? this.idSala,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idReserva.present) {
      map['id_reserva'] = Variable<int>(idReserva.value);
    }
    if (idCurso.present) {
      map['id_curso'] = Variable<int>(idCurso.value);
    }
    if (idSala.present) {
      map['id_sala'] = Variable<int>(idSala.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReservasCompanion(')
          ..write('idReserva: $idReserva, ')
          ..write('idCurso: $idCurso, ')
          ..write('idSala: $idSala')
          ..write(')'))
        .toString();
  }
}

class $UsuariosTable extends Usuarios with TableInfo<$UsuariosTable, Usuario> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsuariosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idUsuarioMeta = const VerificationMeta(
    'idUsuario',
  );
  @override
  late final GeneratedColumn<int> idUsuario = GeneratedColumn<int>(
    'id_usuario',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _matriculaMeta = const VerificationMeta(
    'matricula',
  );
  @override
  late final GeneratedColumn<String> matricula = GeneratedColumn<String>(
    'matricula',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _funcaoMeta = const VerificationMeta('funcao');
  @override
  late final GeneratedColumn<String> funcao = GeneratedColumn<String>(
    'funcao',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _celularMeta = const VerificationMeta(
    'celular',
  );
  @override
  late final GeneratedColumn<String> celular = GeneratedColumn<String>(
    'celular',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _senhaMeta = const VerificationMeta('senha');
  @override
  late final GeneratedColumn<String> senha = GeneratedColumn<String>(
    'senha',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _logadoMeta = const VerificationMeta('logado');
  @override
  late final GeneratedColumn<bool> logado = GeneratedColumn<bool>(
    'logado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("logado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idUsuario,
    matricula,
    nome,
    funcao,
    celular,
    email,
    senha,
    logado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'usuarios';
  @override
  VerificationContext validateIntegrity(
    Insertable<Usuario> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_usuario')) {
      context.handle(
        _idUsuarioMeta,
        idUsuario.isAcceptableOrUnknown(data['id_usuario']!, _idUsuarioMeta),
      );
    }
    if (data.containsKey('matricula')) {
      context.handle(
        _matriculaMeta,
        matricula.isAcceptableOrUnknown(data['matricula']!, _matriculaMeta),
      );
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('funcao')) {
      context.handle(
        _funcaoMeta,
        funcao.isAcceptableOrUnknown(data['funcao']!, _funcaoMeta),
      );
    } else if (isInserting) {
      context.missing(_funcaoMeta);
    }
    if (data.containsKey('celular')) {
      context.handle(
        _celularMeta,
        celular.isAcceptableOrUnknown(data['celular']!, _celularMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('senha')) {
      context.handle(
        _senhaMeta,
        senha.isAcceptableOrUnknown(data['senha']!, _senhaMeta),
      );
    } else if (isInserting) {
      context.missing(_senhaMeta);
    }
    if (data.containsKey('logado')) {
      context.handle(
        _logadoMeta,
        logado.isAcceptableOrUnknown(data['logado']!, _logadoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idUsuario};
  @override
  Usuario map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Usuario(
      idUsuario: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_usuario'],
      )!,
      matricula: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}matricula'],
      ),
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      funcao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}funcao'],
      )!,
      celular: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}celular'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      senha: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}senha'],
      )!,
      logado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}logado'],
      )!,
    );
  }

  @override
  $UsuariosTable createAlias(String alias) {
    return $UsuariosTable(attachedDatabase, alias);
  }
}

class Usuario extends DataClass implements Insertable<Usuario> {
  final int idUsuario;
  final String? matricula;
  final String nome;
  final String funcao;
  final String? celular;
  final String? email;
  final String senha;
  final bool logado;
  const Usuario({
    required this.idUsuario,
    this.matricula,
    required this.nome,
    required this.funcao,
    this.celular,
    this.email,
    required this.senha,
    required this.logado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_usuario'] = Variable<int>(idUsuario);
    if (!nullToAbsent || matricula != null) {
      map['matricula'] = Variable<String>(matricula);
    }
    map['nome'] = Variable<String>(nome);
    map['funcao'] = Variable<String>(funcao);
    if (!nullToAbsent || celular != null) {
      map['celular'] = Variable<String>(celular);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['senha'] = Variable<String>(senha);
    map['logado'] = Variable<bool>(logado);
    return map;
  }

  UsuariosCompanion toCompanion(bool nullToAbsent) {
    return UsuariosCompanion(
      idUsuario: Value(idUsuario),
      matricula: matricula == null && nullToAbsent
          ? const Value.absent()
          : Value(matricula),
      nome: Value(nome),
      funcao: Value(funcao),
      celular: celular == null && nullToAbsent
          ? const Value.absent()
          : Value(celular),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      senha: Value(senha),
      logado: Value(logado),
    );
  }

  factory Usuario.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Usuario(
      idUsuario: serializer.fromJson<int>(json['idUsuario']),
      matricula: serializer.fromJson<String?>(json['matricula']),
      nome: serializer.fromJson<String>(json['nome']),
      funcao: serializer.fromJson<String>(json['funcao']),
      celular: serializer.fromJson<String?>(json['celular']),
      email: serializer.fromJson<String?>(json['email']),
      senha: serializer.fromJson<String>(json['senha']),
      logado: serializer.fromJson<bool>(json['logado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idUsuario': serializer.toJson<int>(idUsuario),
      'matricula': serializer.toJson<String?>(matricula),
      'nome': serializer.toJson<String>(nome),
      'funcao': serializer.toJson<String>(funcao),
      'celular': serializer.toJson<String?>(celular),
      'email': serializer.toJson<String?>(email),
      'senha': serializer.toJson<String>(senha),
      'logado': serializer.toJson<bool>(logado),
    };
  }

  Usuario copyWith({
    int? idUsuario,
    Value<String?> matricula = const Value.absent(),
    String? nome,
    String? funcao,
    Value<String?> celular = const Value.absent(),
    Value<String?> email = const Value.absent(),
    String? senha,
    bool? logado,
  }) => Usuario(
    idUsuario: idUsuario ?? this.idUsuario,
    matricula: matricula.present ? matricula.value : this.matricula,
    nome: nome ?? this.nome,
    funcao: funcao ?? this.funcao,
    celular: celular.present ? celular.value : this.celular,
    email: email.present ? email.value : this.email,
    senha: senha ?? this.senha,
    logado: logado ?? this.logado,
  );
  Usuario copyWithCompanion(UsuariosCompanion data) {
    return Usuario(
      idUsuario: data.idUsuario.present ? data.idUsuario.value : this.idUsuario,
      matricula: data.matricula.present ? data.matricula.value : this.matricula,
      nome: data.nome.present ? data.nome.value : this.nome,
      funcao: data.funcao.present ? data.funcao.value : this.funcao,
      celular: data.celular.present ? data.celular.value : this.celular,
      email: data.email.present ? data.email.value : this.email,
      senha: data.senha.present ? data.senha.value : this.senha,
      logado: data.logado.present ? data.logado.value : this.logado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Usuario(')
          ..write('idUsuario: $idUsuario, ')
          ..write('matricula: $matricula, ')
          ..write('nome: $nome, ')
          ..write('funcao: $funcao, ')
          ..write('celular: $celular, ')
          ..write('email: $email, ')
          ..write('senha: $senha, ')
          ..write('logado: $logado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idUsuario,
    matricula,
    nome,
    funcao,
    celular,
    email,
    senha,
    logado,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Usuario &&
          other.idUsuario == this.idUsuario &&
          other.matricula == this.matricula &&
          other.nome == this.nome &&
          other.funcao == this.funcao &&
          other.celular == this.celular &&
          other.email == this.email &&
          other.senha == this.senha &&
          other.logado == this.logado);
}

class UsuariosCompanion extends UpdateCompanion<Usuario> {
  final Value<int> idUsuario;
  final Value<String?> matricula;
  final Value<String> nome;
  final Value<String> funcao;
  final Value<String?> celular;
  final Value<String?> email;
  final Value<String> senha;
  final Value<bool> logado;
  const UsuariosCompanion({
    this.idUsuario = const Value.absent(),
    this.matricula = const Value.absent(),
    this.nome = const Value.absent(),
    this.funcao = const Value.absent(),
    this.celular = const Value.absent(),
    this.email = const Value.absent(),
    this.senha = const Value.absent(),
    this.logado = const Value.absent(),
  });
  UsuariosCompanion.insert({
    this.idUsuario = const Value.absent(),
    this.matricula = const Value.absent(),
    required String nome,
    required String funcao,
    this.celular = const Value.absent(),
    this.email = const Value.absent(),
    required String senha,
    this.logado = const Value.absent(),
  }) : nome = Value(nome),
       funcao = Value(funcao),
       senha = Value(senha);
  static Insertable<Usuario> custom({
    Expression<int>? idUsuario,
    Expression<String>? matricula,
    Expression<String>? nome,
    Expression<String>? funcao,
    Expression<String>? celular,
    Expression<String>? email,
    Expression<String>? senha,
    Expression<bool>? logado,
  }) {
    return RawValuesInsertable({
      if (idUsuario != null) 'id_usuario': idUsuario,
      if (matricula != null) 'matricula': matricula,
      if (nome != null) 'nome': nome,
      if (funcao != null) 'funcao': funcao,
      if (celular != null) 'celular': celular,
      if (email != null) 'email': email,
      if (senha != null) 'senha': senha,
      if (logado != null) 'logado': logado,
    });
  }

  UsuariosCompanion copyWith({
    Value<int>? idUsuario,
    Value<String?>? matricula,
    Value<String>? nome,
    Value<String>? funcao,
    Value<String?>? celular,
    Value<String?>? email,
    Value<String>? senha,
    Value<bool>? logado,
  }) {
    return UsuariosCompanion(
      idUsuario: idUsuario ?? this.idUsuario,
      matricula: matricula ?? this.matricula,
      nome: nome ?? this.nome,
      funcao: funcao ?? this.funcao,
      celular: celular ?? this.celular,
      email: email ?? this.email,
      senha: senha ?? this.senha,
      logado: logado ?? this.logado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idUsuario.present) {
      map['id_usuario'] = Variable<int>(idUsuario.value);
    }
    if (matricula.present) {
      map['matricula'] = Variable<String>(matricula.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (funcao.present) {
      map['funcao'] = Variable<String>(funcao.value);
    }
    if (celular.present) {
      map['celular'] = Variable<String>(celular.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (senha.present) {
      map['senha'] = Variable<String>(senha.value);
    }
    if (logado.present) {
      map['logado'] = Variable<bool>(logado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsuariosCompanion(')
          ..write('idUsuario: $idUsuario, ')
          ..write('matricula: $matricula, ')
          ..write('nome: $nome, ')
          ..write('funcao: $funcao, ')
          ..write('celular: $celular, ')
          ..write('email: $email, ')
          ..write('senha: $senha, ')
          ..write('logado: $logado')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SalasTable salas = $SalasTable(this);
  late final $CursosTable cursos = $CursosTable(this);
  late final $ReservasTable reservas = $ReservasTable(this);
  late final $UsuariosTable usuarios = $UsuariosTable(this);
  late final UsuariosDao usuariosDao = UsuariosDao(this as AppDatabase);
  late final SalasDao salasDao = SalasDao(this as AppDatabase);
  late final CursosDao cursosDao = CursosDao(this as AppDatabase);
  late final ReservasDao reservasDao = ReservasDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    salas,
    cursos,
    reservas,
    usuarios,
  ];
}

typedef $$SalasTableCreateCompanionBuilder =
    SalasCompanion Function({
      Value<int> id,
      required String nome,
      required String numero,
      required int capacidade,
      required String recursos,
      required String localizacao,
      Value<bool> disponivel,
    });
typedef $$SalasTableUpdateCompanionBuilder =
    SalasCompanion Function({
      Value<int> id,
      Value<String> nome,
      Value<String> numero,
      Value<int> capacidade,
      Value<String> recursos,
      Value<String> localizacao,
      Value<bool> disponivel,
    });

final class $$SalasTableReferences
    extends BaseReferences<_$AppDatabase, $SalasTable, Sala> {
  $$SalasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ReservasTable, List<Reserva>> _reservasRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.reservas,
    aliasName: $_aliasNameGenerator(db.salas.id, db.reservas.idSala),
  );

  $$ReservasTableProcessedTableManager get reservasRefs {
    final manager = $$ReservasTableTableManager(
      $_db,
      $_db.reservas,
    ).filter((f) => f.idSala.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_reservasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SalasTableFilterComposer extends Composer<_$AppDatabase, $SalasTable> {
  $$SalasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get capacidade => $composableBuilder(
    column: $table.capacidade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recursos => $composableBuilder(
    column: $table.recursos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localizacao => $composableBuilder(
    column: $table.localizacao,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get disponivel => $composableBuilder(
    column: $table.disponivel,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> reservasRefs(
    Expression<bool> Function($$ReservasTableFilterComposer f) f,
  ) {
    final $$ReservasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reservas,
      getReferencedColumn: (t) => t.idSala,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReservasTableFilterComposer(
            $db: $db,
            $table: $db.reservas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SalasTableOrderingComposer
    extends Composer<_$AppDatabase, $SalasTable> {
  $$SalasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get capacidade => $composableBuilder(
    column: $table.capacidade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recursos => $composableBuilder(
    column: $table.recursos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localizacao => $composableBuilder(
    column: $table.localizacao,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get disponivel => $composableBuilder(
    column: $table.disponivel,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SalasTableAnnotationComposer
    extends Composer<_$AppDatabase, $SalasTable> {
  $$SalasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get numero =>
      $composableBuilder(column: $table.numero, builder: (column) => column);

  GeneratedColumn<int> get capacidade => $composableBuilder(
    column: $table.capacidade,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recursos =>
      $composableBuilder(column: $table.recursos, builder: (column) => column);

  GeneratedColumn<String> get localizacao => $composableBuilder(
    column: $table.localizacao,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get disponivel => $composableBuilder(
    column: $table.disponivel,
    builder: (column) => column,
  );

  Expression<T> reservasRefs<T extends Object>(
    Expression<T> Function($$ReservasTableAnnotationComposer a) f,
  ) {
    final $$ReservasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reservas,
      getReferencedColumn: (t) => t.idSala,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReservasTableAnnotationComposer(
            $db: $db,
            $table: $db.reservas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SalasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SalasTable,
          Sala,
          $$SalasTableFilterComposer,
          $$SalasTableOrderingComposer,
          $$SalasTableAnnotationComposer,
          $$SalasTableCreateCompanionBuilder,
          $$SalasTableUpdateCompanionBuilder,
          (Sala, $$SalasTableReferences),
          Sala,
          PrefetchHooks Function({bool reservasRefs})
        > {
  $$SalasTableTableManager(_$AppDatabase db, $SalasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<String> numero = const Value.absent(),
                Value<int> capacidade = const Value.absent(),
                Value<String> recursos = const Value.absent(),
                Value<String> localizacao = const Value.absent(),
                Value<bool> disponivel = const Value.absent(),
              }) => SalasCompanion(
                id: id,
                nome: nome,
                numero: numero,
                capacidade: capacidade,
                recursos: recursos,
                localizacao: localizacao,
                disponivel: disponivel,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nome,
                required String numero,
                required int capacidade,
                required String recursos,
                required String localizacao,
                Value<bool> disponivel = const Value.absent(),
              }) => SalasCompanion.insert(
                id: id,
                nome: nome,
                numero: numero,
                capacidade: capacidade,
                recursos: recursos,
                localizacao: localizacao,
                disponivel: disponivel,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$SalasTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({reservasRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (reservasRefs) db.reservas],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (reservasRefs)
                    await $_getPrefetchedData<Sala, $SalasTable, Reserva>(
                      currentTable: table,
                      referencedTable: $$SalasTableReferences
                          ._reservasRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SalasTableReferences(db, table, p0).reservasRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.idSala == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SalasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SalasTable,
      Sala,
      $$SalasTableFilterComposer,
      $$SalasTableOrderingComposer,
      $$SalasTableAnnotationComposer,
      $$SalasTableCreateCompanionBuilder,
      $$SalasTableUpdateCompanionBuilder,
      (Sala, $$SalasTableReferences),
      Sala,
      PrefetchHooks Function({bool reservasRefs})
    >;
typedef $$CursosTableCreateCompanionBuilder =
    CursosCompanion Function({
      Value<int> id,
      required String nomeCurso,
      required DateTime dataInicio,
      required DateTime dataFim,
      required String turno,
      required String professor,
      Value<String?> codigoSIG,
    });
typedef $$CursosTableUpdateCompanionBuilder =
    CursosCompanion Function({
      Value<int> id,
      Value<String> nomeCurso,
      Value<DateTime> dataInicio,
      Value<DateTime> dataFim,
      Value<String> turno,
      Value<String> professor,
      Value<String?> codigoSIG,
    });

final class $$CursosTableReferences
    extends BaseReferences<_$AppDatabase, $CursosTable, Curso> {
  $$CursosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ReservasTable, List<Reserva>> _reservasRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.reservas,
    aliasName: $_aliasNameGenerator(db.cursos.id, db.reservas.idCurso),
  );

  $$ReservasTableProcessedTableManager get reservasRefs {
    final manager = $$ReservasTableTableManager(
      $_db,
      $_db.reservas,
    ).filter((f) => f.idCurso.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_reservasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CursosTableFilterComposer
    extends Composer<_$AppDatabase, $CursosTable> {
  $$CursosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nomeCurso => $composableBuilder(
    column: $table.nomeCurso,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dataInicio => $composableBuilder(
    column: $table.dataInicio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dataFim => $composableBuilder(
    column: $table.dataFim,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get turno => $composableBuilder(
    column: $table.turno,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get professor => $composableBuilder(
    column: $table.professor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get codigoSIG => $composableBuilder(
    column: $table.codigoSIG,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> reservasRefs(
    Expression<bool> Function($$ReservasTableFilterComposer f) f,
  ) {
    final $$ReservasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reservas,
      getReferencedColumn: (t) => t.idCurso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReservasTableFilterComposer(
            $db: $db,
            $table: $db.reservas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CursosTableOrderingComposer
    extends Composer<_$AppDatabase, $CursosTable> {
  $$CursosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nomeCurso => $composableBuilder(
    column: $table.nomeCurso,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dataInicio => $composableBuilder(
    column: $table.dataInicio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dataFim => $composableBuilder(
    column: $table.dataFim,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get turno => $composableBuilder(
    column: $table.turno,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get professor => $composableBuilder(
    column: $table.professor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get codigoSIG => $composableBuilder(
    column: $table.codigoSIG,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CursosTableAnnotationComposer
    extends Composer<_$AppDatabase, $CursosTable> {
  $$CursosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nomeCurso =>
      $composableBuilder(column: $table.nomeCurso, builder: (column) => column);

  GeneratedColumn<DateTime> get dataInicio => $composableBuilder(
    column: $table.dataInicio,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dataFim =>
      $composableBuilder(column: $table.dataFim, builder: (column) => column);

  GeneratedColumn<String> get turno =>
      $composableBuilder(column: $table.turno, builder: (column) => column);

  GeneratedColumn<String> get professor =>
      $composableBuilder(column: $table.professor, builder: (column) => column);

  GeneratedColumn<String> get codigoSIG =>
      $composableBuilder(column: $table.codigoSIG, builder: (column) => column);

  Expression<T> reservasRefs<T extends Object>(
    Expression<T> Function($$ReservasTableAnnotationComposer a) f,
  ) {
    final $$ReservasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reservas,
      getReferencedColumn: (t) => t.idCurso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReservasTableAnnotationComposer(
            $db: $db,
            $table: $db.reservas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CursosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CursosTable,
          Curso,
          $$CursosTableFilterComposer,
          $$CursosTableOrderingComposer,
          $$CursosTableAnnotationComposer,
          $$CursosTableCreateCompanionBuilder,
          $$CursosTableUpdateCompanionBuilder,
          (Curso, $$CursosTableReferences),
          Curso,
          PrefetchHooks Function({bool reservasRefs})
        > {
  $$CursosTableTableManager(_$AppDatabase db, $CursosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CursosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CursosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CursosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nomeCurso = const Value.absent(),
                Value<DateTime> dataInicio = const Value.absent(),
                Value<DateTime> dataFim = const Value.absent(),
                Value<String> turno = const Value.absent(),
                Value<String> professor = const Value.absent(),
                Value<String?> codigoSIG = const Value.absent(),
              }) => CursosCompanion(
                id: id,
                nomeCurso: nomeCurso,
                dataInicio: dataInicio,
                dataFim: dataFim,
                turno: turno,
                professor: professor,
                codigoSIG: codigoSIG,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nomeCurso,
                required DateTime dataInicio,
                required DateTime dataFim,
                required String turno,
                required String professor,
                Value<String?> codigoSIG = const Value.absent(),
              }) => CursosCompanion.insert(
                id: id,
                nomeCurso: nomeCurso,
                dataInicio: dataInicio,
                dataFim: dataFim,
                turno: turno,
                professor: professor,
                codigoSIG: codigoSIG,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$CursosTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({reservasRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (reservasRefs) db.reservas],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (reservasRefs)
                    await $_getPrefetchedData<Curso, $CursosTable, Reserva>(
                      currentTable: table,
                      referencedTable: $$CursosTableReferences
                          ._reservasRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CursosTableReferences(db, table, p0).reservasRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.idCurso == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CursosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CursosTable,
      Curso,
      $$CursosTableFilterComposer,
      $$CursosTableOrderingComposer,
      $$CursosTableAnnotationComposer,
      $$CursosTableCreateCompanionBuilder,
      $$CursosTableUpdateCompanionBuilder,
      (Curso, $$CursosTableReferences),
      Curso,
      PrefetchHooks Function({bool reservasRefs})
    >;
typedef $$ReservasTableCreateCompanionBuilder =
    ReservasCompanion Function({
      Value<int> idReserva,
      required int idCurso,
      required int idSala,
    });
typedef $$ReservasTableUpdateCompanionBuilder =
    ReservasCompanion Function({
      Value<int> idReserva,
      Value<int> idCurso,
      Value<int> idSala,
    });

final class $$ReservasTableReferences
    extends BaseReferences<_$AppDatabase, $ReservasTable, Reserva> {
  $$ReservasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CursosTable _idCursoTable(_$AppDatabase db) => db.cursos.createAlias(
    $_aliasNameGenerator(db.reservas.idCurso, db.cursos.id),
  );

  $$CursosTableProcessedTableManager get idCurso {
    final $_column = $_itemColumn<int>('id_curso')!;

    final manager = $$CursosTableTableManager(
      $_db,
      $_db.cursos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idCursoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SalasTable _idSalaTable(_$AppDatabase db) => db.salas.createAlias(
    $_aliasNameGenerator(db.reservas.idSala, db.salas.id),
  );

  $$SalasTableProcessedTableManager get idSala {
    final $_column = $_itemColumn<int>('id_sala')!;

    final manager = $$SalasTableTableManager(
      $_db,
      $_db.salas,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idSalaTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReservasTableFilterComposer
    extends Composer<_$AppDatabase, $ReservasTable> {
  $$ReservasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idReserva => $composableBuilder(
    column: $table.idReserva,
    builder: (column) => ColumnFilters(column),
  );

  $$CursosTableFilterComposer get idCurso {
    final $$CursosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCurso,
      referencedTable: $db.cursos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CursosTableFilterComposer(
            $db: $db,
            $table: $db.cursos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SalasTableFilterComposer get idSala {
    final $$SalasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSala,
      referencedTable: $db.salas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalasTableFilterComposer(
            $db: $db,
            $table: $db.salas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReservasTableOrderingComposer
    extends Composer<_$AppDatabase, $ReservasTable> {
  $$ReservasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idReserva => $composableBuilder(
    column: $table.idReserva,
    builder: (column) => ColumnOrderings(column),
  );

  $$CursosTableOrderingComposer get idCurso {
    final $$CursosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCurso,
      referencedTable: $db.cursos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CursosTableOrderingComposer(
            $db: $db,
            $table: $db.cursos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SalasTableOrderingComposer get idSala {
    final $$SalasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSala,
      referencedTable: $db.salas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalasTableOrderingComposer(
            $db: $db,
            $table: $db.salas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReservasTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReservasTable> {
  $$ReservasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idReserva =>
      $composableBuilder(column: $table.idReserva, builder: (column) => column);

  $$CursosTableAnnotationComposer get idCurso {
    final $$CursosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCurso,
      referencedTable: $db.cursos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CursosTableAnnotationComposer(
            $db: $db,
            $table: $db.cursos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SalasTableAnnotationComposer get idSala {
    final $$SalasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idSala,
      referencedTable: $db.salas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalasTableAnnotationComposer(
            $db: $db,
            $table: $db.salas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReservasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReservasTable,
          Reserva,
          $$ReservasTableFilterComposer,
          $$ReservasTableOrderingComposer,
          $$ReservasTableAnnotationComposer,
          $$ReservasTableCreateCompanionBuilder,
          $$ReservasTableUpdateCompanionBuilder,
          (Reserva, $$ReservasTableReferences),
          Reserva,
          PrefetchHooks Function({bool idCurso, bool idSala})
        > {
  $$ReservasTableTableManager(_$AppDatabase db, $ReservasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReservasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReservasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReservasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idReserva = const Value.absent(),
                Value<int> idCurso = const Value.absent(),
                Value<int> idSala = const Value.absent(),
              }) => ReservasCompanion(
                idReserva: idReserva,
                idCurso: idCurso,
                idSala: idSala,
              ),
          createCompanionCallback:
              ({
                Value<int> idReserva = const Value.absent(),
                required int idCurso,
                required int idSala,
              }) => ReservasCompanion.insert(
                idReserva: idReserva,
                idCurso: idCurso,
                idSala: idSala,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReservasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idCurso = false, idSala = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idCurso) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idCurso,
                                referencedTable: $$ReservasTableReferences
                                    ._idCursoTable(db),
                                referencedColumn: $$ReservasTableReferences
                                    ._idCursoTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (idSala) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idSala,
                                referencedTable: $$ReservasTableReferences
                                    ._idSalaTable(db),
                                referencedColumn: $$ReservasTableReferences
                                    ._idSalaTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ReservasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReservasTable,
      Reserva,
      $$ReservasTableFilterComposer,
      $$ReservasTableOrderingComposer,
      $$ReservasTableAnnotationComposer,
      $$ReservasTableCreateCompanionBuilder,
      $$ReservasTableUpdateCompanionBuilder,
      (Reserva, $$ReservasTableReferences),
      Reserva,
      PrefetchHooks Function({bool idCurso, bool idSala})
    >;
typedef $$UsuariosTableCreateCompanionBuilder =
    UsuariosCompanion Function({
      Value<int> idUsuario,
      Value<String?> matricula,
      required String nome,
      required String funcao,
      Value<String?> celular,
      Value<String?> email,
      required String senha,
      Value<bool> logado,
    });
typedef $$UsuariosTableUpdateCompanionBuilder =
    UsuariosCompanion Function({
      Value<int> idUsuario,
      Value<String?> matricula,
      Value<String> nome,
      Value<String> funcao,
      Value<String?> celular,
      Value<String?> email,
      Value<String> senha,
      Value<bool> logado,
    });

class $$UsuariosTableFilterComposer
    extends Composer<_$AppDatabase, $UsuariosTable> {
  $$UsuariosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idUsuario => $composableBuilder(
    column: $table.idUsuario,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get matricula => $composableBuilder(
    column: $table.matricula,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get funcao => $composableBuilder(
    column: $table.funcao,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get celular => $composableBuilder(
    column: $table.celular,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get senha => $composableBuilder(
    column: $table.senha,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get logado => $composableBuilder(
    column: $table.logado,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UsuariosTableOrderingComposer
    extends Composer<_$AppDatabase, $UsuariosTable> {
  $$UsuariosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idUsuario => $composableBuilder(
    column: $table.idUsuario,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get matricula => $composableBuilder(
    column: $table.matricula,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get funcao => $composableBuilder(
    column: $table.funcao,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get celular => $composableBuilder(
    column: $table.celular,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get senha => $composableBuilder(
    column: $table.senha,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get logado => $composableBuilder(
    column: $table.logado,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsuariosTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsuariosTable> {
  $$UsuariosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idUsuario =>
      $composableBuilder(column: $table.idUsuario, builder: (column) => column);

  GeneratedColumn<String> get matricula =>
      $composableBuilder(column: $table.matricula, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get funcao =>
      $composableBuilder(column: $table.funcao, builder: (column) => column);

  GeneratedColumn<String> get celular =>
      $composableBuilder(column: $table.celular, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get senha =>
      $composableBuilder(column: $table.senha, builder: (column) => column);

  GeneratedColumn<bool> get logado =>
      $composableBuilder(column: $table.logado, builder: (column) => column);
}

class $$UsuariosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsuariosTable,
          Usuario,
          $$UsuariosTableFilterComposer,
          $$UsuariosTableOrderingComposer,
          $$UsuariosTableAnnotationComposer,
          $$UsuariosTableCreateCompanionBuilder,
          $$UsuariosTableUpdateCompanionBuilder,
          (Usuario, BaseReferences<_$AppDatabase, $UsuariosTable, Usuario>),
          Usuario,
          PrefetchHooks Function()
        > {
  $$UsuariosTableTableManager(_$AppDatabase db, $UsuariosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsuariosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsuariosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsuariosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idUsuario = const Value.absent(),
                Value<String?> matricula = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<String> funcao = const Value.absent(),
                Value<String?> celular = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String> senha = const Value.absent(),
                Value<bool> logado = const Value.absent(),
              }) => UsuariosCompanion(
                idUsuario: idUsuario,
                matricula: matricula,
                nome: nome,
                funcao: funcao,
                celular: celular,
                email: email,
                senha: senha,
                logado: logado,
              ),
          createCompanionCallback:
              ({
                Value<int> idUsuario = const Value.absent(),
                Value<String?> matricula = const Value.absent(),
                required String nome,
                required String funcao,
                Value<String?> celular = const Value.absent(),
                Value<String?> email = const Value.absent(),
                required String senha,
                Value<bool> logado = const Value.absent(),
              }) => UsuariosCompanion.insert(
                idUsuario: idUsuario,
                matricula: matricula,
                nome: nome,
                funcao: funcao,
                celular: celular,
                email: email,
                senha: senha,
                logado: logado,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsuariosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsuariosTable,
      Usuario,
      $$UsuariosTableFilterComposer,
      $$UsuariosTableOrderingComposer,
      $$UsuariosTableAnnotationComposer,
      $$UsuariosTableCreateCompanionBuilder,
      $$UsuariosTableUpdateCompanionBuilder,
      (Usuario, BaseReferences<_$AppDatabase, $UsuariosTable, Usuario>),
      Usuario,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SalasTableTableManager get salas =>
      $$SalasTableTableManager(_db, _db.salas);
  $$CursosTableTableManager get cursos =>
      $$CursosTableTableManager(_db, _db.cursos);
  $$ReservasTableTableManager get reservas =>
      $$ReservasTableTableManager(_db, _db.reservas);
  $$UsuariosTableTableManager get usuarios =>
      $$UsuariosTableTableManager(_db, _db.usuarios);
}
