import {useEffect} from 'react';
import $ from 'jquery';
import 'datatables.net-dt/js/dataTables.dataTables';
import 'datatables.net-buttons/js/dataTables.buttons';
import 'datatables.net-buttons/js/buttons.html5';
import 'datatables.net-buttons/js/buttons.print';
import 'datatables.net-select';


const useDatatable = ({dataLoaded, refresh,orders}) => {

        let table;
            table = $(".table").DataTable({
                data: orders,
                responsive: true,
                paging: true,
                lengthChange: true,
                ordering: false,
                info: true,

                autoWidth:
                    true,
                searching:
                    true,
                dom:
                    "lBfrtip",
                language:
                    {
                        processing: "Đang xử lý...",
                        search:
                            "Tìm kiếm:",
                        lengthMenu:
                            "Hiển thị _MENU_ hàng",
                        info:
                            "Hiển thị _START_ đến _END_ của _TOTAL_ mục",
                        infoEmpty:
                            "Hiển thị 0 đến 0 của 0 mục",
                        infoFiltered:
                            "(được lọc từ _MAX_ mục)",
                        infoPostFix:
                            "",
                        loadingRecords:
                            "Đang tải...",
                        zeroRecords:
                            "Không tìm thấy dữ liệu",
                        emptyTable:
                            "Không có dữ liệu trong bảng",
                        paginate:
                            {
                                first: "Đầu",
                                previous:
                                    "<< ",
                                next:
                                    ">> ",
                                last:
                                    "Cuối",
                            }
                        ,
                        aria: {
                            sortAscending: ": Kích hoạt để sắp xếp cột tăng dần",
                            sortDescending:
                                ": Kích hoạt để sắp xếp cột giảm dần",
                        }
                        ,
                        buttons: {
                            copyTitle: "Sao chép thành công",
                            copySuccess:
                                {
                                    _: "%d dòng đã được sao chép",
                                    1:
                                        "1 dòng đã được sao chép",
                                }
                            ,
                        }
                        ,
                    }
                ,
                buttons: [
                    {
                        extend: 'collection',
                        text: 'Công cụ',
                        buttons: [
                            'copy',
                            'csv',
                            'excel',
                            'pdf',
                            'print',
                        ]
                    }
                ],

            })
            ;


            $('.dt-search').addClass("text-right");
            $('div.dt-paging').addClass("text-right");

            return () => {
                if (table) {
                    table.destroy();
                }
            };


};

export default useDatatable;