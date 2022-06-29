-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Devices" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "company" TEXT NOT NULL,
    "categoryID" INTEGER NOT NULL,
    "subcategoryID" INTEGER NOT NULL,
    "creatorID" INTEGER NOT NULL,
    "price" INTEGER NOT NULL,
    "codeExists" BOOLEAN NOT NULL,
    "groupID" INTEGER,
    CONSTRAINT "Devices_creatorID_fkey" FOREIGN KEY ("creatorID") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Devices_categoryID_fkey" FOREIGN KEY ("categoryID") REFERENCES "Category" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Devices_subcategoryID_fkey" FOREIGN KEY ("subcategoryID") REFERENCES "Subcategory" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Devices_groupID_fkey" FOREIGN KEY ("groupID") REFERENCES "DeviceGroup" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Devices" ("categoryID", "codeExists", "company", "creatorID", "groupID", "id", "name", "price", "subcategoryID") SELECT "categoryID", "codeExists", "company", "creatorID", "groupID", "id", "name", "price", "subcategoryID" FROM "Devices";
DROP TABLE "Devices";
ALTER TABLE "new_Devices" RENAME TO "Devices";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
