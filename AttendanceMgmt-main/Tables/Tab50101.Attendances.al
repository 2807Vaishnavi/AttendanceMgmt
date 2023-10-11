table 50101 Attendances
{
    Caption = 'Attendances';
    DataClassification = CustomerContent;

    fields
    {
        field(50000; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(50001; "Student ID"; Integer)
        {
            Caption = 'Student ID';
            TableRelation = Students."Student ID";

            // trigger OnValidate()
            // var
            //     Rec_Students: Record Students;
            // begin
            //     Clear(Rec_Students);
            //     Rec_Students.Reset();
            //     Rec_Students.SetRange("Student ID", Rec."Student ID");
            //     if Rec_Students.FindFirst() then
            //         Rec.Validate("Student Name", Rec_Students."Student Name");

            // end;
        }

        field(50002; "Student Name"; Text[100])
        {
            Caption = 'Student Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Students."Student Name" where("Student ID" = field("Student ID")));
        }
        field(50003; "Start Time"; Time)
        {
            Caption = 'Start Time';
            // MinValue = 830;
        }
        field(50004; "End Time"; Time)
        {
            Caption = 'End Time';

            trigger OnValidate()
            begin
                If Rec."Start Time" > Rec."End Time" then
                    Error('Start time cannot be greater than End Time.');
            end;
        }

        field(50005; Date; Date)
        {
            Caption = 'Date';
            MinValue = 20000101D;
            MaxValue = 30000101D;
        }


    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(SK1; "Student ID")
        {

        }
        key(SK2; Date)
        {

        }
    }
}
