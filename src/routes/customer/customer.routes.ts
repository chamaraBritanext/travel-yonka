import { Router } from "express";
import {
  createBusiness,
  addContactDetails,
} from "../../controllers/customer/customerRegistration";

export function ConfigureCustomerRoutes(router: Router): void {
  router.post("/create-business", createBusiness);
  router.post("/add-contact-details", addContactDetails);
}
