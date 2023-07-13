<?php

$title = isset($title) ? $title : 'Title';
$style = isset($style) ? $style : 'success';
$number = isset($number) ? $number : '0.00';
$sub_title = isset($sub_title) ? $sub_title : null;
$link = isset($link) ? $link : 'javascript:;';

$bg = 'bg-primary';
$text = 'text-white';
$border = 'border-primary';
$text2 = 'text-dark';

?><a href="{{ admin_url('tenants') }}" title="View All Tenants"
    class="card {{ $bg }} {{ $border }} mb-4 mb-md-5">
    <div class="card-body py-0 pb-2 pb-md-4">
        <p class="h3  text-bold mb-2 mb-md-3 {{$text}} ">All time</p>
        <p class="  m-0 text-right {{$text}} h3" style="line-height: 3.2rem">
            {{ 'UGX ' . number_format($rentings->sum('payable_amount')) }}</p>

        <p class="mt-4 mb-2 {{$text}} text-uppercase">
            COMMISION: <span class="{{$text}}" style="font-weight: 800">
                {{ 'UGX ' . number_format($rentings->sum('commision_amount')) }}
            </span><br>
        </p>
        <hr class="mt-0 mb-2 mb-md-2" style="background-color: white; height: 2px;">
        <p class="h4  text-bold mb-2 bg-white text-primary pl-3 pt-2 pb-1">SUMMARY</p>
        <p class="mt-0 mb-0 {{$text}} text-uppercase">
            Landlords: <span style="font-weight: 800">UGX
                {{ number_format($rentings->sum('payable_amount')) }}</span>
        <p class="mt-0 mb-0 {{$text}} text-uppercase">
            RECEIPTS: <span style="font-weight: 800" class="text-success">UGX
                {{ number_format($payments->sum('amount')) }}</span>
        <p class="mt-0 mb-0 {{$text}} text-uppercase">TOTAL
            EXPENSES: <span style="font-weight: 800" class="text-danger">
                {{ '..........' }}</span>

        </p>
    </div>
</a>
