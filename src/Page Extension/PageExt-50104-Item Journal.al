pageextension 50104 "Item Journal Ext" extends "Item Journal"
{
    layout
    {
        addafter("Shortcut Dimension 2 Code")
        {
            field("Sales Invoice No."; Rec."Sales Invoice No.")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addafter("E&xplode BOM")
        {
            action("Get Invoice Lines")
            {
                Caption = 'Get Invoice Lines';
                Image = GetLines;
                PromotedIsBig = true;
                Promoted = true;
                trigger OnAction()
                begin
                    GetInvoiceLine();
                end;
            }
        }
    }
    //     GetShipments.SETTABLEVIEW(SalesShptLine);
    // GetShipments.SetSalesHeader(SalesHeader);
    // GetShipments.LOOKUPMODE := TRUE;
    // IF GetShipments.RUNMODAL <> ACTION::Cancel THEN;

    procedure GetInvoiceLine()
    var
        GetInvoiceLine: page "Get Invoice Lines";
    Begin
        SalesInvLine.SetCurrentKey("Document No.");
        SalesInvLine.SetRange(Type, SalesInvLine.Type::Item);
        SalesInvLine.SetFilter(Quantity, '<>%1', 0);
        GetInvoiceLine.SetTableView(SalesInvLine);
        GetInvoiceLine.LookupMode := true;
        IF GetInvoiceLine.RUNMODAL <> ACTION::Cancel THEN;
    End;

    var
        SalesInvLine: Record 113;

}