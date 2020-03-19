/*
 Navicat Premium Data Transfer

 Source Server         : tinysqlite
 Source Server Type    : SQLite
 Source Server Version : 3030001
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3030001
 File Encoding         : 65001

 Date: 16/03/2020 09:49:00
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for access_record
-- ----------------------------
DROP TABLE IF EXISTS "access_record";
CREATE TABLE "access_record" (
  "user_id" INTEGER NOT NULL,
  "bookmark_id" INTEGER NOT NULL,
  "click_count" INTEGER,
  "last_accessed" TEXT NOT NULL,
  PRIMARY KEY ("user_id", "bookmark_id"),
  CONSTRAINT "user_id_FK" FOREIGN KEY ("user_id") REFERENCES "account" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "bookmark_id_FK_3" FOREIGN KEY ("bookmark_id") REFERENCES "bookmark" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS "account";
CREATE TABLE "account" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "username" TEXT NOT NULL,
  "password" TEXT NOT NULL,
  "isadmin" INTEGER NOT NULL
);

-- ----------------------------
-- Table structure for bookmark
-- ----------------------------
DROP TABLE IF EXISTS "bookmark";
CREATE TABLE "bookmark" (
  "id" INTEGER NOT NULL,
  "url" TEXT NOT NULL,
  "title" TEXT NOT NULL,
  "desc" TEXT,
  "logo" TEXT,
  "author" TEXT,
  "click_count" INTEGER,
  "created" TEXT,
  "modified" TEXT,
  "last_accessed" TEXT,
  PRIMARY KEY ("id")
);

-- ----------------------------
-- Table structure for bookmark_tag
-- ----------------------------
DROP TABLE IF EXISTS "bookmark_tag";
CREATE TABLE "bookmark_tag" (
  "bookmark_id" INTEGER NOT NULL,
  "tag_id" INTEGER NOT NULL,
  PRIMARY KEY ("bookmark_id", "tag_id"),
  CONSTRAINT "bookmark_id_FK" FOREIGN KEY ("bookmark_id") REFERENCES "bookmark" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "tag_id_FK" FOREIGN KEY ("tag_id") REFERENCES "tag" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for catalog
-- ----------------------------
DROP TABLE IF EXISTS "catalog";
CREATE TABLE "catalog" (
  "id" INTEGER NOT NULL,
  "catalog_name" TEXT NOT NULL,
  "desc" TEXT,
  "parent_catalog" INTEGER,
  PRIMARY KEY ("id")
);

-- ----------------------------
-- Table structure for catalog_bookmark
-- ----------------------------
DROP TABLE IF EXISTS "catalog_bookmark";
CREATE TABLE "catalog_bookmark" (
  "catalog_id" INTEGER NOT NULL,
  "bookmark_id" INTEGER NOT NULL,
  PRIMARY KEY ("catalog_id", "bookmark_id"),
  CONSTRAINT "catalog_id_FK" FOREIGN KEY ("catalog_id") REFERENCES "catalog" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "bookmark_id_FK_2" FOREIGN KEY ("bookmark_id") REFERENCES "bookmark" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for fav_bookmark
-- ----------------------------
DROP TABLE IF EXISTS "fav_bookmark";
CREATE TABLE "fav_bookmark" (
  "user_id" INTEGER NOT NULL,
  "bookmark_id" INTEGER NOT NULL,
  PRIMARY KEY ("user_id", "bookmark_id"),
  CONSTRAINT "user_id_FK_2" FOREIGN KEY ("user_id") REFERENCES "account" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "bookmark_id_FK_4" FOREIGN KEY ("bookmark_id") REFERENCES "bookmark" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for sqlite_sequence
-- ----------------------------
DROP TABLE IF EXISTS "sqlite_sequence";
CREATE TABLE "sqlite_sequence" (
  "name",
  "seq"
);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS "tag";
CREATE TABLE "tag" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" TEXT NOT NULL,
  CONSTRAINT "tag_name_UNIQUE" UNIQUE ("name" ASC)
);

PRAGMA foreign_keys = true;
