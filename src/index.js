// ? MVC <-- Modelos, Vistas, Controladores

// ? Los modelos son espejos de la base de datos

// ? Vistas (routes) son las interfaces de usuario (nos permiten el acceso a la funcionalidad de la aplicación)

// ? Controladores son los que se encargan de la lógica de la aplicación

//*  JSON --> JavaScript Object Notation

// *    "animal": {
// *        "nombre": "Firulais",
// *        "edad": 5,
// *        "tipo": "perro"
// * 
// *       }


// TODO: INICIALIZACIÓN DE LA APLICACIÓN

// * 1. Importar express
import express from 'express';
import piezasRoutes from './routes/piezas.routes.js';
import * as pg from 'pg';
import {sequelize} from './db/connection.js';

async function main(){

    try {
        await sequelize.sync({force: false});
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');
    } catch (error) {
        console.log(error);
    }
    const app = express(); // * 2. Inicializar el servidor express
        app.disable('x-powered-by');
        app.keepAliveTimeout = 2 * 1000;
        app.use(express.json()); // * 3. Habilitar el uso de JSON en express
        app.use(express.urlencoded({extended: false})); // * 4. Habilitar el uso de o no de parámetros en la URL
        app.use(piezasRoutes); // * 5. Habilitar el uso de las rutas de piezas
        app.listen(3000); // * 5. Inicializar el servidor en el puerto 3000
        console.log(`
            Server on port 3000

            http://localhost:3000
            
            to stop the server press ctrl + c
            `)
    
}

main(); // * 6. Ejecutar la función main