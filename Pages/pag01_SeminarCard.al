page 50101 "CSD Seminar Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar";
    Caption = 'Seminar';


    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    AssistEdit = true;

                    trigger OnAssistEdit()
                    begin
                        IF AssistEdit then
                            CurrPage.Update();
                    End;
                }
                field(Name; Name)
                {
                    ApplicationArea = All;

                }
                field("Search Name"; "Search Name")
                {
                    ApplicationArea = All;

                }
                field("Seminar Duration"; "Seminar Duration")
                {
                    ApplicationArea = All;

                }
                field("Minimum Participant"; "Minimum Participant")
                {
                    ApplicationArea = All;

                }
                field("Maximum Participants"; "Maximum Participants")
                {
                    ApplicationArea = All;

                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = All;

                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    ApplicationArea = All;

                }

            }
            group(Invoicing)
            {
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;

                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
                {
                    ApplicationArea = All;

                }
                field("Seminar Price"; "Seminar Price")
                {
                    ApplicationArea = All;

                }
            }
        }
        area(FactBoxes)
        {
            systempart("Links"; Links)
            {

            }
            systempart("Notes"; Notes)
            {

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}