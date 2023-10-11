table 50102 Marksheet
{
    Caption = 'Marksheet';
    DataClassification = CustomerContent;

    fields
    {
        field(50000; "Marksheet No"; Code[20])
        {
            Caption = 'Marksheet No';
        }
        field(50001; "Student ID"; Integer)
        {
            Caption = 'Student ID';
        }
        field(50002; "Student Name"; Text[150])
        {
            Caption = 'Student Name';
        }
        field(50003; "Student Roll No"; Integer)
        {
            Caption = 'Student Roll No';
        }
        field(50004; Class; Enum Classes)
        {
            Caption = 'Class';
        }
        field(50005; Division; Enum DivisionEnum)
        {
            Caption = 'Division';
        }
        field(50006; "Subject 1"; Decimal)
        {
            Caption = 'Subject 1';
        }
        field(50007; "Subject 2"; Decimal)
        {
            Caption = 'Subject 2';
        }
        field(50008; "Subject 3"; Decimal)
        {
            Caption = 'Subject 3';
        }
        field(50009; "Subject 4"; Decimal)
        {
            Caption = 'Subject 4';
        }
        field(50010; "Academic Year"; Code[30])
        {
            Caption = 'Academic Year';
        }
        field(50011; Percentage; Decimal)
        {
            Caption = 'Percentage';
          
        }
        field(50012; "Grade"; Code[30])
        {
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Marksheet No")
        {
            Clustered = true;
        }
    }
}
