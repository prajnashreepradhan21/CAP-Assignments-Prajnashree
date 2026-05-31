using platform.events as events from '../db/schema';

service EventService {
  entity Venues        as projection on events.Venues;
  entity Events        as projection on events.Events;
  entity Speakers      as projection on events.Speakers;
  entity EventSpeakers as projection on events.EventSpeakers;
  entity Registrations as projection on events.Registrations;
  entity Feedback      as projection on events.Feedback;
}