-- create the clinic database
CREATE DATABASE clinic;

-- create table treatment
CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(100),
    name VARCHAR(100)
);

-- create table patient
CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth VARCHAR(100)
);

-- create medical_histories table
CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients(id),
    admitted_at timestamp,
    status VARCHAR(100)
);

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_Amount DECIMAL,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id INTEGER REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INTEGER REFERENCES invoices(id),
    treatment_id INTEGER REFERENCES treatments(id)
);

CREATE TABLE medical_treatments_joint_table (
  id SERIAL PRIMARY KEY,
  medical_histories_id INT NOT NULL,
  treatments_id INT NOT NULL,
  FOREIGN KEY (medical_histories_id) REFERENCES medical_histories (id) ON DELETE CASCADE,
  FOREIGN KEY (treatments_id) REFERENCES treatments (id) ON DELETE CASCADE
);

-- create indexes 
CREATE INDEX fk_medical_histories_patients ON medical_histories(patient_id);
CREATE INDEX fk_medical_histories_invoices ON invoices(medical_history_id);
CREATE INDEX fk_invoice_items_invoices ON invoice_items(invoice_id);
CREATE INDEX fk_invoice_items_treatment ON invoice_items(treatment_id);


