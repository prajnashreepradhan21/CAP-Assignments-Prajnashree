# S/4HANA Business Partner Integration using SAP CAP

## Overview

This project demonstrates how to integrate a SAP Cloud Application Programming (CAP) application with the SAP S/4HANA Business Partner OData API.

The application consumes the standard **Business Partner (A2X)** API from SAP S/4HANA and exposes it as a CAP OData V4 service.

---

## Project Structure

```text
s4hana/
├── gen/
├── mta_archives/
│   └── s4hana_1.0.0.mtar
├── node_modules/
├── srv/
│   ├── external/
│   │   ├── API_BUSINESS_PARTNER.edmx
│   │   └── API_BUSINESS_PARTNER.csn
│   ├── business-partner-service.cds
│   └── business-partner-service.js
├── .gitignore
├── mta.yaml
├── package.json
├── package-lock.json
├── xs-security.json
└── readme.md
```

---

## Technologies Used

* SAP CAP (Cloud Application Programming Model)
* Node.js
* SAP Business Accelerator Hub
* SAP S/4HANA Business Partner API
* OData V2 & OData V4
* SAP BTP Cloud Foundry
* Multi-Target Application (MTA)

---

## Features

* Import external EDMX service into CAP.
* Consume SAP S/4HANA Business Partner API.
* Read Business Partner master data.
* Expose data through an OData V4 service.
* Deploy to SAP BTP Cloud Foundry.

---

## Running the Application

Install dependencies:

```bash
npm install
```

Run locally:

```bash
cds watch
```

---

## Build & Deploy

Build the MTA archive:

```bash
mbt build
```

Deploy to Cloud Foundry:

```bash
cf deploy mta_archives/s4hana_1.0.0.mtar
```

---

## API Endpoint

Business Partners:

```text
GET /odata/v4/business-partner/BusinessPartners
```



