tableextension 50109 "Sales inv line" extends "Sales Invoice Line"
{
    fields
    {
        field(50101; Delivered; Boolean)
        {
            Caption = 'Delivered';
            DataClassification = ToBeClassified;
        }
    }
}
