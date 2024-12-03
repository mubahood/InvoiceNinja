@extends('layouts.auth-layout')
@php
    $url = '';
@endphp
@section('content')
    <div class="" style="color: black;
        text-align: start";>
        <p class=" h5 p-0 m-0" style="color: black; font-weight: 800;
        text-align: center; font-size: 18px;">Email
            Verification Link Sent.</p>
        <p class="">Email verification link has been sent to your email address.</p>
        <p class="">If you cannot see the email in your inbox, please check your spam folder.</p>
        <p class="">If you did not receive the email, <a style="color: blue; text-decoration:  underline;"
                href="{{ url('verification-mail-send') }}">click here to request
                another</a>.</p>
        <p class="">If you are having trouble, please contact our <a style="color: blue; text-decoration:  underline;"
                href="mailto:{{ env('MAIL_FROM_ADDRESS') }}">{{ env('MAIL_FROM_ADDRESS') }}</a></p>
        <hr>
        <p class="p-0 m-0 text-center"><b><u>IMPORTANT LINKS</u></b></p>
        <p class="p-0 m-0">Go to <a href="{{ admin_url('/') }}">Home Page</a></p>
        <p class="p-0 m-0">Go to <a href="{{ admin_url('auth/login') }}">Login Page</a></p>
    </div>

@endsection
