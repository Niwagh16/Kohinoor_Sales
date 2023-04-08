pageextension 50108 Posted_SalesCr_Memo_Ext extends "Posted Sales Credit Memo"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Print)
        {
            action("Sales Return")
            {
                ApplicationArea = all;
                Image = Print;
                Promoted = true;

                trigger OnAction()
                var
                    SCMH: Record "Sales Cr.Memo Header";
                begin
                    SCMH.Reset();
                    SCMH.SetRange("No.", Rec."No.");
                    if SCMH.FindFirst() then
                        Report.RunModal(50002, true, false, SCMH);
                end;
            }
        }
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}