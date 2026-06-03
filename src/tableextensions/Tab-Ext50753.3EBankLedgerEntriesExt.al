tableextension 50753 "3E HIS Bank Ledger Entry" extends "Bank Account Ledger Entry"
{
    fields
    {
        field(50751; "Bank Integration"; Boolean)
        {
            Caption = 'Bank Integration';
            DataClassification = CustomerContent;
        }
        field(50752; "Recipient Bank IFSC Code"; Code[50])
        {
            Description = 'Recipient Bank IFSC Code';
            DataClassification = CustomerContent;
        }
        field(50753; "Recipient Bank Account"; Code[30])
        {
            Caption = 'Recipient Bank Account';
            DataClassification = ToBeClassified;
        }
        field(50754; "Bank Transaction Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Submitted,Successfull,Failed,Cancelled,File Exported';
            OptionMembers = " ",Submitted,Successfull,Failed,Cancelled,"File Exported";
        }
        field(50755; "Payment Exported"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Payment Exported';
        }
        field(50756; "Recipient Branch Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Recipient Branch Name';
        }
        field(50757; "Recipient Bank Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Recipient Bank Name';
        }
        field(50758; "Value Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Value Date';
        }

    }
}