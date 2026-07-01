const cds = require("@sap/cds");
const axios = require("axios");

module.exports = cds.service.impl(function () {

    this.on("triggerLeaveProcess", async (req) => {

        const {
            employeeID,
            employeeName,
            leaveDate,
            approvalEmail,
            leaveType,
            comments
        } = req.data;

        try {

            const clientId = "sb-a68b4273-c714-43b9-9dff-2641903d08cc!b666134|xsuaa!b49390";
            const clientSecret = "b4dd985d-bee2-4660-a1f8-4a4fbb69b0ed$1ROTgJGVZrtZkvlieZG9msErVJyWpAvgyts9Rdr1TZQ=";

            const tokenUrl =
                "https://f709e662trial.authentication.us10.hana.ondemand.com/oauth/token";

            const tokenResponse = await axios.post(
                tokenUrl,
                "grant_type=client_credentials",
                {
                    auth: {
                        username: clientId,
                        password: clientSecret
                    },
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded"
                    }
                }
            );

            const accessToken = tokenResponse.data.access_token;

            const workflowUrl =
"https://spa-api-gateway-bpi-us-prod.cfapps.us10.hana.ondemand.com/workflow/rest/v1/workflow-instances";

            const workflowResponse = await axios.post(
                workflowUrl,
                {
                    definitionId:
                        "us10.f709e662trial.leaveapproval.leaveProcess",

                    context: {
                        employeeID,
                        employeeName,
                        leaveDate,
                        approvalEmail,
                        leaveType,
                        comments
                    }
                },
                {
                    headers: {
                        Authorization: `Bearer ${accessToken}`,
                        "Content-Type": "application/json"
                    }
                }
            );

            

           return workflowResponse.data;
           
        } catch (err) {

            console.error(err.response?.data || err.message);

            req.reject(
                500,
                err.response?.data?.message || err.message
            );

        }

    });

});