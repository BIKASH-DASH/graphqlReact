-- CreateTable
CREATE TABLE "Feed" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "authorId" TEXT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Bundel" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "authorId" TEXT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "auth0" TEXT NOT NULL,
    "nickname" TEXT,
    "picture" TEXT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SavedArtists" (
    "id" TEXT NOT NULL,
    "content" JSONB NOT NULL,
    "feedsId" TEXT NOT NULL,
    "authorId" TEXT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BundelTag" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "bundelId" TEXT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FeedTag" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_FeedToFeedTag" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_feedsUserlike" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_bundelluserikes" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Feed.url_unique" ON "Feed"("url");

-- CreateIndex
CREATE UNIQUE INDEX "User.auth0_unique" ON "User"("auth0");

-- CreateIndex
CREATE UNIQUE INDEX "BundelTag.name_unique" ON "BundelTag"("name");

-- CreateIndex
CREATE UNIQUE INDEX "FeedTag.name_unique" ON "FeedTag"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_FeedToFeedTag_AB_unique" ON "_FeedToFeedTag"("A", "B");

-- CreateIndex
CREATE INDEX "_FeedToFeedTag_B_index" ON "_FeedToFeedTag"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_feedsUserlike_AB_unique" ON "_feedsUserlike"("A", "B");

-- CreateIndex
CREATE INDEX "_feedsUserlike_B_index" ON "_feedsUserlike"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_bundelluserikes_AB_unique" ON "_bundelluserikes"("A", "B");

-- CreateIndex
CREATE INDEX "_bundelluserikes_B_index" ON "_bundelluserikes"("B");

-- AddForeignKey
ALTER TABLE "Feed" ADD FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bundel" ADD FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SavedArtists" ADD FOREIGN KEY ("feedsId") REFERENCES "Feed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SavedArtists" ADD FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BundelTag" ADD FOREIGN KEY ("bundelId") REFERENCES "Bundel"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FeedToFeedTag" ADD FOREIGN KEY ("A") REFERENCES "Feed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FeedToFeedTag" ADD FOREIGN KEY ("B") REFERENCES "FeedTag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_feedsUserlike" ADD FOREIGN KEY ("A") REFERENCES "Feed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_feedsUserlike" ADD FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_bundelluserikes" ADD FOREIGN KEY ("A") REFERENCES "Bundel"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_bundelluserikes" ADD FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
