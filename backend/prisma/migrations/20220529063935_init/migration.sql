-- CreateTable
CREATE TABLE "Permition" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "seeOwnOffers" BOOLEAN NOT NULL,
    "requestOffers" BOOLEAN NOT NULL,
    "scanDevices" BOOLEAN NOT NULL,
    "manageOffers" BOOLEAN NOT NULL,
    "manageDevices" BOOLEAN NOT NULL,
    "manageEvents" BOOLEAN NOT NULL
);

-- CreateTable
CREATE TABLE "User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "UID" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "permitionID" INTEGER NOT NULL,
    "apiKey" TEXT,
    CONSTRAINT "User_permitionID_fkey" FOREIGN KEY ("permitionID") REFERENCES "Permition" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "User_UID_key" ON "User"("UID");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
