codeunit 50752 "3E Event Subscriber Mgmt"
{
    Permissions = tabledata "Bank Account Ledger Entry" = rimd;
    [EventSubscriber(ObjectType::Table, Database::"Vendor Ledger Entry", 'OnAfterCopyVendLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure InsertHISFieldVendLedgerEntries(GenJournalLine: Record "Gen. Journal Line"; var VendorLedgerEntry: Record "Vendor Ledger Entry");
    var
        Vendor: Record "vendor";
    begin
        VendorLedgerEntry."Bank Integration" := GenJournalLine."Bank Integration";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Bank Account Ledger Entry", 'OnAfterCopyFromGenJnlLine', '', true, true)]
    local procedure InsertHISFieldBankLedgerEntries(GenJournalLine: Record "Gen. Journal Line"; var BankAccountLedgerEntry: Record "Bank Account Ledger Entry");
    var
        Customer: Record "Customer Bank Account";
        Vendor: Record "Vendor Bank Account";
        Employee: Record Employee;
    begin
        BankAccountLedgerEntry."Bank Integration" := GenJournalLine."Bank Integration";
        case GenJournalLine."Bal. Account Type" of
            "Gen. Journal Account Type"::Customer:
                begin
                    Customer.Reset();
                    Customer.SetRange("Customer No.", GenJournalLine."Bal. Account No.");
                    Customer.SetRange(Code, GenJournalLine."Recipient Bank Account");
                    if Customer.Find('-') then begin
                        BankAccountLedgerEntry."Recipient Bank Name" := Customer.Name;
                        BankAccountLedgerEntry."Recipient Bank Account" := Customer."Bank Account No.";
                        BankAccountLedgerEntry."Recipient Bank IFSC Code" := Customer."Bank Clearing Code";
                        BankAccountLedgerEntry."Recipient Branch Name" := Customer.IBAN;
                    end;
                end;
            "Gen. Journal Account Type"::Vendor:
                begin
                    Vendor.Reset();
                    Vendor.SetRange("vendor No.", GenJournalLine."Bal. Account No.");
                    Vendor.SetRange(Code, GenJournalLine."Recipient Bank Account");
                    if Vendor.Find('-') then begin
                        BankAccountLedgerEntry."Recipient Bank Name" := Vendor.Name;
                        BankAccountLedgerEntry."Recipient Bank Account" := Vendor."Bank Account No.";
                        BankAccountLedgerEntry."Recipient Bank IFSC Code" := Vendor."Bank Clearing Code";
                        BankAccountLedgerEntry."Recipient Branch Name" := Vendor.IBAN;
                    end;

                end;
            "Gen. Journal Account Type"::Employee:
                begin
                    Employee.Reset();
                    Employee.SetRange("No.", GenJournalLine."Bal. Account No.");
                    Employee.SetRange(Employee."Bank Account No.", GenJournalLine."Recipient Bank Account");
                    if Employee.Find('-') then begin
                        BankAccountLedgerEntry."Recipient Bank Account" := Employee."Bank Account No.";
                        BankAccountLedgerEntry."Recipient Bank IFSC Code" := Employee.IBAN;
                    end;
                end;
        end;
    end;
}