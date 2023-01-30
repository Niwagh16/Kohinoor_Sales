tableextension 50101 "Item Ext" extends Item
{
    fields
    {
        field(50101; "Parent Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";
        }
    }

    var
        myInt: Integer;
}