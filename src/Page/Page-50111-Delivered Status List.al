page 50111 "Delivered Status List"
{
    ApplicationArea = All;
    Caption = 'Delivered Status List';
    PageType = List;
    SourceTable = "Posted Delivery Line";
    UsageCategory = Lists;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    SourceTableView = where(Delivered = filter(true));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Delivery Challan No."; Rec."Delivery Challan No.")
                {
                    ToolTip = 'Specifies the value of the Delivery Challan No. field.';
                }
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
                field("Delivery Address"; Rec."Delivery Address")
                {
                    ToolTip = 'Specifies the value of the Delivery Address field.';
                }
                field("Delivery Address 2"; Rec."Delivery Address 2")
                {
                    ToolTip = 'Specifies the value of the Delivery Address 2 field.';
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                    ToolTip = 'Specifies the value of the Delivery Date field.';
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
                field("Store Name"; Rec."Store Name")
                {
                    ToolTip = 'Specifies the value of the Store Name field.';
                }
                field(Warehouse; Rec.Warehouse)
                {
                    ToolTip = 'Specifies the value of the Warehouse field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field(Delivered; Rec.Delivered)
                {
                    ToolTip = 'Specifies the value of the Delivered field.';
                }
                field("Delivered by"; Rec."Delivered by")
                {
                    ToolTip = 'Specifies the value of the Delivered by field.';
                }
                field("Delivered Date"; Rec."Delivered Date")
                {
                    ToolTip = 'Specifies the value of the Delivered Date field.';
                }
                field("Item Category code 1"; Rec."Item Category code 1")
                {
                    ToolTip = 'Specifies the value of the Item Category code 1 field.';
                }
            }
        }

    }
    actions
    {
        area(Navigation)
        {
            group(Report)
            {

            }
        }
    }

}
