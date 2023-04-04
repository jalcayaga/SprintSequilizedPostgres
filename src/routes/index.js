
// Importar las dependencias necesarias
import express from "express";
import session from "express-session"
import { renderIndexPage, renderMedicos } from "../controllers/index.controller.js";

const router = express.Router();

// Ruta para mostrar la página principal
router.get("/", renderIndexPage);
/* ---------------------------------- Users ---------------------------------- */

// Definir la ruta para mostrar la lista de médicos
router.get('/medicos', renderMedicos);

export default router;
