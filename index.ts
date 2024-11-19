import express, { Express, Router } from "express";
import { configureRoutes } from "./src/routes";
import cors from "cors";

const corsOptions = {
  origin: true,
  credentials: true,
};

const app = express();
app.use(cors(corsOptions));
app.use(express.json());

configureRoutes(app);

const PORT = process.env.PORT || 8000;

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
