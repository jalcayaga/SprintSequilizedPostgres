// Importar Sequelize y crear una instancia para conectarse a la base de datos
import Sequelize from 'sequelize';
import config from './config/config.json' assert { type: "json" };

const sequelize = new Sequelize(config.development);

// Definir el modelo de Especialidad
export const Especialidad = sequelize.define("especialidad", {
  codigo: {
    type: Sequelize.STRING,
    allowNull: false,
    unique: true,
  },
  descripcion: {
    type: Sequelize.STRING,
    allowNull: false,
  },
});

// Definir el modelo de Médico
export const Medico = sequelize.define("medico", {
  nombre: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  rut: {
    type: Sequelize.STRING,
    allowNull: false,
    unique: true,
  },
  direccion: {
    type: Sequelize.STRING,
    allowNull: false,
  },
});

// Definir la relación entre Médico y Especialidad (1 médico tiene 1 especialidad)
Medico.belongsTo(Especialidad);

// Definir el modelo de Paciente
const Paciente = sequelize.define("paciente", {
  nombre: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  rut: {
    type: Sequelize.STRING,
    allowNull: false,
    unique: true,
  },
  direccion: {
    type: Sequelize.STRING,
    allowNull: false,
  },
});

// Definir el modelo de Consulta
const Consulta = sequelize.define("consulta", {
  fecha: {
    type: Sequelize.DATEONLY,
    allowNull: false,
  },
  hora: {
    type: Sequelize.TIME,
    allowNull: false,
  },
  box: {
    type: Sequelize.INTEGER,
    allowNull: false,
  },
});

// Definir la relación entre Médico y Consulta (1 médico realiza muchas consultas)
Medico.hasMany(Consulta);

// Definir la relación entre Paciente y Consulta (1 paciente agenda muchas consultas)
Paciente.hasMany(Consulta);

// Definir la relación entre Consulta y Médico (1 consulta es realizada por 1 médico)
Consulta.belongsTo(Medico);

// Definir la relación entre Consulta y Paciente (1 consulta es agendada por 1 paciente)
Consulta.belongsTo(Paciente);

// Definir el modelo de Licencia
const Licencia = sequelize.define("licencia", {
  codigo: {
    type: Sequelize.STRING,
    allowNull: false,
    unique: true,
  },
  diagnostico: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  fecha_inicio: {
    type: Sequelize.DATEONLY,
    allowNull: false,
  },
  fecha_termino: {
    type: Sequelize.DATEONLY,
    allowNull: false,
  },
});

// Definir la relación entre Médico y Paciente a través de Licencia (1 médico puede entregar muchas licencias a muchos pacientes)
Medico.belongsToMany(Paciente, { through: Licencia });
Paciente.belongsToMany(Medico, { through: Licencia });

// Sincronizar los modelos con la base de datos
sequelize.sync();
