// JavaScript Document
$(document).ready(function() {
	
	$(".getItemsBtn").click(function() {
		listName = $(this).attr("data-list");
		$.ajax({
			url : "/get_list_items?list_name=" + listName,
			success : function(response) {
				var rows = "";
				var titleMsg = listName + ' has ' + response.items.length;
				$("#itemsCountDiv").html(titleMsg);
				if (response.items.length == 0) {
					rows += '<tr><td class="col-lg-6"><p class="file-para">No Items to Display</p></td><td class="col-lg-6"></td></tr>';
					$("#itemsGrid table tbody").html(rows);
				} else {
					$.each(response.items, function(i, value) {
						rows += '<tr><td class="col-lg-6"><p class="file-para">' + value.file_name + '</p></td><td class="col-lg-6"><a class="pop-up-btn downloadBtn" href="/download_item?file_ref=' + encodeURI(value.file_ref) + '&file_name=' + value.file_name + '" style="color: white; padding: 4px;">Download</a></td></tr>';
					});
					$("#itemsGrid table tbody").html(rows);
				}
			}
		});
	});

});
