const baseAPIUrl = "https://erastarlelangproperty.co.id/api/v1/";
const baseAPIUrlImage = "https://erastarlelangproperty.co.id/";

// const baseAPIUrl = "https://develop.apijlantahdev.xyz:8443/api/v1/";
// const baseAPIUrlImage = "https://develop.apijlantahdev.xyz:8443/api/v1/";

const postAPILogin = "${baseAPIUrl}auth";
const getAPIProfile = "${baseAPIUrl}profile/me";

//Home
const getAPIAssetHome =
    "${baseAPIUrl}assets/asset_lists?page=1&limit=4&sort=desc";
const getAPIApprovalCostHome =
    "${baseAPIUrl}invoice_cost/cost_lists?page=1&limit=4&sort=desc&status=pending";
const getAPICashFlowHome =
    "${baseAPIUrl}invoices/invoice_cashflow?page=1&limit=4";
