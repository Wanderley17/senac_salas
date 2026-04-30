import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:senac_salas/database/app_database.dart';
import 'package:senac_salas/database/daos/salas_dao.dart';
import 'package:senac_salas/telas/cadastro_curso.dart';
import 'package:senac_salas/telas/cadastro_sala.dart';

class TelaSalas extends StatefulWidget {
  const TelaSalas({super.key});

  @override
  State<TelaSalas> createState() => _TelaSalasState();
}

class _TelaSalasState extends State<TelaSalas> {
  AppDatabase db = AppDatabase();
  late SalasDao salasDao = SalasDao(db);

  Future<void> removerSala(Sala sala) async {
    int result = await salasDao.removerSala(id: sala.id);

    if (result > 0) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Sala ${sala.nome} removida com sucesso.",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.amber,
            content: Text(
              "Sala ${sala.nome} não removida.",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    }

    if (mounted) Navigator.of(context).pop();
  }

  Future<void> abrirDialogoRemover(Sala sala) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Remover?'),
          content: Text('Deseja remover a sala ${sala.nome} ?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async => removerSala(sala),
              child: Text('Sim'),
            ),
          ],
        );
      },
    );
  }

  void adicionarSala() => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CadastroSala()),
  );

  void adicionarCurso() => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CadastroCurso()),
  );

  void mudarDisponibilidadeSala(Sala sala, bool status) async {
    AppDatabase db = AppDatabase();
    SalasDao salasDao = SalasDao(db);

    int result = await salasDao.atualizarSala(
      id: sala.id,
      sala: SalasCompanion(
        id: d.Value(sala.id),
        capacidade: d.Value(sala.capacidade),
        localizacao: d.Value(sala.localizacao),
        nome: d.Value(sala.nome),
        numero: d.Value(sala.numero),
        recursos: d.Value(sala.recursos),
        disponivel: d.Value(status),
      ),
    );

    if (result > 0) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Disponibilidade alterada."),
            showCloseIcon: true,
          ),
        );
      }
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppDatabase db = AppDatabase();
    SalasDao salasDao = SalasDao(db);

    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<List<Sala>>(
          stream: salasDao.streamOfSalas(),
          builder: (context, snapshot) {
            //Quando se está esperando uma alteração no banco
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: const CircularProgressIndicator());
            }
            //Verifica se a aplicação apresentou ero ao carregar as salas
            if (snapshot.hasError) {
              return Center(child: Text("Houve um erro ao carregar as salas"));
            }
            //Armazena a lista de salas em uma variável
            List<Sala> listOfSalas = snapshot.data ?? [];

            //Verifica se a lista de salas está vazia
            if (listOfSalas.isEmpty) {
              return Center(child: Text("Nenhuma sala cadastrada no sistema."));
            } 

            return ListView.builder(
              itemCount: listOfSalas.length,
              itemBuilder: (context, index) {
                final sala = listOfSalas[index];

                return Card(
                  elevation: 2,
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.indigo, width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {},
                        visualDensity: VisualDensity.comfortable,
                        leading: Icon(Icons.meeting_room, color: Colors.indigo),
                        title: Text(
                          sala.nome,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          sala.localizacao,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                          ),
                        ),
                        trailing: Switch(
                          value: sala.disponivel,
                          onChanged: (value) {
                            mudarDisponibilidadeSala(sala, value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          spacing: 20,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit, color: Colors.indigo),
                            ),
                            IconButton(
                              onPressed: () async =>abrirDialogoRemover(sala),
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                            SizedBox.square(dimension: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
