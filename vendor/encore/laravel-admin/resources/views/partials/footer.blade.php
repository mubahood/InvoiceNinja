<!-- Main Footer -->
<footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
        @if (config('admin.show_environment'))
            <strong>Env</strong>&nbsp;&nbsp; {!! config('app.env') !!}
        @endif

        &nbsp;&nbsp;&nbsp;&nbsp;

        @if (config('admin.show_version'))
            <strong>Version</strong>&nbsp;&nbsp; {!! \Encore\Admin\Admin::VERSION !!}
        @endif

    </div>
    <!-- Default to the left -->
    <p class="nav d-block  text-md-start text-md-start pb-2 pb-lg-0 mb-0">
        Powered By
        <a class="nav-link d-inline-block p-0 text-primary" href="https://wa.me/+256783204665" target="_blank" rel="noopener">Newline
            Technologies</a>
    </p>
    </p>
</footer>
