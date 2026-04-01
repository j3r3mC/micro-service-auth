/*
  Warnings:

  - Added the required column `role` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Role" AS ENUM ('PARENT', 'CHILD', 'GUEST');

-- CreateEnum
CREATE TYPE "WingStyle" AS ENUM ('ROUND_SMALL', 'FEATHER_LIGHT', 'LONG_GRACEFUL');

-- CreateEnum
CREATE TYPE "HairStyle" AS ENUM ('BLOND_SOFT', 'BROWN_SOFT', 'WHITE_ANGELIC');

-- CreateEnum
CREATE TYPE "HaloStyle" AS ENUM ('HALO_SIMPLE', 'HALO_GLOW', 'HALO_STARRY');

-- CreateEnum
CREATE TYPE "RobeStyle" AS ENUM ('ROBE_WHITE', 'ROBE_PASTEL_BLUE', 'ROBE_PASTEL_GOLD');

-- CreateEnum
CREATE TYPE "Accessory" AS ENUM ('STAR_SMALL', 'HEART_SMALL', 'CROSS_SOFT');

-- CreateEnum
CREATE TYPE "Expression" AS ENUM ('SMILE_SOFT');

-- DropIndex
DROP INDEX "User_email_key";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "accessory" "Accessory" NOT NULL DEFAULT 'STAR_SMALL',
ADD COLUMN     "expression" "Expression" NOT NULL DEFAULT 'SMILE_SOFT',
ADD COLUMN     "hairStyle" "HairStyle" NOT NULL DEFAULT 'BLOND_SOFT',
ADD COLUMN     "haloStyle" "HaloStyle" NOT NULL DEFAULT 'HALO_SIMPLE',
ADD COLUMN     "isGuest" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "parentId" INTEGER,
ADD COLUMN     "pin" TEXT,
ADD COLUMN     "robeStyle" "RobeStyle" NOT NULL DEFAULT 'ROBE_WHITE',
ADD COLUMN     "role" "Role" NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "wingStyle" "WingStyle" NOT NULL DEFAULT 'ROUND_SMALL',
ALTER COLUMN "email" DROP NOT NULL,
ALTER COLUMN "password" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
