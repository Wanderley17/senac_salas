import 'package:flutter/material.dart';
import 'package:senac_salas/database/app_database.dart';
import 'package:senac_salas/database/daos/cursos_dao.dart';
import 'package:senac_salas/telas/cadastro_reserva.dart';

class TelaCursos extends StatefulWidget {
  const TelaCursos({super.key});

  @override
  State<TelaCursos> createState() => _TelaCursosState();
}

class _TelaCursosState extends State<TelaCursos> {
  AppDatabase db = AppDatabase();
  late CursosDao cursosDao = CursosDao(db);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  Future<void> removerCurso(Curso curso) async {
    int result = await cursosDao.removerCurso(id: curso.id);

    if (result > 0) {
     if(mounted) {
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "curso ${curso.nomeCurso} removido com sucesso.", 
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
     }
    } else {
       if(mounted) {
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.amber,
          content: Text(
            "curso ${curso.nomeCurso} não removido", 
             style: TextStyle(color: Colors.white),
          ),
        ),
      );
     }
    }

    if(mounted) Navigator.of(context).pop();
  }

  Future<void> abrirDialogoRemover(Curso curso) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Remover?'),
          content: Text('Deseja remover o curso ${curso.nomeCurso} ?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async => removerCurso(curso),
              child: Text('Sim'),
            ),
          ],
        );
      },
    );
  }

  void abrirDialogoReserva(BuildContext context, {required Curso curso}) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            CadastroReservas(curso: curso),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOutQuart;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: cursosDao.streamOfCursos(),
          builder: (context, snapshot) {
            List<Curso> listOfCurso = snapshot.data ?? [];
            
            if (listOfCurso.isEmpty) {
              return Center(child: Text("Nenhum curso cadastrado no sistema."));
            }

            return ListView.builder(
              itemCount: listOfCurso.length,
              itemBuilder: (context, index) {
                final curso = listOfCurso[index];

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
                  child: InkWell(
                    splashColor: Colors.indigo,
                    highlightColor: Colors.blueAccent,
                    onTap: () {
                      abrirDialogoReserva(context, curso: curso);
                    },
                    child: ListTile(
                      visualDensity: VisualDensity.comfortable,
                      leading: Icon(Icons.school, color: Colors.indigo),
                      title: Text(
                        curso.nomeCurso,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        curso.professor,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => abrirDialogoRemover(curso),
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    ),
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
