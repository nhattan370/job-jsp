
$(document).ready(function() {

    $('#category').select2({
        placeholder: "Tìm danh mục công việc...",
        allowClear: true,
        ajax: {
            url: contextPath + "/api/categories-by-name",
            dataType: 'json',
            delay: 250,
			data: function (params) {
			    return {
			        name: params.term || ""
			    };
			},
            processResults: function (data) {
                return {
                    results: $.map(data, function (item) {
                        return {
                            id: item.id,
                            text: item.name
                        };
                    })
                };
            }
        }
    });

    // Bắt sự kiện khi user chọn category
    $('#category').on('change', function() {
        console.log("Category được chọn: " + $(this).val());
    });

});
