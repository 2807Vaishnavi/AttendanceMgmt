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
                        PageStudent: page Students;
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
                }

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

        Rec."Marksheet No" := Cu_Numberseries.DoGetNextNo(Rec_GenLedeSetup."Marksheet No Series", Today, true, true);
        Rec."Academic Year" := 'SY-' + Format(System.Date2DMY(Today, 3));
        StartDate := CalcDate('-CY', Today);
        EndDate := CalcDate('CY', Today);
        Rec.Insert();
    end;

 

}
