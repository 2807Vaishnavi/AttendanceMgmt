pageextension 50101 CustomerSocialMediaPage_Ext extends "Customer Card"
{
    layout
    {
        addfirst(General)
        {
            field(Linkedin; Rec.Linkedin)
            {
                ApplicationArea = All;
            }
            field(Facebook; Rec.Facebook)
            {
                ApplicationArea = All;
            }

        }



    }

    trigger OnOpenPage()
    begin

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

    end;

    trigger OnModifyRecord(): Boolean
    begin

    end;

    trigger OnAfterGetCurrRecord()
    begin

    end;

    trigger OnAfterGetRecord()
    begin

    end;

    trigger OnDeleteRecord(): Boolean
    begin

    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin

    end;

    trigger OnClosePage()
    begin

    end;

    trigger OnPageBackgroundTaskError(TaskId: Integer; ErrorCode: Text; ErrorText: Text; ErrorCallStack: Text; var IsHandled: Boolean)
    begin

    end;

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    begin

    end;
}
