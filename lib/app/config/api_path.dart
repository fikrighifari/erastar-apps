const baseAPIUrl = "https://erastarlelangproperty.co.id/api/v1/";
const baseAPIUrlImage = "https://erastarlelangproperty.co.id/";

// const baseAPIUrl = "https://develop.apijlantahdev.xyz:8443/api/v1/";
// const baseAPIUrlImage = "https://develop.apijlantahdev.xyz:8443/api/v1/";

const postAPILogin = "${baseAPIUrl}auth";
const getAPIProfile = "${baseAPIUrl}profile/me";

// Asset Stuff
const getAPIAsset = "${baseAPIUrl}assets/asset_lists?";
const getAPIAssetDetail = "${baseAPIUrl}assets/asset_detail/";

// Cashflow Stuff
const getAPIApprovalCost = "${baseAPIUrl}invoice_cost/cost_lists?";
const getAPIApprovalCostDetail = "${baseAPIUrl}invoice_cost/cost_detail/";
const putAPIApproveCost = "${baseAPIUrl}invoice_cost/status_update";

const getAPICashFlow = "${baseAPIUrl}invoices/invoice_cashflow?";
const getAPIInvoice = "${baseAPIUrl}invoices/invoice_lists?";
const getAPITopMarketing = "${baseAPIUrl}marketing/top_marketing?";
