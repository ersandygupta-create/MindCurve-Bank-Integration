pageextension 50757 "3E Vendor Ext" extends "Vendor Card"
{
    layout
    {
        addafter("General")
        {
            group("3E Bank Integration")
            {
                Caption = '3E Bank Integration';
                field("Bank Integration"; Rec."Bank Integration")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Integration Enabled';
                    ToolTip = 'Indicates whether bank integration is enabled for this vendor.';
                }
            }
        }
    }


}