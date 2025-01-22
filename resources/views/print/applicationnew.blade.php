@if (!isset($item))
    @php throw new Exception('Item not set'); @endphp
@endif

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="css/bootstrap-print.css" />
    <link rel="stylesheet" href="{{ public_path('css/print.css') }}" />
    <title>Application Form</title>
    <style>
        .text-justify {
            text-align: justify;
        }

        .divider {
            background-color: black;
            height: 3px;
        }

        p {
            /* padding-bottom: 8px !important; */
        }
    </style>
</head>

<body>
    <table style="width: 100%">
        <tr>
            <td style="width: 25%;"></td>
            <td class="text-center" style="width: 20%;">
                <img style="width: 100px" src="{{ public_path('assets/images/coat_of_arms-min.png') }}">
            </td>
            <td style="width: 25%;"></td>
        </tr>
        <tr>
            <td colspan="3" class="text-center">
                <p style="font-size: 18px; font-weight: bold; margin-bottom: 0%!important">THE REPUBLIC OF UGANDA</p>
                <p style="font-size: 18px; font-weight: bold; margin-bottom: 0%!important">TAX APPEALS TRIBUNAL</p>
                <p style="font-size: 12px;">
                    <strong>E-MAIL:</strong> info@tat.co.ug,
                    <strong>TELEPHONE:</strong> +256 0414 340 470/23268, NIC Building 7th & 8th Floor
                </p>
            </td>
        </tr>
    </table>
    <hr class="divider" />

    <h5 class="text-center mt-4 mb-4"><strong>FORM TAT 1</strong></h5>
    <p class="text-center">
        IN THE TAX APPEALS TRIBUNAL AT @include('components.value-display', ['s' => 'TAX APPEALS TRIBUNAL (TAT)'])
        REGISTRY APPLICATION NUMBER @include('components.value-display', ['s' => $item->application_number])
        YEAR @include('components.value-display', ['s' => $item->year])
    </p>
    <p class="mt-4 text-center">IN THE MATTER OF</p>
    <p class="text-center mb-2">
        @include('components.value-display', ['s' => $item->applicant_name, 'max_spaces' => 15])
        APPLICANT
    </p>
    <p class="text-center mb-2">AND</p>
    <p class="text-center mb-2">
        @include('components.value-display', ['s' => 'UGANDA REVENUE AUTHORITY (URA)', 'max_spaces' => 15])
        RESPONDENT
    </p>

    <h5 class="text-center mt-4"><strong>APPLICATION</strong></h5>
    <p class="text-center mb-4"><i>(Under Section 17 of the Act and rule 10)</i></p>

    <h4>1. PARTICULARS OF APPLICANT</h4>
    <p><i>(a)</i> Name: @include('components.value-display', ['s' => $item->applicant_name])</p>
    <p><i>(b)</i> Nature of business: @include('components.value-display', ['s' => $item->nature_of_business])</p>
    <p><i>(c)</i> Postal address: @include('components.value-display', ['s' => $item->postal_address])</p>
    <p class="text-justify"><i>(d)</i> Physical address:
        Plot: @include('components.value-display', ['s' => $item->plot_number])
        Street: @include('components.value-display', ['s' => $item->street])
        Village: @include('components.value-display', ['s' => $item->village])
        Town/City: @include('components.value-display', ['s' => $item->trading_center])
    </p>
    <br>
    <p><i>(e)</i> Telephone: @include('components.value-display', ['s' => $item->telephone_number])
        Fax: @include('components.value-display', ['s' => $item->fax_number])
        Email: @include('components.value-display', ['s' => $item->email])
    </p>
    <p><i>(h)</i> VAT Number: @include('components.value-display', ['s' => $item->vat_number])</p>

    <h4 class="mt-4">2. PARTICULARS OF TAX DISPUTES</h4>
    <p><i>(a)</i> Office: @include('components.value-display', ['s' => $item->tax_decision_office])</p>
    <p><i>(b)</i> Type of tax: @include('components.value-display', ['s' => $item->tax_type])</p>
    <p><i>(c)</i> Assessment Number: @include('components.value-display', ['s' => $item->assessment_number])</p>
    <p><i>(d)</i> Customs Bill of Entry: @include('components.value-display', ['s' => $item->bill_of_entry])</p>
    <p><i>(e)</i> Bank Payment Advice Form Number: @include('components.value-display', ['s' => $item->bank_payment])</p>
    <p><i>(f)</i> Amount of tax in dispute: @include('components.value-display', ['s' => $item->amount_of_tax])</p>
    <p><i>(g)</i> Date of service of taxation decision:
        @include('components.value-display', ['s' => $item->taxation_decision_date])
    </p>

    <h4 class="mt-4">3. STATEMENT OF FACT AND REASONS</h4>
    <p>@include('components.value-display', ['s' => $item->statement_of_facts])</p>

    <h4 class="mt-4">4. ISSUES ON WHICH A DECISION IS SOUGHT</h4>
    <p>@include('components.value-display', ['s' => $item->decision_issue])</p>

    <h4 class="mt-4">5. LIST OF BOOKS OR DOCUMENTS</h4>
    <p>@include('components.value-display', ['s' => $item->list_of_books])</p>

    <h4 class="mt-4">6. WITNESSES (IF ANY)</h4>
    <p>@include('components.value-display', ['s' => $item->witness_names])</p>

    <h4 class="mt-4">7. REPRESENTATIVE ADDRESS</h4>
    <p>NAME: @include('components.value-display', ['s' => $item->representative_name])</p>
    <p>TELEPHONE: @include('components.value-display', ['s' => $item->representative_telephone])</p>
    <p>MOBILE: @include('components.value-display', ['s' => $item->representative_mobile])</p>
    <p>ADDRESS: @include('components.value-display', ['s' => $item->representative_address])</p>

    <h4 class="mt-4">8. DATE OF FILLING</h4>
    <p>DATE: @include('components.value-display', ['s' => $item->date_of_filling])</p>
    <p>Signature of Applicant/Advocate/Agent</p>

    <h4 class="text-center">FOR OFFICIAL USE</h4>
    <p><strong>By Registrar/Officer-in-Charge</strong></p>
    <p>Date of filling: ..........................................</p>
    <p>Signature: .................................................</p>
    <p>Official Stamp</p>

    <h4 class="text-center">FOR OFFICIAL USE</h4>
    <p><strong>By Commissioner General</strong></p>
    <p>Date: .......................................................</p>
    <p>Sign: .......................................................</p>

</body>

</html>
