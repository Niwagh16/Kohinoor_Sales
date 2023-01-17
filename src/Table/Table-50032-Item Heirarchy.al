table 50032 "Item heirarchy"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; A; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const(A));

        }
        field(2; B; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const(B));


        }
        field(3; C; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const(C));

        }
        field(4; D; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const(D));

        }
        field(5; E; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const(E));

        }
        field(6; F; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const(F));

        }
        field(7; G; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const(G));

        }
        field(8; H; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Heirarchy Master".Code where("Option Type" = const(H));

        }

    }

    keys
    {
        key(Key1; A, B, C, D, E, F, G, H)
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