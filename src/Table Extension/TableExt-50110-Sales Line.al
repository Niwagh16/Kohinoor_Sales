tableextension 50110 "Sales Line Sal" extends "Sales Line"
{
    fields
    {
        field(50102; Demo; Boolean)
        {
            Caption = 'Demo';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}
