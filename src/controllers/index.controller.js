import { Medico, Especialidad } from "../models.js";

// render pagina principal
export const renderIndexPage = (req, res) => {
  const authenticated = req.session.userId ? true : false;
  res.render("index", { authenticated });
};

export const renderMedicos = async (req, res) => {
  try {
    // Obtener la lista de médicos con sus especialidades asociadas
    const medicos = await Medico.findAll({
      include: [Especialidad],
    });
    console.log(medicos);

    // Renderizar la plantilla de EJS con los datos obtenidos
    res.render("medicos", { medicos });
  } catch (error) {
    console.error(error);
    res.status(500).send("Ha ocurrido un error");
  }
};
