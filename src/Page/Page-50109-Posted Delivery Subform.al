page 50109 "Posted Delivery Subform"
{
    ApplicationArea = All;
    Caption = 'Posted Delivery Subform';
    PageType = ListPart;
    SourceTable = "Posted Delivery Line";
    AutoSplitKey = true;
    Editable = false;
    LinksAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Invoice No."; Rec."Invoice No.")
                {
                    ToolTip = 'Specifies the value of the Invoice No. field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Customer Phone No."; Rec."Customer Phone No.")
                {
                    ToolTip = 'Specifies the value of the Customer Phone No. field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field("Item Description"; Rec."Item Description")
                {
                    ToolTip = 'Specifies the value of the Item Description field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field(Warehouse; Rec.Warehouse)
                {
                    ToolTip = 'Specifies the value of the Warehouse field.';
                }
                field("Store Name"; Rec."Store Name")
                {
                    ToolTip = 'Specifies the value of the Store Name field.';
                }
                field("Delivery Address"; Rec."Delivery Address")
                {
                    ToolTip = 'Specifies the value of the Delivery Address field.';
                }
                field("Delivery Address 2"; Rec."Delivery Address 2")
                {
                    ToolTip = 'Specifies the value of the Delivery Address 2 field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
        }
    }
}
