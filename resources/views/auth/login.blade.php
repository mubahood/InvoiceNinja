@extends('layouts.auth-layout')
@php
    $url = '';
@endphp
@section('content')
    <form action="{{ url('auth/login') }}" method="post">
        <div class="form-group has-feedback {!! !$errors->has('username') ?: 'has-error' !!}">

            @if ($errors->has('username'))
                @foreach ($errors->get('username') as $message)
                    <label class="control-label" for="inputError"><i
                            class="fa fa-times-circle-o"></i>{{ $message }}</label><br>
                @endforeach
            @endif

            <input type="text" class="form-control" placeholder="{{ trans('admin.username') }}" name="username"
                value="{{ old('username') }}">
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback {!! !$errors->has('password') ?: 'has-error' !!}">

            @if ($errors->has('password'))
                @foreach ($errors->get('password') as $message)
                    <label class="control-label" for="inputError"><i
                            class="fa fa-times-circle-o"></i>{{ $message }}</label><br>
                @endforeach
            @endif

            <input type="password" value="{{ old('password') }}" class="form-control"
                placeholder="{{ trans('admin.password') }}" name="password">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <input type="hidden" name="_token" value="{{ csrf_token() }}">
                <button type="submit" class="btn btn-primary btn-block btn-flat">{{ trans('admin.login') }}</button>
            </div>
        </div>
        <div class="row">
            <br>
            <div class="col-xs-12">
                {{-- did you forget your password --}}
                <p>
                    Forgot your password? <a class="" href="{{ url('auth/password/reset') }}">Reset Password</a>.
                </p>
            </div>
        </div>
        <hr>
        <input type="hidden" name="remember" value="1">

        <div class="row">
            <div class="col-xs-12 text-center  ">
                <p class="text-center">OR</p>
                <a href="{{ url('auth/register') }}" class="h5" style="color: rgb(10, 10, 226);"><b>Create Account</b></a>
             </div>
            <!-- /.col -->

            <!-- /.col -->
        </div>
    </form>
@endsection
