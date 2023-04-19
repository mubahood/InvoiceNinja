<?php

namespace App\Admin\Controllers;

use App\Models\Association;
use App\Models\Group;
use App\Models\Location;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class GroupController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Groups';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Group());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('association_id', __('Association id'));
        $grid->column('name', __('Name'));
        $grid->column('address', __('Address'));
        $grid->column('parish', __('Parish'));
        $grid->column('village', __('Village'));
        $grid->column('phone_number', __('Phone number'));
        $grid->column('email', __('Email'));
        $grid->column('district_id', __('District id'));
        $grid->column('subcounty_id', __('Subcounty id'));
        $grid->column('members', __('Members'));
        $grid->column('phone_number_2', __('Phone number 2'));
        $grid->column('started', __('Started'));
        $grid->column('leader', __('Leader'));
        $grid->column('deleted_at', __('Deleted at'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Group::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('association_id', __('Association id'));
        $show->field('name', __('Name'));
        $show->field('address', __('Address'));
        $show->field('parish', __('Parish'));
        $show->field('village', __('Village'));
        $show->field('phone_number', __('Phone number'));
        $show->field('email', __('Email'));
        $show->field('district_id', __('District id'));
        $show->field('subcounty_id', __('Subcounty id'));
        $show->field('members', __('Members'));
        $show->field('phone_number_2', __('Phone number 2'));
        $show->field('started', __('Started'));
        $show->field('leader', __('Leader'));
        $show->field('deleted_at', __('Deleted at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Group());






        if (
            (Auth::user()->isRole('staff')) ||
            (Auth::user()->isRole('admin'))
        ) {

            $ajax_url = url(
                '/api/ajax?'
                    . "search_by_1=name"
                    . "&search_by_2=id"
                    . "&model=Association"
            );
            $form->select('association_id', "Association")
                ->options(function ($id) {
                    $a = Association::find($id);
                    if ($a) {
                        return [$a->id => "#" . $a->id . " - " . $a->name];
                    }
                })
                ->ajax($ajax_url)->rules('required');
        } else {
            $form->select('association_id', __('Association'))
                ->options(Association::where('administrator_id', Auth::user()->id)->get()->pluck('name', 'id'))->rules('required');
        }


        $form->text('name', __('Group Name'))->rules('required');
        $form->textarea('leader', __('Group Leader Name'))->rules('required');

        $form->date('started', __('Started'))->rules('required');
        $form->decimal('members', __('Number of Members'))->rules('required');

        $form->select('subcounty_id', __('Subcounty'))
            ->rules('required')
            ->help('Where is this business located?')
            ->options(Location::get_sub_counties_array());

        $form->text('village', __('Village'))->rules('required');
        $form->text('parish', __('Parish'))->rules('required');
        $form->text('address', __('Group Address'));
        $form->text('phone_number', __('Phone number'))->rules('required');
        $form->text('phone_number_2', __('Alternative Phone number'));
        $form->email('email', __('Email address'));
        $form->disableCreatingCheck();
        $form->disableEditingCheck();
        $form->disableReset();
        $form->disableViewCheck(); 


        return $form;
    }
}
