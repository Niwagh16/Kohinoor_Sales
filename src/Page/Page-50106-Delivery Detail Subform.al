page 50106 "Delivery Detail Subform"
{
    ApplicationArea = All;
    Caption = 'Delivery Detail Subform';
    PageType = ListPart;
    SourceTable = "Delivery Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                    Editable = false;
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                    ToolTip = 'Specifies the value of the Delivery Date field.';
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
