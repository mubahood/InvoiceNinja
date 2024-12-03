@extends('layouts.auth-layout')
@php
    $url = '';
@endphp
@section('content')
    <div class="" style="color: black;
        text-align: start";>
        <p class=" h5 p-0 m-0" style="color: black; font-weight: 800;
        text-align: center; font-size: 18px;">Email
            Verified Successfully</p>
        <p class="">You have successfully verified your email address. You can now login to your account using your
            email <b>{{ $email }}</b></p>
        <p class="p-0 m-0">Click <a href="{{ $url }}">here</a> to login</p>
        <hr>
        <p class="p-0 m-0 text-center"><b><u>IMPORTANT LINKS</u></b></p>
        <p class="p-0 m-0">Go to <a href="{{ admin_url('/') }}">Home Page</a></p>
        <p class="p-0 m-0">Go to <a href="{{ admin_url('auth/login') }}">Login Page</a></p>
    </div>
    <hr>
    <!-- Footer -->
    <div class="footer text-center" {{-- style="border-top: 2px solid  #AB7602" --}}>
        <p style="color: rgb(0, 0, 50);">© {{ date('Y') }} {{ env('APP_NAME') }}. All rights reserved.</p>
    </div>
    </div>
@endsection
