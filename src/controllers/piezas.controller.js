import { response } from 'express';
import modelosInit from '../models/init-models.js';
import {sequelize} from 'sequelize';

let modelos = modelosInit(sequelize);

export const pieces = async (req, res) => {
    let data = await modelos.piezas.findAll();
    res.json({
        msg: 'Lista de piezas',
        data: data
    })
}

export const createPieces = async (req, res) => {
    let {id_pieza, nombre, color, precio, categoria_is, precio_dinero} = req.body;
    try{
        response = await modelos.piezas.create({
            id_pieza: id_pieza,
            nombre: nombre,
            color: color,
            precio: precio,
            categoria_is: categoria_is,
            precio_dinero: precio_dinero
        });
    }