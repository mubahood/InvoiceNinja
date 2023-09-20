<?php
use App\Models\Utils;
?>
<div class="card  mb-4 mb-md-5 border-0">
    <!--begin::Header-->
    {{--  <div class="d-flex justify-content-between px-3 px-md-4 ">
        <h3>
            <b>Calendar</b>
        </h3>
        <div>
            <a href="{{ admin_url('/events') }}" class="btn btn-sm btn-primary mt-md-4 mt-4">
                View All
            </a>
        </div>
    </div> --}}
    <div class="card-body py-2 py-md-3">
        <div id='loading'></div>
        <div id='calendar'></div>
    </div>
</div>


<script>
    $(document).ready(function() {
        var data = JSON.parse('<?= json_encode($events) ?>');

        function show_activity(x) {
            const eve = data[x];

            $.alert({
                title: eve.title,
                content: eve.details,
                closeIcon: true,
                buttons: {
                    edit: {
                        btnClass: 'btn-primary',
                        text: 'UPDATE ACTIVITY STATUS',
                        action: function() {
                            submit_activity(eve.activity_id);
                        }
                    },
                    CLOSE: function() {

                    },
                }
            });

        }

        $('.activity-item').click(function(e) {
            e.preventDefault();
            show_activity(e.currentTarget.dataset.id);

        });



        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {

            headerToolbar: {
                left: 'title',
                right: 'prev today next'
            },

            editable: false,
            selectable: false,
            selectMirror: true,
            nowIndicator: true,
            displayEventTime: true,
            events: data,

            eventClick: function(arg) {

                // opens events in a popup window
                //window.open(arg.event.url, 'google-calendar-event', 'width=700,height=600');
                arg.jsEvent.preventDefault() // don't navigate in main tab

                const eve = arg.event._def;
                const activity_id = eve.extendedProps.activity_id;


                $.alert({
                    title: eve.extendedProps.type,
                    content: eve.extendedProps.details,
                    closeIcon: true,
                    buttons: {
                        edit: {
                            btnClass: 'btn-primary',
                            text: 'UPDATE ACTIVITY STATUS',
                            action: function() {
                                submit_activity(activity_id);
                            }
                        },
                        CLOSE: function() {

                        },
                    }
                });
            },

            loading: function(bool) {
                document.getElementById('loading').style.display =
                    bool ? 'block' : 'none';
            }

        });

        calendar.render();
    });

    function submit_activity(x) {

        $.confirm({
            title: 'Activity status submission',
            content: '' +
                '<form method="GET" action="<?= admin_url('calender-activity-edit') ?>" class="formName">' +

                '<div class="form-group">' +
                '<div class="form-check form-check-inline">' +
                '<input required class="form-check-input" type="radio" id="done_status" name="done_status" value="1">' +
                '<label class="form-check-label" for="done_status">Done</label></div>' +
                '</div>' +

                '<div class="form-group">' +
                '<div class="form-check form-check-inline">' +
                '<input required class="form-check-input" type="radio" id="done_status_not" name="done_status" value="0">' +
                '<label class="form-check-label" for="done_status_not">Not Done (Missed)</label></div>' +
                '</div>' +


                '<div class="form-group">' +
                '<label>Activity remarks</label>' +
                '<input name="done_details" placeholder="Remarks about this activity"  class="name form-control" required />' +
                '</div>' +

                '<input name="id" type="hidden" value="' + x + '">' +


                '<button class="btn-lg float-right btn btn-primary mt-2" type="submit">SUBMIT</button>' +


                '</form>',
            buttons: {
                cancel: function() {
                    //close
                },
            },

        });
    }
</script>
