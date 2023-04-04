// Importar las dependencias necesarias
const express = require('express');
const router = express.Router();
const { Medico, Especialidad } = require('./models');

// Definir la ruta para mostrar la lista de médicos
router.get('/medicos', async (req, res) => {
  try {
    // Obtener la lista de médicos con sus especialidades asociadas
    const medicos = await Medico.findAll({
      include: [Especialidad],
    });

    // Renderizar la plantilla de EJS con los datos obtenidos
    res.render('medicos', { medicos });
  } catch (error) {
    console.error(error);
    res.status(500).send('Ha ocurrido un error');
  }
});

// Exportar el módulo para su uso en la aplicación
module.exports = router;
