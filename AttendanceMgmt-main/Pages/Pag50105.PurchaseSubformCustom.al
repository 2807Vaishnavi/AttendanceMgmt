page 50105 "Purchase Subform Custom"
{
    ApplicationArea = All;
    Caption = 'Purchase Subform Custom';
    PageType = ListPart;
    SourceTable = "Purchase Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Type; Rec.Type)
                {

                }
                field("No."; Rec."No.")
                {

                }
                field(Description; Rec.Description)
                {

                }
                field(Quantity; Rec.Quantity)
                {

                }

            }

            field("Test"; 'Test Field')
            {

            }
            field("Test 2"; 'Test Field 2')
            {

            }
        }
    }
    actions
    {
        area(Processing)
        {
            group(Line)
            {
                action(Comments)
                {
                    // ApplicationArea = All;
                    Image = Comment;
                    ShortcutKey = 'Alt+C';
                    RunObject = page "Purch. Comment Sheet";
                    RunPageLink = "Document Type" = field("Document Type"), "No." = field("Document No."), "Document Line No." = field("Line No.");

                    // trigger OnAction()
                    // var
                    //     Rec_Comment: Record "Purch. Comment Line";
                    //     Page_PurchaseComment: Page "Purch. Comment Sheet";
                    // begin
                    //     Clear(Rec_Comment);
                    //     Rec_Comment.Reset();
                    //     Rec_Comment.SetRange("Document Type", Rec."Document Type");
                    //     Rec_Comment.SetRange("No.", Rec."Document No.");
                    //     Rec_Comment.SetRange("Line No.", Rec."Line No.");

                    //     Clear(Page_PurchaseComment);
                    //     Page_PurchaseComment.SetTableView(Rec_Comment);
                    //     Page_PurchaseComment.Run();
                    // end;
                }
            }
            group(Functions)
            {
                action(Reserve)
                {
                    Image = Reserve;

                    trigger OnAction()
                    begin

                    end;
                }
                action("Order Tracking")
                {
                    Image = Track;
                    trigger OnAction()
                    begin

                    end;
                }
            }
        }

    }
}
