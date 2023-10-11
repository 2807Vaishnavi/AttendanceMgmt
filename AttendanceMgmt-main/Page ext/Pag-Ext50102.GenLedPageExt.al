pageextension 50102 GenLedPageExt extends "General Ledger Setup"
{
    layout
    {
        addbefore("Allow Posting From")
        {
            field("Marksheet No Series"; Rec."Marksheet No Series")
            {
                ApplicationArea = All;
            }
        }
    }
}
