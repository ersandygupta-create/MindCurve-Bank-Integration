permissionset 50751 "3E HIS Permission"
{
    Assignable = true;
    Caption = 'HIS Permission Sets', MaxLength = 30;
    Permissions = table "Bank Account Ledger Entry" = X,
    table "3E Bank Integration" = X,
    tabledata "Bank Account Ledger Entry" = RIM,
    tabledata "3E Bank Integration" = RIM,
    page "Create Bank Payment" = X,
    page "3E Vendor Ledger Entries" = X,
    page "3E VLE Ready for Payment" = X,
    page "3E Exported BLE File" = X,
    page "3E Update Bank UTR No. API" = X,
    query "3E Exported Bank File Get API" = X,
    codeunit "3E Bank Integration" = X,
    codeunit "3E Event Subscriber Mgmt" = X;

}