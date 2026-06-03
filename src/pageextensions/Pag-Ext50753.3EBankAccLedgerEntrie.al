pageextension 50753 "3E Bank Acc. Ledger Entrie" extends "Bank Account Ledger Entries"
{
    layout
    {
        addlast(Control1)
        {
            field("Recipient Bank Name"; Rec."Recipient Bank Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Recipient Bank Name field.';
            }
            field("Recipient Bank Account"; Rec."Recipient Bank Account")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Recipient Bank Account field.';
            }
            field("Recipient Bank IFSC Code"; Rec."Recipient Bank IFSC Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Recipient Bank IFSC Code field.';
            }
            field("Recipient Branch Name"; Rec."Recipient Branch Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Recipient Branch Name field.';
            }
            field("Bank Transaction Status"; Rec."Bank Transaction Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bank Transaction Status field.';
            }
            field("Value Date"; Rec."Value Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Value Date field.';
            }
        }
    }
    actions
    {
        addlast(navigation)
        {
            action("Export Payment")
            {
                ApplicationArea = All;
                Caption = 'Export Payment';
                Image = ExportToBank;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
                    IntegrationMgmt: Codeunit "3E Bank Integration"; // replace 50005 with actual name if different
                    TempBankAccountLedgerEntry: Record "Bank Account Ledger Entry" temporary;
                    BankAccount: Record "Bank Account";
                    Vendor: Record Vendor;
                    i: Integer;
                    Ch: Char;
                begin
                    //   Clear(SCIntegrationMgmt);
                    CurrPage.SetSelectionFilter(BankAccountLedgerEntry);
                    TempBankAccountLedgerEntry.DeleteAll();

                    if BankAccountLedgerEntry.FindSet() then
                        repeat

                            if BankAccountLedgerEntry."Recipient Bank Account" = '' then
                                Error(
                                    'Recipient Bank Account is missing for Entry No. %1. Please update before exporting.',
                                    BankAccountLedgerEntry."Entry No.");

                            if BankAccountLedgerEntry."Recipient Bank IFSC Code" = '' then
                                Error(
                                    'Recipient Bank IFSC Code is missing for Entry No. %1. Please update before exporting.',
                                    BankAccountLedgerEntry."Entry No.");

                            if BankAccountLedgerEntry."Recipient Branch Name" = '' then
                                Error(
                                    'Recipient Branch Name is missing for Entry No. %1. Please update before exporting.',
                                    BankAccountLedgerEntry."Entry No.");

                            if BankAccountLedgerEntry."Recipient Bank Name" = '' then
                                Error(
                                    'Recipient Bank Name is missing for Entry No. %1. Please update before exporting.',
                                    BankAccountLedgerEntry."Entry No.");


                            if Vendor.Get(BankAccountLedgerEntry."Bal. Account No.") then begin
                                if Vendor.Name = '' then
                                    Error('Vendor Name is blank for Vendor No. %1 (Entry No. %2). Please update before exporting.',
                                          Vendor."No.", BankAccountLedgerEntry."Entry No.");

                                if Vendor."E-Mail" = '' then
                                    Error('Vendor Email is blank for Vendor No. %1 (Entry No. %2). Please update before exporting.',
                                          Vendor."No.", BankAccountLedgerEntry."Entry No.");


                                // Check if already exported
                                if BankAccountLedgerEntry."Bank Transaction Status" =
                                   BankAccountLedgerEntry."Bank Transaction Status"::"File exported" then
                                    Error(
                                        'Transaction %1 is already exported. File cannot be generated again.',
                                        BankAccountLedgerEntry."Entry No.");

                                // Process for export
                                if BankAccount.Get(BankAccountLedgerEntry."Bank Account No.") then begin
                                    // if BankAccount."SC Bank Integration" then begin
                                    TempBankAccountLedgerEntry.Init();
                                    TempBankAccountLedgerEntry := BankAccountLedgerEntry;
                                    TempBankAccountLedgerEntry.Insert();
                                end;
                            end;
                        until BankAccountLedgerEntry.Next() = 0;

                    // Export after collecting all
                    IntegrationMgmt.SCExportTransactionRequestFile(TempBankAccountLedgerEntry);
                end;

            }
        }
    }
}
