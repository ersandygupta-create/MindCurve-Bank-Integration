tableextension 50755 "3E Bank Account Ext" extends "Bank Account"
{
    fields
    {
        field(50751; "Server Code"; Text[30])
        {
            Caption = 'Server Code';
            DataClassification = CustomerContent;
        }
        field(50752; "Client Code"; Text[30])
        {
            Caption = 'Client Code';
            DataClassification = CustomerContent;
        }
        field(50753; "Client Code 1"; Text[30])
        {
            Caption = 'Client Code 1';
            DataClassification = CustomerContent;
        }
    }
}