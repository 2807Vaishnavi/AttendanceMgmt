page 50104 "Purchase Order Custom"
{
    ApplicationArea = All;
    Caption = 'Purchase Order Custom';
    PageType = Card;
    SourceTable = "Purchase Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Buy-from Vendor Name"; Rec."Buy-from Vendor Name")
                {
                    Caption = 'Vendor Name';
                    Importance = Promoted;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        PageVendorLookup: Page "Vendor Lookup";
                        Rec_Vendor: Record Vendor;
                    begin
                        Clear(Rec_Vendor);
                        Rec_Vendor.Reset();
                        Rec_Vendor.SetRange(Blocked, Rec_Vendor.Blocked::" ");

                        Clear(PageVendorLookup);
                        PageVendorLookup.SetTableView(Rec_Vendor);
                        PageVendorLookup.LookupMode(true);
                        if PageVendorLookup.RunModal() = Action::LookupOK then begin
                            PageVendorLookup.GetRecord(Rec_Vendor);

                            Rec.Validate("Buy-from Vendor No.", Rec_Vendor."No.");
                            Rec.Validate("Buy-from Vendor Name", Rec_Vendor."Name");
                        end;
                    end;
                }

                field("Buy-from Contact"; Rec."Buy-from Contact")
                {
                }
                field("Document Date"; Rec."Document Date")
                {

                }

                field("Vendor Invoice No."; Rec."Vendor Invoice No.")
                {
                    ShowMandatory = true;
                    Importance = Promoted;
                }
                field("Vendor Shipment No."; Rec."Vendor Shipment No.")
                {
                    Importance = Standard;
                }
                field(Status; Rec.Status)
                {
                    StyleExpr = StatusStyleExpr;

                    trigger OnDrillDown()
                    begin
                        Message(StrSubstNo('The current Status is %1', Rec.Status));
                    end;
                }

                field("Buy-from Address"; Rec."Buy-from Address")
                {
                    Importance = Additional;
                }
                field("Buy-from Address 2"; Rec."Buy-from Address 2")
                {
                    Importance = Additional;
                }
                field("Buy-from Country/Region Code"; Rec."Buy-from Country/Region Code")
                {
                    Importance = Additional;
                }
                field("Buy-from Contact No."; Rec_VendorG."Phone No.")
                {
                    Importance = Additional;
                    Editable = false;
                    ExtendedDatatype = PhoneNo;
                }
                field("E-mail"; Rec_VendorG."E-Mail")
                {
                    Importance = Additional;
                    Editable = false;
                    ExtendedDatatype = EMail;
                }
            }

            part(Lines; "Purchase Subform Custom")
            {
                SubPageLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
            }
            group("Invoice Details")
            {
                Caption = 'Invoice Details';

                field("Currency Code"; Rec."Currency Code")
                {
                    trigger OnAssistEdit()
                    var
                        Page_Currencies: Page Currencies;
                        Rec_Currency: Record Currency;
                    begin
                        Clear(Rec_Currency);
                        Rec_Currency.Reset();

                        Clear(Page_Currencies);
                        Page_Currencies.SetTableView(Rec_Currency);
                        Page_Currencies.LookupMode(true);
                        if Page_Currencies.RunModal() = Action::LookupOK then begin
                            Page_Currencies.GetRecord(Rec_Currency);

                            Rec.Validate("Currency Code", Rec_Currency.Code);
                        end;
                    end;
                }

                field("Tax Exemption No."; Rec."Tax Exemption No.")
                {
                    trigger OnAssistEdit()
                    var
                        PageVendorLookup: Page "Vendor Lookup";
                        Rec_Vendor: Record Vendor;
                        VendorList: Text;
                    begin
                        Clear(Rec_Vendor);
                        Rec_Vendor.Reset();
                        Rec_Vendor.SetRange(Blocked, Rec_Vendor.Blocked::" ");

                        Clear(PageVendorLookup);
                        PageVendorLookup.SetTableView(Rec_Vendor);
                        PageVendorLookup.LookupMode(true);
                        if PageVendorLookup.RunModal() = Action::LookupOK then begin
                            PageVendorLookup.SetSelectionFilter(Rec_Vendor);

                            Clear(VendorList);
                            if Rec_Vendor.FindSet(false) then
                                repeat begin
                                    VendorList := VendorList + ',' + Rec_Vendor."No.";
                                end until Rec_Vendor.Next() = 0;

                            Rec.Validate("Tax Exemption No.", VendorList);
                        end;
                    end;
                }
            }
            group("Shipping and Billing")
            {
                Caption = 'Shipping and Billing';

            }
            group("Prepayment")
            {
                Caption = 'Prepayment';

                field("Compress Prepayment"; Rec."Compress Prepayment")
                {
                    trigger OnValidate()
                    begin
                        IsCompressPrepayment := Rec."Compress Prepayment";
                    end;
                }
                field("Vendor Cr. Memo No."; Rec."Vendor Cr. Memo No.")
                {

                }

                group("Sample Group")
                {
                    Visible = IsCompressPrepayment;
                    ShowCaption = false;
                    field("Prepayment %"; Rec."Prepayment %")
                    {
                        Visible = IsCompressPrepayment;
                        Editable = IsCompressPrepayment;
                    }

                    field("Prepmt. Payment Terms Code"; Rec."Prepmt. Payment Terms Code")
                    {
                        Visible = IsCompressPrepayment;
                        Editable = IsCompressPrepayment;
                    }
                }
            }
            group("Foreign Trade")
            {
                Caption = 'Prepayment';
            }
        }

        area(FactBoxes)
        {
            systempart(RecordLinks; Links)
            {
            }
            systempart(Notes; Notes)
            {

            }
            systempart(MyNotes; MyNotes)
            {

            }
            systempart(Outlook; Outlook)
            {

            }
        }
    }

    actions
    {
        area(Promoted)
        {
            group("Prepare")
            {
                ShowAs = SplitButton;
                actionref("Copy Doc Ref"; "Copy Doc Custom") { }
                actionref("Archive Doc Ref"; "Archive Doc Custom") { }

            }
            group("Print/Send")
            {
                actionref("Print Ref"; "Print") { }
            }
        }

        area(Processing)
        {
            action("Archive Doc Custom")
            {
                ApplicationArea = All;
                Caption = 'Archive Document';
                Image = Archive;

                trigger OnAction()
                begin

                end;
            }
            action("Copy Doc Custom")
            {
                ApplicationArea = All;
                Caption = 'Copy Document';
                Image = Copy;

                trigger OnAction()
                begin

                end;
            }
        }
        area(Reporting)
        {
            action("Print")
            {
                ApplicationArea = All;
                Caption = 'Print';
                Image = Print;
                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        StatusStyleExpr: Text;
        Rec_VendorG: Record Vendor;
        IsCompressPrepayment: Boolean;

    trigger OnInit()
    begin
        IsCompressPrepayment := true;
    end;

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

        Clear(Rec_VendorG);
        Rec_VendorG.Reset();
        Rec_VendorG.Get(Rec."Buy-from Vendor No.");
    end;

    local procedure MyProcedure()
    var
        myInt: Integer;
    begin

    end;
}
