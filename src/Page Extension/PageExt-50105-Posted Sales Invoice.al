pageextension 50105 Posted_Sales_Invoice_Ext extends "Posted Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Approvals)
        {
            action("Tax Invoice")
            {
                Promoted = true;
                Image = Print;
                ApplicationArea = all;
                PromotedCategory = Report;
                trigger OnAction()
                var
                    SIH: Record "Sales Invoice Header";
                begin
                    SIH.Reset();
                    SIH.SetRange("No.", rec."No.");
                    if SIH.FindFirst() then
                        Report.RunModal(50000, true, false, SIH);
                end;
            }
        }

        // Add changes to page actions here
    }

    var
        myInt: Integer;
}