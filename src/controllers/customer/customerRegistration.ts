import prisma from "../../prisma/prismaClient";
import { Request, Response, NextFunction } from "express";
import { v4 as uuidv4 } from "uuid";

export async function createBusiness(
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> {
  const {
    BusinessDisplayName,
    BusinessMobileNumber,
    BusinessEmailAddress,
    BusinessType,
    FirstName,
    MiddleNames,
    LastName,
  } = req.body;

  try {
    if (
      !BusinessDisplayName ||
      !BusinessMobileNumber ||
      !BusinessEmailAddress ||
      !BusinessType ||
      !FirstName ||
      !LastName
    ) {
      res.status(400).json({ error: "Please provide all required fields" });
      return;
    }

    const existingBusiness = await prisma.businessDetails.findFirst({
      where: { BusinessDisplayName },
    });

    if (existingBusiness) {
      res.status(400).json({ error: "Business already exists" });
      return;
    }

    const contactIDR = uuidv4().replace(/-/g, "").slice(0, 20);
    const businessIDR = uuidv4().replace(/-/g, "").slice(0, 20);

    const contactDetails = await prisma.contactDetails.create({
      data: {
        FirstName,
        MiddleNames,
        LastName,
        ContactIDR: contactIDR,
      },
    });

    await prisma.businessDetails.create({
      data: {
        BusinessDisplayName,
        BusinessMobileNumber,
        BusinessEmailAddress,
        BusinessType,
        ContactID: contactDetails.ContactID,
        BusinessIDR: businessIDR,
      },
    });

    res.status(201).json({ message: "Business created successfully" });
  } catch (error: any) {
    res.status(500).json({ error: error.message });
  }
}

export async function addContactDetails(req: Request, res: Response) {
  const {
    ContactID,
    AddressStreetNo,
    AddressLine1,
    AddressLine2,
    Postcode,
    City,
    MobileNumber,
    WhatsAppNumber,
    MobileNumber2,
    EmailAddress,
    Position,
    // ProfilePic,
    IDNumber,
    DOB,
  } = req.body;

  try {
    await prisma.contactDetails.update({
      where: { ContactID },

      data: {
        AddressStreetNo,
        AddressLine1,
        AddressLine2,
        Postcode,
        City,
        MobileNumber,
        WhatsAppNumber,
        MobileNumber2,
        EmailAddress,
        Position,
        // ProfilePic,
        IDNumber,
        DOB,
      },
    });

    res.status(200).json({ message: "Contact details updated successfully" });
  } catch (error: any) {
    res.status(500).json({ error: error.message });
  }
}
