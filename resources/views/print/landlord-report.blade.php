<?php

$link = public_path('css/bootstrap-print.css');
use App\Models\Utils;

$logo_link = public_path('/logo-1.jpg');
$sign = public_path('/sign.jpg');
?>
<!DOCTYPE html>
<html lang="en">
<style>
    @page {
        size: A4 landscape;
    }

    .text-lowercase {
        text-transform: lowercase !important
    }

    .text-uppercase {
        text-transform: uppercase !important
    }

    .text-capitalize {
        text-transform: capitalize !important
    }

    .font-weight-light {
        font-weight: 300 !important
    }

    .font-weight-normal {
        font-weight: 400 !important
    }

    .font-weight-bold {
        font-weight: 700 !important
    }

    .font-italic {
        font-style: italic !important
    }

    .text-white {
        color: #fff !important
    }

    .text-primary {
        color: #007bff !important
    }

    a.text-primary:focus,
    a.text-primary:hover {
        color: #0062cc !important
    }

    .text-secondary {
        color: #6c757d !important
    }

    a.text-secondary:focus,
    a.text-secondary:hover {
        color: #545b62 !important
    }

    .text-success {
        color: #28a745 !important
    }

    a.text-success:focus,
    a.text-success:hover {
        color: #1e7e34 !important
    }

    .text-info {
        color: #17a2b8 !important
    }

    a.text-info:focus,
    a.text-info:hover {
        color: #117a8b !important
    }

    .text-warning {
        color: #ffc107 !important
    }

    a.text-warning:focus,
    a.text-warning:hover {
        color: #d39e00 !important
    }

    .text-danger {
        color: #dc3545 !important
    }

    a.text-danger:focus,
    a.text-danger:hover {
        color: #bd2130 !important
    }

    .text-light {
        color: #f8f9fa !important
    }

    a.text-light:focus,
    a.text-light:hover {
        color: #dae0e5 !important
    }

    .text-dark {
        color: #343a40 !important
    }

    a.text-dark:focus,
    a.text-dark:hover {
        color: #1d2124 !important
    }

    .text-muted {
        color: #6c757d !important
    }

    .text-hide {
        font: 0/0 a;
        color: transparent;
        text-shadow: none;
        background-color: transparent;
        border: 0
    }

    .visible {
        visibility: visible !important
    }

    .invisible {
        visibility: hidden !important
    }

    @media print {

        *,
        ::after,
        ::before {
            text-shadow: none !important;
            box-shadow: none !important
        }

        a:not(.btn) {
            text-decoration: underline
        }

        abbr[title]::after {
            content: " ("attr(title) ")"
        }

        pre {
            white-space: pre-wrap !important
        }

        blockquote,
        pre {
            border: 1px solid #999;
            page-break-inside: avoid
        }

        thead {
            display: table-header-group
        }

        img,
        tr {
            page-break-inside: avoid
        }

        h2,
        h3,
        p {
            orphans: 3;
            widows: 3
        }

        h2,
        h3 {
            page-break-after: avoid
        }

        @page {
            size: a3
        }

        body {
            min-width: 992px !important
        }

        .container {
            min-width: 992px !important
        }

        .navbar {
            display: none
        }

        .badge {
            border: 1px solid #000
        }

        .table {
            border-collapse: collapse !important
        }

        .table td,
        .table th {
            background-color: #fff !important
        }

        .table-bordered td,
        .table-bordered th {
            border: 1px solid black !important
        }
    }


    h1,
    h2,
    h3,
    h4,
    h5,
    h6,
    .h1,
    .h2,
    .h3,
    .h4,
    .h5,
    .h6,
    p {
        padding: 0% !important;
        margin: 0% !important;
        line-height: 1 !important;
        font-family: Arial, Helvetica, sans-serif;
    }

    p {
        font-size: 16px;
    }

    .detail-item {
        font-size: 14px !important;
        line-height: 1rem !important;
    }

    .my-h2 {
        text-align: center;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif !important;
        text-decoration: underline;
        font-size: 24px;
        font-weight: 800;
        text-transform: uppercase !important;
    }

    .my-table {
        font-size: 12px !important;
        line-height: .8rem !important;
        padding: 0.2rem !important;
    }

    .my-table tbody tr td {
        padding: 0.2rem !important;
        font-size: 12px !important;
    }
</style>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{ public_path('css/bootstrap-print.css') }}">
    <title>Payment receipt</title>
</head>

<body>

    <div class="main">
        <table class="w-100 ">
            <tbody>
                <tr>
                    <td style="width: 10%;" class="pr-2">
                        <img class="img-fluid" src="{{ $logo_link }}">
                    </td>
                    <td class=" text-center">
                        <p class="p-0 m-0" style="font-size: 1.3rem;"><b>NICSIM PROPERTY MANAGERS LIMITED</b></p>
                        <p class="mt-1">P.O.BOX: <b>27063 - KAMPALA</b>
                        <p class="mt-1">Tel: <b>+256708180880</b> , <b>+256775280880</b>
                        <p class="mt-1">Email: <b>info@nicsimproperty.com</b> , Website <b>www.nicsimproperty.com</b>
                        </p>
                    </td>
                    <td style="width: 15%; text-align: right;">

                    </td>
                </tr>
            </tbody>
        </table>
        <hr style="height:2px;border-width:0;color:gray;background-color:gray">

        @include('components.detail-item', ['t' => 'Name', 's' => $landLord->name])
        @include('components.detail-item', ['t' => 'Phone number', 's' => $landLord->phone_number])
        @include('components.detail-item', ['t' => 'Address', 's' => $landLord->address])

        <p class="my-h2 mb-3">Summary Report - As On {{ Utils::my_date(time()) }}</p>
        <table class="table table-bordered my-table">
            <thead style="background-color: black;" class="table text-white  table-bordered">
                <tr>
                    <th style="border-color: black; border-right-color: white; ">ESTATES & ROOMS</th>
                    <th style="border-color: black; border-right-color: white; ">TENANTS</th>
                    <th style="border-color: black; border-right-color: white; ">COMPANY COMISSION</th>
                    <th style="border-color: black; border-right-color: black; ">LANDLORD</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        @include('components.detail-item', ['t' => 'Estates', 's' => 11])
                        @include('components.detail-item', ['t' => 'Occupied Rooms', 's' => 11])
                        @include('components.detail-item', ['t' => 'Vacant Rooms', 's' => 11])
                        @include('components.detail-item', ['t' => 'All Rooms', 's' => 11])
                    </td>
                    <td>
                        @include('components.detail-item', ['t' => 'All Tenants', 's' => '12'])
                        @include('components.detail-item', ['t' => 'New Tenants', 's' => '6'])
                        @include('components.detail-item', ['t' => 'Debtors', 's' => '4'])
                        @include('components.detail-item', ['t' => 'Total Debt', 's' => '12'])
                    </td>
                    <td>
                        @include('components.detail-item', ['t' => 'Name', 's' => 'John Doe'])
                        @include('components.detail-item', ['t' => 'Phone number', 's' => 'John Doe'])
                        @include('components.detail-item', ['t' => 'Address', 's' => 'John Doe'])
                    </td>
                    <td>
                        @include('components.detail-item', ['t' => 'TOTAL INCOME', 's' => '12,020,000'])
                        @include('components.detail-item', ['t' => 'COMISSION', 's' => '1,122,010'])
                        @include('components.detail-item', ['t' => 'AMOUNT PAID', 's' => '1,122,010'])
                        @include('components.detail-item', ['t' => 'BALANCE ', 's' => '1,122,010'])
                    </td>
                </tr>
            </tbody>
        </table>

        <p class="my-h2 mt-3 mb-2">RECENT RENTINGS (Invoinces)</p>
        <table class="table table-bordered my-table">
            <thead style="" class="table   table-bordered">
                <tr>
                    <th style="border-color: black; ">Invoince No.</th>
                    <th style="border-color: black; ">Estate</th>
                    <th style="border-color: black; ">Room</th>
                    <th style="border-color: black; ">Tenant</th>
                    <th style="border-color: black; ">Period</th>
                    <th style="border-color: black; ">Starts</th>
                    <th style="border-color: black; ">Ends</th>
                    <th style="border-color: black; ">Amount</th>
                    <th style="border-color: black; ">Paid</th>
                    <th style="border-color: black; ">Balance</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $i = 0;
                @endphp
                @foreach ($rentings as $rent)
                    @php
                        $i++;
                    @endphp
                    <tr>
                        <td>{{ $i }}</td>
                        <td>{{ $rent->room->house->name }}</td>
                        <td>{{ $rent->room->number }}</td>
                        <td>{{ $rent->tenant->name }}</td>
                        <td>{{ Utils::my_date($rent->period) }}</td>
                        <td>{{ Utils::my_date($rent->starts) }}</td>
                        <td>{{ $rent->ends }}</td>
                        <td>{{ number_format($rent->amount) }}</td>
                        <td>{{ number_format($rent->paid) }}</td>
                        <td>{{ number_format($rent->balance) }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>

        <p class="my-h2 mt-3 mb-2">RECENT TENANTS PAYMENTS (Receipts)</p>
        <table class="table table-bordered my-table">
            <thead style="" class="table   table-bordered">
                <tr>
                    <th style="border-color: black; ">S/n.</th>
                    <th style="border-color: black; ">Date</th>
                    <th style="border-color: black; ">Invoince</th>
                    <th style="border-color: black; ">Tenant</th>
                    <th style="border-color: black; ">Description</th>
                    <th style="border-color: black; ">Amount</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $i = 0;
                @endphp
                @foreach ($tenantsPayments as $trans)
                    @php
                        $i++;
                    @endphp
                    <tr>
                        <td>{{ $i }}</td>
                        <td>{{ Utils::my_date($trans->created_at) }}</td>
                        <td>#{{ $trans->renting_id }}</td>
                        <td>{{ $trans->tenant->name }}</td>
                        <td>{{ $trans->details }}</td>
                        <td>UGX {{ number_format($trans->amount) }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>

        <p class="my-h2 mt-3 mb-2">RECENT LANDLOAD PAYMENTS (Transactions)</p>
        <table class="table table-bordered my-table">
            <thead style="" class="table   table-bordered">
                <tr>
                    <th style="border-color: black; ">S/n.</th>
                    <th style="border-color: black; ">Date</th>
                    <th style="border-color: black; ">Description</th>
                    <th style="border-color: black; ">Amount</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $i = 0;
                @endphp
                @foreach ($landlordPayments as $trans)
                    @php
                        $i++;
                    @endphp
                    <tr>
                        <td>{{ $i }}</td>
                        <td>{{ Utils::my_date($trans->created_at) }}</td>
                        <td>{{ $trans->details }}</td>
                        <td>UGX {{ number_format($trans->amount) }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</body>

</html>
