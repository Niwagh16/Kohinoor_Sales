table 50102 "Item heirarchy"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Category 1"; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const("Category 1"));

        }
        field(2; "Category 2"; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const("Category 2"));


        }
        field(3; "Category 3"; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const("Category 3"));

        }
        field(4; "Category 4"; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const("Category 4"));

        }
        field(5; "Category 5"; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const("Category 5"));

        }
        field(6; "Category 6"; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const("Category 6"));

        }
        field(7; "Category 7"; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const("Category 7"));

        }
        field(8; "Category 8"; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const("Category 8"));

        }

    }

    keys
    {
        key(Key1; "Category 1", "Category 2", "Category 3", "Category 4", "Category 5", "Category 6", "Category 7", "Category 8")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}