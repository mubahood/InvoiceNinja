<?php

$title = isset($title) ? $title : 'Title';
$style = isset($style) ? $style : 'success';
$number = isset($number) ? $number : '0.00';
$sub_title = isset($sub_title) ? $sub_title : null;
$link = isset($link) ? $link : 'javascript:;';

$bg = '';
$text = 'text-primary';
$border = 'border-primary';
$text2 = 'text-dark';

?><a href="{{ admin_url('rooms') }}" title="View All Rooms"
    class="card {{ $bg }} {{ $border }} mb-4 mb-md-5">
    <div class="card-body py-0 pb-2 pb-md-4">
        <p class="h3  text-bold mb-2 mb-md-3 text-primary ">Rooms</p>
        <p class="  m-0 text-right text-primary h3" style="line-height: 3.2rem">{{ number_format($rooms->count()) }}</p>

        <p class="mt-4 mb-2 text-dark text-uppercase">
            Occupied: <span class=" text-danger"
                style="font-weight: 800">{{ $rooms->where('status', 'Occupied')->count() }}</span>,
            Available: <span class=" text-success"
                style="font-weight: 800">{{ $rooms->where('status', 'Vacant')->count() }}</span>
        </p>
        <hr class="mt-0 mb-2 mb-md-2" style="background-color: var(--primary); height: 2px;">
        <p class="h4  text-bold mb-2 bg-primary text-white pl-3 pt-2 pb-1">ROOMS STATES</p>
        <p class="mt-0 mb-0 text-dark text-uppercase">UNDER Construction: <span
                style="font-weight: 800">{{ $rooms->where('state', 'Construction')->count() }}</span>
 
        <p class="mt-0 mb-0 text-dark text-uppercase">UNDER Repair: <span
                style="font-weight: 800">{{ $rooms->where('state', 'Repair')->count() }}</span>
        <p class="mt-0 mb-0 text-dark text-uppercase">Ready: <span
                style="font-weight: 800">{{ $rooms->where('state', 'Ready')->count() }}</span>
        </p>
    </div>
</a>
