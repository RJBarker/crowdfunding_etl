DROP TABLE "campaign" CASCADE;
DROP TABLE "category" CASCADE;
DROP TABLE "contacts" CASCADE;
DROP TABLE "subcategory" CASCADE;


CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar64   NOT NULL,
    "description" varchar64   NOT NULL,
    "goal" numeric(10)   NOT NULL,
    "pledged" numeric(10)   NOT NULL,
    "outcome" varchar25   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar5   NOT NULL,
    "currency" varchar5   NOT NULL,
    "launched_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar10   NOT NULL,
    "subcategory_id" varchar10   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "category" (
    "category_id" varchar10   NOT NULL,
    "category" varchar64   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "subcategory" (
    "subcategory_id" varchar10   NOT NULL,
    "subcategory" varchar64   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar25   NOT NULL,
    "last_name" varchar25   NOT NULL,
    "email" varchar264   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

ALTER TABLE "contacts" ADD CONSTRAINT "fk_contacts_contact_id" FOREIGN KEY("contact_id")
REFERENCES "campaign" ("contact_id");

-- Import order: (1) category, (2) subcategory, (3) campaign, (4) contacts