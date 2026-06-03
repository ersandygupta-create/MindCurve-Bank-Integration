pageextension 50789 "3E Business Manager RC" extends "Business Manager Role Center"
{
    actions
    {
        addbefore(Action39)
        {
            group("3E Bank Integration")
            {
                Caption = 'Bank Integration';
                group("Payment Process")
                {
                    Caption = 'Payment Process';

                    action("VLE Payment Entry Selection")
                    {
                        AccessByPermission = TableData "Vendor Ledger Entry" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Payment Entry Selection';
                        Image = NewOrder;
                        RunObject = Page "3E Vendor Ledger Entries";
                        RunPageMode = Create;
                        ToolTip = 'Specify the Payment Entry Selection';
                    }
                    action("VLE Ready for Payment")
                    {
                        AccessByPermission = TableData "Vendor Ledger Entry" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Ready for Payment Process';
                        Image = NewOrder;
                        RunObject = Page "3E VLE Ready for Payment";
                        RunPageMode = Create;
                        ToolTip = 'Specify the VLE Ready for Payment';
                    }
                    action("Bank Process Data")
                    {
                        AccessByPermission = TableData "3E Bank Integration" = IMD;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Bank Process Data';
                        Image = NewOrder;
                        RunObject = Page "3E Exported BLE File";
                        RunPageMode = Create;
                        ToolTip = 'Specify the Exported BLE File';
                    }
                }
            }
        }
    }
}
