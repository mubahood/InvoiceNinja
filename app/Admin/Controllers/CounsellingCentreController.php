<?php

namespace App\Admin\Controllers;

use App\Models\CounsellingCentre;
use App\Models\Disability;
use App\Models\Location;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class CounsellingCentreController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Counselling centres';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new CounsellingCentre());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('administrator_id', __('Administrator id'));
        $grid->column('disability_id', __('Disability id'));
        $grid->column('name', __('Name'));
        $grid->column('about', __('About'));
        $grid->column('address', __('Address'));
        $grid->column('parish', __('Parish'));
        $grid->column('village', __('Village'));
        $grid->column('phone_number', __('Phone number'));
        $grid->column('email', __('Email'));
        $grid->column('district_id', __('District id'));
        $grid->column('subcounty_id', __('Subcounty id'));
        $grid->column('website', __('Website'));
        $grid->column('phone_number_2', __('Phone number 2'));
        $grid->column('photo', __('Photo'));
        $grid->column('gps_latitude', __('Gps latitude'));
        $grid->column('gps_longitude', __('Gps longitude')); 
        $grid->column('skills', __('Skills'));
        $grid->column('fees_range', __('Fees range'));
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
        $show = new Show(CounsellingCentre::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('disability_id', __('Disability id'));
        $show->field('name', __('Name'));
        $show->field('about', __('About'));
        $show->field('address', __('Address'));
        $show->field('parish', __('Parish'));
        $show->field('village', __('Village'));
        $show->field('phone_number', __('Phone number'));
        $show->field('email', __('Email'));
        $show->field('district_id', __('District id'));
        $show->field('subcounty_id', __('Subcounty id'));
        $show->field('website', __('Website'));
        $show->field('phone_number_2', __('Phone number 2'));
        $show->field('photo', __('Photo'));
        $show->field('gps_latitude', __('Gps latitude'));
        $show->field('gps_longitude', __('Gps longitude'));
        $show->field('status', __('Status'));
        $show->field('skills', __('Skills'));
        $show->field('fees_range', __('Fees range'));
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
        $form = new Form(new CounsellingCentre());


        if (
            (Auth::user()->isRole('staff')) ||
            (Auth::user()->isRole('admin'))
        ) {

            $ajax_url = url(
                '/api/ajax?'
                    . "search_by_1=name"
                    . "&search_by_2=id"
                    . "&model=User"
            );
            $form->select('administrator_id', "Counselling Centre manager")
                ->options(function ($id) {
                    $a = Administrator::find($id);
                    if ($a) {
                        return [$a->id => "#" . $a->id . " - " . $a->name];
                    }
                })
                ->ajax($ajax_url)->rules('required');
        } else {
            $form->select('administrator_id', __('Counselling Centre manager'))
                ->options(Administrator::where('id', Auth::user()->id)->get()->pluck('name', 'id'))->default(Auth::user()->id)->readOnly()->rules('required');
        }


        $form->text('name', __('Counselling Centre Name'))->rules('required');

        $form->select('disability_id', __('Select Category of persons with disabilities offered'))
            ->rules('required')
            ->options(Disability::where([])->get()->pluck('name', 'id'));

        $form->tags('skills', __('Skills offered'));
        $form->text('fees_range', __('Fees range'));

        $form->select('subcounty_id', __('Counselling Centre Subcounty'))
            ->rules('required')
            ->help('Where is this Counselling Centre located?')
            ->options(Location::get_sub_counties_array());

        $form->text('village', __('Counselling Centre Village'))->rules('required');
        $form->text('parish', __('Counselling Centre Parish'))->rules('required');
        $form->text('address', __('Counselling Centre Address'));

        $form->text('phone_number', __('Counselling Centre Phone number'))->rules('required');
        $form->text('phone_number_2', __('Alternative Phone number'));
        $form->email('email', __('Counselling Centre Email address'));

        $form->url('website', __('Counselling Centre Website'));

        $form->text('gps_latitude', __('Counselling Centre Gps latitude'));
        $form->text('gps_longitude', __('Counselling Centre Gps longitude'));
        $form->image('photo', __('Counselling Centre logo'));
        $form->quill('about', __('About The Counselling Centre'))->rules('required');
        $form->disableCreatingCheck();
        $form->disableEditingCheck();
        $form->disableReset();
        $form->disableViewCheck();


        return $form;
    }
}
