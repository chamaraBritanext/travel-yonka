import { Router } from "express";
import { ConfigureCustomerRoutes } from "../customer/customer.routes";

export function Configurev1Routes(app: Router): void {
  const customer = Router();
  ConfigureCustomerRoutes(customer);
  app.use("/customer", customer);
}
