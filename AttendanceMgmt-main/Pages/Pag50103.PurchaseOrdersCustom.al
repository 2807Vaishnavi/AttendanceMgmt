page 50103 "Purchase Orders Custom"
{
    ApplicationArea = All;
    Caption = 'Purchase Orders Custom';
    PageType = List;
    SourceTable = "Purchase Header";
    UsageCategory = Lists;
    CardPageId = "Purchase Order Custom";
    ModifyAllowed = false;
    InsertAllowed = true;
    DeleteAllowed = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the No. of the Purchase Order';

                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {

                }
                field("Buy-from Vendor Name"; Rec."Buy-from Vendor Name")
                {

                }
                field(Status; Rec.Status)
                {
                    //Use style to hardcode the colors and font style of the text
                    StyleExpr = StatusStyleExpr;

                }
            }
        }
    }

    var
        StatusStyleExpr: Text;

    trigger OnAfterGetRecord()
    begin
        Clear(StatusStyleExpr);
        StatusStyleExpr := 'None';

        if Rec.Status = Rec.Status::Open then
            StatusStyleExpr := 'Favorable';

        if Rec.Status = Rec.Status::"Pending Approval" then
            StatusStyleExpr := 'StandardAccent';

        if Rec.Status = Rec.Status::Released then
            StatusStyleExpr := 'Subordinate';
    end;

}
