<?php

namespace App\Admin\Controllers;

use App\Models\Disability;
use App\Models\Group;
use App\Models\Location;
use App\Models\Person;
use App\Models\Utils;
use Dflydev\DotAccessData\Util;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class PersonController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Persons with disabilities';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Person());
        $grid->quickSearch('name')->placeholder('Search by name');

        $grid->model()->orderBy('id', 'desc');
        $grid->disableBatchActions();

        $grid->column('id', __('Id'))->sortable();
        $grid->column('created_at', __('Regisetered'))->display(
            function ($x) {
                return Utils::my_date($x);
            }
        )->sortable();
        $grid->column('name', __('Name'))->sortable();
        $grid->column('sex', __('Sex'))->filter([
            'Male' => 'Male',
            'Female' => 'Female',
        ])->sortable();

        $grid->column('dob', __('AGE/D.O.B'));

        $grid->column('disability_id', __('Disability'))
            ->display(
                function ($x) {
                    if ($this->disability == null) {
                        return '-';
                    }
                    return $this->disability->name;
                }
            )->sortable();
        $grid->column('phone_number', __('Phone number'))->sortable();
        $grid->column('district_id', __('District'))
            ->display(
                function ($x) {
                    if ($this->district == null) {
                        return '-';
                    }
                    return $this->district->name;
                }
            )->sortable();

        $grid->column('email', __('Email'))->hide();
        $grid->column('address', __('Address'))->hide();
        $grid->column('parish', __('Parish'))->hide();
        $grid->column('village', __('Village'))->hide();


        $grid->column('employment_status', __('Is Employed'))->filter([
            'Yes' => 'Yes',
            'No' => 'No',
        ])->sortable();

        $grid->column('has_caregiver', __('Has caregiver'))->hide();
        $grid->column('caregiver_name', __('Caregiver name'))->hide();
        $grid->column('caregiver_sex', __('Caregiver sex'))->hide();
        $grid->column('caregiver_phone_number', __('Caregiver phone number'))->hide();
        $grid->column('caregiver_age', __('Caregiver age'))->hide();
        $grid->column('caregiver_relationship', __('Caregiver relationship'))->hide();
        $grid->column('photo', __('Photo'))->hide();

        $grid->column('association_id', __('Association'))
            ->display(
                function ($x) {
                    if ($this->association == null) {
                        return '-';
                    }
                    return $this->association->name;
                }
            )->sortable();



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
        $show = new Show(Person::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('association_id', __('Association id'));
        $show->field('group_id', __('Group id'));
        $show->field('name', __('Name'));
        $show->field('address', __('Address'));
        $show->field('parish', __('Parish'));
        $show->field('village', __('Village'));
        $show->field('phone_number', __('Phone number'));
        $show->field('email', __('Email'));
        $show->field('district_id', __('District id'));
        $show->field('subcounty_id', __('Subcounty id'));
        $show->field('disability_id', __('Disability id'));
        $show->field('phone_number_2', __('Phone number 2'));
        $show->field('dob', __('Dob'));
        $show->field('sex', __('Sex'));
        $show->field('education_level', __('Education level'));
        $show->field('employment_status', __('Employment status'));
        $show->field('has_caregiver', __('Has caregiver'));
        $show->field('caregiver_name', __('Caregiver name'));
        $show->field('caregiver_sex', __('Caregiver sex'));
        $show->field('caregiver_phone_number', __('Caregiver phone number'));
        $show->field('caregiver_age', __('Caregiver age'));
        $show->field('caregiver_relationship', __('Caregiver relationship'));
        $show->field('photo', __('Photo'));
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
        $form = new Form(new Person());


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
            $form->select('administrator_id', "Account mananger")
                ->options(function ($id) {
                    $a = Administrator::find($id);
                    if ($a) {
                        return [$a->id => "#" . $a->id . " - " . $a->name];
                    }
                })
                ->ajax($ajax_url)->rules('required');
        } else {
            $form->select('administrator_id', __('Account mananger'))
                ->options(Administrator::where('id', Auth::user()->id)->get()->pluck('name', 'id'))->default(Auth::user()->id)->readOnly()->rules('required');
        }


        $form->select('group_id', __('Select Association & Group'))
            ->rules('required')
            ->help('Where this person with disability belongs')
            ->options(Group::get_groups_array());


        $form->text('name', __('Full Name'))->rules('required');
        $form->image('photo', __('Photo'));

        $form->date('dob', __('Date of Birth'))->rules('required');
        $form->radio('sex', __('Sex'))->options(['Male' => 'Male', 'Female' => 'Female'])->rules('required');


        $form->email('email', __('Email address'));
        $form->text('phone_number', __('Phone number'))->rules('required');
        $form->text('phone_number_2', __('Alternative Phone number'));

        $form->select('subcounty_id', __('Subcounty'))
            ->rules('required')
            ->help('Where is this business located?')
            ->options(Location::get_sub_counties_array());

        $form->text('parish', __('Parish'));
        $form->text('village', __('Village'));
        $form->text('address', __('Address'));

        $form->select('education_level', __('Education level'))
            ->options([
                'None' => 'None - (Not educated at all)',
                'Below primary' => 'Below primary - (Did not complete P.7)',
                'Primary' => 'Primary - (Completed P.7)',
                'Secondary' => 'Secondary - (Completed S.4)',
                'A-Level' => 'Advanced level - (Completed S.6)',
                'Bachelor' => 'Bachelor - (Degree)',
                'Masters' => 'Masters',
                'PhD' => 'PhD',
            ])->rules('required');

        $form->radio('employment_status', __('Employment status'))->options(['Employed' => 'Employed', 'Not Employed' => 'Not Employed'])->rules('required');
        $form->radio('has_caregiver', __('Has caregiver?'))
            ->options(['Yes' => 'Yes', 'No' => 'No'])
            ->when('Yes', function ($form) {
                $form->text('caregiver_name', __('Caregiver Name'))->rules('required');
                $form->radio('caregiver_sex', __('Caregiver Sex'))->options(['Male' => 'Male', 'Female' => 'Female'])->rules('required');
                $form->text('caregiver_phone_number', __('Caregiver phone number'));
                $form->text('caregiver_age', __('Caregiver age'));
                $form->text('caregiver_relationship', __('Caregiver relationship'));
            })
            ->rules('required');




        return $form;
    }
}
