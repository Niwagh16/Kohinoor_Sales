pageextension 50107 Sales_Quote_Ext extends "Sales Quote"
{
    layout
    {
        addafter("Due Date")
        {
            field("Pro-forma Invoice"; Rec."Pro-forma Invoice")
            {
                ApplicationArea = all;
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        addafter(Print)
        {
            action("Sales Order")
            {
                Caption = 'Proforma Invoice';
                Image = Print;
                Promoted = true;
                ApplicationArea = all;
                trigger OnAction()
                var
                    SH: Record "Sales Header";
                begin
                    SH.Reset();
                    SH.SetRange("No.", rec."No.");
                    if SH.FindFirst() then //begin
                        // SH.Modify();
                        Report.RunModal(50001, true, false, SH);
                    //end;
                end;
            }
        }
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}