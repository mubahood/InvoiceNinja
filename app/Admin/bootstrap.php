<?php

/**
 * Laravel-admin - admin builder based on Laravel.
 * @author z-song <https://github.com/z-song>
 *
 * Bootstraper for Admin.
 *
 * Here you can remove builtin form field:
 * Encore\Admin\Form::forget(['map', 'editor']);
 *
 * Or extend custom form field:
 * Encore\Admin\Form::extend('php', PHPEditor::class);
 *
 * Or require js and css assets:
 * Admin::css('/packages/prettydocs/css/styles.css');
 * Admin::js('/packages/prettydocs/js/main.js');
 *
 */

use App\Models\Utils;
use Encore\Admin\Facades\Admin;
use Illuminate\Support\Facades\Auth;
use App\Admin\Extensions\Nav\Shortcut;
use App\Admin\Extensions\Nav\Dropdown;
use Encore\Admin\Form;

Utils::system_boot();


Admin::navbar(function (\Encore\Admin\Widgets\Navbar $navbar) {

    $u = Auth::user();
    $navbar->left(view('admin.search-bar', [
        'u' => $u
    ]));

    $navbar->left(Shortcut::make([
        'File New Case' => 'cases/create',
        /*  'Products or Services' => 'products/create',
        'Jobs and Opportunities' => 'jobs/create',
        'Event' => 'events/create', */
    ], 'fa-plus')->title('CREATE NEW'));
    /*     $navbar->left(Shortcut::make([
        'Candidate' => 'people/create', 
    ], 'fa-wpforms')->title('Register new')); */



    /*     $navbar->right(Shortcut::make([
        'How to register a new candidate' => '',
        'How to change  candidate\'s status' => '',
    ], 'fa-question')->title('HELP')); */
});


Form::init(function (Form $form) {
    //$form->disableEditingCheck();
    // $form->disableCreatingCheck();
    $form->disableViewCheck();
    $form->disableReset();
    //$form->disableCreatingCheck();

    $form->tools(function (Form\Tools $tools) {
        $tools->disableDelete();
        $tools->disableView();
    });
});


Encore\Admin\Form::forget(['map', 'editor']);
Admin::css(url('/assets/css/bootstrap.css'));
Admin::css('/assets/css/styles.css');
