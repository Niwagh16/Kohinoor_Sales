page 50110 "Delivery Status Update"
{
    ApplicationArea = All;
    Caption = 'Delivery Status Update';
    PageType = List;
    SourceTable = "Posted Delivery Line";
    UsageCategory = Lists;

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
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Submit for Delivered")
            {
                Caption = 'Submit for Delivered';
                Image = Delivery;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Promoted = true;
                PromotedOnly = true;
                ApplicationArea = all;
                trigger OnAction()
                var
                    PDL: Record "Posted Delivery Line";
                begin
                    CurrPage.SetSelectionFilter(PDl);
                    PDL.SetRange(Delivered, false);
                    if PDL.FindSet() then
                        repeat
                            PDL.Validate(Delivered, true);
                            PDL."Delivered by" := UserId;
                            PDL."Delivered Date" := Today;
                            PDl.Modify();
                        until pdl.Next() = 0;
                    Message('Delivery Status Updated successfully for selected lines.');
                end;
            }
        }
    }
}
