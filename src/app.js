import express from "express";
import session from "express-session";
import path from "path";
import morgan from "morgan";
import routes from "./routes/index.js";

import config from "./config.js";
import {fileURLToPath} from "url";

const app = express();
const __dirname = path.dirname(fileURLToPath(import.meta.url));

// Settings
app.set("port", config.PORT);
app.set("views", path.resolve(__dirname, "views"));
app.set("view engine", "ejs");

// Middlewares
app.use(morgan("dev"));
app.use(express.urlencoded({ extended: false }));

// Session middleware
app.use(session({
  secret: 'mysecretkey',
  resave: false,
  saveUninitialized: false
}));

// global variables
app.use((req, res, next) => {
  console.log(config.APPID)
  app.locals.APPID = config.APPID;
  next();
});

// Routes
app.use('/', routes);

app.use(express.static(path.join(__dirname, "public")));

// 404 handler
app.use((req, res, next) => {
  res.status(404).render("404");
});

export default app;








