@php
    if (!isset($max_spaces)) {
        $max_spaces = 3;
    }
@endphp
<b style="border-bottom: 2px dotted; border-bottom-color: black;">
    @for ($i = 0; $i < $max_spaces; $i++)
        &nbsp;
    @endfor
    {!! strtoupper($s) ?? '-' !!}
    @for ($i = 0; $i < $max_spaces; $i++)
        &nbsp;
    @endfor
</b>
