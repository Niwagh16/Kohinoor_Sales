tableextension 50101 "Item Ext" extends Item
{
    fields
    {
        field(50101; "Child Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";
        }
        field(50102; "Category 1"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const("Category 1"));

        }
        field(50103; "Category 2"; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const("Category 2"));
        }
        field(50104; "Category 3"; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const("Category 3"));
            //IF ("Option Type"=CONST(Trade)) "Bisleri Common Master - 2".Code WHERE (Code Type=CONST(Trade)) ELSE IF (Channel=CONST(Non_Corporate)) "Bisleri Common Master - 2".Code WHERE (Code Type=CONST(Non_Corporate)) ELSE IF (Channel=CONST(Others)) "Bisleri Common Master - 2".Code WHERE (Code Type=CONST(Others)) ELSE IF (Channel=CONST(Alternate)) "Bisleri Common Master - 2".Code WHERE (Code Type=CONST(Alternate))

        }
        field(50105; "Category 4"; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const("Category 4"));

        }
        field(50106; "Category 5"; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const("Category 5"));

        }
        field(50107; "Category 6"; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const("Category 6"));

        }
        field(50108; "Category 7"; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const("Category 7"));

        }
        field(50109; "Category 8"; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const("Category 8"));
        }
        field(50110; Demo; Boolean)
        {
            DataClassification = ToBeClassified;
        }

    }

    var
        myInt: Integer;
}