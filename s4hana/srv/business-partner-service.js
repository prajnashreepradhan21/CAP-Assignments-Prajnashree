const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {

    const bupa = await cds.connect.to('API_BUSINESS_PARTNER');

    this.on('READ', 'BusinessPartners', async (req) => {
        return await bupa.run(req.query);
    });

});