pageextension 50102 "Item List Ext" extends "Item List"
{
    layout
    {
        addafter("No.")
        {
            field("Parent Item No."; Rec."Child Item No.")
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