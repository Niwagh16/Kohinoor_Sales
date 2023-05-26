page 50105 "Delivery Detail"
{
    ApplicationArea = All;
    Caption = 'Delivery Detail';
    PageType = Card;
    SourceTable = "Delivery Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Delivery Challan No."; Rec."Delivery Challan No.")
                {
                    ToolTip = 'Specifies the value of the Delivery Challan No. field.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                    ToolTip = 'Specifies the value of the Delivery Date field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Driver Contact No."; Rec."Driver Contact No.")
                {
                    ToolTip = 'Specifies the value of the Driver Contact No. field.';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle No. field.';
                }
                field("Delivery Boy"; Rec."Delivery Boy")
                {
                    ToolTip = 'Specifies the value of the Delivery Boy field.';
                }
            }
            part(Lines; "Delivery Detail Subform")
            {
                ApplicationArea = all;
                SubPageLink = "Delivery Challan No." = field("Delivery Challan No.");
                UpdatePropagation = Both;
            }

        }

    }
    actions
    {
        area(Navigation)
        {
            action("Get Invoice Lines")
            {
                ApplicationArea = all;
                Caption = 'Get Invoice Lines';
                Image = GetLines;
                trigger OnAction()
                begin
                    GetInvoiceLine();
                end;
            }
        }
    }
    procedure GetInvoiceLine()
    var
        GetInvoiceLineDelivery: page "Get Invoice Lines Delivery";
        SalesInvLine: Record 113;
    Begin
        SalesInvLine.SetCurrentKey("Document No.");
        SalesInvLine.SetRange(Type, SalesInvLine.Type::Item);
        SalesInvLine.SetFilter(Quantity, '<>%1', 0);
        GetInvoiceLineDelivery.SetTableView(SalesInvLine);
        GetInvoiceLineDelivery.SetSalesHeader(Rec);
        GetInvoiceLineDelivery.LookupMode := true;
        IF GetInvoiceLineDelivery.RUNMODAL <> ACTION::Cancel THEN;
    End;



}
