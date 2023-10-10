const baseAPIUrl = "https://erastarlelangproperty.co.id/api/v1/";
const baseAPIUrlImage = "https://erastarlelangproperty.co.id/";

// const baseAPIUrl = "https://develop.apijlantahdev.xyz:8443/api/v1/";
// const baseAPIUrlImage = "https://develop.apijlantahdev.xyz:8443/api/v1/";

const postAPILogin = "${baseAPIUrl}auth";
const getAPIProfile = "${baseAPIUrl}profile/me";

//Home
const getAPIAssetHome =
    "${baseAPIUrl}assets/asset_lists?page=1&limit=4&sort=desc";
const getAPIApprovalCost = "${baseAPIUrl}invoice_cost/cost_lists?";
const getAPICashFlow = "${baseAPIUrl}invoices/invoice_cashflow?";
const getAPIInvoice = "${baseAPIUrl}invoices/invoice_lists?";
