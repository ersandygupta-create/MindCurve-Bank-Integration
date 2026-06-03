tableextension 50751 "3E Vendor Ledger Ext" extends "Vendor Ledger Entry"
{

    fields
    {
        field(50751; Select; Boolean)
        {
            Caption = 'Select';
            DataClassification = CustomerContent;
        }
        field(50752; "Ready for Payment"; Boolean)
        {
            Caption = 'Ready for Payment';
            DataClassification = CustomerContent;
        }
        field(50753; "Hold Status"; Boolean)
        {
            Caption = 'Hold Status';
            DataClassification = CustomerContent;
        }
        field(50754; "Bank Integration"; Boolean)
        {
            Caption = 'Bank Integration';
            DataClassification = CustomerContent;
        }
        field(50755; "Payment Exported"; Boolean)
        {
            Caption = 'Payment Exported';
            DataClassification = CustomerContent;
        }
        field(50756; "RP User Id"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'RP User Id';
        }
        field(50757; "RP DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'RP DateTime';
        }
        field(50758; "CR User Id"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'CR User Id';
        }
        field(50759; "CR DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'CR DateTime';
        }
        field(50760; "Amount to Pay"; Decimal)
        {
            Caption = 'Amount to Pay';
            Editable = true;
            DataClassification = ToBeClassified;
        }
        field(50761; "Bank Integration Enabled"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Vendor."Bank Integration" where("No." = FIELD("Vendor No.")));
        }
    }
}
