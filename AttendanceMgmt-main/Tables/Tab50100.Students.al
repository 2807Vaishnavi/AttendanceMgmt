table 50100 Students
{
    Caption = 'Students';
    DataClassification = OrganizationIdentifiableInformation;
    DataCaptionFields = "Student ID", "Student Name";
    
    fields
    {
        field(50000; "Student ID"; Integer)
        {
            Caption = 'Student ID';
            AutoIncrement = true;
        }

        field(50001; "Student Name"; Text[100])
        {
            Caption = 'Name';
        }
        field(50002; "Date of Birth"; Date)
        {
            Caption = 'Date of Birth';

            trigger OnValidate()
            var
                AgeL: Integer;
            begin
                Clear(AgeL);
                AgeL := Date2DMY(Today, 3) - Date2DMY(Rec."Date of Birth", 3);
                Rec.Validate(Age, AgeL);
            end;
        }
        field(50003; "Age"; Integer)
        {
            Caption = 'Age';
            Editable = false;

        }
        field(50004; "Class"; Enum Classes)
        {
            Caption = 'Class';
        }
        field(50005; "Active"; Boolean)
        {
            Caption = 'Active';
            InitValue = true;
        }
        field(50006; "Attendance Count"; Integer)
        {
            Caption = 'Attendance Count';
            FieldClass = FlowField;
            CalcFormula = Count(Attendances where("Student ID" = field("Student ID"), Date = field("Attendance Count Filter")));
        }
        field(50007; "Attendance Count Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50008; "Student Image"; Blob)
        {
            DataClassification = CustomerContent;
            Subtype = Bitmap;
        }
    }
    keys
    {
        key(PK; "Student ID")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        //When new record is created
    end;

    trigger OnModify()
    begin
        //When modifying non-PK fields for a record
    end;

    trigger OnRename()
    begin
        //When modifying PK fields for a record
    end;

    trigger OnDelete()
    begin
        //When deleting a record
        if Rec.Active then
            Error('Cannot delete active records.');
    end;


    //https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-al-control-statements
    local procedure DifferentMethodsToFetchRecords()
    var
        Students: Record Students;
        IntArr: array[10] of Integer;
        IntList: List of [Integer];
        MyInt: Integer;
        SumInt: Integer;
    begin
        foreach MyInt in IntList do begin

        end;

        for MyInt := 1 to 10 do begin
            MyInt += IntArr[MyInt];
        end;

        for MyInt := 10 downto 1 do begin
            MyInt += IntArr[MyInt];
        end;

        //Fetches a single record
        //Returns true or false, throws error if record is not found
        //Only takes PK as parameters
        if Students.Get(1) then;

        Clear(Students);
        Students.Reset();
        Students.SetRange("Student Name", 'Riki');
        //Fetches a single record
        //Returns true or false, throws error if record is not found
        //Does not take any parameters
        //Finds the first record based on the filters
        if Students.FindFirst() then;

        Clear(Students);
        Students.Reset();
        Students.SetRange("Student Name", 'Riki');
        //Fetches a single record
        //Returns true or false, throws error if record is not found
        //Does not take any parameters
        //Finds the last record based on the filters
        if Students.FindLast() then;

        Clear(Students);
        Students.Reset();
        Students.SetRange("Student Name", 'Riki');
        //Fetches a multiple record
        //Returns true or false, throws error if record is not found
        // Takes a boolean parameters, which defines whether the record is going to be modified or not
        //Finds the last record based on the filters
        if Students.FindSet(true) then
            repeat begin

            end until Students.Next() = 0;
    end;
}
