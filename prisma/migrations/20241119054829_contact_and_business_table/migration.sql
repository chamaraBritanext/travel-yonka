-- CreateTable
CREATE TABLE "ContactDetails" (
    "ContactID" SERIAL NOT NULL,
    "ContactIDR" TEXT,
    "FirstName" TEXT NOT NULL,
    "MiddleNames" TEXT,
    "LastName" TEXT NOT NULL,
    "AddressStreetNo" TEXT,
    "AddressLine1" TEXT,
    "AddressLine2" TEXT,
    "Postcode" TEXT,
    "City" TEXT,
    "MobileNumber" TEXT,
    "WhatsAppNumber" TEXT,
    "MobileNumber2" TEXT,
    "EmailAddress" TEXT,
    "Position" TEXT,
    "ProfilePic" TEXT,
    "IDNumber" TEXT,
    "DOB" TIMESTAMP(3),
    "UserID" TEXT,
    "CreatedDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ModifiedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ContactDetails_pkey" PRIMARY KEY ("ContactID")
);

-- CreateTable
CREATE TABLE "BusinessDetails" (
    "BusinessID" SERIAL NOT NULL,
    "BusinessIDR" TEXT,
    "ContactID" INTEGER,
    "OfficialBusinessName" TEXT,
    "BusinessDisplayName" TEXT NOT NULL,
    "BusinessMobileNumber" TEXT NOT NULL,
    "BusinessEmailAddress" TEXT NOT NULL,
    "BusinessType" TEXT NOT NULL,
    "IsPersonal" BOOLEAN,
    "AddressStreetNo" TEXT,
    "AddressLine1" TEXT,
    "AddressLine2" TEXT,
    "Postcode" TEXT,
    "City" TEXT,
    "District" TEXT,
    "Province" TEXT,
    "Country" TEXT,
    "WhatsAppNumber" TEXT,
    "LandlineNo" TEXT,
    "BusinessRegNo" TEXT,
    "Description" TEXT,
    "Notes" TEXT,
    "MaxUnits" INTEGER,
    "BusinessGroupID" TEXT,
    "GoogleMapLink" TEXT,
    "MapCoordinates" TEXT,
    "IsPriceNegotiable" BOOLEAN,
    "StandardCommissionRate" DOUBLE PRECISION DEFAULT 5.00,
    "StandardDiscountRate" DOUBLE PRECISION,
    "BusinessWebsite" TEXT,
    "GeneratedSubURL" TEXT,
    "IsActive" BOOLEAN,
    "IsValidated" BOOLEAN,
    "Tax" DOUBLE PRECISION,
    "Charges" DOUBLE PRECISION,
    "CreatedDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ModifiedDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BusinessDetails_pkey" PRIMARY KEY ("BusinessID")
);

-- CreateIndex
CREATE UNIQUE INDEX "ContactDetails_ContactIDR_key" ON "ContactDetails"("ContactIDR");

-- CreateIndex
CREATE UNIQUE INDEX "BusinessDetails_BusinessIDR_key" ON "BusinessDetails"("BusinessIDR");

-- CreateIndex
CREATE UNIQUE INDEX "BusinessDetails_BusinessDisplayName_key" ON "BusinessDetails"("BusinessDisplayName");

-- CreateIndex
CREATE INDEX "BusinessDetails_ContactID_idx" ON "BusinessDetails"("ContactID");

-- AddForeignKey
ALTER TABLE "BusinessDetails" ADD CONSTRAINT "BusinessDetails_ContactID_fkey" FOREIGN KEY ("ContactID") REFERENCES "ContactDetails"("ContactID") ON DELETE SET NULL ON UPDATE CASCADE;
