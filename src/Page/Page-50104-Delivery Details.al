page 50104 "Delivery Details"
{
    ApplicationArea = All;
    Caption = 'Delivery Details';
    PageType = List;
    SourceTable = "Delivery Header";
    UsageCategory = Lists;
    CardPageId = "Delivery Detail";
    InsertAllowed = false;
    ModifyAllowed = false;

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
        }
    }
}
