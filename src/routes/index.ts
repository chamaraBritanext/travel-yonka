import { Configurev1Routes } from "./v1/v1";
import express, { Router, Express } from "express";

export function configureRoutes(app: Express): void {
  const router = Router();
  Configurev1Routes(router);
  app.use("/api/v1", router);
}
