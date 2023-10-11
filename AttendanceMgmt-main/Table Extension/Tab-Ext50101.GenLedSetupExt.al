tableextension 50101 GenLedSetupExt extends "General Ledger Setup"
{
    fields
    {
        field(50100; "Marksheet No Series"; Code[20])
        {
            Caption = 'Marksheet No Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }

    }
}
