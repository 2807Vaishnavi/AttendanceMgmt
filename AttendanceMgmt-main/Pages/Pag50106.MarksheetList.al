page 50106 "Marksheet List"
{
    ApplicationArea = All;
    Caption = 'Marksheet List';
    PageType = List;
    SourceTable = Marksheet;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Marksheet No"; Rec."Marksheet No")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if xRec."Marksheet No" <> Rec."Marksheet No" then Error('You cannot change the Marksheet No');// To check if old no and new no is different throw an error.
                    end;
                }
                field("Student ID"; Rec."Student ID")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    TableRelation = Students."Student ID";
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Rec_Student: Record Students;
                    begin
                        Rec_Student.Reset();
                        if Page.RunModal(Page::Students, Rec_Student) = Action::LookupOK then begin
                            // Rec."Student ID" := Rec_Student."Student ID";
                            // Rec.Class := Rec_Student.Class;
                            // Rec."Student Name" := Rec_Student."Student Name";

                            Rec.Validate("Student ID", Rec_Student."Student ID");
                            Rec.Validate("Student Name", Rec_Student."Student Name");
                            Rec.Validate(Class, Rec_Student.Class);

                        end;
                    end;
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = All;
                }
                field("Student Roll No"; Rec."Student Roll No")
                {
                    ApplicationArea = All;
                }
                field("Subject 1"; Rec."Subject 1")
                {
                    ApplicationArea = All;
                }
                field("Subject 2"; Rec."Subject 2")
                {
                    ApplicationArea = All;
                }
                field("Subject 3"; Rec."Subject 3")
                {
                    ApplicationArea = All;
                }
                field("Subject 4"; Rec."Subject 4")
                {
                    ApplicationArea = All;
                }
                field("Academic Year"; Rec."Academic Year")
                {
                    ApplicationArea = All;
                }
                field(Class; Rec.Class)
                {
                    ApplicationArea = All;
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = All;
                }
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if (Rec.Percentage > 90) and (Rec.Percentage < 100) then rec.Grade := 'A+';
                        if (Rec.Percentage < 90) and (Rec.Percentage > 80) then rec.Grade := 'A';
                        if (Rec.Percentage < 80) and (Rec.Percentage > 70) then rec.Grade := 'B+';
                        if (Rec.Percentage < 70) and (Rec.Percentage > 60) then rec.Grade := 'B';
                        if (Rec.Percentage < 60) and (Rec.Percentage > 50) then rec.Grade := 'C+';
                        if (Rec.Percentage < 50) and (Rec.Percentage > 40) then rec.Grade := 'C';

                    end;
                }

            }

        }

    }
    actions
    {
        area(Processing)
        {
            action(AttendanceList)
            {
                Caption = 'Attendance List';
                ApplicationArea = All;
                Image = Document;
                RunObject = Page Attendance;
                RunPageLink = "Student ID" = field("Student ID"), "Student Name" = field("Student Name"); // you can use this feature for opening Attendance Page.
                trigger OnAction()
                var
                    PageAttendance: Page Attendance;
                    Rec_Attendance: Record Attendances;
                begin
                    //Alternate way to open a new page using the action 
                    Clear(Rec_Attendance);
                    Clear(PageAttendance);
                    Rec_Attendance.SetRange("Student ID", Rec."Student ID");
                    PageAttendance.SetTableView(Rec_Attendance);
                    PageAttendance.Run();
                end;

            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        Rec_GenLedeSetup: Record "General Ledger Setup";
        Cu_Numberseries: Codeunit NoSeriesManagement;
        StartDate: Date;
        EndDate: Date;
    begin
        Rec_GenLedeSetup.Get();
        Rec_GenLedeSetup.TestField("Marksheet No Series");// To check if the Marksheet No series contains a value or not and throw a error

        if Rec_GenLedeSetup."Marksheet No Series" = '' then Error('Kindly assign Marksheet No series in General Ledger Setup');// To check if the Marksheet No series contains a value or not and throw a error

        Rec.Validate("Marksheet No", Cu_Numberseries.DoGetNextNo(Rec_GenLedeSetup."Marksheet No Series", Today, true, true));
        Rec.Validate("Academic Year", 'SY-' + Format(System.Date2DMY(Today, 3)));
        StartDate := CalcDate('-CY', Today);
        EndDate := CalcDate('CY', Today);
    end;

    trigger OnModifyRecord(): Boolean
    var
        CountN: Integer;
        TotalmarksObtaine: Decimal;
    begin
        Clear(CountN);
        if (xRec."Subject 1" <> Rec."Subject 1") or (xRec."Subject 2" <> Rec."Subject 2") or (xRec."Subject 3" <> Rec."Subject 3") or (xRec."Subject 4" <> Rec."Subject 4") then begin
            if Rec."Subject 1" <> 0 then CountN := 100 + CountN;
            if Rec."Subject 2" <> 0 then CountN += 100;
            if Rec."Subject 3" <> 0 then CountN += 100;
            if Rec."Subject 4" <> 0 then CountN += 100;
            Rec.Validate(Percentage, ((Rec."Subject 1" + Rec."Subject 2" + Rec."Subject 3" + Rec."Subject 4") / CountN) * 100);

        end;
    end;

}
