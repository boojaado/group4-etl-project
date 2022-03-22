CREATE TABLE "us_vacc_totals_by_provider" (
    "id" INT   NOT NULL,
    "date" date   NOT NULL,
    "location_key" varchar    NULL,
    "new_persons_vaccinated" float    NULL,
    "cumulative_persons_vaccinated" float    NULL,
    "new_persons_fully_vaccinated" float    NULL,
    "cumulative_persons_fully_vaccinated" float    NULL,
    "new_vaccine_doses_administered" float    NULL,
    "cumulative_vaccine_doses_administered" float    NULL,
	"vaccination_provider_id" int   NOT NULL,
    "last_updated"  timestamp default localtimestamp NOT NULL,
    CONSTRAINT "pk_us_vacc_totals_by_provider" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "vaccination_providers" (
    "vaccination_provider_id" INT   NOT NULL,
    "vaccination_provider" varchar(100)   NOT NULL,
    "last_updated"  timestamp default localtimestamp NOT NULL,
    CONSTRAINT "pk_vaccination_providers" PRIMARY KEY (
        "vaccination_provider_id"
     )
);

CREATE TABLE "countries" (
    "country_code" varchar   NOT NULL,
    "country" varchar   NOT NULL,
    "population" float    NULL,
    "infant_mortality" float    NULL,
    "gdp" float    NULL,
    "birthrate" float    NULL,
    "deathrate" float    NULL,
    "last_updated" timestamp default localtimestamp   NOT NULL,
    CONSTRAINT "pk_countries" PRIMARY KEY (
        "country_code"
     )
);

ALTER TABLE "us_vacc_totals_by_provider" ADD CONSTRAINT "fk_us_vacc_totals_by_provider_location_key" FOREIGN KEY("location_key")
REFERENCES "countries" ("country_code");

ALTER TABLE "us_vacc_totals_by_provider" ADD CONSTRAINT "fk_us_vacc_totals_by_provider_vaccination_provider_id" FOREIGN KEY("vaccination_provider_id")
REFERENCES "vaccination_providers" ("vaccination_provider_id");