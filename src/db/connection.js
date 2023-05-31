import * as pg from 'pg';
import Sequelize from 'sequelize';

export const sequelize = new Sequelize(
    'piezas', // * 1. Nombre de la base de datos
    'postgres', // * 2. Usuario de la base de datos
    '1234.', // * 3. Contraseña de la base de datos,
    {
        host: 'localhost', // * 4. Host de la base de datos
        port: 5432, // * 5. Puerto de la base de datos
        dialect: 'postgres', // * 6. Dialecto de la base de datos (que motor de base de datos vamos a utilizar "mysql", "mariadb", "postgres", "mssql")") 
    }
);