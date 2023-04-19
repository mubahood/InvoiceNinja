<?php
$link = public_path('css/bootstrap-print.css');
use App\Models\Utils;
use App\Models\Candidate;

$c = Candidate::find($_GET['id']);
$logo_link = public_path('/storage/' . $c->photo);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{ public_path('css/bootstrap-print.css') }}">
    <title>TEST CV</title>
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
        .data td {
            padding: 3px !important;
            margin: 0px !important;
        }

        .arab {
            font-family: dejavu sans;
            font-size: 13px
        }
    </style>

</head>

<body>

    <table class="w-100 ">
        <tbody>
            <tr>
                <td style="width: 15%;" class="">
                    <img class="img-fluid" src="{{ $logo_link }}">
                </td>
                <td class=" text-center">
                    <h1 class="h3 " style="font-size: 20px">JARO HOLDINGS INTERNATIONAL LIMITED</h1>
                    <p class="mt-1">Address: Plost 121, Najanankumbi, Salama Road</p>
                    <p class="mt-0">Email: test-email@gmail.com</p>
                    <p class="mt-0">Tel: <b>+880632257609</b> , <b>+880632257609</b></p>
                </td>
                <td style="width: 15%;">
                    <img class="img-fluid" src="{{ public_path('assets/images/logo.jpg') }}">
                </td>
            </tr>
        </tbody>
    </table>

    <hr style="background-color: black; height: 2px;" class="p-0 m-0 mt-2">
    <hr style="background-color: yellow; height: 2px;" class="p-0 m-0">
    <hr style="background-color: red; height: 2px;" class="p-0 m-0">
    <table class="table table-bordered data mt-2">
        <tr>
            <td class="w-25">FULL NAME</td>
            <td><b>{{ $c->first_name . ' ' . $c->middle_name . ' ' . $c->last_name }}</b></td>
            <td class="w-25 text-right arab">الاسم الكامل</td>
        </tr>
        <tr>
            <td class="w-25">POSITION</td>
            <td><b>{{ $c->job_type }}</b></td>
            <td class="w-25 text-right arab">موضع</td>
        </tr>
    </table>

    {{-- 
    <p class="text-right"><b>{{ Utils::my_date(time()) }}</b></p> --}}

</body>

</html>
