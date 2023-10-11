tableextension 50100 CustomerExt extends Customer
{


    fields
    {
        field(50100; Facebook; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50102; Linkedin; Text[50])
        {
            DataClassification = CustomerContent;

        }

        modify(Address)
        {
            trigger OnAfterValidate()
            begin
                if Strlen(Address) > 20 then Error('kindly enter the details to Address 2 field');
                if Address.Contains('@') then Error('You cannot use special characters in Address field');
            end;

        }
        modify("No.")
        {
            trigger OnAfterValidate()
            begin
                if xRec."No." <> Rec."No." then Error('You cannot change the No');
            end;
        }


    }
    keys
    {

    }

    trigger OnBeforeInsert()
    begin
        Message('This is before insert trigger');
    end;

    trigger OnInsert()
    begin
        Message('This is insert trigger');

    end;

    trigger OnAfterInsert()
    begin
        Message('This is after insert trigger');

    end;

    trigger OnBeforeModify()
    begin
        Message('This is before modify trigger');
    end;

    trigger OnModify()
    begin
        Message('This is  modify trigger');

    end;

    trigger OnAfterModify()
    begin
        Message('This is after modify trigger');

    end;

    trigger OnBeforeDelete()
    begin
        Message('This is before delete trigger');

    end;

    trigger OnDelete()
    begin
        Message('This is delete trigger');

    end;

    trigger OnAfterDelete()
    begin
        Message('This is after delete trigger');

    end;

    trigger OnBeforeRename()
    begin
        Message('This is before rename trigger');

    end;

    trigger OnRename()
    begin
        Message('This is rename trigger');

    end;

    trigger OnAfterRename()
    begin
        Message('This is after rename trigger');

    end;


}
