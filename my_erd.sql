-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/M82rTq
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "department_number" char(4)   NOT NULL,
    "department_name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "department_number"
     )
);

CREATE TABLE "department_employee" (
    "employee_number" int   NOT NULL,
    "department_number" char(4)   NOT NULL,
    CONSTRAINT "pk_department_employee" PRIMARY KEY (
        "employee_number","department_number"
     )
);

CREATE TABLE "titles" (
    "title_id" char(5)   NOT NULL,
    "title" varchar(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "department_manager" (
    "department_number" char(4)   NOT NULL,
    "employee_number" int   NOT NULL,
    CONSTRAINT "pk_department_manager" PRIMARY KEY (
        "employee_number"
     )
);

CREATE TABLE "salaries" (
    "employee_number" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "employee_number"
     )
);

CREATE TABLE "employees" (
    "employee_number" int   NOT NULL,
    "employee_title" char(5)   NOT NULL,
    "birth_date" date   NOT NULL,
    "frst_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "sex" char(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "employee_number"
     )
);

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_employee_number" FOREIGN KEY("employee_number")
REFERENCES "employees" ("employee_number");

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_department_number" FOREIGN KEY("department_number")
REFERENCES "departments" ("department_number");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_department_number" FOREIGN KEY("department_number")
REFERENCES "departments" ("department_number");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_employee_number" FOREIGN KEY("employee_number")
REFERENCES "employees" ("employee_number");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_employee_number" FOREIGN KEY("employee_number")
REFERENCES "employees" ("employee_number");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_employee_title" FOREIGN KEY("employee_title")
REFERENCES "titles" ("title_id");
