import 'package:flutter/material.dart';

class Usuario {
  final String id;
  final String nombre;
  final String correo;
  final String contrasena;
  List<String> favoritos;
  List<String> leidos;

  Usuario({
    required this.id,
    required this.nombre,
    required this.correo,
    required this.contrasena,
    required this.favoritos,
    required this.leidos,
  });
}

class Libro {
  final String id;
  final String titulo;
  final String autor;
  final String genero;
  final String descripcion;
  final String imagen;

  Libro({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.genero,
    required this.descripcion,
    required this.imagen,
  });
}

List<Usuario> mockUsuarios = [
  Usuario(
    id: 'u1',
    nombre: 'Juan Pérez',
    correo: 'juan@email.com',
    contrasena: 'password123',
    favoritos: ['l1', 'l3'],
    leidos: ['l1'],
  )
];

List<Libro> mockLibros = [
  Libro(
    id: 'l1',
    titulo: 'Don Quijote de la Mancha',
    autor: 'Miguel de Cervantes',
    genero: 'Novela',
    descripcion: 'Las aventuras del ingenioso hidalgo Don Quijote y su fiel escudero Sancho Panza.',
    imagen: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=200',
  ),
  Libro(
    id: 'l2',
    titulo: 'Cien años de soledad',
    autor: 'Gabriel García Márquez',
    genero: 'Realismo Mágico',
    descripcion: 'La historia de la familia Buendía a lo largo de siete generaciones en el pueblo ficticio de Macondo.',
    imagen: 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?q=80&w=200',
  ),
  Libro(
    id: 'l3',
    titulo: '1984',
    autor: 'George Orwell',
    genero: 'Distopía',
    descripcion: 'Una novela política de ficción distópica que introduce el concepto del Gran Hermano.',
    imagen: 'https://images.unsplash.com/photo-1512820790803-83ca734da794?q=80&w=200',
  ),
  Libro(
    id: 'l4',
    titulo: 'El Principito',
    autor: 'Antoine de Saint-Exupéry',
    genero: 'Infantil / Filosofía',
    descripcion: 'Un piloto varado en el desierto conoce a un pequeño príncipe que viaja de planeta en planeta.',
    imagen: 'https://images.unsplash.com/photo-1512820790803-83ca734da794?q=80&w=200',
  ),
];

Usuario? usuarioActual;

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _correoController = TextEditingController();
  final _contrasenaController = TextEditingController();

  void _iniciarSesion() {
    final correo = _correoController.text.trim();
    final contrasena = _contrasenaController.text;

    if (correo.isEmpty || contrasena.isEmpty) {
      _mostrarError('Por favor, rellene todos los campos requeridos.');
      return;
    }

    try {
      final user = mockUsuarios.firstWhere(
        (u) => u.correo == correo && u.contrasena == contrasena,
      );
      
      usuarioActual = user;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CatalogScreen()),
      );
    } catch (e) {
      _mostrarError('Credenciales incorrectas o usuario no registrado.');
    }
  }

  void _mostrarError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bookly - Iniciar Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.menu_book, size: 80, color: Colors.indigo),
                const SizedBox(height: 16),
                const Text('¡Bienvenido a Bookly!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 32),
                TextField(
                  controller: _correoController,
                  decoration: const InputDecoration(labelText: 'Correo Electrónico', border: OutlineInputBorder()),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _contrasenaController,
                  decoration: const InputDecoration(labelText: 'Contraseña', border: OutlineInputBorder()),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _iniciarSesion,
                  style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                  child: const Text('Ingresar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                  },
                  child: const Text('¿No tienes cuenta? Regístrate aquí'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _contrasenaController = TextEditingController();

  void _registrarUsuario() {
    final nombre = _nombreController.text.trim();
    final correo = _correoController.text.trim();
    final contrasena = _contrasenaController.text;

    if (nombre.isEmpty || correo.isEmpty || contrasena.isEmpty) {
      _mostrarMsg('Todos los campos son obligatorios.');
      return;
    }

    bool existe = mockUsuarios.any((u) => u.correo == correo);
    if (existe) {
      _mostrarMsg('El correo electrónico ya está registrado.');
      return;
    }

    final nuevoUsuario = Usuario(
      id: 'u${mockUsuarios.length + 1}',
      nombre: nombre,
      correo: correo,
      contrasena: contrasena,
      favoritos: [],
      leidos: [],
    );

    mockUsuarios.add(nuevoUsuario);
    _mostrarMsg('Registro exitoso. Ya puede iniciar sesión.');
    Navigator.pop(context);
  }

  void _mostrarMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro en Bookly')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nombreController, decoration: const InputDecoration(labelText: 'Nombre Completo')),
            const SizedBox(height: 12),
            TextField(controller: _correoController, decoration: const InputDecoration(labelText: 'Correo Electrónico')),
            const SizedBox(height: 12),
            TextField(controller: _contrasenaController, decoration: const InputDecoration(labelText: 'Contraseña'), obscureText: true),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _registrarUsuario,
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              child: const Text('Crear Cuenta'),
            ),
          ],
        ),
      ),
    );
  }
}

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  int _uiIndexSeleccionado = 0;
  String _busquedaQuery = '';

  List<Libro> get _librosFiltrados {
    if (_busquedaQuery.isEmpty) return mockLibros;
    return mockLibros.where((libro) => libro.titulo.toLowerCase().contains(_busquedaQuery.toLowerCase())).toList();
  }

  List<Libro> get _misFavoritos {
    return mockLibros.where((libro) => usuarioActual?.favoritos.contains(libro.id) ?? false).toList();
  }

  List<Libro> get _misLeidos {
    return mockLibros.where((libro) => usuarioActual?.leidos.contains(libro.id) ?? false).toList();
  }

  void _cerrarSesion() {
    usuarioActual = null;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookly - Hola, ${usuarioActual?.nombre ?? "Lector"}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _cerrarSesion,
            tooltip: 'Cerrar Sesión',
          )
        ],
      ),
      body: Column(
        children: [
          if (_uiIndexSeleccionado == 0)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Buscar libro por título...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (val) {
                  setState(() {
                    _busquedaQuery = val;
                  });
                },
              ),
            ),
          
          Expanded(
            child: _construirListaSegmentada(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _uiIndexSeleccionado,
        onTap: (index) {
          setState(() {
            _uiIndexSeleccionado = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Catálogo'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_added), label: 'Leídos'),
        ],
      ),
    );
  }

  Widget _construirListaSegmentada() {
    List<Libro> librosAMostrar;
    String mensajeVacio;

    switch (_uiIndexSeleccionado) {
      case 1:
        librosAMostrar = _misFavoritos;
        mensajeVacio = 'No tienes libros favoritos añadidos.';
        break;
      case 2:
        librosAMostrar = _misLeidos;
        mensajeVacio = 'No has marcado ningún libro como leído.';
        break;
      default:
        librosAMostrar = _librosFiltrados;
        mensajeVacio = 'No se encontraron libros.';
    }

    if (librosAMostrar.isEmpty) {
      return Center(child: Text(mensajeVacio, style: const TextStyle(color: Colors.grey)));
    }

    return ListView.builder(
      itemCount: librosAMostrar.count,
      itemBuilder: (context, index) {
        final libro = librosAMostrar[index];
        final esFav = usuarioActual?.favoritos.contains(libro.id) ?? false;
        final esLeido = usuarioActual?.leidos.contains(libro.id) ?? false;

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListTile(
            leading: Image.network(libro.imagen, width: 50, fit: BoxFit.cover, 
              errorBuilder: (_, __, ___) => const Icon(Icons.book, size: 50),
            ),
            title: Text(libro.titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(libro.autor),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(esFav ? Icons.favorite : Icons.favorite_border, color: esFav ? Colors.red : null),
                  onPressed: () {
                    setState(() {
                      if (esFav) {
                        usuarioActual?.favoritos.remove(libro.id);
                      } else {
                        usuarioActual?.favoritos.add(libro.id);
                      }
                    });
                  },
                ),
                IconButton(
                  icon: Icon(esLeido ? Icons.check_circle : Icons.radio_button_unchecked, color: esLeido ? Colors.green : null),
                  onPressed: () {
                    setState(() {
                      if (esLeido) {
                        usuarioActual?.leidos.remove(libro.id);
                      } else {
                        usuarioActual?.leidos.add(libro.id);
                      }
                    });
                  },
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen(libro: libro)),
              ).then((_) => setState(() {}));
            },
          ),
        );
      },
    );
  }
}

extension on List {
  int get count => length;
}

class DetailScreen extends StatefulWidget {
  final Libro libro;
  const DetailScreen({Key? key, required this.libro}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final libro = widget.libro;
    final esFav = usuarioActual?.favoritos.contains(libro.id) ?? false;
    final esLeido = usuarioActual?.leidos.contains(libro.id) ?? false;

    return Scaffold(
      appBar: AppBar(title: Text(libro.titulo)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(libro.imagen, height: 200, fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(Icons.book, size: 100),
              ),
            ),
            const SizedBox(height: 16),
            Text(libro.titulo, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('Por ${libro.autor}', style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.grey)),
            const SizedBox(height: 8),
            Chip(label: Text(libro.genero), backgroundColor: Colors.indigo.shade100),
            const Divider(height: 32),
            const Text('Descripción', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(libro.descripcion, style: const TextStyle(fontSize: 16, height: 1.4)),
            const Divider(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      if (esFav) {
                        usuarioActual?.favoritos.remove(libro.id);
                      } else {
                        usuarioActual?.favoritos.add(libro.id);
                      }
                    });
                  },
                  icon: Icon(esFav ? Icons.favorite : Icons.favorite_border),
                  label: Text(esFav ? 'Quitar Favorito' : 'Favorito'),
                  style: ElevatedButton.styleFrom(backgroundColor: esFav ? Colors.red.shade400 : null),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      if (esLeido) {
                        usuarioActual?.leidos.remove(libro.id);
                      } else {
                        usuarioActual?.leidos.add(libro.id);
                      }
                    });
                  },
                  icon: Icon(esLeido ? Icons.check_circle : Icons.radio_button_unchecked),
                  label: Text(esLeido ? 'Leído' : 'Marcar Leído'),
                  style: ElevatedButton.styleFrom(backgroundColor: esLeido ? Colors.green.shade400 : null),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
