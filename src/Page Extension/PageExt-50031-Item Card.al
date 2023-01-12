pageextension 50031 "Item Card Ext1" extends "Item Card"
{
    layout
    {
        addafter("No.")
        {
            field("Parent Item No."; Rec."Parent Item No.")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}