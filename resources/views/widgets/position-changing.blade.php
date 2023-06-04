<?php
use App\Models\Utils;
?><style>
    .ext-icon {
        color: rgba(0, 0, 0, 0.5);
        margin-left: 10px;
    }

    .installed {
        color: #00a65a;
        margin-right: 10px;
    }

    .card {
        border-radius: 5px;
    }

    .case-item:hover {
        background-color: rgb(254, 254, 254);
    }
</style>
<div class="card  mb-4 mb-md-5 border-0">
    <!--begin::Header-->
    <div class="d-flex justify-content-between px-3 px-md-4 border-bottom">
        <h3 class="h4 pt-3">
            <b style="font-weight: 800;">Position changing</b>
        </h3>
        <div>
            <a href="{{ url('/stock-items') }}" class="btn btn-sm btn-primary mt-md-4 mt-4">
                View All
            </a>
        </div>
    </div>
    <div class="card-body py-2 py-md-3">
        @foreach ($items as $i)
            <a href="{{ url("/cases/{$i->id}") }}" class="text-dark text-hover-primary">
                <div class="d-flex align-items-center mb-4 case-item">
                    <div style="border-left: solid #ECF0F5 5px;" class="flex-grow-1 pl-2 pl-md-3 border-primary">

                        <b>{{ $i->name }}</b>

                        <span class="text-muted fw-bold d-block" style="font-size: 12px;">
                            NEXT CHANGING: {{ $i->next_monitor_position_date }}.
                        </span>
                    </div>
                </div>
            </a>
        @endforeach
    </div>
</div>
