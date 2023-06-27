pageextension 50112 "Gen led Setup for Sale" extends "General Ledger Setup"
{
    layout
    {
        addafter(EnableDataCheck)
        {

            field("Item Journal Batch for Sales"; Rec."Item Journal Batch for Sales")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item Journal Batch for Sales field.';
            }
            field("Item Journal Batch for Purch."; Rec."Item Journal Batch for Purch.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item Journal Batch for Sales field.';
            }
        }
    }
}
