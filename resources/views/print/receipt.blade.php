<?php
$link = public_path('css/bootstrap-print.css');
use App\Models\Utils;
use App\Models\TenantPayment;

$receipt = TenantPayment::find($_GET['id']);
$logo_link = public_path('/logo-1.jpg');
$sign = public_path('/sign.jpg');
?>

<!DOCTYPE html>
<html lang="en">

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{ public_path('css/bootstrap-print.css') }}">
    <title>Payment receipt</title>
    <style>
        @page {
            size: A4 portrait;
        }
    </style>
</head>

<body>
    <div class="receipt  p-3 pb-4" style="border: solid black .2rem;">
        <table class="w-100 ">
            <tbody>
                <tr>
                    <td style="width: 12%;" class="pr-2">
                        <img class="img-fluid" src="{{ $logo_link }}">
                    </td>
                    <td class=" text-left">
                        <p class="p-0 m-0" style="font-size: 1.3rem;"><b>NICSIM PROPERTY MANAGERS LIMITED</b></p>
                        <p class="mt-1">P.O.BOX: <b>27063 - KAMPALA</b>
                        <p class="mt-1">Tel: <b>0200901808</b> , <b>+256708180880</b>, <b>+256705360104</b>
                        </p>
                    </td>
                    <td style="width: 15%; text-align: right;">
                        <b>No. <span style="color: red;">{{ $receipt->id }}</span></b>
                        <br><br><br>
                    </td>
                </tr>
            </tbody>
        </table>

        <h2 class="text-center h4 mb-4 mt-4"><u>RECEIPT</u></h2>

        <p class="text-right mb-4"><b>{{ Utils::my_date($receipt->created_at) }}</b></p>
        <p>Received sum of <b>UGX {{ number_format($receipt->amount) }}</b> in words:
            <b>{{ Utils::convert_number_to_words($receipt->amount) }}</b>.
        <p>{{ $receipt->details }} </p>
        </p>
        <p class="mt-3 mb-4">BALANCE: <b>UGX {{ number_format($receipt->balance) }}</b></p>

        <table style="width: 100%;">
            <tr>
                <td>
                    <div class="  d-inline p-2 px-3"
                        style="font-weight: 800; font-size: 1.4rem; border: solid black .2rem;">
                        UGX {{ number_format($receipt->amount) }}
                    </div>
                </td>
                <td class="text-right">
                    Approved by <b>.............................</b>
                </td>
            </tr>
        </table>


    </div>
</body>

</html>
