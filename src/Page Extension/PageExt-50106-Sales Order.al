pageextension 50106 Sales_Order_Ext extends "Sales Order"
{
    layout
    {

        // Add changes to page layout here
    }

    actions
    {
        addafter("O&rder")
        {
            action("Sales Order")
            {
                Caption = 'Sales Order';
                Promoted = true;
                Image = Print;
                ApplicationArea = all;
                trigger OnAction()
                var
                    SH: Record "Sales Header";
                begin
                    SH.Reset();
                    SH.SetRange("No.", rec."No.");
                    if SH.FindFirst() then
                        Report.RunModal(50001, true, false, SH);
                    // SH.Modify();
                end;
            }
        }
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}