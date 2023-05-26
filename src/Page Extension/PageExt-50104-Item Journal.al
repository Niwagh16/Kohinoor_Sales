pageextension 50104 "Item Journal Ext" extends "Item Journal"
{
    layout
    {
    }

    actions
    {
        addafter("E&xplode BOM")
        {
            action("Get Invoice Lines")
            {
                Caption = 'Get Invoice Lines';
                ApplicationArea = all;
                Image = GetLines;
                PromotedIsBig = true;
                Promoted = true;
                trigger OnAction()
                begin
                    IF Confirm('Do you want fatch the sales invoice line', true) then
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