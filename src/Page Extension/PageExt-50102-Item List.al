pageextension 50102 "Item List Ext" extends "Item List"
{
    layout
    {
        addafter("No.")
        {

            field("No. 2"; Rec."No. 2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the No. 2 field.';
            }
        }
        addafter(Description)
        {

            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Description 2 field.';
            }
        }
        addafter("Vendor No.")
        {

            field("Category 1"; Rec."Category 1")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Category 1 field.';
            }
            field("Category 2"; Rec."Category 2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Category 2 field.';
            }
            field("Category 3"; Rec."Category 3")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Category 3 field.';
            }
            field("Category 4"; Rec."Category 4")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Category 4 field.';
            }
            field("Category 5"; Rec."Category 5")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Category 5 field.';
            }
            field("Category 6"; Rec."Category 6")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Category 6 field.';
            }
            field("Category 7"; Rec."Category 7")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Category 7 field.';
            }
            field("Category 8"; Rec."Category 8")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Category 8 field.';
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