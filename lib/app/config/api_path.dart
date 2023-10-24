const baseAPIUrl = "https://erastarlelangproperty.co.id/api/v1/";
const baseAPIUrlImage = "https://erastarlelangproperty.co.id/";

// Auth Stuff
const postAPILogin = "${baseAPIUrl}auth";
const getAPIProfile = "${baseAPIUrl}profile/me";
const postResetPassword = "${baseAPIUrl}auth/request_reset_password";

// Asset Stuff
const getAPIAsset = "${baseAPIUrl}assets/asset_lists?";
const getAPIAssetDetail = "${baseAPIUrl}assets/asset_detail/";

// Cashflow Stuff
const getAPIApprovalCost = "${baseAPIUrl}invoice_cost/cost_lists?";
const getAPIApprovalCostDetail = "${baseAPIUrl}invoice_cost/cost_detail/";
const putAPIApproveCost = "${baseAPIUrl}invoice_cost/status_update";
const getAPICashFlow = "${baseAPIUrl}invoices/invoice_cashflow?";
const getAPICashFlowDetail =
    "${baseAPIUrl}invoices/invoice_cashflow?invoice_id=";

// Invoice Stuff
const getAPIInvoice = "${baseAPIUrl}invoices/invoice_lists?";
const getAPIInvoiceDetail = "${baseAPIUrl}invoices/invoice_detail/";

// Top Marketing Stuff
const getAPITopMarketing = "${baseAPIUrl}marketing/top_marketing?";
