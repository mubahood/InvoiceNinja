<?php
$link = public_path('css/bootstrap-print.css');
use App\Models\Utils;
use App\Models\TenantPayment;

$tenant_receipt = TenantPayment::find($_GET['id']);
$logo_link = public_path('/logo-1.jpg' );
$sign = public_path('/sign.jpg');
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{ public_path('css/bootstrap-print.css') }}">
    <title>Invoice - {{ $tenant_receipt->id }}</title>
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
                    <b style="font-size: 35px;">RECEIPT</b>
                    <p>NO. <b style="color: red;"><i>0000{{ $tenant_receipt->id }}</i></b></p>
                </td>
            </tr>
            <tr>
                <td style="width: 35%;" class="">
                    <p>NICSIM</p>
 
                    <br>
                    <p>P.O.Box <b><i>30000, Kampala</i></b></p>
                    <p>Tel: <b><i>+256 772-544 263,<br>+256 702-544 263</i></b></p>
                </td>                
            </tr> 
        </tbody>
    </table>

    <hr style="background-color: rgb(31, 94, 9); height: 3px;" class="p-0 m-0 mt-4">
    <hr style="background-color: rgb(255, 255, 255); height: 3px;" class="p-0 m-0 mt-0">
    <hr style="background-color: rgb(26, 9, 94); height: 3px;" class="p-0 m-0 mt-0 mb-4">

    <p class="text-right">DATE: {{ Utils::my_date($tenant_receipt->created_at) }}</p><br>

    <b>PAID BY</b>
    <p>{{ $tenant_receipt->tenant->name }},</p>
    


    <table class="table table-bordered data mt-4 mb-2">
        <thead>
            <tr>
                <th style="width: 5%;">S/n</th>
                
                <th style="width: 8%;">TOTAL AMOUNT</th>
                <th style="width: 15%;">PAID</th>
                <th style="width: 20%;">BALANCE</th>
            </tr>
        </thead>


        <tbody>
            <?php $i = 0;
             ?>
               
                <tr>
                    <th>{{ $i }}</th>
                    <td class="text-center p-0">{{ $tenant_receipt->amount }}</td>
                    <td class="text-center p-0"> {{ number_format($tenant_receipt->amount) }}</td>
                    <td class="text-right p-0"> {{ number_format($tenant_receipt->balance) }}</td>
                </tr>


        </tbody>
      
    </table>
 

</body>

</html>
