<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>{{ config('admin.title') }} | {{ trans('admin.login') }}</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    @if (!is_null($favicon = Admin::favicon()))
        <link rel="shortcut icon" href="{{ $favicon }}">
    @endif

    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="{{ admin_asset('vendor/laravel-admin/AdminLTE/bootstrap/css/bootstrap.min.css') }}">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{ admin_asset('vendor/laravel-admin/font-awesome/css/font-awesome.min.css') }}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ admin_asset('vendor/laravel-admin/AdminLTE/dist/css/AdminLTE.min.css') }}">
    <!-- iCheck -->
    <link rel="stylesheet" href="{{ admin_asset('vendor/laravel-admin/AdminLTE/plugins/iCheck/square/blue.css') }}">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="//oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
    <style>
        .login-box {
            margin-top: 2%;
            padding: 0;
        }

        .login-box-body {
            border-radius: 15px !important;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 10px;
            background: #fff;
        }
    </style>
</head>

<body class="hold-transition login-page" style="background-color: rgb(255, 166, 0);">
    <div class="login-box login-box-body">
        <div class="" style="border-radius: 15px!important">
            <div style="text-align: center;">
                <img width="80px" src="{{ url('public/assets/images/logo.png') }}" alt="">
            </div>
            <p class="login-box-msg text-uppercase p-0 m-0"
                style="color: black; font-weight: 800; margin-top: 15px;
            font-size: 18px; margin-bottom: 0px; line-height: 1;">
                Tax Appeals Tribunal (TAT)</p>
            <hr style="background-color: rgb(255, 166, 0); height: 5px; margin-top: 0px;">

            @yield('content')

            <hr>
            <!-- Footer -->
            <div class="footer text-center" {{-- style="border-top: 2px solid  #AB7602" --}}>
                <p style="color: rgb(0, 0, 50);">© {{ date('Y') }} {{ env('APP_NAME') }}. All rights reserved.</p>
            </div>

        </div>
        <!-- /.login-box-body -->
    </div>
    <!-- /.login-box -->

    <!-- jQuery 2.1.4 -->
    <script src="{{ admin_asset('vendor/laravel-admin/AdminLTE/plugins/jQuery/jQuery-2.1.4.min.js') }}"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="{{ admin_asset('vendor/laravel-admin/AdminLTE/bootstrap/js/bootstrap.min.js') }}"></script>
    <!-- iCheck -->
    <script src="{{ admin_asset('vendor/laravel-admin/AdminLTE/plugins/iCheck/icheck.min.js') }}"></script>
    <script>
        $(function() {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
    </script>
</body>

</html>
