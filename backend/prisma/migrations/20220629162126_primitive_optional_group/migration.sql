-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_PrimitiveDevice" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "groupID" INTEGER,
    "codeExists" BOOLEAN NOT NULL,
    CONSTRAINT "PrimitiveDevice_groupID_fkey" FOREIGN KEY ("groupID") REFERENCES "DeviceGroup" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_PrimitiveDevice" ("codeExists", "groupID", "id", "name") SELECT "codeExists", "groupID", "id", "name" FROM "PrimitiveDevice";
DROP TABLE "PrimitiveDevice";
ALTER TABLE "new_PrimitiveDevice" RENAME TO "PrimitiveDevice";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
