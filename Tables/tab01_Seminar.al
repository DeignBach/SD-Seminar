table 50101 "CSD Seminar"
{
    DataClassification = CustomerContent;
    Caption = 'Seminar';

    fields
    {
        field(10; "No."; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(20; "Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Name';
        }
        field(30; "Seminar Duration"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Seminar Duration';
            DecimalPlaces = 0 : 1;
        }
        field(40; "Minimum Participant"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Minimum Participant';
        }
        field(50; "Maximum Participants"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Maximum Participants';
        }
        field(60; "Search Name"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Search Name';
        }
        field(70; "Blocked"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Blocked';
        }
        field(80; "Last Date Modified"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(90; "Comment"; Boolean)
        {
            Caption = 'Comment';
            Editable = FALSE;
            FieldClass = FlowField;
            //CalcFormula=exist("CSD Seminar Comment Line" where("Table Name"=const("Seminar"),"No."=field("No.")));

        }
        field(100; "Seminar Price"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Seminar Price';
            AutoFormatType = 1;
        }
        field(110; "Gen. Prod. Posting Group"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";

        }
        field(120; "VAT Prod. Posting Group"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'VAT Prod. Posting Group';
            Editable = FALSE;
            TableRelation = "No. Series";
        }
        field(130; "No. Series"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'No. Series';
            Editable = FALSE;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    var
        SeminarSetup: Record "CSD Seminar Setup";
        //CommentLine : Record "CSD Seminar Comment Line";
        Seminar: Record "CSD Seminar";
        GenProdPostingGroup: Record "Gen. Product Posting Group";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            SeminarSetup.Get;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        End;
    End;

    trigger OnModify()
    begin
        "Last Date Modified" := Today();
    end;

    trigger OnDelete()
    begin
        //CommentLine.RESET;
        //CommentLine.SetRange("Table Name",CommentLine."Table Name"::Seminar);
        //CommentLine.SetRange("No.","No.");
        //CommentLine.DeleteAll;
    end;

    trigger OnRename()

    begin
        "Last Date Modified" := Today();
    end;

    procedure AssistEdit(): Boolean;
    begin
        with Seminar do begin
            Seminar := Rec;
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                Rec := Seminar;
                exit(true);
            End;
        end;
    End;
}
