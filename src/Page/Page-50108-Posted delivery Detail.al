page 50108 "Posted delivery Detail"
{
    ApplicationArea = All;
    Caption = 'Posted Dispatch Detail';
    PageType = Card;
    SourceTable = "Posted Delivery Header";
    RefreshOnActivate = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

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
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                    ToolTip = 'Specifies the value of the Delivery Date field.';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle No. field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Driver Contact No."; Rec."Driver Contact No.")
                {
                    ToolTip = 'Specifies the value of the Driver Contact No. field.';
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
            part(Lines; "Posted Delivery Subform")
            {
                ApplicationArea = all;
                SubPageLink = "Delivery Challan No." = field("Delivery Challan No.");

            }
        }

    }
    actions
    {
        area(Processing)
        {
            action(DataUpdate)
            {
                ApplicationArea = all;
                trigger OnAction()
                var
                    PDL: Record "Posted Delivery Line";
                    Item: Record 27;
                begin
                    IF PDL.FindSet() then
                        repeat
                            if Item.Get(PDL."Item No.") then begin
                                PDL."Item Category code 1" := Item."Category 1";
                                PDL.Modify();
                            end;
                        until PDL.Next() = 0;
                    Message('Done');
                end;
            }
        }
    }
}
