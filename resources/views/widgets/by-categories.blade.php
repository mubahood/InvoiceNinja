<?php
use App\Models\Utils;
?>
<div class="card  mb-4 mb-md-5 border-0">
    <!--begin::Header-->
    <div class="d-flex justify-content-between px-3 pt-2 px-md-4 border-bottom">
        <h4 style="line-height: 1; margrin: 0; " class="fs-22 fw-800">
            Candidates by Stage
        </h4>
    </div>
    <div class="card-body py-3 py-md-5">
        <canvas id="graph_animals" style="width: 100%;"></canvas>
    </div>
</div>


<script>
    $(function() {
        var config = {
            type: 'pie',
            data: {
                datasets: [{
                    data: [370, 57, 101, 210, 259, 712, 100, 259, 210, 100, 70],
                    backgroundColor: [
                        '#8EFCDF',
                        '#F43DE3',
                        '#F6DE5C',
                        '#7D57F8',
                        '#431B02',
                        '#23A2E9',
                        '#34F1B7',
                        '#868686',
                        '#C71C5D',
                        '#D0B1FD',
                    ],
                    label: 'Dataset 1'
                }],
                labels: [
                    'Musaned',
                    'Interpol',
                    'Shared CV',
                    'EMIS',
                    'Training',
                    'Ministry',
                    'Enjaz',
                    'Embasy',
                    'Departure',
                    'Traveled',
                    'Failed',
                ],
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                legend: {
                    position: 'left',
                    display: true,
                },
                title: {
                    display: false,
                    text: 'Persons with Disabilities by Categories'
                },
                animation: {
                    animateScale: true,
                    animateRotate: true
                }
            }
        };

        var ctx = document.getElementById('graph_animals').getContext('2d');
        new Chart(ctx, config);
    });
</script>
