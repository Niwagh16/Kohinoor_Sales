pageextension 50109 Posted_Transfer_Shipment_Ext extends "Posted Transfer Shipment"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("&Print")
        {
            action("Transfer Order")
            {
                ApplicationArea = all;
                Promoted = true;
                Image = Print;
                trigger OnAction()
                var
                    TSH: Record "Transfer Shipment Header";
                begin
                    TSH.Reset();
                    TSH.SetRange("No.", rec."No.");
                    if TSH.FindFirst() then
                        Report.RunModal(50003, true, false, TSH);
                end;

            }
        }
    }

    var
        myInt: Integer;
}