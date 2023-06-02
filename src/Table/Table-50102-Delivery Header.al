table 50102 "Delivery Header"
{
    Caption = 'Delivery Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Delivery Challan No."; Code[20])
        {
            Caption = 'Delivery Challan No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Delivery Challan No." <> xRec."Delivery Challan No." then begin
                    NoSeriesMgt.TestManual(GetNoSeriesCode());
                    "No. Series" := '';
                end;
            end;
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
            trigger OnValidate()
            var
                Cnt: Integer;
            begin
                Cnt := StrLen("Driver Contact No.");
                IF (Cnt > 10) OR (Cnt < 10) then
                    Error('Phone No. required 10 digit only.');
            end;
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
            trigger OnValidate()
            var
                Cnt: Integer;
            begin
                Cnt := StrLen("Delivery Boy Contact");
                IF (Cnt > 10) OR (Cnt < 10) then
                    Error('Phone No. required 10 digit only.');
            end;
        }

    }
    keys
    {
        key(PK; "Delivery Challan No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        IF Rec."Delivery Challan No." = '' then
            rec.TestField("Delivery Challan No.");
    end;

    trigger OnDelete()
    var
        DelLine: Record "Delivery Line";
    begin
        DelLine.Reset();
        DelLine.SetRange("Delivery Challan No.", "Delivery Challan No.");
        IF DelLine.FindSet() then
            repeat
                DelLine.Delete();
            until DelLine.Next() = 0;
    end;

    local procedure GetNoSeriesCode(): Code[20]
    var
        NoSeriesCode: Code[20];
        IsHandled: Boolean;


    begin
        SalesRec.Get();
        IsHandled := false;
        if IsHandled then
            exit;
        NoSeriesCode := SalesRec."Delivery No Series";
        exit(NoSeriesCode);
    end;

    procedure AssistEdit(OldDeliveryHdr: Record "Delivery Header"): Boolean
    begin
        with DelieryHdr do begin
            DelieryHdr := Rec;
            SalesRec.Get();
            SalesRec.TestField("Delivery No Series");
            if NoSeriesMgt.SelectSeries(GetNoSeriesCode(), OldDeliveryHdr."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("Delivery Challan No.");
                Rec := DelieryHdr;
                exit(true);
            end;
        end;
    end;


    var
        DelieryHdr: record "Delivery Header";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalesRec: Record 311;

}
