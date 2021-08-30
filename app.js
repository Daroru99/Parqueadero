const express = require('express');
const path = require('path');
const morgan = require('morgan');
const mysql = require('mysql');
const twig = require('twig');
const myConnection = require('express-myconnection');

const app = express();

//import routes
const customerRoutes = require('./routes/customer');
const exp = require('constants');
const { urlencoded } = require('body-parser');

//settings
app.set('port', process.env.PORT || 3000);
app.set('view engine', 'html');
app.engine('html', twig.__express);
app.set('views', 'views');
app.set('views', path.join(__dirname, 'views'));


//middlewares
app.use(morgan('dev'));
app.use(myConnection(mysql, {
    host: 'localhost',
    user: 'root',
    password: '',
    port: 3306,
    database: 'parqueadero'
}, 'single'));

app.use(express.urlencoded({ extended: false }));

//routes
app.use('/', customerRoutes);

//static files
app.use(express.static(path.join(__dirname, 'public')));

//start server
app.listen(app.get('port'), () => {
    console.log('Server on port 3000');
});
// const express = require('express');
// const app = express();
// const twig = require('twig');
// const bodyParser = require('body-parser');

// const connection = require('./config/database');

// app.set('view engine', 'html');
// app.engine('html', twig.__express);
// app.set('views', 'views');

// app.use(bodyParser.urlencoded({ extended: false }));
// app.use(express.static(__dirname + '/public'));
// app.use(express('views'));


// app.get('/', (req, res) => {
//     connection.query('SELECT * FROM `registro`', (err, results) => {
//         if (err) throw err;
//         res.render('index', {
//             registro: results
//         });
//     });
// });

// //insert
// app.post('/', (req, res) => {
//     const codRegistro = req.body.codRegistro;
//     const nombre = req.body.nombre;
//     const cedula = req.body.cedula;
//     const vehiculo = req.body.vehiculo;
//     const placa = req.body.placa;
//     const fotografia = req.body.fotografia;
//     const cilindraje = req.body.cilindraje;
//     const tiempos = req.body.tiempos;
//     const modelo = req.body.modelo;
//     const numeroPuertas = req.body.numeroPuertas;
//     const serie = req.body.serie;
//     const marca = req.body.marca;

//     const post = {
//         codRegistro: codRegistro,
//         nombre: nombre,
//         cedula: cedula,
//         vehiculo: vehiculo,
//         placa: placa,
//         fotografia: fotografia,
//         cilindraje: cilindraje,
//         tiempos: tiempos,
//         modelo: modelo,
//         numeroPuertas: numeroPuertas,
//         serie: serie,
//         marca: marca,
//     }
//     connection.query('INSERT INTO `registro` ', post, (err) => {
//         if (err) throw err;
//         console.log('Dato insertado');
//         return res.redirect('/');
//     });
// });

// //update
// // app.post('/edit/:id', (req, res) => {
// //     const update_title = req.body.title;
// //     const update_content = req.body.content;
// //     const update_author_name = req.body.author_name;
// //     const userId = req.params.id;
// //     connection.query('UPDATE `posts` SET title = ?, content = ?, author = ? WHERE id = ?', [update_title, update_content, update_author_name, userId], (err, results) => {
// //         if (err) throw err;
// //         if (results.changedRows === 1) {
// //             console.log('Post Updated');
// //             return res.redirect('/');
// //         }
// //     });
// // });

// // app.use('/', (req, res) => {
// //     res.status(404).send('<h1>404 Page Not Found!</h1>');
// // });

// //conection successful
// connection.connect((err) => {
//     if (err) throw err;
//     app.listen(3000);
// });