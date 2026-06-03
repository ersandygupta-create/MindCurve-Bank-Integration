tableextension 50754 "3E Purchase & Payable Setup" extends "Purchases & Payables Setup"
{
    fields
    {
        field(50751; "Bank File Series"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Bank File Series';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}