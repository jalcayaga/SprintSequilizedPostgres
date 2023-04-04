
import { Sequelize, DataTypes } from 'sequelize';


const sequelize = new Sequelize('postgres', 'postgres', 'javierpassword', {
  host: 'localhost',
  dialect: 'postgres',
  logging: false
});

const Cliente = sequelize.define('Cliente', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  nombre: {
    type: DataTypes.STRING,
    allowNull: false
  },
  direccion: {
    type: DataTypes.STRING,
    allowNull: false
  }
});

const Producto = sequelize.define('Producto', {
  codigo: {
    type: DataTypes.STRING,
    primaryKey: true
  },
  nombre: {
    type: DataTypes.STRING,
    allowNull: false
  }
});

// Relación uno a muchos entre Cliente y Producto
Cliente.hasMany(Producto, { as: 'productos' });
Producto.belongsTo(Cliente);



(async () => {
  try {
    await sequelize.authenticate();
    console.log('Conexión a la base de datos establecida correctamente.');

    await Cliente.sync({ force: true });
    console.log('Tabla de Cliente creada correctamente.');

    await Producto.sync({ force: true });
    console.log('Tabla de Producto creada correctamente.');

    // Otras operaciones con la base de datos

  } catch (error) {
    console.error('Error al conectar a la base de datos:', error);
  }
})();
