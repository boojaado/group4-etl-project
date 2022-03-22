-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/ax18GS
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "us_vacc_totals_by_provider" (
    "id" INT   NOT NULL,
    "date" datetime   NOT NULL,
    "location_key" varchar   NOT NULL,
    "vaccination_provider_id" int   NOT NULL,
    "new_persons_vaccinated" float   NOT NULL,
    "cumulative_persons_vaccinated" float   NOT NULL,
    "new_persons_fully_vaccinated" float   NOT NULL,
    "cumulative_persons_fully_vaccinated" float   NOT NULL,
    "new_vaccine_doses_administered" float   NOT NULL,
    "cumulative_vaccine_doses_administered" float   NOT NULL,
    "last_updated" datetime   NOT NULL,
    CONSTRAINT "pk_us_vacc_totals_by_provider" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "vaccination_providers" (
    "vaccination_provider_id" INT   NOT NULL,
    "vaccination_provider" varchar(100)   NOT NULL,
    "last_updated" datetime   NOT NULL,
    CONSTRAINT "pk_vaccination_providers" PRIMARY KEY (
        "vaccination_provider_id"
     )
);

CREATE TABLE "countries" (
    "location_key" varchar   NOT NULL,
    "country_code" varchar   NOT NULL,
    "country" varchar   NOT NULL,
    "population" int   NOT NULL,
    "infant_mortality" varchar   NOT NULL,
    "gdp" varchar   NOT NULL,
    "birthrate" varchar   NOT NULL,
    "deathrate" varchar   NOT NULL,
    "last_updated" datetime   NOT NULL,
    CONSTRAINT "pk_countries" PRIMARY KEY (
        "location_key"
     )
);

ALTER TABLE "us_vacc_totals_by_provider" ADD CONSTRAINT "fk_us_vacc_totals_by_provider_location_key" FOREIGN KEY("location_key")
REFERENCES "countries" ("location_key");

ALTER TABLE "us_vacc_totals_by_provider" ADD CONSTRAINT "fk_us_vacc_totals_by_provider_vaccination_provider_id" FOREIGN KEY("vaccination_provider_id")
REFERENCES "vaccination_providers" ("vaccination_provider_id");

