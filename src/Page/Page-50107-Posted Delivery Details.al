page 50107 "Posted Delivery Details"
{
    ApplicationArea = All;
    Caption = 'Posted Delivery Details';
    PageType = List;
    SourceTable = "Posted Delivery Header";
    UsageCategory = History;
    CardPageId = "Posted delivery Detail";

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
                field("Delivery Date"; Rec."Delivery Date")
                {
                    ToolTip = 'Specifies the value of the Delivery Date field.';
                }
                field("Driver Contact No."; Rec."Driver Contact No.")
                {
                    ToolTip = 'Specifies the value of the Driver Contact No. field.';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle No. field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Delivery Boy"; Rec."Delivery Boy")
                {
                    ToolTip = 'Specifies the value of the Delivery Boy field.';
                }
                field("Delivery Boy Contact"; Rec."Delivery Boy Contact")
                {
                    ToolTip = 'Specifies the value of the Delivery Boy Contact field.';
                }
            }
        }
    }
}
