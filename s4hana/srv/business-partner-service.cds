using { API_BUSINESS_PARTNER as bupa } from './external/API_BUSINESS_PARTNER.csn';

service BusinessPartnerService {
    entity BusinessPartners as projection on bupa.A_BusinessPartner;
}