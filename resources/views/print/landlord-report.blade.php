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
                        </p>
                    </td>
                    <td style="width: 15%; text-align: right;">

                    </td>
                </tr>
            </tbody>
        </table>
        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nihil, illo, maiores ipsum aperiam velit ratione
            maxime
            voluptatibus voluptate deserunt vero porro harum nam, ullam at? Vitae quasi reiciendis officiis fugiat?</p>
    </div>
</body>

</html>
