import {Router} from 'express'



const router = Router(); // * 1. Inicializar el enrutador de express

// * router.get(); // * 2. Crear una consulta (ruta) de tipo GET (solo lectura de la API)

// * req --> request --> petición, res --> response --> respuesta

import {pieces, createPieces, updatePieces, deletePieces} from '../controllers/piezas.controller.js';


router.get('/api/pieces', pieces);
router.post('/api/create', createPieces);
router.put('/api/update/:id', updatePieces);
router.delete('/api/delete/:id', deletePieces);


// router.post(); // * 3. Crear una consulta (ruta) de tipo POST (escritura de la API)

router.post('/api/person', person);

// router.put(); // * 4. Crear una consulta (ruta) de tipo PUT (actualización de la API)
// router.delete(); // * 5. Crear una ruta de tipo DELETE (eliminación de la API)


export default router; // * 6. Exportar el enrutador de express
