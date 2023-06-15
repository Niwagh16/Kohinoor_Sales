pageextension 50101 "Item Card Ext1" extends "Item Card"
{
    layout
    {
        addafter("No.")
        {
            field("Parent Item No."; Rec."Child Item No.")
            {
                ApplicationArea = all;

            }

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
            field(Demo; Rec.Demo)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Demo field.';
            }

        }
    }

    actions
    {

    }

    var
        myInt: Integer;
}