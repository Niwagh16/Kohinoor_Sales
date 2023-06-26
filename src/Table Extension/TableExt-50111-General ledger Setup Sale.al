tableextension 50111 "General ledger Setup Sale" extends "General Ledger Setup"
{
    fields
    {
        field(50101; "Item Journal Batch for Sales"; Code[10])
        {
            Caption = 'Item Journal Batch for Sales';
            DataClassification = ToBeClassified;
            TableRelation = "Item Journal Batch";
        }

    }
}
