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

?><a href="{{ admin_url('tenants') }}" title="View All Tenants"
    class="card {{ $bg }} {{ $border }} mb-4 mb-md-5">
    <div class="card-body py-0 pb-2 pb-md-4">
        <p class="h3  text-bold mb-2 mb-md-3 text-primary ">Tenants</p>
        <p class="  m-0 text-right text-primary h3" style="line-height: 3.2rem">{{ number_format($tenants->count()) }}</p>

        <p class="mt-4 mb-2 text-dark text-uppercase">
            Overstay: <span class="text-danger"
                style="font-weight: 800">{{ $rentings->where('is_overstay', 'Yes')->count() }}</span>,
            Debtors: <span class="text-danger"
                style="font-weight: 800">{{ $rentings->where('balance', '<', 0)->where('invoice_status', 'Active')->count() }}</span>
        </p>
        <hr class="mt-0 mb-2 mb-md-2" style="background-color: var(--primary); height: 2px;">
        <p class="h4  text-bold mb-2 bg-primary text-white pl-3 pt-2 pb-1">MORE INFO</p>
        <p class="mt-0 mb-0 text-dark text-uppercase">
            PAYABLE: <span style="font-weight: 800">UGX
                {{ number_format($rentings->where('invoice_status', 'Active')->sum('payable_amount')) }}</span>
        <p class="mt-0 mb-0 text-dark text-uppercase">
            UNPAID: <span style="font-weight: 800" class="text-danger">UGX
                {{ number_format($rentings->where('invoice_status', 'Active')->sum('balance')) }}</span>
        <p class="mt-0 mb-0 text-dark text-uppercase">No. of
            DEBTORS: <span style="font-weight: 800" class="text-danger">
                {{ number_format(
                    $rentings->where('invoice_status', 'Active')->where('balance', '<', 0)->count(),
                ) }}</span>

        </p>
    </div>
</a>
