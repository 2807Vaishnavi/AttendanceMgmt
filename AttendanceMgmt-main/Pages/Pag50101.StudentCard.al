page 50101 "Student Card"
{
    ApplicationArea = All;
    Caption = 'Student Card';
    PageType = Card;
    SourceTable = Students;
    //Card Page Specific
    DataCaptionFields = "Student ID", "Student Name";


    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Student Name"; Rec."Student Name")
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ToolTip = 'Specifies the value of the Date of Birth field.';
                }
                field(Age; Rec.Age)
                {
                    ToolTip = 'Specifies the value of the Age field.';
                }
                field(Class; Rec.Class)
                {
                    ToolTip = 'Specifies the value of the Class field.';
                }
                field(Active; Rec.Active)
                {
                    ToolTip = 'Specifies the value of the Active field.';
                }
            }

            group("Student Image Grp")
            {
                ShowCaption = false;
                field("Student Image"; Rec."Student Image")
                {
                    ShowCaption = false;
                    ToolTip = 'Specifies the value of the Student Image field.';
                }
            }

            part(Attendance; Attendance)
            {
                ApplicationArea = All;
                SubPageLink = "Student ID" = field("Student ID");
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            actionref("Sample Processing Ref"; "Sample Processing") { }
        }
        area(Processing)
        {
            action("Sample Processing")
            {
                ApplicationArea = All;
                Image = Properties;
                // Enabled = false;
                Visible = IsProcessingVisibleG;

                trigger OnAction()
                begin
                    Message('Processing clicked!');
                end;
            }
        }

        area(Reporting)
        {
            action("Sample Reporting")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }

        area(Creation)
        {
            action("Sample Creation")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }

        area(Navigation)
        {
            action("Sample Navigation")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }

    }

    trigger OnOpenPage()
    begin
        IsProcessingVisibleG := true;
    end;

    var
        IsProcessingVisibleG: Boolean;
}
