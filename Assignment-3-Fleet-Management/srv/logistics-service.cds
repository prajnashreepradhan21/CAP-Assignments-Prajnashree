using logistics.fleet as fleet from '../db/schema';

service LogisticsService {
  entity Vehicles       as projection on fleet.Vehicles;
  entity Drivers        as projection on fleet.Drivers;
  entity Customers      as projection on fleet.Customers;
  entity Shipments      as projection on fleet.Shipments;
  entity Routes         as projection on fleet.Routes;
  entity ServiceRecords as projection on fleet.ServiceRecords;
}