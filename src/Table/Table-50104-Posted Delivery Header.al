table 50104 "Posted Delivery Header"
{
    Caption = 'Posted Delivery Header';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Delivery Challan No."; Code[20])
        {
            Caption = 'Delivery Challan No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Delivery Date"; Date)
        {
            Caption = 'Delivery Date';
            DataClassification = ToBeClassified;
        }
        field(3; "Driver Name"; Text[50])
        {
            Caption = 'Driver Name';
            DataClassification = ToBeClassified;
        }
        field(4; "Driver Contact No."; Text[30])
        {
            Caption = 'Driver Contact No.';
            DataClassification = ToBeClassified;

        }
        field(5; "Vehicle No."; Text[20])
        {
            Caption = 'Vehicle No.';
            DataClassification = ToBeClassified;
        }
        field(6; "Delivery Boy"; Text[50])
        {
            Caption = 'Delivery Boy';
            DataClassification = ToBeClassified;
        }
        field(7; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(8; "Delivery Boy Contact"; Text[30])
        {
            DataClassification = ToBeClassified;

        }

    }
    keys
    {
        key(PK; "Delivery Challan No.")
        {
            Clustered = true;
        }
    }
    trigger OnDelete()
    var
        PDelLine: Record "Posted Delivery Line";
    begin
        PDelLine.Reset();
        PDelLine.SetRange("Delivery Challan No.", "Delivery Challan No.");
        IF PDelLine.FindSet() then
            repeat
                PDelLine.Delete();
            until PDelLine.Next() = 0;
    end;


    var
        DelieryHdr: record "Delivery Header";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalesRec: Record 311;

}
