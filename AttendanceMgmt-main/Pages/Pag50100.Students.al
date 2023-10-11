page 50100 Students
{
    ApplicationArea = All;
    Caption = 'Students';
    PageType = List;
    SourceTable = Students;
    UsageCategory = Lists;
    CardPageId = "Student Card";
    ModifyAllowed = false;
    DeleteAllowed = true;
    InsertAllowed = true;



    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Student ID"; Rec."Student ID")
                {
                    ToolTip = 'Specifies the value of the Student ID field.';
                    Editable = false;
                }
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
                field("Attendance Count"; Rec."Attendance Count")
                {
                    ToolTip = 'Specifies the value of the Attendance Count field.';
                }
                field("Student Image"; Rec."Student Image")
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Sample Processing")
            {
                ApplicationArea = All;
                Image = Properties;
                Scope = Repeater;
                // Enabled = false;
                // Visible = false;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    // trigger OnInit()
    // begin
    //     Message('OnInit');
    // end;

    // trigger OnOpenPage()
    // begin
    //     Message('OnOpenPage');
    // end;

    // // trigger OnFindRecord(Which: Text): Boolean
    // // begin
    // //     Message('OnFindRecord');
    // // end;

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     Message('OnNewRecord');
    // end;

    // trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    // begin
    //     Message('OnInsertRecord');
    // end;

    // trigger OnModifyRecord(): Boolean
    // begin
    //     Message('OnModifyRecord');
    // end;

    // trigger OnDeleteRecord(): Boolean
    // begin
    //     Message('OnDeleteRecord');
    // end;

    // trigger OnNextRecord(Steps: Integer): Integer
    // begin
    //     Message('OnNextRecord');
    // end;

    // trigger OnAfterGetCurrRecord()
    // begin
    //     Message('OnAfterGetCurrRecord');
    // end;

    // trigger OnAfterGetRecord()
    // begin
    //     Message('OnAfterGetRecord');
    // end;

    // trigger OnQueryClosePage(CloseAction: Action): Boolean
    // begin
    //     Message('OnQueryClosePage');
    // end;

    // trigger OnClosePage()
    // begin
    //     Message('OnClosePage');
    // end;
}
