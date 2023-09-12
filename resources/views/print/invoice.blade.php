<?php
$link = public_path('css/bootstrap-print.css');
use App\Models\Utils;
use App\Models\Invoice;

$c = Invoice::find($_GET['id']);
//$logo_link = public_path('/storage/' . $c->photo);
$logo_link = public_path('/logo-1.png' );
$sign = public_path('/sign.jpg');
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{ public_path('css/bootstrap-print.css') }}">
    <title>Invoice - {{ $c->id }}</title>
    {{--     @if ($template->print_water_mark == 1)
        <style>
            body::before {
                content: "";
                position: absolute;
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
                z-index: -1;
                background-image: url({{ $logo_link }});
                background-size: cover;
                background-position: center;
                opacity: 0.15;
                background-repeat: no-repeat;
                background-position: center;
                background-size: 80%;
                opacity: 0.15;
            }
        </style>
    @endif --}}
    <style>
        /*  @font-face {
            font-family: Arial;
            src: {public_path('assets/arial.ttf')};
        }
 */
        .data td,
        .data tbody th {
            padding: 2px !important;
            padding-left: 3px !important;
            margin: 0px !important;
        }

        .arab {
            font-family: dejavu sans;
            font-size: 13px
        }

        thead tr th {
            background-color: rgb(26, 9, 94);
            color: white;
            padding: 4px !important;
            text-align: center;
            font-size: 16px;
        }
    </style>

</head>

<body>

    <table class="w-100 ">
        <tbody>
            <tr>
                <td style="width: 30%;">
                    <img class="img-fluid" src="{{ $logo_link }}">
                    <br>
                    <br>
                </td>

                <td class=" text-center">

                </td>


                <td style="width: 15%;" class="">
                    <b style="font-size: 35px;">INVOICE</b>
                    <p>NO. <b style="color: red;"><i>0000{{ $c->id }}</i></b></p>
                </td>
            </tr>
            <tr>
                <td style="width: 35%;" class="">
                    <p>Dealers in Dental materials and equipment and general medical supplies.</p>
 
                    <br>
                    <p>P.O.Box <b><i>36580, Kampala</i></b></p>
                    <p>Tel: <b><i>+256 772-544 263,<br>+256 702-544 263</i></b></p>
                </td>                
            </tr> 
        </tbody>
    </table>

    <hr style="background-color: rgb(31, 94, 9); height: 3px;" class="p-0 m-0 mt-4">
    <hr style="background-color: rgb(255, 255, 255); height: 3px;" class="p-0 m-0 mt-0">
    <hr style="background-color: rgb(26, 9, 94); height: 3px;" class="p-0 m-0 mt-0 mb-4">

    <p class="text-right">DATE: {{ Utils::my_date($c->invoice_date) }}</p><br>

    <b>BILL TO</b>
    <p>{{ $c->customer_name }},</p>
    <p>{{ $c->customer_address }},</p>
    <p>{{ $c->customer_contact }}.</p>


    <table class="table table-bordered data mt-4 mb-2">
        <thead>
            <tr>
                <th style="width: 5%;">S/n</th>
                <th>PARTICULARS</th>
                <th style="width: 8%;">QTY</th>
                <th style="width: 15%;">RATE</th>
                <th style="width: 20%;">AMOUNT</th>
            </tr>
        </thead>


        <tbody>
            <?php $i = 0;
            $tot = 0; ?>
            @foreach ($c->items as $item)
                <?php $i++;
                $tot += $item->pro->price * $item->quantity;
                ?>
                <tr>
                    <th>{{ $i }}</th>
                    <td class="p-0">{{ $item->pro->name }}</td>
                    <td class="text-center p-0">{{ $item->quantity }}</td>
                    <td class="text-center p-0"> {{ number_format($item->pro->price) }}</td>
                    <td class="text-right p-0"> {{ number_format($item->pro->price * $item->quantity) }}</td>
                </tr>
            @endforeach

            <tr>
                <th><b></b></th>
                <th colspan="3"><b>TOTAL</b></th>
                <td class="text-right p-0">UGX <b>{{ number_format($tot) }}</b> </td>
            </tr>

        </tbody>
        {{--   <tr>
            <td class="w-25">FULL NAME</td>
            <td><b>{{ $c->first_name . ' ' . $c->middle_name . ' ' . $c->last_name }}</b></td>
            <td class="w-25 text-right arab">الاسم الكامل</td>
        </tr>
        <tr>
            <td class="w-25">POSITION</td>
            <td><b>{{ $c->job_type }}</b></td>
            <td class="w-25 text-right arab">موضع</td>
        </tr> --}}
    </table>
    <p class="text-center p-0 m-0"><i>Accounts are due on demand</i></p>
    <br>
    <p class=""><b>AMOUNT IN WORDS:</b> {{ Utils::convert_number_to_words($tot) }}.</p>

    <hr>

    <img class="img-fluid w-25" src="{{ $sign }}">  
    <p class=""><i>NICSIM PROPERTY MANAGERS LIMITED</i></p>
 
 

    {{-- 
    <p class="text-right"><b>{{ Utils::my_date(time()) }}</b></p> --}}

</body>

</html>
